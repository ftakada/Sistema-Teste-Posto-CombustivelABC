program SistemaCombustivel;

uses
  Vcl.Forms,
  Sistema.View.Principal in 'View\Sistema.View.Principal.pas' {ViewPrincipal},
  Sistema.Model.Connection.Firedac in 'Model\Connection\Sistema.Model.Connection.Firedac.pas',
  Sistema.Model.Connection.Interfaces in 'Model\Connection\Sistema.Model.Connection.Interfaces.pas',
  Sistema.Model.Connection.Factory in 'Model\Connection\Sistema.Model.Connection.Factory.pas',
  Sistema.Model.Entities.Tanques in 'Model\Entities\Sistema.Model.Entities.Tanques.pas',
  Sistema.Model.Util.SQLGerador in 'Model\Util\Sistema.Model.Util.SQLGerador.pas',
  Sistema.Model.DAO.Interfaces in 'Model\DAO\Sistema.Model.DAO.Interfaces.pas',
  Sistema.Model.DAO.SQL in 'Model\DAO\Sistema.Model.DAO.SQL.pas',
  Sistema.Model.DAO.Factory in 'Model\DAO\Sistema.Model.DAO.Factory.pas',
  Sistema.View.RelatorioPadrao in 'View\Sistema.View.RelatorioPadrao.pas' {ViewRelatorioPadrao},
  Sistema.View.Tanques in 'View\Sistema.View.Tanques.pas' {ViewTanques},
  Sistema.Controller.Interfaces in 'Controller\Sistema.Controller.Interfaces.pas',
  Sistema.Controller in 'Controller\Sistema.Controller.pas',
  Sistema.Model.Entities.Bombas in 'Model\Entities\Sistema.Model.Entities.Bombas.pas',
  Sistema.Model.Entities.Abastecimentos in 'Model\Entities\Sistema.Model.Entities.Abastecimentos.pas',
  Sistema.View.Bombas in 'View\Sistema.View.Bombas.pas' {ViewBombas},
  Sistema.View.Abastecimentos in 'View\Sistema.View.Abastecimentos.pas' {ViewAbastecimentos},
  Sistema.Model.Connection.Query.Firedac in 'Model\Connection\Sistema.Model.Connection.Query.Firedac.pas',
  Sistema.Model.Services.Interfaces in 'Model\Services\Sistema.Model.Services.Interfaces.pas',
  Sistema.Model.Services.Tanques in 'Model\Services\Sistema.Model.Services.Tanques.pas',
  Sistema.Model.Services.Factory in 'Model\Services\Sistema.Model.Services.Factory.pas',
  Sistema.Model.Services.Bombas in 'Model\Services\Sistema.Model.Services.Bombas.pas',
  Sistema.Model.Services.Abastecimentos in 'Model\Services\Sistema.Model.Services.Abastecimentos.pas',
  Sistema.Model.Types in 'Model\Types\Sistema.Model.Types.pas',
  Sistema.View.Padrao in 'View\Sistema.View.Padrao.pas' {ViewPadrao},
  Sistema.View.RelatorioAbastecimento in 'View\Sistema.View.RelatorioAbastecimento.pas' {ViewRelatorioAbastecimento},
  Sistema.Model.Util.Funcoes in 'Model\Util\Sistema.Model.Util.Funcoes.pas',
  Sitema.Model.Helpers.EnterTabHelper in 'Model\Helpers\Sitema.Model.Helpers.EnterTabHelper.pas',
  Sistema.Sitema.Model.Exception.MinhaExcecao in 'Model\Exception\Sistema.Sitema.Model.Exception.MinhaExcecao.pas',
  Sistema.Model.Services.Calculos in 'Model\Services\Sistema.Model.Services.Calculos.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.
