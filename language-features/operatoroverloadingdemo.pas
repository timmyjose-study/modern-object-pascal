{$mode objfpc}{$H+}{$J-}

program OperatorOverloadingDemo(input, output);
uses StrUtils;

operator*(const S: String; const N: Integer): String;
begin
  Result := DupeString(S, N)
end;

operator*(const N: Integer; const S: String): Integer;
begin
  Result := N + Length(S)
end;

var
  S: String;
  N: Integer;

begin
  ReadLn(S);
  ReadLn(N);
  WriteLn(S * N);
  WriteLN(N * S)
end.
