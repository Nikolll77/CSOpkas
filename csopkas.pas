unit csopkas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls,MySQLOpkas;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ADOConnection1: TADOConnection;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    mySqlOpkas:TMySqlOpkas;

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
   Zapros : TADOQuery;
   clientBuffer:TbuferClientRecord;
begin
   mySqlOpkas:=TMySqlOpkas.create;
   mySqlOpkas.Connect;

   Zapros:=TADOQuery.Create(nil);
   Zapros.Connection:=ADOConnection1;
   Zapros.SQL.Clear;
   Zapros.SQL.Add('select * from clients order by id');
   Zapros.Open;
   mySqlOpkas.Clients_Sinchro(Zapros);


end;

end.
