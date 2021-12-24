{$mode objfpc}{$H+}{$J-}

program ReadTextFileDemo(input, output);
uses SysUtils, Classes, StreamEx;

var
  S: TStream;
  R: TStreamReader;
  InfileName: String;

begin
  Write('Enter the file to be read: ');
  ReadLn(InfileName);

  try 
    S := TFileStream.Create(InfileName, fmOpenRead);
    R := TStreamReader.Create(S);

    while not R.Eof do
      WriteLn(R.ReadLine)
  finally
    FreeAndNil(R);
    FreeAndNil(S) // TStreamReader is not owning
  end
end.
