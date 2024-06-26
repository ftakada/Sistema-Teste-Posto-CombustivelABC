unit Sistema.Model.Util.Funcoes;

interface

uses
  System.SysUtils;

type


  TFuncoes = class
  public
    class function SomarValoresStr(const AValorAtualStr, AValorAdicionarStr: string): string;
    class function CaminhoExe: string;
  end;



implementation

class function TFuncoes.CaminhoExe: string;
var
  LCaminhoExe: string;
begin
  LCaminhoExe := ParamStr(0);
  LCaminhoExe := ExtractFilePath(LCaminhoExe);
  Result := LCaminhoExe;
end;

class function TFuncoes.SomarValoresStr(const AValorAtualStr, AValorAdicionarStr: string): string;
var
  LValorAtual: Double;
  LValorAdicionar: Double;
  LValorTotal: Double;
begin
  Result := '';

  if TryStrToFloat(AValorAtualStr, LValorAtual) and TryStrToFloat(AValorAdicionarStr, LValorAdicionar) then
  begin
    LValorTotal := LValorAtual + LValorAdicionar;

    Result := FloatToStrF(LValorTotal, ffNumber, 15, 2);
  end
  else
  begin
    raise Exception.Create('Erro ao converter string para float. Verifique o formato dos valores.');
  end;
end;



end.
