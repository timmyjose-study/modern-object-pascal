{$mode objfpc}{$H+}{$J-}

program CallbackMethod(input, output);
uses SysUtils;

type
  TMyArray = array of Integer;

  TMyMethod = procedure (const A: Integer) of object;

  TMyClass = class
    CurrentValue: Integer;

    procedure Add(const A: Integer);
    procedure Sub(const A: Integer);
    procedure Multiply(const A: Integer);
    procedure Process(const M: TMyMethod; const A: TMyArray);
  end;

procedure TMyClass.Add(const A: Integer);
begin
  CurrentValue := CurrentValue + A
end;

procedure TMyClass.Sub(const A: Integer);
begin
  CurrentValue := CurrentValue - A
end;

procedure TMyClass.Multiply(const A: Integer);
begin
  CurrentValue := CurrentValue * A
end;

procedure TMyClass.Process(const M: TMyMethod; const A: TMyArray);
var
  I: Integer;
begin
  CurrentValue := A[0];
  for I := 1 to Length(A)-1 do
    M(A[I]);
  WriteLn('Result = ', CurrentValue)
end;

var
  O: TMyClass;
  A: TMyArray;
  N, I: Integer;

begin
  ReadLn(N);
  SetLength(A, N);

  for I := 0 to N-1 do
    Read(A[I]);

  try
    O := TMyClass.Create;
    O.Process(@O.Add, A);
    O.Process(@O.Sub, A);
    O.Process(@O.Multiply, A)
  finally
    FreeAndNil(O)
  end
end.
