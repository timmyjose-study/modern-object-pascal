{$mode objfpc}{$H+}{$J-}

program Overloading(output);

function Add(const A, B: Integer): Integer;
begin
  Result := A + B
end;

function Add(const A, B, C: Integer): Integer;
begin
  Result := A + B + C
end;

var
  A, B, C: Integer;

begin
  ReadLn(A, B, C);
  WriteLn(Add(A, B));
  WriteLn(Add(A, B, C))
end.
