program tp_pila;
CONST
N = 3;
TYPE
T_DATO = integer;

T_PILA = RECORD
TOPE: BYTE;
ELEM: ARRAY [1..N] OF T_DATO;
TAM:BYTE; //tamaño
END;

VAR
P:T_PILA;

procedure crearpila(var P:T_PILA);
begin
  p.TOPE:=0;
  p.TAM:=0;
end;

procedure apilar(var P:T_PILA; x:t_dato);
begin
  p.TOPE:=p.tope+1;
  p.ELEM[p.TOPE]:=x;
  inc(p.TAM)
end;

procedure desapilar(var P:T_PILA; var x:t_dato);
begin
  x:=p.ELEM[p.TOPE];
  p.TOPE:=p.tope-1;
  Dec(p.tam);
end;

function pila_llena (var p:T_PILA):boolean;     //no es necesario el var pero si el vector es muy grande es recomendado
begin
  pila_llena:=p.TAM=N;
end;

function pila_vacia (var p:T_PILA):boolean;    //no es necesario el var pero si el vector es muy grande es recomendado
begin
  pila_llena:=p.tam=0
end;

function tamanio (var p:t_pila):byte;    //no es necesario el var pero si el vector es muy grande es recomendado
begin
tamanio:=p.TAM;
end.

