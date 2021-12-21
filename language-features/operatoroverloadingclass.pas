{$mode objfpc}{$H+}{$J-}

program OperatorOverloadingClass(input, output);
uses SysUtils;

type
  TMyclass = class
    MyInt: Integer;
    constructor Create;
    constructor Create(const N: Integer);
  end;

constructor TMyClass.Create;
begin
end;

constructor TMyClass.Create(const N: Integer);
begin
  MyInt := N
end;

operator+(C1, C2: TMyClass): TMyClass;
begin
  Result := TMyClass.Create;
  Result.MyInt := C1.MyInt + C2.MyInt
end;

operator-(C1, C2: TMyClass): TMyClass;
begin
  Result := TMyClass.Create;
  Result.MyInt := C1.MyInt - C2.MyInt
end;

var
  C1, C2, C3: TMyClass;
  N: Integer;

begin
  Write('Enter integer for C1: ');
  ReadLn(N);
  C1 := TMyClass.Create(N);

  WriteLn('Enter integer for C2: ');
  ReadLn(N);
  C2 := TMyClass.Create(N);

  try
    try
      C3 := C1 + C2;
      WriteLn('Sum = ', C3.MyInt);
    finally
      FreeAndNil(C3)
    end;

    try
       C3 := C1 - C2;
       WriteLn('Difference = ', C3.MyInt)
    finally
      FreeAndNil(C3)
    end
  finally
    FreeAndNil(C1);
    FreeAndNil(C2)
  end
end.
