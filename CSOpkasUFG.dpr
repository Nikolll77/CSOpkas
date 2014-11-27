program CSOpkasUFG;

uses
  Forms,
  csopkas in 'csopkas.pas' {Form1},
  MySQLOpkas in 'MySQLOpkas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
