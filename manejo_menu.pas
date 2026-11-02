unit manejo_menu;

interface

const
  CANT_OP = 6;

type
  T_Menu_Op = 1..CANT_OP;
  T_Menu = array [T_Menu_Op] of string;

function SeleccionarOpcionMenu(titulo: string; var opciones: T_Menu;
  maxOp: T_Menu_Op): T_Menu_Op;
function SeleccionarOpcionMenuInteractivo(titulo: string; var opciones: T_Menu;
  maxOp: T_Menu_Op): T_Menu_Op;
procedure InicializarMenu(out opciones: T_Menu);

implementation

uses
  crt;

procedure InicializarMenu(out opciones: T_Menu);
var
  i: T_menu_Op;
begin
  for i := 1 to CANT_OP do
  begin
    opciones[i] := '';
  end;
end;

function SeleccionarOpcionMenu(titulo: string; var opciones: T_Menu;
  maxOp: T_Menu_Op): T_Menu_Op;
var
  opcion: integer;
  i: T_menu_Op;
begin
  repeat
    ClrScr;
    writeLn(titulo);  //el titulo no se ve, es borrado por el clear screen de escribir opcion
    for i := 1 to CANT_OP do
    begin
      if opciones[i] <> '' then
        writeLn(opciones[i]);
    end;
    ReadLn(opcion);
  until (opcion >= 1) and (opcion <= maxOp);
  SeleccionarOpcionMenu := opcion;
end;

procedure EscribirOpcion(posicion: T_Menu_Op; texto: string; resaltar: boolean);
var indicador: Char;
begin
  GotoXY(60, 12 + posicion);
  if not resaltar then
  begin
    TextColor(Green);
    indicador := '-';
  end
  else
  begin
    TextColor(Yellow);
    indicador := '>';
  end;
  Write(indicador,' ', texto);
end;

function SeleccionarOpcionMenuInteractivo(titulo: string; var opciones: T_Menu;
  maxOp: T_Menu_Op): T_Menu_Op;
var
  i, seleccion: T_menu_Op;
  tecla: Char;
begin

  ClrScr;
  cursoroff;  //añadido para no ver el cursor
  GotoXY(60, 10);
  Write(titulo);
  seleccion := 1;
  for i := 1 to maxOp do
  begin
    EscribirOpcion(i, opciones[i], false);
  end;

  EscribirOpcion(seleccion, opciones[1], true);

  repeat
        tecla:= readkey;
        if tecla = #0 then // Tecla Especial
        begin
          tecla := readkey;
          case tecla of
          #72: // Flecha Arriba
            begin
              EscribirOpcion(seleccion, opciones[seleccion], false);
              if seleccion = 1 then
                seleccion := maxOp
              else
                seleccion := seleccion - 1;
              EscribirOpcion(seleccion, opciones[seleccion], true);
            end;
          #80: // Flecha Abajo
            begin
              EscribirOpcion(seleccion, opciones[seleccion], false);
              if seleccion = maxOp then
                seleccion := 1
              else
                seleccion := seleccion + 1;
              EscribirOpcion(seleccion, opciones[seleccion], true);
            end;
          end;
        end;
  until tecla = #13; // Enter

  TextColor(White);
  SeleccionarOpcionMenuInteractivo := seleccion;
end;

end.
