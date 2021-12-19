{$mode objfpc}{$H+}{$J-}

program DynamicDispatchUsingVirtual(output);
uses SysUtils;

type
  TFruit = class
    procedure Eat; virtual;
  end;

  TApple = class(TFruit)
    procedure Eat; override;
  end;

  TOrange = class(TFruit)
    procedure Eat; override;
  end;

  TPersimmon = class(TFruit)
  end;

  TBuckthorn = class(TFruit)
    procedure Eat; reintroduce; // opt-out of the polymorphism
  end;

procedure TFruit.Eat;
begin
  WriteLn('Eating a fruit')
end;

procedure TApple.Eat;
begin
  WriteLn('Eating an apple')
end;

procedure TOrange.Eat;
begin
  WriteLn('Eating an orange')
end;

procedure TBuckthorn.Eat;
begin
  WriteLn('This is not an eat method - I cannot be eaten, fool!')
end;

procedure DoSomethingWithAFruit(const F: TFruit);
begin
  WriteLn('Got a fruit of type ', F.ClassName);
  WriteLn('Preparing to eat it...');
  F.Eat;
  WriteLn
end;

var
  Apple: TApple;
  Orange: TOrange;
  Persimmon: TPersimmon;
  Buckthorn: TBuckthorn;

begin
  try
    Apple := TApple.Create;
    DoSomethingWithAFruit(Apple);

    Orange := TOrange.Create;
    DoSomethingWithAFruit(Orange);

    Persimmon := TPersimmon.Create;
    DoSomethingWithAFruit(Persimmon);

    Buckthorn := TBuckthorn.Create;
    DoSomethingWithAFruit(Buckthorn); // this will still call TFruit's `Eat`.
    Buckthorn.Eat
  finally
    FreeAndNil(Apple);
    FreeAndNil(Orange);
    FreeAndNil(Persimmon);
    FreeAndNil(Buckthorn)
  end
end.


