unit frmOperator;

interface

uses
  Winapi.Windows, System.Classes, System.SysUtils, Vcl.Dialogs, Vcl.Graphics,
  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.DBCtrls;

type
  TMDIOperatorChild = class(TForm)
    pnlFind: TPanel;
    splFind: TSplitter;
    pnlControls: TPanel;
    grpOperator: TGroupBox;
    grpAddUser: TGroupBox;
    lblBirth: TLabel;
    lblFio: TLabel;
    edtFio: TEdit;
    dtpBirth: TDateTimePicker;
    btnAddUser: TButton;
    grpLastUsers: TGroupBox;
    grpRefList: TGroupBox;
    grpRefAdd: TGroupBox;
    lblRefDate: TLabel;
    lblRefNote: TLabel;
    dtpRefDate: TDateTimePicker;
    mmoRefNote: TMemo;
    btnRefAdd: TButton;
    lblRefName: TLabel;
    edtRefName: TEdit;
    lvLastUsers: TListView;
    lvRefList: TListView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAddUserClick(Sender: TObject);
    procedure lvLastUsersSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure btnRefAddClick(Sender: TObject);
    procedure lvRefListDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  Func;

procedure TMDIOperatorChild.btnAddUserClick(Sender: TObject); //�������� ������������
var
  fio: string;
begin
  fio := Trim(edtFio.Text);
  if (fio <> '') then
  begin
    fio := QuotedStr(fio);
    qry.Open('SELECT id FROM tbl_users WHERE LOWER(fio) = LOWER(' + fio + ')');
    if qry.RowsAffected = 0 then
    begin
      qry.ExecSQL('INSERT INTO TBL_USERS(fio,birth)VALUES(' + fio + ',TO_DATE(' + QuotedStr(DateTimeToStr(dtpBirth.DateTime)) + ', ''dd.mm.yyyy hh24:mi:ss''))');
      ShowLast;
      edtFio.Clear;
      dtpBirth.DateTime := Now;
    end
    else
      ShowMsg('������������ ' + fio + ' ��� ���������� !', MB_ICONWARNING);
  end
  else
    ShowMsg('������� ���', MB_ICONWARNING);
end;

procedure TMDIOperatorChild.btnRefAddClick(Sender: TObject);  //�������� �������
var
  txt,cnt: string;
  id: Integer;
begin
  id := PLastItem(lvLastUsers.Selected.Data).id;
  txt := Trim(edtRefName.Text);
  cnt := Trim(mmoRefNote.Text);
  if (txt <> '') and (cnt <> '') then
  begin
    txt := QuotedStr(txt);
    qry.ExecSQL('INSERT INTO tbl_ref(ref_name,ref_date,ref_note,user_id)VALUES(' + txt + ',TO_DATE(' + QuotedStr(DateTimeToStr(dtpRefDate.DateTime)) + ', ''dd.mm.yyyy hh24:mi:ss''),' + QuotedStr(cnt) + ',' + id.ToString() + ')');
    mmoRefNote.Clear;
    edtRefName.Clear;
    dtpRefDate.DateTime := Now;
    ShowRef(id);
  end else ShowMsg('������� "�����" � "����������"', MB_ICONWARNING);
end;

procedure TMDIOperatorChild.FormClose(Sender: TObject; var Action: TCloseAction); //���������� �����
begin
  Action := caFree;
end;

procedure TMDIOperatorChild.lvLastUsersSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean); //�������� ������� (�����)
begin
  grpRefAdd.Caption := '������ �������: ' + Item.Caption;
  grpRefList.Caption := '������ �������: ' + item.Caption;
  ShowRef(PLastItem(Item.Data).id);
end;

procedure TMDIOperatorChild.lvRefListDblClick(Sender: TObject);
begin
  qry.Open('SELECT ref_note FROM tbl_ref WHERE id = ' + lvRefList.Selected.Caption);
  if qry.RowsAffected > 0 then ShowMsg(qry.Fields[0].Text,MB_ICONINFORMATION);
end;

end.

