unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
uses
  uThreads, uDomain;

procedure TForm1.Button1Click(Sender: TObject);
var
  Product: TProduct;
begin
  Product := TProduct.Create;
  TProductionThread.Create(Product);
  TProductionThread.Create(Product);
  TProductionThread.Create(Product);
  TConsumptionThread.Create(Product);
  TConsumptionThread.Create(Product);
end;

end.

