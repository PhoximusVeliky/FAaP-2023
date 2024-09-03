unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    procedure MyPrivat;
    procedure MyDouble;
  public

  end;

var
  Form1: TForm1;
  MyNum:real;

implementation

{$R *.lfm}
procedure UdvoeniePoSsilke(var r: real);
begin
  r:= r * 2;
end;


{ TForm1 }
function FuncUdvoenie(st: string): string;
var
  r: real;
begin
   //полученную строку сначала преобразуем в число:
   r:= StrToFloat(st);
   //теперь удвоим его:
   r:= r * 2;
   //теперь вернем результат в виде строки:
   Result:= FloatToStr(r);
end;

procedure Udvoenie(st: string);
var
  r: real;
begin
   //полученную строку преобразуем в число:
   r:= StrToFloat(st);
   //теперь удвоим его:
   r:= r * 2;
   //теперь выведем результат в сообщении:
   ShowMessage(FloatToStr(r));
end;


procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.MyPrivat;
var
  r: real;
begin
  //преобразуем в число то, что ввел пользователь:
  r:= StrToFloat(Edit1.Text);
  //теперь удвоим его:
  r:= r * 2;
  //теперь выведем результат в сообщении:
  ShowMessage(FloatToStr(r));
end;

procedure TForm1.MyDouble;
begin
  begin
  //удвоим глобальную переменную:
  MyNum:= MyNum * 2;
end;
end;




procedure TForm1.Button1Click(Sender: TObject);
begin
  Udvoenie(Edit1.Text);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ShowMessage(FuncUdvoenie(Edit1.Text));
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  myReal: real;
begin
  myReal:= StrToFloat(Edit1.Text);
  UdvoeniePoSsilke(myReal);
  ShowMessage(FloatToStr(myReal));
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  MyPrivat;
end;




procedure TForm1.Button5Click(Sender: TObject);
begin
  MyNum:= StrToFloat(Edit1.Text);
  //теперь удвоим его:
  MyDouble;
  //выводим результат на экран:
  ShowMessage(FloatToStr(MyNum));
end;


procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

end.

