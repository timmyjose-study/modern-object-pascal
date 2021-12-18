{$mode objfpc}{$H+}{$J-}

program ConvToString(output);
uses SysUtils;

var
  F: Single = 2.7182345;
  I: Integer = 42;
  S1: String = '12';
  S2: String = '2.122457';
  S: String;

begin
  Format('%d %f %s %s', [I, F, S1, S2]);

  S := IntToStr(I);
  WriteLn(S);

  S := FloatToStr(F);
  WriteLn(S);

  I := StrToInt(S1);
  WriteLn(I);

  F := StrToFloat(S2);
  WriteLn(F);

  // Format simply returns the formatted string
  S := Format('%d %f %s %s', [I, F, S1, S2]);
  WriteLn(S);

  F := Pi;
  WriteStr(S, I, '-', F, '-', S1, '-', S2);
  WriteLn(S)
end.
