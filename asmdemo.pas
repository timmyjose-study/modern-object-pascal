{$mode objfpc}{$H+}{$J-}

program AsmDemo;
var
  N, M: LongInt;

begin
  ReadLn(N, M);
  WriteLn('Before swap, N = ', N, ', and M = ', M);

  {$asmMode intel}
  asm
    mov eax, [rip+n]
    xchg eax, [rip+m]
    mov [rip+n], eax
  end['eax'];

  WriteLn('After swap, N = ', N, ', and M = ', M)
end.