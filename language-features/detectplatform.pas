{$mode objfpc}{$H+}{$J-}

program DetectPlatform(output);

begin
  {$ifdef DARWIN}
  WriteLn('Working on macOS');
  {$endif}
end.

