{$mode objfpc}{$H+}{$J-}
{$modeswitch advancedrecords}

program RecordsDemo(input, output);
uses SysUtils; { Format }

type
  TMyRecord = record
    public
      N, Square: Integer;
      procedure WriteLnDescription;
    end;

procedure TMyRecord.WriteLnDescription;
begin
  WriteLn(Format('N = %d, and Square = %d', [N, Square]))
end;

var
  R: TMyRecord;
  A: array[1..10] of TMyRecord;
  N, I: Integer;

begin
  ReadLn(N);
  for I := 1 to N do
    with A[I] do
      begin
        ReadLn(N);
        Square := N * N
      end;

  for I := 1 to N do
    A[I].WriteLnDescription;
  WriteLn;

  // arrays supports enumeration
  for R in A do
    R.WriteLnDescription
end.
