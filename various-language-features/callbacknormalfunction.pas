{$mode objfpc}{$H+}{$J-}

program CallbackNormalFunction(output);

type
  TMyArray = array of Integer;

function Add(const A, B: Integer): Integer;
begin
  Result := A + B
end;

function Sub(const A, B: Integer): Integer;
begin
  Result := A - B
end;

function Multiply(const A, B: Integer): Integer;
begin
  Result := A * B
end;

type 
  TMyFunction = function (const A, B: Integer): Integer;

function Process(const F: TMyFunction; const A: TMyArray): Integer;
var
  I: Integer;

begin
  Result := A[0];
  for I := 1 to Length(A)-1 do
    Result := F(Result, A[I])
end;

var
  I, N: Integer;
  A: TMyArray;
  F: TMyFunction;

begin
  ReadLn(N);
  SetLength(A, N);

  for I := 0 to N-1 do
    Read(A[I]);

  F := @Add;
  WriteLn('Sum of the elements of the array = ', Process(F, A));

  F := @Multiply;
  WriteLn('Product of the elements of the array = ', Process(F, A));

  WriteLn('Difference of the elements of the array = ', Process(@Sub, A))
end.
