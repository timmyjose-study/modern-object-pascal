{$mode objfpc}{$H+}{$J-}
{$scopedenums on}

program EnumCobvs(input, output);
uses SysUtils;

type
  TAnimalKind = (Dog, Cat, Duck);

type
  EAnimalKind = class(Exception);

procedure ProcessAnimal(Ak: TAnimalKind);
begin
  case Ak of
    TAnimalKind.Dog: WriteLn('Got a dog');
    TAnimalKind.Cat: WriteLn('Got a cat');
    TAnimalKind.Duck: WriteLn('Got a duck')
  end
end;

function AkToInt(Ak: TAnimalKind): Integer;
begin
  Result := Ord(Ak)
end;

function IntToAk(I: Integer): TAnimalKind;
begin
  if (I < 0) or (I > Ord(High(TAnimalKind))) then
    raise EAnimalKind.Create('invalid ord value for TAnimalKind');

  Result := TAnimalKind(I)
end;

var
  I: Integer;

begin
  ProcessAnimal(TAnimalKind.Duck);
  ProcessAnimal(TAnimalKind.Dog);
  ProcessAnimal(TAnimalKind.Cat);

  WriteLn(AkToInt(TAnimalKind.Dog));
  WriteLn(AkToInt(TAnimalKind.Cat));
  WriteLn(AkToInt(TAnimalKind.Duck));

  try
    Write('Enter ord value for TAnimalKind: ');
    ReadLn(I);
    WriteLn(IntToAk(I))
  except 
    on E:EAnimalKind do
        WriteLn('Error: ', E.Message);
    on E:Exception do
      begin
        WriteLn('Got a generic error. Bye!');
        Exit
      end
   end
end.
