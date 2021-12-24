{$mode objfpc}{$H+}{$J-}

program GenericApples(output);
uses SysUtils, Generics.Collections;

type
  TApple = class
      Name: String;
      constructor Create(S: String);
    end;

  TOrange = class
      Name: String
    end;

  TAppleList = specialize TObjectList<TApple>;

constructor TApple.Create(S: String);
begin
  Name := S
end;

var
  A: TApple;
  O: TOrange;
  Apples: TAppleList;

begin
  try
    Apples := TAppleList.Create(true); // true -> own elements

    A := TApple.Create('apple1');
    Apples.Add(A);

    A := TApple.Create('apple2');
    Apples.Add(A);

    for A in Apples do
      Write(A.Name, ' ');
    WriteLn;

    { this will not work at compile time since `Apples` is parameterised over `TApple` }
    O := TOrange.Create;
    //Apples.Add(O);

    Writeln('Number of apples in the list = ', Apples.Count);
    WriteLn(Apples[0].Name);
    WriteLn(Apples[1].Name)
  finally
    FreeAndNil(Apples);
    FreeAndNil(O)
  end
end.