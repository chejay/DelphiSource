unit UnitService;

interface

uses
  System.IOUtils, Winapi.Windows, Winapi.GDIPOBJ, Winapi.GDIPAPI;

type
  TGameSevice = class
  private
   //定义属性
    FHdc: HDC;
    //表示图片的编号
    FImageIndex: Integer;
  public
    //绘制图片
    procedure DrawImage(FileName: string; Width, Hegiht: Integer);
    //绘制背景
    procedure DrawBackGround(Width, Hegiht: Integer);
    //构造方法，方法名相同，参数列表不同称为重载
    constructor Create(hdc: HDC); overload;
    constructor Create(); overload;
    //定义字段
    property GameHandle: HDC read FHdc write FHdc;
    property ImageIndex: Integer read FImageIndex write FImageIndex;
  end;

implementation

{ TGameSevice }

constructor TGameSevice.Create(hdc: hdc);
begin
  GameHandle := hdc;
end;

constructor TGameSevice.Create;
begin
  inherited;
end;

procedure TGameSevice.DrawBackGround(Width, Hegiht: Integer);
var
  ImageList: TArray<string>;
begin
  //获取图片列表
  ImageList := TDirectory.GetFiles('E:\Delphi课程相关\resources\background');
  if ImageIndex >= Length(ImageList) then
    ImageIndex := 0;
  //选取图片列表中的某一个图片，展示在窗口
  DrawImage(ImageList[ImageIndex], Width, Hegiht);
end;

procedure TGameSevice.DrawImage(FileName: string; Width, Hegiht: Integer);
var
  //画笔
  Graphics: TGPGraphics;
  Image: TGPImage;
begin
  //载入我们的图片文件
  Image := TGPImage.Create(FileName);
  //将载入的图片绘制到指定的组件上(TImage)
  Graphics := TGPGraphics.Create(GameHandle);
  //绘制图片
  Graphics.DrawImage(Image, MakeRect(0, 0, Width, Hegiht));
  Graphics.Free;
  Image.Free;
end;

end.

