unit  Sistema.Sitema.Model.Exception.MinhaExcecao;

interface

uses
  SysUtils;

type
  EMinhaExcecao = class(Exception)
  public
    constructor Create(const Msg: string);
  end;

implementation

constructor EMinhaExcecao.Create(const Msg: string);
begin
  inherited Create(Msg);
end;

end.

