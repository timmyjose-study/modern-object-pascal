{$mode objfpc}{$H+}{$J-}

program ReadWriteBinFileDemo(input, output);
uses SysUtils, Classes;

var
  S: TStream;
  N: Integer;

begin
  ReadLn(N);
  S := TFileStream.Create('mybinfile.dat', fmCreate);
  try
    S.WriteBuffer(N, SizeOf(N))
  finally
    FreeAndNil(S)
  end;

  N := 0;
  S := TFileStream.Create('mybinfile.dat', fmOpenRead);
  try
    S.ReadBuffer(N, SizeOf(N));
    WriteLn('N = ', N)
  finally
    FreeAndNil(S)
  end
end.