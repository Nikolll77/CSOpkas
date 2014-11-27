unit MySQLOpkas;

interface

uses ADODB,dialogs;

type

  TbuferClientRecord=record
    id:integer;
    Name:string;
    dType:string;
  end;

  TMySqlOpkas=class

  private
      MysqlConnection: TADOConnection;
      connected:boolean;

      procedure CurrClientToBufer(LocalClients:TADOQuery;buferClientRecord:TbuferClientRecord);
  public

      Constructor create();
      Destructor destroy();
      function Connect():integer;
      function Clients_Sinchro(LocalClients: TADOQuery):integer;
      procedure onConnect(Connection: TADOConnection; const Error: Error; var EventStatus: TEventStatus);
      procedure onDisconnect(Connection: TADOConnection;  var EventStatus: TEventStatus);
  end;

implementation

uses Math;

procedure TMysqlOpkas.CurrClientToBufer(LocalClients:TADOQuery;buferClientRecord:TbuferClientRecord);
begin

end;

procedure TMysqlOpkas.onConnect(Connection: TADOConnection; const Error: Error; var EventStatus: TEventStatus);
begin
  connected:=true;

     ShowMessage('sdf');
end;

procedure TMysqlOpkas.onDisconnect(Connection: TADOConnection;  var EventStatus: TEventStatus);
begin
  connected:=False;
end;


function TMysqlOpkas.Connect:integer;
begin

    with  MysqlConnection do
    begin
        LoginPrompt:=False;
        ConnectionString:=
              'Provider=MSDASQL.1;Persist Security Info=True;Extended Properties="Driver=MySQL ODBC 5.3 ANSI Driver;SERVER=localhost;UID=root;PWD=zxcv4321;DATABASE=opkasufg;PORT=3306;NO_PROMPT=1;AUTO_RECONNECT=1;COLUMN_SIZE_S32=1"';
        Open;
    end;

end;

Constructor TMysqlOpkas.create();
begin
    connected:=false;
    MysqlConnection:=TADOConnection.Create(nil);
    MysqlConnection.OnConnectComplete:=onConnect;
    MysqlConnection.OnDisconnect:=onDisconnect;
end;

Destructor TMysqlOpkas.destroy();
begin
  MysqlConnection.Close;
  MysqlConnection.Free;
end;

function TMysqlOpkas.Clients_Sinchro(LocalClients: TADOQuery):integer;
var
buferClientRecord: TbuferClientRecord;
begin
result:=-1;
If connected then
begin

   LocalClients.First;
   while not LocalClients.Eof do
   begin
       CurrClientToBufer(LocalClients,buferClientRecord);
       if not CheckKlientInBase(buferClientRecord) then
            InsertClientsRecord(buferClientRecord);
   end;

end;

end;


end.
