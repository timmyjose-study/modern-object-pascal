{$mode objfpc}{$H+}{$J-}

program ResultIsSpecial(output);

function MyFunction(const S: String): String;
begin
  Result := S + 'something';
  Result := Result + ' and something more!';
  Result := Result + ' and something more again!'
end;

var
  S: String = 'Here''s ';

begin
  S := MyFunction(S);
  WriteLn(S)
end.
