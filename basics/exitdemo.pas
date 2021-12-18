{$mode objfpc}{$H+}{$J-}

program ExitDemo(input, output);

function AddName(const ExistingNames, NewName: String): String;
begin
  if ExistingNames = '' then
    Exit(NewName)
  else
    Result := ExistingNames + ', ' + NewName
end;

var
  Names: String;

begin
  Names := '';
  Names := AddName(Names, 'Bob');
  Names := AddName(Names, 'Dave');
  Names := AddName(Names, 'Brad');
  Names := AddName(Names, 'Ian');
  Names := AddName(Names, 'Liam');

  WriteLn(Names)
end.
