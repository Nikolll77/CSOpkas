unit csopkas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls,MySQLOpkas;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ADOConnection1: TADOConnection;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MySqlOpas:TMySqlOpkas;

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
   Zapros : TADOQuery;

begin
   MySqlOpas:=TMySqlOpkas.create;
   MySqlOpas.Connect;

{   Zapros:=TADOQuery.Create(nil);
   Zapros.Connection:=ADOConnection1;
   Zapros.SQL.Clear;

   Zapros.SQL.Add('');    }

{   Zapros.SQL.Add('INSERT INTO oper([operdata],[opertime],[kasirID],[kassa],[oper],[sum],[currency],[sumUAH],[kvit],[rate],[smena],[opername],[rateNBU],[dopinfo],[clientID],[komis],[prizn],[notate])');
   Zapros.SQL.Add('VALUES (:Param1,:Param2,:Param3,:Param4,:Param5,:Param6,:Param7,:Param8,:Param9,:Param10,:Param11,:Param12,:Param13,:Param14,:Param15,:Param16,:Param17,:Param18)');
   Zapros.Parameters.ParamByName('Param1').Value:=FormatDateTime('dd-mm-yyyy', main.idDate);
   Zapros.Parameters.ParamByName('Param2').Value:=now;
   Zapros.Parameters.ParamByName('Param3').Value:=p.kasirID;
   Zapros.Parameters.ParamByName('Param4').Value:=2;
   Zapros.Parameters.ParamByName('Param5').Value:=p.oper;
   Zapros.Parameters.ParamByName('Param6').Value:=p.summa;
   Zapros.Parameters.ParamByName('Param7').Value:=p.curr;
   Zapros.Parameters.ParamByName('Param8').Value:=p.ekv;
   Zapros.Parameters.ParamByName('Param9').Value:=p.kvit;
   Zapros.Parameters.ParamByName('Param10').Value:=p.rate;
   Zapros.Parameters.ParamByName('Param11').Value:=p.smena;
   case p.oper of
      1: Zapros.Parameters.ParamByName('Param12').Value:='Купівля';
      2: Zapros.Parameters.ParamByName('Param12').Value:='Продаж';
      100: Zapros.Parameters.ParamByName('Param12').Value:='Конвертація';
   end;
   Zapros.Parameters.ParamByName('Param13').Value:=p.rateNBU;
   Zapros.Parameters.ParamByName('Param14').Value:=p.earmark;
   Zapros.Parameters.ParamByName('Param15').Value:=p.clientID;
   Zapros.Parameters.ParamByName('Param16').Value:=p.komis;
   Zapros.Parameters.ParamByName('Param17').Value:=p.prizn;
   Zapros.Parameters.ParamByName('Param18').Value:=p.notate;}

  { Zapros.ExecSQL;
   Zapros.Close;
   Zapros.Free;      }

end;

end.
