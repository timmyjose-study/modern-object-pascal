{$mode objfpc}{$H+}{$J-}

program MyUnitClient(input, output);
uses MyUnit;

var
  N: Integer;
  S: String;

begin
  Write('Enter an integer: ');
  ReadLn(N);
  MyProcedure(N);

  Write('Enter a string: ');
  ReadLn(S);
  S := MyFunction(S);
  WriteLn(S)
end.
