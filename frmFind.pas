unit frmFind;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFindForm = class(TForm)
    grpFind: TGroupBox;
    lblFio: TLabel;
    lblInfo: TLabel;
    edtFindName: TEdit;
    mmoData: TMemo;
    btnFind: TButton;
    lvUsers: TListView;
    lvFindRef: TListView;
    mmoRefInfo: TMemo;
    lblFindRef: TLabel;
    lblFindRefInfo: TLabel;
    procedure btnFindClick(Sender: TObject);
    procedure lvUsersSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure lvFindRefSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FindForm: TFindForm;

implementation

{$R *.dfm}

uses
  Func;

procedure TFindForm.btnFindClick(Sender: TObject); //Поиск пользователя
var
  txt: string;
  rec: PLastItem;
begin
  txt := Trim(edtFindName.Text);
  qry.Open('SELECT fio,id FROM tbl_users WHERE LOWER(fio) LIKE LOWER(''%' + txt + '%'') ORDER BY id DESC');
  lvUsers.Items.BeginUpdate;
  lvUsers.Items.Clear;
  while not qry.Eof do
  begin
    new(rec);
    rec^.id := qry.Fields[1].AsInteger;
    with lvUsers.Items.Add do
    begin
      Caption := qry.Fields[0].Text;
      Data := rec;
    end;
    qry.Next;
  end;
  lvUsers.Items.EndUpdate;
  if lvUsers.Items.Count > 0 then
    lvUsers.ItemIndex := 0
  else
  begin
    mmoData.Clear;
    mmoRefInfo.Clear;
    lvFindRef.Items.Clear;
  end;
end;

procedure TFindForm.lvFindRefSelectItem(Sender: TObject; Item: TListItem; //Содержание справки
  Selected: Boolean);
begin
  qry.Open('SELECT ref_note,ref_name,TRUNC(ref_date),TRUNC(created) FROM tbl_ref WHERE id = ' + IntToStr(PLastItem(Item.Data).id));
  mmoRefInfo.Clear;
  if qry.RowsAffected > 0 then
    mmoRefInfo.Text := 'Имя справки: ' + qry.Fields[1].Text + #13#10 + 'Дата справки: ' + qry.Fields[2].Text + #13#10 + 'Дата создания: ' + qry.Fields[3].Text + #13#10 + 'Содержание:' + #13#10 + qry.Fields[0].Text;
end;

procedure TFindForm.lvUsersSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean); //Информация о пользователе (выбор)
var
  id: integer;
  rec: PLastItem;
begin
  lblInfo.Caption := 'Информация: ' + item.Caption;
  id := PLastItem(Item.Data).id;
  qry.Open('SELECT fio,TRUNC(birth),created FROM tbl_users WHERE id = ' + id.ToString);
  mmoData.Clear;
  if qry.RowsAffected > 0 then
  begin
    mmoData.Text := 'ФИО: ' + qry.Fields[0].Text + #13#10 + 'Создан: ' + qry.Fields[2].Text + #13#10 + 'День рождения: ' + qry.Fields[1].Text;
    qry.Open('SELECT ref_name,id FROM tbl_ref WHERE user_id = ' + id.ToString);
    lvFindRef.Items.BeginUpdate;
    lvFindRef.Items.Clear;
    if qry.RowsAffected > 0 then
    begin
      while not qry.Eof do
      begin
        New(rec);
        rec^.id := qry.Fields[1].AsInteger;
        with lvFindRef.Items.Add do
        begin
          Caption := qry.Fields[0].Text;
          Data := rec;
        end;
        qry.Next;
      end;
      lvFindRef.ItemIndex := 0;
    end;
    lvFindRef.Items.EndUpdate;
  end
end;

end.

