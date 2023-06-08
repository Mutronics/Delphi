unit frmStatist;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TMDIStatistChild = class(TForm)
    pnlFind: TPanel;
    splFind: TSplitter;
    pnlControls: TPanel;
    grpRefList: TGroupBox;
    grpFind: TGroupBox;
    lblFio: TLabel;
    edtFindFio: TEdit;
    chkBirth: TCheckBox;
    dtpBirth1: TDateTimePicker;
    dtpBirth2: TDateTimePicker;
    lblBirth1: TLabel;
    lblBirth2: TLabel;
    lblFind3: TLabel;
    dtpCreated1: TDateTimePicker;
    lblBirth3: TLabel;
    dtpCreated2: TDateTimePicker;
    chkFindDateCreated: TCheckBox;
    btnFind: TButton;
    grpUsers: TGroupBox;
    lvUsers: TListView;
    lvRef: TListView;
    grpRefCnt: TGroupBox;
    mmoRef: TMemo;
    btnClean: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkBirthClick(Sender: TObject);
    procedure chkFindDateCreatedClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure lvUsersSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure lvRefSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure btnCleanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MDIStatistChild: TMDIStatistChild;

implementation

{$R *.dfm}

uses
  Func;

procedure TMDIStatistChild.btnCleanClick(Sender: TObject); //Очистить строку поиска
begin
  edtFindFio.Clear;
end;

procedure TMDIStatistChild.btnFindClick(Sender: TObject); //Поиск пользователя
var
  txt, sql: string;
  rec: PLastItem;

  function CheckDate(dat1, dat2: TDateTime): Boolean;
  begin
    Result := False;
    if dat1 <= dat2 then
    begin
      ShowMsg('Дата "по" должна быть больше даты "с"', MB_ICONWARNING);
      Result := True;
    end;
  end;

begin
  txt := Trim(edtFindFio.Text);

  if chkBirth.Checked then
  begin
    if CheckDate(dtpBirth2.Date, dtpBirth1.Date) then
      exit;
    sql := 'AND birth BETWEEN TO_DATE(' + QuotedStr(DateToStr(dtpBirth1.Date)) + ', ''dd.mm.yyyy'') AND TO_DATE(' + QuotedStr(DateToStr(dtpBirth2.Date)) + ', ''dd.mm.yyyy'')';
  end;

  if chkFindDateCreated.Checked then
  begin
    if CheckDate(dtpCreated2.Date, dtpCreated1.Date) then
      exit;
    sql := sql + ' AND created BETWEEN TO_DATE(' + QuotedStr(DateToStr(dtpCreated1.Date)) + ', ''dd.mm.yyyy'') AND TO_DATE(' + QuotedStr(DateToStr(dtpCreated2.Date)) + ', ''dd.mm.yyyy'')';
  end;

  sql := 'SELECT fio,id FROM tbl_users WHERE LOWER(fio) LIKE LOWER(''%' + txt + '%'') ' + sql + ' ORDER BY id DESC';
  qry.Open(sql);
  lvUsers.Items.BeginUpdate;
  lvUsers.Items.Clear;
  if qry.RowsAffected > 0 then
  begin
    while not qry.Eof do
    begin
      New(rec);
      rec^.id := qry.Fields[1].AsInteger;
      with lvUsers.Items.Add do
      begin
        Caption := qry.Fields[0].Text;
        Data := rec;
      end;
      qry.Next;
    end;
    lvUsers.ItemIndex := 0;
  end
  else
  begin
    lvRef.Items.Clear;
    mmoRef.Clear;
  end;
  lvUsers.Items.EndUpdate;
end;

procedure TMDIStatistChild.chkBirthClick(Sender: TObject);
var
  b: Boolean;
begin
  b := chkBirth.Checked;
  dtpBirth1.Enabled := b;
  dtpBirth2.Enabled := b;
end;

procedure TMDIStatistChild.chkFindDateCreatedClick(Sender: TObject);
var
  b: Boolean;
begin
  b := chkFindDateCreated.Checked;
  dtpCreated1.Enabled := b;
  dtpCreated2.Enabled := b;
end;

procedure TMDIStatistChild.FormClose(Sender: TObject; var Action: TCloseAction); //Освободить форму
begin
  Action := caFree;
end;

procedure TMDIStatistChild.lvRefSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean); //Показать содержимое справки (выбор)
begin
  qry.Open('SELECT ref_note,ref_name,TRUNC(ref_date),TRUNC(created) FROM tbl_ref WHERE id = ' + IntToStr(PLastItem(Item.Data).id));
  if qry.RowsAffected > 0 then
    mmoRef.Text := 'Имя справки: ' + qry.Fields[1].Text + #13#10 + 'Дата справки: ' + qry.Fields[2].Text + #13#10 + 'Дата создания: ' + qry.Fields[3].Text + #13#10 + 'Содержание:' + #13#10 + qry.Fields[0].Text;
end;

procedure TMDIStatistChild.lvUsersSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean); //Показать списко справок (выбор)
var
  rec: PLastItem;
begin
  qry.Open('SELECT ref_name,id FROM tbl_ref WHERE user_id = ' + IntToStr(PLastItem(Item.Data).id) + ' ORDER BY id DESC');
  lvRef.Items.BeginUpdate;
  lvRef.Items.Clear;
  if qry.RowsAffected > 0 then
  begin
    while not qry.Eof do
    begin
      new(rec);
      rec^.id := qry.Fields[1].AsInteger;
      with lvRef.Items.Add do
      begin
        Caption := qry.Fields[0].Text;
        Data := rec;
      end;
      qry.Next;
    end;
    lvRef.ItemIndex := 0;
  end
  else
    mmoRef.Clear;
  lvRef.Items.EndUpdate;
end;

end.

