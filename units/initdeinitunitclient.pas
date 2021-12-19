{$mode objfpc}{$H+}{$J-}

program InitDeinitUnitClient(input, output);
uses InitDeinitUnit;

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
