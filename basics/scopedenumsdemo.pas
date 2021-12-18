{$mode objfpc}{$H+}{$J-}
{$scopedenums on}

program ScopedEnumsDemo(output);

type
  TAnimalKind = (Duck, Cat, Dog);

procedure ProcessAnimal(Ak: TAnimalKind);
begin
  case Ak of
    TAnimalKind.Duck: WriteLn('Got a duck');
    TAnimalKind.Cat: WriteLn('Got a cat');
    TAnimalKind.Dog: WriteLn('Got a dog');
  else
    begin
      WriteLn('Impossible!');
      Exit
    end
  end
end;

begin
  ProcessAnimal(TAnimalKind.Cat);
  ProcessAnimal(TAnimalKind.Dog);
  ProcessAnimal(TAnimalKind.Duck)
end.
