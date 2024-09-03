uses GraphABC,M;  
var
  i,step,x,y,t,n: integer;
{
procedure Draw();
begin
  i := i mod 4;
  case i of
    0: LineRel(Step, 0);
    1,-3: LineRel(0, Step);
    2,-2: LineRel(-Step, 0);
    3,-1: LineRel(0, -Step);
  end;
end;
}
procedure Fractal(a: integer; b: integer);
begin
  if (a <= 0) then  exit;
  a:=a-1;
  Fractal(a, b);
  Draw(i,step);
  Fractal(a, -b);
  Draw(i,step);
  Fractal(a, b);
  i += b;
  Draw(i,step);
  i += b;
  Fractal(a, -b);
  Draw(i,step);
  Fractal(a, b);
  Draw(i,step);
  Fractal(a, -b);
  i -= b;
  Draw(i,step);
  i -= b;
  Fractal(a, b);
  Draw(i,step);
  Fractal(a, -b);
  Draw(i,step);
  Fractal(a, b);
end;

procedure KeyDown(key: integer);//Движ
begin
  case key of
    VK_W:  y -= 5; 
    VK_S:  y += 5;
    VK_A:  x -= 5;
    VK_D:  x += 5;
    VK_Z:  t -= 5;
    VK_X:  t += 5;
    VK_E:  n -= 1; 
    VK_Q:  n += 1;
  end; 
  Window.Clear;
  Step:=t;
  if step<=0 then begin
                  step:= 1;
                  t:=0;
                  end;
  MoveTo(x, y);
  Fractal(n, -1);
  redraw;
end;

begin
  SetWindowSize(500, 500);
  t:=5; n:=1;
  Step:=1*t;
  i:=1;
  x:=15; y:=15;
  
  LockDrawing;
  MoveTo(x, y);
  Fractal(n, -1);
  redraw;
  onKeyDown += keydown;
  
end.