{$mode objfpc}{$H+}{$J-}

program Pointerdemo(input, output);
uses SysUtils;

type
  TMyRecord = record
    MyInt: Integer;
  end;

  PMyRecord = ^TMyRecord;

  // class instances are inherently pointers
  TMyClass = class
    MyInt: Integer;
  end;

procedure HandleRecordPointer(const P: PMyRecord);
begin
  with P^ do
    WriteLn('[HandleRecordPointer] MyInt = ', MyInt)
end;

procedure HandleRecord(const P: TMyRecord);
begin
  with P do
    WriteLN('[HandleRecord] MyInt = ', MyInt)
end;

procedure HandleClass(Const C: TMyClass);
begin
  WriteLn('[HandleClass] MyInt = ', C.MyInt)
end;

// generic, type-unsafe pointer type, equivalent to void* in C
procedure HandleRecordUsingPointer(const P: Pointer);
var 
  R: PMyRecord;
begin
  R := P;
  with R^ do
    WriteLn('[HandleRecordUsingPointer] MyInt = ', MyInt)
end;

var
  R: TMyRecord;
  P: PMyRecord;
  C: TMyClass;
  N: Integer;

begin
  ReadLn(N);
  R.MyInt := N;
  C := TMyClass.Create;
  C.MyInt := N;


  P := @R; // records are stack allocated by default
  HandleRecordUsingPointer(P);
  HandleRecordPointer(P);
  HandleRecord(R);

  try
    New(P);
    P^.MyInt := N * N;
    HandleRecordPointer(P)
  finally
    Dispose(P)
  end;

  try
    HandleClass(C)
  finally
    FreeAndNil(C)
  end
end.
