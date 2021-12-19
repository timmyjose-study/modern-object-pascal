{$mode objfpc}{$H+}{$J-}

unit InitDeinitUnit;

interface

procedure MyProcedure(const A: Integer);
function MyFunction(const S: String): String;

implementation

procedure MyProcedure(const A: Integer);
begin
  WriteLn(A, ' + 10 = ', A + 10)
end;

function MyFunction(const S: String): String;
begin
  Result := S + ' (strings are automatically managed in FreePascal)'
end;

initialization
  WriteLn('Initialising InitDeinitUnit')

finalization
  WriteLn('De-initialising InitDeinitUnit')
end.
