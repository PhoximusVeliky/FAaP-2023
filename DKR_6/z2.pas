program zad2;
uses crt;
const 
n = 10;
type arr = array [0..n-1] of integer;
var   b,p: integer;
      A:arr;flag: boolean;
  
  function TakeNumber:integer;
  var a:integer;
  begin
    read(a);
    result:=a;
  end;
  
  procedure full (var A:arr);
  var i:integer;
  begin
  for i:=0 to n-1 do A[i]:=maxint;
  end;
  
  procedure WriteAD (var A:arr);
  var i,k:integer;
  begin
  k:=0; 
  for i:=0 to n-1 do if MaxInt<>A[i] then k+=1;
  if (k<>n) then Write(' ____    ');
     Write(' ____     ____     ____     ____     ____     ____     ____     ____     ____     ____     ');
   if (k<>n) then Write('____');
   Writeln;
   if (k<>n) then  Write('|  x | = ');
  for i:=0 to n-1 do begin                              
                     if A[i]=MaxInt then Write('|  x |')
                                    else Write('|',A[i]:4,'|');
                     if i<>n-1 then Write(' = ');
                     end;
    if (k<>n) then  Write(' = |  x |');
     Writeln;
     if (k<>n) then Write(' ‾‾‾‾    ');
     Write(' ‾‾‾‾     ‾‾‾‾     ‾‾‾‾     ‾‾‾‾     ‾‾‾‾     ‾‾‾‾     ‾‾‾‾     ‾‾‾‾     ‾‾‾‾     ‾‾‾‾     ');
      if (k<>n) then Write('‾‾‾‾');
    Writeln;
 end;
  
  

  procedure AddFirst ( var A:arr;  NewNumber: integer);
  var i, k :integer;
  begin
  for i:=0 to n-1 do if MaxInt<>A[i] then k+=1;
  if k=n then begin
              Writeln('Превышено кол-во элементов');
              exit;
              end
  else  begin
        for i:=n-2 downto 0 do A[i+1]:=A[i]; /// 1 2 3 4 5 6 7 8
        A[0]:=NewNumber;
        end;
  end;
  
  procedure AddLast ( var A:arr;  NewNumber: integer);
  var i, k :integer;
  begin
  for i:=0 to n-1 do if MaxInt<>A[i] then k+=1;
  if k=n then begin
              Writeln('Превышено кол-во элементов');
              exit;
              end
  else begin
       for i:=n-2 downto 0 do 
         if A[i]<>MaxInt then
           begin
           A[i+1]:=NewNumber;
           Break;
           end;     
       end;
  end;
  
   procedure AddBefore ( var A:arr;  NewNumber: integer; posarr:integer);
   var k,i:integer;
   begin
   for i:=0 to n-1 do if MaxInt<>A[i] then k+=1;
   if k=n then begin
               Writeln('Превышено кол-во элементов');
               exit;
               end
   else begin
         if (posarr >= 0) and (posarr < n) then
           begin
           for i:=n-2 downto posarr do A[i+1]:=A[i];
           A[posarr]:=NewNumber;
           end
         else Writeln('Неверная позиция для вставки');
         end;
   end;
   
   procedure AddAfter  ( var A:arr;  NewNumber: integer; posarr:integer);
   var k,i:integer;
   begin
   for i:=0 to n-1 do if MaxInt<>A[i] then k+=1;
   if k=n then begin
               Writeln('Превышено кол-во элементов');
               exit;
               end
   else begin
        if (posarr>=0) and (posarr<n-1) then
         begin
          for i:=n-2 downto posarr+1 do A[i+1] := A[i];
          A[posarr + 1] := NewNumber;
         end
        else Writeln('Неверная позиция для вставки'); 
        end;
   end;
   
   procedure delete(var A: arr; posarr: integer);
   var i: integer;
   begin
   if (posarr >= 0) and (posarr < n) then   
      begin
      for i:=posarr to n-2 do A[i]:=A[i+1];
      A[n-1]:=MaxInt; 
      end
   else Writeln('Неверная позиция для удаления');
end;


  begin
  full(A);
  Writeln('Двусвязный список');
  WriteAD(A);
  repeat
  flag:=true;
  writeln('Что вы хотите сделать?');
  writeln('1: Добавить элемент');
  writeln('2: Удалить элемент');
  writeln('3: Очистить список');
  writeln('4: Закрыть приложение');
  readln(b);
  case b of
       1:begin
         writeln('Куда вы хотите добавить элемент?');
         writeln('1: В начало');
         writeln('2: Перед...');
         writeln('3: После...');
         writeln('4: В конец ');
         readln(b);
         case b of
              1: begin
                 writeln('Введите число');
                 AddFirst(A,TakeNumber);
                 end;
              2: begin
                 writeln('Введите номер элемента перед которым нужно добавить новый элемент');
                 read(p);
                 writeln('Введите число');
                 AddBefore(A,TakeNumber,p)
                 end;
              3: begin
                 writeln('Введите номер элемента после которого нужно добавить новый элемент');
                 read(p);
                 writeln('Введите число');
                 AddAfter(A,TakeNumber,p)
                 end;
              4: begin
                 writeln('Введите число');
                 AddLast(A,TakeNumber);
                 end;
         end;
         writeln('Элемент успешно добавлено');
         WriteAD(A);
         flag:=false;
         end;
         
       2:begin
         writeln('Введите номер элемента который нужно удалить');
         read(p);
         delete(A,p);
         writeln('Элемент успешно удалено');
         WriteAD(A);
         flag:=false;
         end;
       3:begin
         full(A);
         WriteAD(A);
         flag:=false;
         end;
       4:Exit;
  end;
  flag:=false; 
  until flag=true;
  end.