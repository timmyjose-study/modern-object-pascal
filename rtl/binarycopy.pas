{$mode objfpc}{$H+}{$J-}

program BinaryCopy(input, output);
uses SysUtils, Classes, StreamEx;

procedure CopyFile(const InfileName, OutfileName: String);
var
  InStream, OutStream: TStream;
begin
  try
    InStream := TFileStream.Create(InfileName, fmOpenRead);
    OutStream := TFileStream.Create(OutfileName, fmCreate);
    OutStream.CopyFrom(InStream, InStream.Size)
  finally
    FreeAndNil(InStream);
    FreeAndNil(OutStream)
  end
end;

var
  InfileName, OutfileName: String;

begin
  if ParamCount() <> 2 then
    begin
      WriteLn('Usage: binarycopy <input-file> <output-file>');
      Exit
    end;

  CopyFile(ParamStr(1), ParamStr(2))
end.
