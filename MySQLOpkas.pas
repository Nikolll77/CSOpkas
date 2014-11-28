unit MySQLOpkas;

interface

uses ADODB,SysUtils,progressForm,dialogs,forms;


type

  TbuferClientRecord=record
    id:integer;
    Name:string;
    dType:string;
  	ser:string;
	  num:string;
   	info:string;
   	adres:string;
  	isresident:Smallint;
  	Country:string;
  	firstdate:TDateTime;
  	limitdate:TDateTime;
  	birthday:TDateTime;
  end;

  TMySqlOpkas=class

  private
      MysqlConnection: TADOConnection;
      connected:boolean;
      c_NullDate:Double;

  public

      Constructor create();
      Destructor destroy();
      function Connect():integer;
      function Clients_Sinchro(LocalClients: TADOQuery):integer;
      procedure onConnect(Connection: TADOConnection; const Error: Error; var EventStatus: TEventStatus);
      procedure onDisconnect(Connection: TADOConnection;  var EventStatus: TEventStatus);
      procedure currClientToBufer(LocalClients:TADOQuery;var buferClientRecord:TbuferClientRecord);      
      function checkClientInBase(buferClientRecord:TbuferClientRecord):integer;
      function insertClientRecord(buferClientRecord:TbuferClientRecord):integer;      
  end;

implementation

uses Math, Variants, Classes;

procedure TMysqlOpkas.currClientToBufer(LocalClients:TADOQuery;var buferClientRecord:TbuferClientRecord);
begin
   with buferClientRecord do
   begin
    id:=LocalClients['id'];
    if LocalClients['Name']=null then Name:='' else Name:=LocalClients['Name'];
    if LocalClients['dType']=null then dType:='' else dType:=LocalClients['dType'];
  	if LocalClients['ser']=null then ser:='' else ser:=LocalClients['ser'];
	  if LocalClients['num']=null then num:='' else num:=LocalClients['num'];
   	if LocalClients['info']=null then info:='' else info:=LocalClients['info'];
   	if LocalClients['adres']=null then adres:='' else adres:=LocalClients['adres'];
  	isresident:=LocalClients['isresident'];
  	if LocalClients['Country']=null then Country:='' else Country:=LocalClients['Country'];
    if LocalClients['firstdate']=null then firstdate:=c_NullDate else firstdate:=LocalClients['firstdate'];
    if LocalClients['limitdate']=null then limitdate:=c_NullDate else limitdate:=LocalClients['limitdate'];
    if LocalClients['birthday']=null  then birthday:=c_NullDate else birthday:=LocalClients['birthday'];

  end;
end;

function TMysqlOpkas.checkClientInBase(buferClientRecord:TbuferClientRecord):integer;
var
  zapros:TADOQuery;
begin
   result:=0;
   Zapros:=TADOQuery.Create(nil);
   Zapros.Connection:=MysqlConnection;
   Zapros.SQL.Add('select ser,num from clients where ser="'+buferClientRecord.ser+'" and num="'+buferClientRecord.num+'"');
     //Zapros.Parameters.ParamByName('serr').Value:=buferClientRecord.ser;
     //Zapros.Parameters.ParamByName('numm').Value:=buferClientRecord.num;
   zapros.Open;
   If zapros.RecordCount>=1 then result:=1;
   Zapros.Close;
   Zapros.Free;
end;

function TMysqlOpkas.insertClientRecord(buferClientRecord:TbuferClientRecord):integer;
var
  zapros:TADOQuery;
begin
   Zapros:=TADOQuery.Create(nil);
   Zapros.Connection:=MysqlConnection;
   Zapros.Parameters.Clear;

  Zapros.SQL.Add('INSERT INTO clients(name,dType,ser,num,info,adres,isresident,country,firstdate,limitdate,birthday) ');
  Zapros.SQL.Add('VALUES (:p_name,:p_dType,:p_ser,:p_num,:p_info,:p_adres,:p_isresident,:p_country,:p_firstdate,:p_limitdate,:p_birthday)');

     Zapros.Parameters.ParamByName('p_name').Value:=buferClientRecord.Name;
     Zapros.Parameters.ParamByName('p_dType').Value:=buferClientRecord.dType;
     Zapros.Parameters.ParamByName('p_ser').Value:=buferClientRecord.ser;
     Zapros.Parameters.ParamByName('p_num').Value:=buferClientRecord.num;
     Zapros.Parameters.ParamByName('p_info').Value:=buferClientRecord.info;
     Zapros.Parameters.ParamByName('p_adres').Value:=buferClientRecord.adres;
     Zapros.Parameters.ParamByName('p_isresident').Value:=buferClientRecord.isresident;
     Zapros.Parameters.ParamByName('p_Country').Value:=buferClientRecord.Country;
     Zapros.Parameters.ParamByName('p_isresident').Value:=buferClientRecord.isresident;
     Zapros.Parameters.ParamByName('p_firstdate').Value:=buferClientRecord.firstdate;
     Zapros.Parameters.ParamByName('p_limitdate').Value:=buferClientRecord.limitdate;
     Zapros.Parameters.ParamByName('p_birthday').Value:=buferClientRecord.birthday; 

     result:=Zapros.ExecSQL;  // колво обработаніх записей       


   Zapros.Close;
   zapros.Free;

end;




procedure TMysqlOpkas.onConnect(Connection: TADOConnection; const Error: Error; var EventStatus: TEventStatus);
begin
  connected:=true;
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
              'Provider=MSDASQL.1;Persist Security Info=True;Extended Properties="Driver=MySQL ODBC 5.3 ANSI Driver;SERVER=91.195.75.20;UID=nikolll77;PWD=OK!@34ufgnikolll77;DATABASE=OpkasUFG;PORT=3306;NO_PROMPT=1;AUTO_RECONNECT=1;COLUMN_SIZE_S32=1"';
        Open;
    end;

end;

Constructor TMysqlOpkas.create();
begin
    connected:=false;
    MysqlConnection:=TADOConnection.Create(nil);
    MysqlConnection.OnConnectComplete:=onConnect;
    MysqlConnection.OnDisconnect:=onDisconnect;
    c_NullDate:=0;
end;

Destructor TMysqlOpkas.destroy();
begin
  MysqlConnection.Close;
  MysqlConnection.Free;
end;

function TMysqlOpkas.Clients_Sinchro(LocalClients: TADOQuery):integer;
var
buferClientRecord: TbuferClientRecord;
i:integer;
begin
result:=-1;
If connected then
begin
   ProgressFrm.show;
   i:=0;
   LocalClients.First;
   while not LocalClients.Eof do
   begin
       currClientToBufer(LocalClients,buferClientRecord);
       if checkClientInBase(buferClientRecord)=0 then
           insertClientRecord(buferClientRecord);
     i:=i+1;
     ProgressFrm.Label1.Caption:=IntToStr(i);
     Application.ProcessMessages;
     LocalClients.Next;
   end;


end;

end;


end.
