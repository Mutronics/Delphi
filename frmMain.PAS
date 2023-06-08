unit frmMain;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.Menus, Vcl.StdCtrls, Vcl.Dialogs, Vcl.Buttons,
  Winapi.Messages, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdActns, Vcl.ActnList,
  Vcl.ToolWin, Vcl.ImgList, System.ImageList, System.Actions, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, Data.DBXOracle, Data.Win.ADODB, Data.SqlExpr,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    mnuNewOperator: TMenuItem;
    Window1: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    WindowArrangeItem: TMenuItem;
    Edit1: TMenuItem;
    CutItem: TMenuItem;
    CopyItem: TMenuItem;
    PasteItem: TMenuItem;
    WindowMinimizeItem: TMenuItem;
    StatusBar: TStatusBar;
    ActionList1: TActionList;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    actOperator: TAction;
    actExit: TAction;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowArrangeAll1: TWindowArrange;
    WindowMinimizeAll1: TWindowMinimizeAll;
    actClose: TWindowClose;
    WindowTileVertical1: TWindowTileVertical;
    WindowTileItem2: TMenuItem;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ImageList1: TImageList;
    actStatist: TAction;
    btnStatist: TToolButton;
    mnuNewStatist: TMenuItem;
    btnDBSet: TToolButton;
    actDBSettings: TAction;
    mnuNewSet: TMenuItem;
    procedure actOperatorExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure actStatistExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    MDIChildOperatorCount: Integer;
    MDIChildStatistCount: Integer;
    procedure CloseMDIChild(Sender: TObject; var Action: TCloseAction);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  frmOperator, frmStatist, frmFind, frmDBSet, Func;

procedure FindModuleInit(pnl: TPanel); //Добавление модуля поиска
begin
  FindForm := TFindForm.Create(pnl);
  with FindForm do
  begin
    Align := alClient;
    Parent := pnl;
    Top := 10;
    Left := 10;
    Show;
  end;
end;

procedure TMainForm.CloseMDIChild(Sender: TObject; var Action: TCloseAction); //Освободить форму
begin
  Action := caFree;
end;

procedure TMainForm.FormCreate(Sender: TObject); //Читаем настройки и соединяемся
begin
  ReadSet;
  OpenOrc;
end;

procedure TMainForm.actOperatorExecute(Sender: TObject); //Вызываем окно оператора
begin
  if CheckDB then
    exit;
  Inc(MDIChildOperatorCount);
  ChildOperator := TMDIOperatorChild.Create(Application);
  with ChildOperator do
  begin
    Caption := 'Оператор ' + MDIChildOperatorCount.ToString();
    OnClose := CloseMDIChild;
    Width := 900;
    Height := 600;
    dtpBirth.DateTime := Now;
    dtpRefDate.DateTime := Now;
    FindModuleInit(ChildOperator.pnlFind);
  end;
  ShowLast;

end;

procedure TMainForm.actStatistExecute(Sender: TObject); //Вызываем окно статиска
begin
  if CheckDB then
    exit;
  Inc(MDIChildStatistCount);
  ChildStatist := TMDIStatistChild.Create(Application);
  with ChildStatist do
  begin
    Caption := 'Статист ' + MDIChildStatistCount.ToString();
    OnClose := CloseMDIChild;
    Width := 900;
    Height := 600;
    dtpBirth1.DateTime := Now;
    dtpBirth1.DateTime := Now;
    dtpCreated1.DateTime := Now;
    dtpCreated2.DateTime := Now;
    FindModuleInit(pnlFind);
  end;

end;

procedure TMainForm.actSettingsExecute(Sender: TObject); //Вызываем окно настроек БД
var
  ChildSettings: TMDISettingsChild;
begin
  ChildSettings := TMDISettingsChild.Create(Application);
  with ChildSettings do
  begin
    edtDBDatabase.Text := dbDatabase;
    edtDBUser.Text := dbUser;
    edtDBPassword.Text := dbPassword;
  end;
  ChildSettings.OnClose := CloseMDIChild;
end;

procedure TMainForm.actExitExecute(Sender: TObject);  //Выход
begin
  Close;
end;

end.

