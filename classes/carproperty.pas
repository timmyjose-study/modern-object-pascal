{$mode objfpc}{$H+}{$J-}

program CarProperty(output);
uses SysUtils;

type
  TCar = class
    private
      FColor: String;
      FBuildYear: Integer;
      procedure SetColor(C: String);

    public
      constructor Init(C: String; Y: Integer);
      destructor Deinit;
      property Color: String read FColor write SetColor;
      property BuildYear: Integer read FBuildYear write FBuildYear;
      procedure Display;
    end;

constructor TCar.Init(C: String; Y: Integer);
begin
  FColor := C;
  FBuildYear := Y
end;

destructor TCar.Deinit;
begin
  WriteLn('Adios, car!')
end;

procedure TCar.SetColor(C: String);
begin
  if C = 'Pink' then
    WriteLn('Pink is a rather strange colour for a car!');
  FColor := C
end;

procedure TCar.Display;
begin
  WriteLn(Format('Build year: %d, Colour: %s', [BuildYear, Color]))
end;
      
var
  Car: TCar;

begin
  Car := TCar.Create;
  try
    Car.BuildYear := 1923;
    Car.SetColor('Pink');
    Car.Display
  finally
    FreeAndNil(Car)
  end
end.