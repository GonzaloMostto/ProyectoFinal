unit Visuales;

{$mode ObjFPC}{$H+}

interface

uses
  crt, SysUtils;

const
  x=50; //Largo  50
  y=28; //Alto   28
  z=30; //desplazamiento al centro  30

procedure introduccion;

procedure bordes;

procedure limpiar_chat_1;

procedure limpiar_chat_2;

procedure mostrar_contador(g:byte);

implementation

procedure introduccion;
var
texto:string;
i,n,m:byte;
t:1..1000;   //tiempo
begin
  t:=15;
  n:=1;
  m:=9;
  texto:='> Hola, soy ChatterBot-<tematica>, soy mas que un simple programa, soy un asistente virtual que te ayudara a responder tus preguntas sobre <tematica>. Solo tienes que empezar a escribir!';

  for i:=1 to length(texto) do
  begin
       if n < (x-2) then
       begin
       gotoxy(z+n+1,m);
       write(texto[i]);
       inc(n);
       end
       else
       begin
            gotoxy(x-1+z,m);
            write('-');
            n:=1;
            inc(m);
            gotoxy(z+n+1,m);
            write(texto[i]);
            inc(n);
       end;
       sleep(t);
  end;
  readkey;
end;

procedure bordes;
var
cabecera:string;
i,j:byte;
begin

for i:=1 to x do   //generar bordes del chat
    for j:=1 to y do
    begin

      //techos
      if (j=1) or (j=y) or (j=3) or (j=8)then
      begin
      gotoxy(i+z,j);
      write('-');
      end;

      //paredes
      if (i=1) or (i=x) then
      begin
      gotoxy(i+z,j);
      write('|');
      end;

      //esquinas
      if ((i=1)and(j=1)) or ((i=1)and(j=y)) or ((j=1)and(i=x)) or ((i=x)and(j=y)) then
      begin
      gotoxy(i+z,j);
      write('.');
      end;
    end;   // end del for bordes(matriz)

cabecera:='[C H A T T E R B O T]';
gotoxy((x div 2)+ z - (length(cabecera) div 2),2);
write(cabecera);

end;  // end del procedure bordes

procedure limpiar_chat_1;
var
i,j:byte;
begin
     for i:=(z+2) to x+z-1 do
         for j:=(4) to 7 do
         begin
           gotoxy(i,j);
           write(' ');
         end;
     gotoxy(z+2,4);
     write('>');
end;

procedure limpiar_chat_2;
var
i,j:byte;
begin
     for i:=(z+2) to (x+z-1) do
         for j:=9 to y-1 do
         begin
           gotoxy(i,j);
           write(' ');
         end;
     gotoxy(z+2,8);
     write('>');
end;

procedure mostrar_contador(g:byte);
begin
gotoxy(x+z-5,7);
write('[   ]');
gotoxy(x+z-4,7);
write(' ');
gotoxy(x+z-3,7);
write(' ');
gotoxy(x+z-2,7);
write(' ');
gotoxy(x+z-4,7);
writeln(g);
end;


end. //end de unit

