{$mode objfpc}{$H+}{$J-}

program OperatorOverloadingRecords(input, output);

type
  TMyRecord = record
    MyInt: Integer;
  end;

operator+(const R1, R2: TMyRecord): TMyRecord;
begin
  Result.MyInt := R1.MyInt + R2.MyInt
end;

operator-(const R1, R2: TMyRecord): TMyRecord;
begin
  Result.MyInt := R1.MyInt - R2.MyInt
end;

var
  R1, R2, R3: TMyRecord;

begin
  WriteLn('Enter integer for R1: ');
  ReadLn(R1.MyInt);

  WriteLn('Enter integer for R2: ');
  ReadLn(R2.MyInt);

  R3 := R1 + R2;
  with R3 do
    WriteLn('Sum = ', MyInt);

  R3 := R1 - R2;
  with R3 do
    WriteLn('Difference = ', MyInt)
end.
