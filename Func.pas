unit Func;

interface

uses
  Winapi.Windows, System.IniFiles, System.IOUtils, System.SysUtils,
  System.Classes, FireDAC.Phys.Oracle, FireDAC.Comp.Client, Data.Cloud.CloudAPI,
  FireDAC.Stan.Def, FireDAC.DApt, FireDAC.Stan.Async, FireDAC.Stan.Intf,
  FireDAC.Stan.Error, Vcl.Dialogs, frmOperator, frmStatist;

type
  TLastItem = record
    id: Integer;
  end;

  PLastItem = ^TLastItem;

var
  ini: TIniFile;
  AppPath, dbUser, dbDatabase, dbPassword: string;
  mcon: TFDConnection;
  qry: TFDQuery;
  ChildStatist: TMDIStatistChild;
  ChildOperator: TMDIOperatorChild;

procedure CreateDB;

function CheckDB: Boolean;

function TableExists(tbl: string): Boolean;

procedure ReadSet;

function OpenOrc: Boolean;

procedure ShowMsg(msg: string; icon: Cardinal = MB_ICONINFORMATION);

procedure StatusMsg(msg: string);

procedure ShowLast;

procedure ShowRef(id: Integer);

implementation

uses
  frmMain, frmDBSet;

procedure CreateDB; //�������� ������ � ���� ������
var
  sql: TStringList;
  item: string;
begin
  if not mcon.Connected then
  begin
    ShowMsg('�� ���������� ��', MB_ICONERROR);
    exit;
  end;

  if (TableExists('TBL_USERS') or TableExists('TBL_REF')) then
  begin
    ShowMsg('������� ��� ����������', MB_ICONERROR);
    exit;
  end;

  sql := TStringList.Create;
  sql.StrictDelimiter := True;
  sql.LoadFromFile(TPath.Combine(AppPath, 'db.sql'), TEncoding.UTF8);
  for item in sql do
    qry.ExecSQL(item);

  if MessageBox(MainForm.Handle, '������� ���� ������ ?', '���������', MB_YESNO + MB_ICONQUESTION) = ID_YES then
  begin
    sql.LoadFromFile(TPath.Combine(AppPath, 'sample.sql'), TEncoding.UTF8);
    for item in sql do
      qry.ExecSQL(item);
  end;

  StatusMsg('������� �������');
end;

function CheckDB: Boolean; //�������� ���������� � �� � ������� ������
begin
  Result := False;
  if not mcon.Connected then
  begin
    ShowMsg('�� ���������� ��', MB_ICONERROR);
    Result := True;
  end;

  if (not TableExists('TBL_USERS') or not TableExists('TBL_REF')) then
  begin
    ShowMsg('�� ������� ������� � ��', MB_ICONERROR);
    Result := True;
  end;
end;

function TableExists(tbl: string): Boolean; //�������� �� ������������� �������
begin
  Result := False;
  qry.Open('SELECT COUNT(TABLE_NAME) FROM USER_TABLES WHERE TABLE_NAME = ' + QuotedStr(tbl));
  Result := qry.Fields[0].AsInteger = 1;
end;

procedure ShowMsg(msg: string; icon: Cardinal = MB_ICONINFORMATION); //�������� ���������
begin
  MessageBox(MainForm.Handle, PChar(msg), '���������', MB_OK + icon);
end;

procedure StatusMsg(msg: string); //�������� ��������� � ����������
begin
  MainForm.StatusBar.Panels[0].Text := msg;
end;

procedure ReadSet; //������ �������� ��
begin
  dbDatabase := ini.ReadString('settings', 'Database', '');
  dbUser := ini.ReadString('settings', 'User', '');
  dbPassword := ini.ReadString('settings', 'Password', '');
end;

function OpenOrc: Boolean; //���������� � ��
var
  podl: TFDPhysOracleDriverLink;
  err: string;
begin
  try
    mcon := TFDConnection.Create(nil);
    //mcon.ResourceOptions.CmdExecMode := amAsync;
    mcon.DriverName := 'Ora';
    with mcon.Params do
    begin
      Add('Database=' + dbDatabase);
      Add('User_Name=' + dbUser);
      Add('Password=' + dbPassword);
      Add('CharacterSet=utf8');
      Add('DriverID=Ora');
    end;
    qry := TFDQuery.Create(nil);
    podl := TFDPhysOracleDriverLink.Create(nil);
    podl.VendorLib := TPath.Combine(AppPath, 'runtimes\oci.dll');
    qry.Connection := mcon;
    mcon.Connected := True;
    StatusMsg('����������');
    Result := True;
  except
    on E: EFDDBEngineException do
    begin
      case E.Kind of
        ekUserPwdInvalid:
          err := '�� ������ ����� ��� ������';
        ekUserPwdExpired:
          err := '������ ���������';
        ekServerGone:
          err := '��� ���������� � ��������';
      else
        err := '�� ������������ ������';
      end;
      StatusMsg('������ ���������� ��: ' + err + ' (' + E.Message + ')');
      Result := False;
    end;
  end;
end;

procedure ShowLast; //�������� 10 ���������
var
  rec: PLastItem;
begin
  with ChildOperator.lvLastUsers.Items do
  begin
    BeginUpdate;
    Clear;
    qry.Open('SELECT * FROM (SELECT fio,id FROM tbl_users ORDER BY id DESC) WHERE rownum < 11');
    while not qry.Eof do
    begin
      new(rec);
      rec^.id := qry.Fields[1].AsInteger;
      with Add do
      begin
        Caption := qry.Fields[0].Text;
        Data := rec;
      end;
      qry.Next;
    end;
    EndUpdate;
    if Count > 0 then
      ChildOperator.lvLastUsers.ItemIndex := 0;
  end;
end;

procedure ShowRef(id: Integer); //�������� ������ �������
begin
  with ChildOperator.lvRefList.Items do
  begin
    BeginUpdate;
    Clear;
    qry.Open('SELECT id,ref_name,TRUNC(ref_date) FROM tbl_ref WHERE user_id = ' + IntToStr(id) + ' ORDER BY id DESC');
    while not qry.Eof do
    begin
      with Add do
      begin
        Caption := qry.Fields[0].Text;
        SubItems.Add(qry.Fields[1].Text);
        SubItems.Add(qry.Fields[2].Text);
      end;
      qry.Next;
    end;
    EndUpdate;
    if Count > 0 then
      ChildOperator.lvRefList.ItemIndex := 0;
  end;
end;

end.

