unit Sistema.View.RelatorioPadrao;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  RLReport,
  Sitema.Model.Helpers.EnterTabHelper;

type
  TViewRelatorioPadrao = class(TForm)
    DtSrc: TDataSource;
    RLReport: TRLReport;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewRelatorioPadrao: TViewRelatorioPadrao;

implementation

{$R *.dfm}

procedure TViewRelatorioPadrao.FormCreate(Sender: TObject);
begin
  RLReport.Visible := False;
  EnableEnterTab;
end;

end.
