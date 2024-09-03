unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Num1: TButton;
    Num2: TButton;
    Num3: TButton;
    Num4: TButton;
    Num5: TButton;
    Num6: TButton;
    Num7: TButton;
    Num8: TButton;
    Num9: TButton;
    Num0: TButton;
    Zapataia: TButton;
    AC: TButton;
    Strelochka: TButton;
    C: TButton;
    Delenee: TButton;
    Umnogenie: TButton;
    Menus: TButton;
    Plus: TButton;
    Ravno: TButton;
    Drob: TButton;
    Stepen2: TButton;
    Koren: TButton;

    Edit1: TEdit;
    procedure ZapataiaClick(Sender: TObject);
    procedure ACClick(Sender: TObject);
    procedure StrelochkaClick(Sender: TObject);
    procedure CClick(Sender: TObject);
    procedure MenusClick(Sender: TObject);
    procedure RavnoClick(Sender: TObject);
    procedure DrobClick(Sender: TObject);
    procedure Stepen2Click(Sender: TObject);
    procedure KorenClick(Sender: TObject);
    procedure ClickBut(Sender: TObject);
    procedure Clicktub(Sender: TObject);
  private


  public

  end;

var
  Form1: TForm1;
  a,b,c: real;
  z: string;

implementation

{$R *.lfm}

{ TForm1 }
procedure TForm1.ClickBut(Sender: TObject);
begin
 Edit1.text:=Edit1.text + (Sender as TButton).Caption;
end;

procedure TForm1.Clicktub(Sender: TObject);
begin
  if Edit1.text <> '' then
  begin
  a:=StrToFloat(Edit1.text);
  Edit1.Clear;
  z:=(Sender as TButton).Caption;
  end;
end;

procedure TForm1.StrelochkaClick(Sender: TObject);
var
  sr:string;
begin
  sr := Edit1.text;
  if sr <> '' then delete(sr, length(sr), 1);
  Edit1.text:= sr;
end;

procedure TForm1.CClick(Sender: TObject);
begin
  Edit1.Clear;
  a:=0;
  b:=0;
  c:=0;
end;

procedure TForm1.MenusClick(Sender: TObject);
var
  sr:string;
begin
  sr := Edit1.text;
  if (sr = '') or (sr[1] = '-') then begin
                                     sr:='-';
                                     Edit1.text:= sr;
                                     end
             else begin
                    if Edit1.text <> '' then
                    begin
                    a:=StrToFloat(Edit1.text);
                    Edit1.Clear;
                    z:=(Sender as TButton).Caption;
                    end;
                  end;

end;

procedure TForm1.RavnoClick(Sender: TObject);
var
  sr:string;
begin
  sr := Edit1.text;
  if (Edit1.text <> '') and (sr <> '-') and (sr <> ',') then
  begin
  b := StrToFloat(Edit1.text);
  Edit1.Clear;
  case z of
    '+': c:=a+b;
    '-': c:=a-b;
    '*': c:=a*b;
    '/': if b=0 then begin
                     c:=0;
                     ShowMessage('на ноль делить неможно');
                     end
                else c:=a/b;
  end;
  Edit1.text:=FloatToStr(c);
  end;
end;

procedure TForm1.DrobClick(Sender: TObject);
begin
  if Edit1.text <> '' then
  begin
  a:=StrToFloat(Edit1.text);
  if (a<>0) and (1.5E-45<1/a) then a:= 1/a;
  Edit1.text:=floatToStr(a);
  a:=0;
  end;
end;

procedure TForm1.Stepen2Click(Sender: TObject);
begin
  if Edit1.text <> '' then
  begin
  a:=StrToFloat(Edit1.text);
  a:= a*a;
  if 3.402823466E+38 > a*a then  Edit1.text:=floatToStr(a);
  a:=0;
  end;
end;

procedure TForm1.KorenClick(Sender: TObject);
begin
  if Edit1.text <> '' then
  begin
  a:=StrToFloat(Edit1.text);
  if a<=0 then ShowMessage('ироциональные числа и другой бред не поддерживаются')
          else a:= sqrt(a);
  Edit1.text:=floatToStr(a);
  a:=0;
  end;
end;

procedure TForm1.ACClick(Sender: TObject);
begin
  Edit1.Clear;
end;

procedure TForm1.ZapataiaClick(Sender: TObject);
var
  sr:string;
  k:int64;
begin
  sr:=Edit1.text;
  k:=pos(',',sr);
  //for i:=1 to length(sr) do if sr[i] = ',' then k:=1+k;
  if k=0 then Edit1.text:=Edit1.text + (Sender as TButton).Caption;
  k:=0;

end;


end.

