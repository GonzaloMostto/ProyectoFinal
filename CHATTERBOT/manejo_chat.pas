unit manejo_chat;

{$mode ObjFPC}{$H+}

interface

uses
SysUtils,crt,Visuales;

procedure entrada(var input:string);

procedure salida (cadena:string);

implementation

procedure entrada(var input:string);
var
key:char;
n:1..50; // columnas del chat;
m:4..7; // filas del chat.
g:0..182; // maximo de caracteres.

begin
     input:='';
     g:=182; // limite caracteres
     n:=4; // columna inicial
     m:=4; // fila inicial
     mostrar_contador(g);

     repeat
     gotoxy(n+z,m);  // ubicar el cursos en la ultima letra
     if KeyPressed then
     begin
     key:=readkey;

     if (key <> #13) and (key <> #8) then  //no enter o no borra
     begin
     if g > 0 then
        begin
        if n < x-1 then
          begin
            input:=input+key;
            gotoxy(n+z,m);
            writeln(key);
            dec(g);
            inc(n);
            mostrar_contador(g);
          end  // limite de columna
          else
          begin
               input:=input+key;
               gotoxy(x-1+z,m);
               write('-');
               inc(m);
               n:=2;
               gotoxy(n+z,m);
               writeln(key);
               dec(g);
               inc(n);
               mostrar_contador(g);
          end;  // else limite de columna

        end; // fin del limite de caracteres

     end  // distinto de borrar
     else if key = #8 then // si decide borrar
       begin
            if g < 182 then   //borrar si hay caracter
              begin
                   SetLength(input,length(input)-1); // Cortar el ultimo caracter del string
                   inc(g);
                   mostrar_contador(g);

                   if (n=2) then
                   begin
                        dec(m);
                        gotoxy(x-1+z,m);
                        write(' ');
                        n:=x-2;
                        gotoxy(n+z,m);
                        write(' ');
                   end
                   else
                   begin
                        dec(n);
                        gotoxy(n+z,m);
                        write(' ');
                   end;
              end;
       end;

     end; // presiona tecla
     until key = #13;
end;

procedure salida (cadena:string);
var
i,n,m:byte;
t:1..1000; //tiempo para sleep()
begin
     t:=15;
     n:=3;
     m:=9;

     for i:=1 to length(cadena) do
  begin
       if n < (x-2) then
       begin
       gotoxy(z+n+1,m);
       write(cadena[i]);
       inc(n);
       end
       else
       begin
            gotoxy(x-1+z,m);
            write('-');
            n:=1;
            inc(m);
            gotoxy(z+n+1,m);
            write(cadena[i]);
            inc(n);
       end;
       sleep(t);
  end;

end;

end.

