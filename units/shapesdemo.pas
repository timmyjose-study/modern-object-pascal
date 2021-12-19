{$mode objfpc}{$H+}{$J-}
{$M+}

program ShapesDemo(input, output);
uses SysUtils;

type
  Rectangle = class
  private
    Length, Width: Integer;

  public
    constructor Init(L, W: Integer);
    destructor Deinit;

    procedure SetLength(L: Integer);
    procedure SetWidth(W: Integer);
    function GetLength: Integer;
    function GetWidth: Integer;

    procedure Draw;
  end;

constructor Rectangle.Init(L, W: Integer);
begin
  Length := L;
  Width := W
end;

destructor Rectangle.Deinit;
begin
end;

procedure Rectangle.SetLength(L: Integer);
begin
  Length := L
end;

procedure Rectangle.SetWidth(W: Integer);
begin
  Width := W
end;

function Rectangle.GetLength: Integer;
begin
  Result := Length
end;

function Rectangle.GetWidth: Integer;
begin
  Result := Width
end;

procedure Rectangle.Draw;
begin
  WriteLn(Format('Drawing a rectangle of length %d and width %d', [Length, Width]))
end;

type
  Circle = class
  private
    Radius: Single;

  public
    constructor Init(R: Single);
    destructor Deinit;
    
    procedure SetRadius(R: Single);
    function GetRadius: Single;

    procedure Draw;
  end;

constructor Circle.Init(R: Single);
begin
  Radius := R
end;

destructor Circle.Deinit;
begin
  WriteLn('Destroyed circle')
end;

procedure Circle.SetRadius(R: Single);
begin
  Radius := R
end;

function Circle.GetRadius: Single;
begin
  Result := Radius
end;

procedure Circle.Draw;
begin
  WriteLn(Format('Drew a circle of radius %.3f', [Radius]))
end;

var 
  R: Rectangle;
  C: Circle;

begin
  try
    R := Rectangle.Init(10, 20);
    R.Draw
  finally
    FreeAndNil(R)
  end;

  try
    C := Circle.Init(11.2345);
    C.Draw
  finally
    FreeAndNil(C)
  end
end.
