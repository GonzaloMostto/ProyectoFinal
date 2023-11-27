unit menu;

interface

uses crt, Visuales, manejo_chat;

procedure menu_;

implementation

procedure menu_;
var
  opcion:string;
begin
     opcion:='';
     clrscr;
     bordes;
     repeat  // menu - chat principal
      limpiar_chat_1;
      limpiar_chat_2;

      entrada(opcion);
      salida(opcion);
      readkey;
      case opcion of
      'h':introduccion;
      end;

     until opcion = 'q';
end;

end.

