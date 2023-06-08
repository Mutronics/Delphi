program Project;

uses
  System.SysUtils,
  System.IniFiles,
  System.IOUtils,
  Forms,
  frmMain in 'frmMain.PAS' {MainForm},
  frmOperator in 'frmOperator.pas' {MDIOperatorChild},
  frmFind in 'frmFind.pas' {FindForm},
  frmStatist in 'frmStatist.pas' {MDIStatistChild},
  Func in 'Func.pas',
  frmDBSet in 'frmDBSet.pas' {MDISettingsChild};

{$R *.RES}

begin
  AppPath := ExtractFilePath(Application.ExeName);
  ini := TIniFile.Create(TPath.Combine(AppPath, 'settings.ini'));
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.

