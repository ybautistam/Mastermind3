program mastermind3;

const
  MAX_INTENTOS = 10;
  LARGO_CODIGO = 4;

  PRIMERO_LETRA =  'A'; //LETRA INICIAL
  ULTIMA_LETRA = 'H'; // ULTIMA LETRA DEL RANGO;

type
  //subrango para restringi las letras que se pueden usar
  Tletras = PRIMERO_LETRA..ULTIMA_LETRA;

  // arreglo de letras con cantidad de celdas
  Tcodigo = array[1..LARGO_CODIGO] of Tletras;


var
  indice: integer;
  letras :Tletras;
  codigo,ingreso : Tcodigo;  {mas adelante veras que codigo y ingreso utilizan este mismo array para no alargar codigo  }
  i,j,k: byte;

  usadas: array[Tletras] of boolean; // lleva el control de que letras se repiten en ambos arreglo y las almacena las que ya estan usadas
  // hasta que el usuario ingresa todas las correctar o no

  bien,regular:integer; // son mis contadores

begin

  // adivinador y pensador de letras

  randomize;

  // genera el codigo secreto
  for i:=1 to LARGO_CODIGO do begin
    indice:= random(ord(ULTIMA_LETRA)-ord(PRIMERO_LETRA)+1)+ord(PRIMERO_LETRA);
    codigo[i] := chr(indice);
    {write(codigo[i],' '); --> esta linea me sirve para ver si esta parte del codigo funciona
    bien y lo muestra en pantalla para ver si las letras que genero son igual a las que nuestro usuario tambien ingreso }

  end;

  writeln;


  writeln('dispones de', MAX_INTENTOS, ' intentos para adivinar el codigo');
  writeln;
  writeln('debes ingresar 4 letras ');

  for i:= 1 to MAX_INTENTOS do begin
    writeln('ingresa el ', i, 'intento : ');
    readln(ingreso);


    FillChar(usadas,SizeOf(usadas),false);
    regular := 0;
    bien := 0;

    // compara cada indice del array
    for j:= 1 to LARGO_CODIGO do begin
      if ingreso[j] =  codigo[j] then begin
         bien +=1;
      end else if not usadas[ingreso[j]] then begin
         for k := 1 to LARGO_CODIGO do begin
           if ingreso[j] =  codigo[k] then begin
              regular+=1;
              usadas[ingreso[j]] := true;
              break;

           end;
         end;
      end;

    end;
    writeln('Buenas : ', bien, ' Regulares : ' , regular);
    if bien = LARGO_CODIGO then begin
       writeln('-----GANASTE----- ');
       break;
    end;

  end;

  if bien <> LARGO_CODIGO then
     writeln('PERDISTE =( ,  las letra eran : ' , codigo);


   readln;
end.

