{$mode objfpc}{$H+}{$J-}

program GenericCalculator(input, output);
uses SysUtils;

type
  generic TMyCalculator<T> = class
    Value: T;
    constructor Create;
    procedure Add(const A: T);
  end;

constructor TMyCalculator.Create;
begin
  Value := 0
end;

procedure TMyCalculator.Add(const A: T);
begin
  Value := Value + A
end;

type
  TMyIntegerCalculator = specialize TMyCalculator<Integer>;
  TMyFloatCalculator = specialize TMyCalculator<Single>;

var
  IntCalc: TMyIntegerCalculator;
  FloatCalc: TMyFloatCalculator;
  I: Integer;
  S: Single;

begin
  try
    ReadLn(I);
    IntCalc := TMyIntegerCalculator.Create;
    IntCalc.Add(I);
    WriteLn(IntCalc.Value);

    ReadLn(S);
    FloatCalc := TMyFloatCalculator.Create;
    FloatCalc.Add(S);
    WriteLn(FloatCalc.Value:1:3)
  finally
    FreeAndNil(IntCalc);
    FreeAndNil(FloatCalc)
  end
end.
