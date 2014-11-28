program CSOpkasUFG;

uses
  Forms,
  csopkas in 'csopkas.pas' {Form1},
  MySQLOpkas in 'MySQLOpkas.pas',
  progressForm in 'progressForm.pas' {ProgressFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TProgressFrm, ProgressFrm);
  Application.Run;
end.
