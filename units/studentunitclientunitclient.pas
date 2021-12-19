{$mode objfpc}{$H+}{$J-}

program StudentUnitClientUnitClient(input, output);
uses SysUtils, StudentUnit, StudentUnitClientUnit;

var
  S: TSTudent;
  Name: String;
  Id: Integer;

begin
  try
    Write('Enter name: ');
    ReadLn(Name);

    Write('Enter id: ');
    ReadLn(Id);

    S := TStudent.Init(Name, Id);
    ShowStudent(S)
  finally
    FreeAndNil(S)
  end
end.
