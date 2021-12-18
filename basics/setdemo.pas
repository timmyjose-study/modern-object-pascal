{$mode objfpc}{$H+}{$J-}
{$scopedenums on}

program SetDemo(output);

type
  TAnimalKind = (Duck, Cat, Dog);
  TAnimal = set of TAnimalKind;

var
  S: TAnimal;
  Anim: TAnimalKind;

begin
  S := [];
  S := [TAnimalKind.Duck, TAnimalKind.Cat];
  S := S + [TAnimalKind.Dog];
  S := S * [TAnimalKind.Dog, TAnimalKind.Cat];

  for Anim in S do
    WriteLn(Anim);
  WriteLn;

  Include(S, TAnimalKind.Duck);
  for Anim in S do
    WriteLn(Anim);
  WriteLn;

  Exclude(S, TAnimalKind.Dog);
  for Anim in S do
    WriteLn(Anim)
end.
