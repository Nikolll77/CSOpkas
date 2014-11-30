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
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    mySqlOpkas:TMySqlOpkas;

  end;

var
  Form1: TForm1;

implementation

uses Math;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
   Zapros : TADOQuery;
   clientBuffer:TbuferClientRecord;
   ClIdOnline:integer;
begin
   mySqlOpkas:=TMySqlOpkas.create;
   mySqlOpkas.Connect;

   Zapros:=TADOQuery.Create(nil);
   Zapros.Connection:=ADOConnection1;
   Zapros.SQL.Clear;
   Zapros.SQL.Add('select * from clients order by id');
   Zapros.Open;
   Zapros.Next;

//   if zapros.
   mySqlOpkas.ClientToBufer(zapros,clientBuffer);
   ClIdOnline:=-1;
   if (trim(clientBuffer.num)<>'') then
       ClIdOnline:=mySqlOpkas.GetClientId_Sinchro(clientBuffer);
   if ClIdOnline=-1 then ShowMessage('Не идентифицированы данные клиента!');

//   mySqlOpkas.Clients_Sinchro(Zapros);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
   Zapros : TADOQuery;
   operBuffer:TbuferOperRecord;
   ClIdOnline:integer;
begin
   mySqlOpkas:=TMySqlOpkas.create;
   mySqlOpkas.Connect;

   Zapros:=TADOQuery.Create(nil);
   Zapros.Connection:=ADOConnection1;
   Zapros.SQL.Clear;
   Zapros.SQL.Add('select * from oper order by id');
   Zapros.Open;
   Zapros.Next;

//   if zapros.
   mySqlOpkas.OperToBufer(zapros,operBuffer);
   mySqlOpkas.insertOperRecord(operBuffer);
//   mySqlOpkas.Clients_Sinchro(Zapros);


end;

procedure TForm1.Button3Click(Sender: TObject);
var
   LocalClientId:integer;
   summa:real;
   date_from,date_to:TDateTime;
begin

   LocalClientId:=55;

   mySqlOpkas:=TMySqlOpkas.create;
   mySqlOpkas.Connect;
   summa:=mySqlOpkas.getSumVidanoHrn(LocalClientId,date_from,date_to);


   ShowMessage(FloatToStr(summa));

end;

end.
