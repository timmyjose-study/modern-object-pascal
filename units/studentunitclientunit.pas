{$mode objfpc}{$H+}{$J-}

unit StudentUnitClientUnit;

interface
uses StudentUnit;

procedure ShowStudent(const S: TStudent);
  
implementation

procedure ShowStudent(const S: TSTudent);
begin
  WriteLn('Student name: ', S.GetName);
  WriteLn('Student Id: ', S.GetId)
end;

initialization
  WriteLn('Initialised StudentUnitClientUnit')

finalization
  WriteLn('De-initialised StudentUnitClientUnit')
end.
