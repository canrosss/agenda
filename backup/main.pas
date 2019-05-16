unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, StdCtrls, ExtCtrls, MaskEdit, Buttons, ZConnection, ZDataset,
  main_gui;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    CheckBox_OcultarPassword: TCheckBox;
    Edit_User: TEdit;
    Edit_Password: TEdit;
    Image_Close: TImage;
    Image_Eye: TImage;
    Image_Logo1: TImage;
    Image_Separator: TImage;
    Image_Separator1: TImage;
    Image_User: TImage;
    Image_Logo: TImage;
    Label_User: TLabel;
    Label_Password: TLabel;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox_OcultarPasswordChange(Sender: TObject);
    procedure CheckBox_OcultarPasswordClick(Sender: TObject);
    procedure Edit_PasswordClick(Sender: TObject);
    procedure Edit_UserClick(Sender: TObject);
    procedure Edit_UserMouseLeave(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    procedure Image_CloseClick(Sender: TObject);
    procedure Image_CloseMouseEnter(Sender: TObject);
    procedure Image_CloseMouseLeave(Sender: TObject);


    procedure Image_LogoClick(Sender: TObject);
    procedure Label_UserClick(Sender: TObject);
    procedure MaskEdit_PasswordChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Label_UserClick(Sender: TObject);
begin

end;

procedure TForm1.MaskEdit_PasswordChange(Sender: TObject);
begin

end;

procedure TForm1.Image_LogoClick(Sender: TObject);
begin

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  //Pone el texto Default
  Edit_User.Text:=WELCOME_TEXT_EDIT_LOGIN;
  Edit_Password.Text:=WELCOME_TEXT_EDIT_PASSWORD;
  CheckBox_OcultarPassword.Checked:=False;
  Edit_Password.PasswordChar:='*'; //Pone **** al campo de Password

  //Personalización de la GUI
  Edit_Password.Show;
  Edit_User.BorderStyle:=bsNone;
  Edit_Password.BorderStyle:=bsNone;
  Edit_User.BorderStyle:=bsNone;

  //Establece una conexion a la SQLITE
  ZConnection1.Connected:=TRUE;
end;

procedure TForm1.Image_CloseClick(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.Image_CloseMouseEnter(Sender: TObject);
begin
  Image_Close.Picture.LoadFromFile('img/X_orange.png');
end;

procedure TForm1.Image_CloseMouseLeave(Sender: TObject);
begin
  Image_Close.Picture.LoadFromFile('img/X_grey.png');
end;

procedure TForm1.CheckBox_OcultarPasswordChange(Sender: TObject);
begin
    if CheckBox_OcultarPassword.Checked=False then
  begin
    Image_Eye.Picture.LoadFromFile('img/close_eye_33x35.png');
    Edit_Password.EchoMode:=emPassword;
  end
  else
  begin
    Image_Eye.Picture.LoadFromFile('img/open_eye_33x35.png');
    Edit_Password.EchoMode:=emNormal;
  end;

end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  result:String;
  user:String;
begin
  //try
  //   ZConnection1.Connect;
  //finally
  //   ShowMessage('No me puedo conectar al recurso');
  //end;

  user:=Edit_User.Caption;
  ShowMessage('Tu busqueda: ' + user);
  try
     with ZQuery1 do
     begin

       SQL.Clear;

       SQL.Add('SELECT * FROM users WHERE username = "'+user+'"');
       Open;
       First;

       result:=FieldByName('username').AsString;
     end;

     //Query Terminado
     ShowMessage(result);

     //Validación



  finally
     ShowMessage('Consulta terminada..');
  end;

  try
     with ZQuery1 do
     begin

       SQL.Clear;

       SQL.Add('SELECT * FROM users WHERE username = "'+user+'"');
       Open;
       First;

       result:=FieldByName('username').AsString;
     end;

     //Query Terminado
     ShowMessage(result);

     //Validación



  finally
     ShowMessage('Consulta terminada..');
  end;

  if (result = '') then
  begin
    ShowMessage('No encontrado');
    Image_Separator.Picture.LoadFromFile('img/orange_line.png');
  end;
  if (result = 'admin') then
     begin
       ShowMessage('ok!');
       Image_Separator.Picture.LoadFromFile('img/green_line.png');
     end;
end;

procedure TForm1.CheckBox_OcultarPasswordClick(Sender: TObject);
begin
  //Cambiando la imagen


end;

procedure TForm1.Edit_PasswordClick(Sender: TObject);
begin
  //Evento click
  //Revisa si esta el texto default
  if Edit_Password.Caption = WELCOME_TEXT_EDIT_PASSWORD then
  begin
    //Limpia el txto default
    Edit_Password.Caption:='';
  end;
end;

procedure TForm1.Edit_UserClick(Sender: TObject);
begin
  //Revisa si esta el texto default
  if Edit_User.Caption = WELCOME_TEXT_EDIT_LOGIN then
  begin
    //Limpia el txto default
    Edit_User.Caption:='';
  end;

end;

procedure TForm1.Edit_UserMouseLeave(Sender: TObject);
begin
  //Si el campo esta en blanco, volver a poner el texto
  if (Edit_User.Caption = '') then
  begin
    Edit_User.Caption:=WELCOME_TEXT_EDIT_LOGIN;
  end

end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: char);
begin
  if Edit_User.Caption = WELCOME_TEXT_EDIT_LOGIN then
  begin
    //Limpia el txto default
    Edit_User.Caption:='';
  end;
end;



begin

end.
