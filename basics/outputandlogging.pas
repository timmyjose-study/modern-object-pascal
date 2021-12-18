{$mode objfpc}{$H+}{$J-}
{$apptype CONSOLE}

program OutputAndLogging(output);
begin
  WriteLn('Hello, world');
  WriteLn('Print an integer: ', 3 * 4);
  WriteLn('Pad an integer: ', 12345:10);
  WriteLn('Print a real: ', Pi:1:10);
  WriteLn('Hola' + LineEnding + 'Mundo')
end.
