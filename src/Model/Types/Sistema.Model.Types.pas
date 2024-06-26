unit Sistema.Model.Types;

interface

uses
  System.SysUtils;

type
   TTipoCombustivel = (tpGasolina,tpOleoDiesel);
   TState = (stBrowse,stInsert,stEdit);

   TTipoCombustivelHelper = record helper for TTipoCombustivel
     function Valor(ATipo : string) : TTipoCombustivel; overload;
     function Valor(ATipo : TTipoCombustivel) : string;  overload;
     function Descricao(ATipo : string) : string; overload;
     function Descricao(ATipo : TTipoCombustivel) : string; overload;
   end;
implementation

{ TTipoCombustivelHelper }

function TTipoCombustivelHelper.Descricao(ATipo: TTipoCombustivel): string;
begin
  case ATipo of
    tpGasolina: Result := 'Gasolina';
    tpOleoDiesel: Result := 'Diesel';
    else Result := '';
  end;
end;

function TTipoCombustivelHelper.Descricao(ATipo: string): string;
begin
  if SameText(ATipo, 'G') then
    Result := 'Gasolina'
  else if SameText(ATipo, 'O') then
    Result := 'Diesel'
  else Result := '';
end;

function TTipoCombustivelHelper.Valor(ATipo: TTipoCombustivel): string;
begin
  case ATipo of
    tpGasolina: Result := 'G';
    tpOleoDiesel: Result := 'O';
    else Result := '';
  end;
end;

function TTipoCombustivelHelper.Valor(ATipo: string): TTipoCombustivel;
begin
  if SameText(ATipo, 'G') then
    Result := tpGasolina
  else if SameText(ATipo, 'O') then
    Result := tpOleoDiesel
  else
    raise Exception.Create('Tipo desconhecido: ' + ATipo);
end;

end.
