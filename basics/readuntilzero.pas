{$mode objfpc}{$H+}{$J-}

program ReadUntilZero(input, output);
uses SysUtils;

function ReadIntegersUntilZero: String;
var
  N: Integer;
begin
  ReadLn(N);

  Result := IntToStr(N);

  if N <> 0 then
    Result := Result + ' ' + ReadIntegersUntilZero()
end;

begin
  WriteLn(ReadIntegersUntilZero())
end.

