{$mode objfpc}{$H+}{$J-}

program FunctionsProcedures(input, output);

procedure MyProcedure(const A: Integer);
begin
  WriteLn('A + 10 is ', A + 10)
end;

function MyFunction(const S: String): String;
begin
  Result := S + 'strings are automatically managed'
end;

var
  X: Single;

begin
  WriteLn(MyFunction('Pascal '));
  MyProcedure(5);

  X := 15 / 5;
  WriteLn('X is now ', X);
  WriteLn('X is now ', X:1:2)
end.