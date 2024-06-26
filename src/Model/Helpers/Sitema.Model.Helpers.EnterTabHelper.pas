unit Sitema.Model.Helpers.EnterTabHelper;

interface

uses
  Vcl.Forms,
  Vcl.Controls,
  Vcl.StdCtrls,
  System.Classes,
  Winapi.Messages,
  Winapi.Windows;

type
  //Para funcionar corretamente � necess�rio habilitar KeyPreview do Form
  TEnterTabHelper = class helper for TForm
  private
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  public
    procedure EnableEnterTab;
  end;

implementation

procedure TEnterTabHelper.EnableEnterTab;
begin
  OnKeyDown := FormKeyDown;
end;

procedure TEnterTabHelper.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  LNextControl: TWinControl;
begin
  if Key = VK_RETURN then
  begin
    LNextControl := FindNextControl(ActiveControl, True, True, False);
    if Assigned(LNextControl) then
    begin
      LNextControl.SetFocus;
      Key := 0;
    end;
  end;
end;

end.

