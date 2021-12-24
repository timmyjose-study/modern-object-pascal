{$mode objfpc}{$H+}{$J-}

program AppleDictionary(output);
uses SysUtils, Generics.Collections;

type
  TApple = class
      Name: String;
      constructor Create(N: String);
    end;

  TAppleDictionary = specialize TObjectDictionary<String, TApple>; { owned }

constructor TApple.Create(N: String);
begin
  Name := N
end;

var
  Value: TApple;
  AppleDict: TAppleDictionary;
  Key: String;
  KVPair: TAppleDictionary.TDictionaryPair;

begin
  try
    AppleDict := TAppleDictionary.Create([doOwnsValues]); // note: different from TObjectList
    
    AppleDict.AddOrSetValue('fuji', TApple.Create('Fuji'));
    AppleDict.AddOrSetValue('jonagold', TApple.Create('Jonagold'));
    AppleDict.AddOrSetValue('cameo', TApple.Create('Cameo'));

    if AppleDict.TryGetValue('fuji', Value) then
      WriteLn('Found apple with name `fuji`, value = ', Value.Name);

    for Key in AppleDict.Keys do
      WriteLn('Found apple key: ', Key);
    WriteLn;

    for Value in AppleDict.Values do
      WriteLn('Found apple value: ', Value.Name);
    WriteLn;

    for KVPair in AppleDict do
      WriteLn(KVPair.Key +  ' => ' + KVPair.Value.Name);
    WriteLn;

    AppleDict.Remove('fuji');

    WriteLn('After removing `fuji`...');
    for KVPair in AppleDict do
      WriteLn(KVPair.Key,  ' => ', KVPair.Value.Name)
  finally
    FreeAndNil(AppleDict)
  end
end.