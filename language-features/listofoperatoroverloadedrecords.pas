{$mode objfpc}{$H+}{$J-}
{$modeswitch advancedrecords} // class operator for records

program ListOfOperatorOverloadedRecords(input, output);
uses SysUtils, FGL;

type
  TMyRecord = record
      MyInt: Integer;
      { this is required in order since TFPGList et al require certain overloads such as on `=` }
      class operator=(const R1, R2: TMyRecord): Boolean;
      class operator+(const R1, R2: TMyRecord): TMyRecord;
    end;

  TMyRecordList = specialize TFPGList<TMyRecord>;

class operator TMyRecord.=(const R1, R2: TMyRecord): Boolean;
begin
  Result := R1.MyInt = R2.MyInt
end;

class operator TMyRecord.+(const R1, R2: TMyRecord): TMyRecord;
begin
  Result.MyInt := R1.MyInt + R2.MyInt
end;

procedure ReadList(const N: Integer; var List: TMyRecordList);
var
  I: Integer;
  R: TMyRecord;
begin
  for I := 1 to N do
    with R do
      begin
        Write('Enter integer for record ', I, ': ');
        ReadLn(MyInt);
        List.Add(R)
      end
end;

procedure DemoList(const L: TMyRecordList);
var
  R: TMyRecord;
  S: Integer = 0;
begin
  for R in L do
    Write(R.MyInt, ' ');
  WriteLn;

  for R in L do
    S := S + R.MyInt;

  WriteLn('Sum of records = ', S)
end;

var
  N: Integer;
  List: TMyRecordList;

begin
  List := TMyRecordList.Create;
  try
    ReadLn(N);
    ReadList(N, List);
    DemoList(List)
  finally
    FreeAndNil(List)
  end
end.
