{$mode objfpc}{$H+}{$J-}

program ReadWriteFile(input, output);
uses SysUtils, Classes;

var
  S: TStream;
  N: Integer;

begin
  ReadLn(N);
  S := TFileStream.Create('my_binary_file.dat', fmCreate);
  try
    S.WriteBuffer(S, SizeOf(n))
  finally
    FreeAndNil(S)
  end;

  S := TFileStream.Create('my_binary_file.dat', fmOpenRead);
  try
    S.ReadBuffer(S, SizeOf(N))
  finally
    FreeAndNil(S)
  end;

  WriteLn('Read ', N)
end.

