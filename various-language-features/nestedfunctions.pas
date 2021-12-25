{$mode objfpc}{$H+}{$J-}

program NestedFunctions(input, output);

function SumOfSquares(const N: Integer): Integer;
var 
  I: Integer;

function Square(const N: Integer): Integer;
begin
  Result := N * N
end;

begin
  Result := 0;
  for I := 1 to N do
    Result := Result + Square(I)
end;

function AnotherSumOfSquares(const N: Integer): Integer;
var
  I: Integer;

function Square: Integer;
begin
  Result := I * I
end;

begin
  Result := 0;
  for I := 1 to N do
    Result := Result + Square
end;

var
  N: Integer;

begin
  Write('Enter N: ');
  ReadLn(N);
  WriteLn('Sum of squares from 1 to ', N, ' = ', SumOfSquares(N));
  WriteLn('Sum of squares from 1 to ', N, ' = ', AnotherSumOfSquares(N))
end.