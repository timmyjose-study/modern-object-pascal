{$mode objfpc}{$H+}{$J-}

program ProblemWithNonVirtual(output);
uses SysUtils;

type
  TFruit = class
    procedure Eat;
  end;

  TApple = class(TFruit)
    procedure Eat; // non-virtual
  end;

procedure TFruit.Eat;
begin
  WriteLn('Eating a fruit')
end;

procedure TApple.Eat;
begin
  WriteLn('Eating an apple')
end;

procedure DoSomethingWithAFruit(const F: TFruit);
begin
  WriteLn('We have a fruit of type ', F.ClassName);
  WriteLn('We''re going to eat it');
  F.Eat // this will always point to TFruit 
end;

var
  AnApple: TApple;
  AnotherApple: TFruit;

begin
  try
    AnApple := TApple.Create;
    DoSomethingWithAFruit(AnApple);

    AnotherApple := TFruit.Create;
    DoSomethingWithAFruit(AnotherApple)
  finally
    FreeAndNil(AnApple);
    FreeAndNil(AnotherApple)
  end
end.
