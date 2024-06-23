unit Sistema.Model.Entities.Bombas;

interface


type
  TBombas = class
  private
    FId: Integer;
    FDescricao: string;
    FId_Tanque : Integer;
  public
    property Id: Integer read FID write FID;
    property Descricao: string read FDescricao write FDescricao;
    property Id_Tanque: Integer read FId_Tanque write FId_Tanque;
  end;

implementation

end.
