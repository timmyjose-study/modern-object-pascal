{$mode objfpc}{$H+}{$J-}

program CaseOps;
var
  N: Integer = 0;

procedure GetNum(var N: Integer);
begin
  ReadLn(N)
end;

procedure ProcessNum(const N: Integer);
begin
  case N of
    0, 1, 2: WriteLn('Number if 1 1, or 2');
    3: WriteLn('Number is 3');
    4, 5: WriteLn('Number is 4 or 5');
    6..10: WriteLn('Number is between 6 and 10');
  else
    WriteLn('Number is something else')
  end
end;

begin
  GetNum(N);
  ProcessNum(N)
end.
