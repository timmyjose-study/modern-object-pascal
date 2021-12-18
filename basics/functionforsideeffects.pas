{$mode objfpc}{$H+}{$J-}

program FunctionForSideEffects(output);
var
  N: Integer;

function CountMe: Integer;
begin
  Inc(N);
  Result := N
end;

begin
  N := 10;
  WriteLn('Before, N = ', N);
  CountMe;
  WriteLn('After, N = ', N)
end.