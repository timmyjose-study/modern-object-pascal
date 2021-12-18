{$mode objfpc}{$H+}{$J-}
{$scopedenums on}

program EnumeratedOrdinalArrays(input, output);

type
  TArrayOfTenStrings = array[0..9] of String;
  TArrayOfTenStrings1Based = array[1..10] of String;

  TMyRange = 0..9;
  TAlsoArrayOfTenStrings = array[TMyRange] of String;

  TAnimalKind = (Duck, Cat, Dog);
  TAnimalNames = array [TAnimalKind] of String;

procedure ArrayOfTenStringsDemo;
var
  Arr: TAlsoArrayOfTenStrings;
  N, I: Integer;
begin
  Write('Enter size of string array: ');
  ReadLn(N);

  for I := 0 to N-1 do
    begin
      Write('Enter string: ');
      ReadLn(Arr[I])
    end;

  for I := 0 to N-1 do
    Write(Arr[I], ' ');
  WriteLn
end;

procedure ArrayOfTenStrings1BasedDemo;
var
  Arr: TArrayOfTenStrings1Based;
  N, I: Integer;
begin
  Write('Enter size of string array: ');
  ReadLn(N);

  for I := 1 to N do
    begin
      Write('Enter string: ');
      ReadLn(Arr[I])
    end;

  for I := 1 to N do
    Write(Arr[I], ' ');
  WriteLn
end;

procedure AnimalNamesDemo;
var
  Arr: TAnimalNames;
  Ak: TAnimalKind;
begin
  Arr[TAnimalKind.Duck] := 'Duck';
  Arr[TAnimalKind.Cat] := 'Cat';
  Arr[TAnimalKind.Dog] := 'Dog';

  for Ak in TAnimalKind do
    WriteLn(Arr[Ak])
end;

begin
  ArrayOfTenStringsDemo;
  WriteLn;
  ArrayOfTenStrings1BasedDemo;
  WriteLn;
  AnimalNamesDemo;
end.
