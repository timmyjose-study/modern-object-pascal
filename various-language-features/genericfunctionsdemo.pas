{$mode objfpc}{$H+}{$J-}

program GenericFunctionsDemo(input, output);

generic function MyMax<T>(const A, B: T): T;
begin
  if A > B then
    Result := A
  else
    Result := B
end;

generic function MyMin<T>(const A, B: T): T;
begin
  if A < B then
    Result := A
  else
    Result := B
end;

var
  A, B: Integer;
  C, D: Single;

begin
  ReadLn(A, B);
  WriteLn('Max of ', A, ' and ', B, ' is ', specialize MyMax<Integer>(A, B));
  WriteLn('Min of ', A, ' and ', B, ' is ', specialize MyMin<Integer>(A, B));

  ReadLn(C, D);
  WriteLn('Max of ', C, ' and ', D, ' is ', specialize MyMax<Single>(C, D):1:2);
  WriteLn('Min of ', C, ' and ', D, ' is ', specialize MyMin<Single>(C, D):1:2)
end.

