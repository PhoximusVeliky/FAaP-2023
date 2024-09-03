Unit M;
uses GraphABC;
procedure Draw(i,step:integer);
begin
  i := i mod 4;
  case i of
    0: LineRel(Step, 0);
    1,-3: LineRel(0, Step);
    2,-2: LineRel(-Step, 0);
    3,-1: LineRel(0, -Step);
  end;
end;
begin end.