unit frmDBSet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TMDISettingsChild = class(TForm)
    lblDBUser: TLabel;
    lblDBDatabase: TLabel;
    lblDBPassword: TLabel;
    edtDBUser: TEdit;
    edtDBDatabase: TEdit;
    edtDBPassword: TEdit;
    btnDBSave: TButton;
    btnCreateTables: TButton;
    btnDropTables: TButton;
    procedure btnDBSaveClick(Sender: TObject);
    procedure btnCreateTablesClick(Sender: TObject);
    procedure btnDropTablesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MDISettingsChild: TMDISettingsChild;

implementation

{$R *.dfm}

uses
  Func;

procedure TMDISettingsChild.btnCreateTablesClick(Sender: TObject); //������� ��
begin
  CreateDB;
end;

procedure TMDISettingsChild.btnDBSaveClick(Sender: TObject);  //��������� ���������
begin
  dbDatabase := Trim(edtDBDatabase.Text);
  dbUser := Trim(edtDBUser.Text);
  dbPassword := Trim(edtDBPassword.Text);
  ini.WriteString('settings', 'User', dbUser);
  ini.WriteString('settings', 'Password', dbPassword);
  ini.WriteString('settings', 'Database', dbDatabase);
  if mcon.Connected then mcon.Close;
  if OpenOrc then Close;
end;

procedure TMDISettingsChild.btnDropTablesClick(Sender: TObject); //������� �������
begin
  if TableExists('TBL_USERS') then mcon.ExecSQL('DROP TABLE TBL_USERS');
  if TableExists('TBL_REF') then  mcon.ExecSQL('DROP TABLE TBL_REF');
  StatusMsg('������� �������');
end;

end.

