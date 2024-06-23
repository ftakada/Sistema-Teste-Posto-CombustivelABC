unit Sistema.Model.Entities.Tanques;

interface


type
  TTanques = class
  private
    FID: Integer;
    FDescricao: string;
    FTipoCombustivel : string;
  public
    property ID: Integer read FID write FID;
    property Descricao: string read FDescricao write FDescricao;
    property TipoCombustivel: string read FTipoCombustivel write FTipoCombustivel;
  end;

implementation

end.
