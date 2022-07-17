//Creamos dos variables que tendrán las expresiones regulares a ser comprobadas
//Una para el correo y otra para verrficar solo letras
var expr = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
var expr1 = /^[a-zA-Z\sáéíóú]*$/;
 
$(document).ready(function () {
    $("#boton").click(function (){ //función para el boton de enviar
        //recolectamos en variables, lo que tenga cada input.
        //Para mejor manipulación en los if's
        var nombre = $("#nombre").val();
        var apellidos = $("#apellidos").val();
        var correo = $("#correo").val();
        var passw = $("#pass").val();
        var repass = $("#repass").val();
 
        //Secuencia de if's para verificar contenido de los inputs
 
        //Verifica que no este vacío y que sean letras
        if(nombre == "" || !expr1.test(nombre)){
            $("#mensaje1").fadeIn("slow"); //Muestra mensaje de error
            return false;                  // con false sale de la secuencia
        }
        else{
            $("#mensaje1").fadeOut();   //Si el anterior if cumple, se oculta el error
 
            if(apellidos == "" || !expr1.test(apellidos)){
                $("#mensaje2").fadeIn("slow");
                return false;
            }
            else{
                $("#mensaje2").fadeOut();
 
                if(correo == "" || !expr.test(correo)){
                    $("#mensaje3").fadeIn("slow");
                    return false;
                }
                else{
                    $("#mensaje3").fadeOut();
 
                    if(passw != repass){
                        $("#mensaje4").fadeIn("slow");
                        return false;
                    }
                }
            }
        }
 
    });//fin click
 
    /*Las siguientes funciones son una mejora al ejemplo anterior que mostré
     * Si el mensaje se mostró, el usuario tenía que volver a oprimir el boton
     * de registrar para que el error se ocultará (si era el caso).
     *
     *Con estas funciones de keyup, el mensaje de error se muestra y
     * se ocultará automáticamente, si el usuario escribe datos admitidos.
     * Sin necesidad de oprimir de nuevo el boton de registrar.
     *
     * La función keyup lee lo último que se ha escrito y comparamos
     * con nuestras condiciones, si cumple se quita el error.
     *
     * Es cuestión de analizar un poco para entenderlas
     * Cualquier duda, comenten
     * */
    $("#nombre, #apellidos").keyup(function(){
        if( $(this).val() != "" && expr1.test($(this).val())){
            $("#mensaje1, #mensaje2").fadeOut();
            return false;
        }
    });
 
    $("#correo").keyup(function(){
        if( $(this).val() != "" && expr.test($(this).val())){
            $("#mensaje3").fadeOut();
            return false;
        }
    });
 
    var valido=false;
    $("#repass").keyup(function(e) {
        var pass = $("#pass").val();
        var re_pass=$("#repass").val();
 
        if(pass != re_pass)
        {
            $("#repass").css({"background":"#F22" }); //El input se pone rojo
            valido=true;
        }
        else if(pass == re_pass)
        {
            $("#repass").css({"background":"#8F8"}); //El input se ponen verde
            $("#mensaje4").fadeOut();
            valido=true;
        }
    });//fin keyup repass
 
});//fin ready


///   contraseña validacion %
var numeros="0123456789";
var letras="abcdefghyjklmnñopqrstuvwxyz";
var letras_mayusculas="ABCDEFGHYJKLMNÑOPQRSTUVWXYZ";

function tiene_numeros(texto){
   for(i=0; i<texto.length; i++){
      if (numeros.indexOf(texto.charAt(i),0)!=-1){
         return 1;
      }
   }
   return 0;
} 

function tiene_letras(texto){
   texto = texto.toLowerCase();
   for(i=0; i<texto.length; i++){
      if (letras.indexOf(texto.charAt(i),0)!=-1){
         return 1;
      }
   }
   return 0;
} 

function tiene_minusculas(texto){
   for(i=0; i<texto.length; i++){
      if (letras.indexOf(texto.charAt(i),0)!=-1){
         return 1;
      }
   }
   return 0;
} 

function tiene_mayusculas(texto){
   for(i=0; i<texto.length; i++){
      if (letras_mayusculas.indexOf(texto.charAt(i),0)!=-1){
         return 1;
      }
   }
   return 0;
} 

function seguridad_pass(pass){
  var seguridad = 0;
  if (pass.length!=0){
    if (tiene_numeros(pass) && tiene_letras(pass)){
      seguridad += 30;
    }
    if (tiene_minusculas(pass) && tiene_mayusculas(pass)){
      seguridad += 30;
    }
    if (pass.length >= 4 && pass.length <= 5){
      seguridad += 10;
    }else{
      if (pass.length >= 6 && pass.length <= 8){
        seguridad += 30;
      }else{
        if (pass.length > 8){
          seguridad += 40;
        }
      }
    }
  }
  return seguridad        
} 

function muestra_seguridad_pass(pass,formulario){
  seguridad=seguridad_pass(pass);
  formulario.seguridad.value=seguridad + "%";
}
///  fin contraseña validacion %

