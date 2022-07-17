/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//Creamos dos variables que tendrán las expresiones regulares a ser comprobadas
//Una para el correo y otra para verrficar solo letras
var expr = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
var expr1 = /^[a-zA-Z\sáéíóú]*$/;
 
$(document).ready(function () {
    $("#boton2").click(function (){ //función para el boton de enviar
        //recolectamos en variables, lo que tenga cada input.
        //Para mejor manipulación en los if's
       
        var passw = $("#pass").val();
        var repass = $("#repass").val();
        
        
      
        //Secuencia de if's para verificar contenido de los inputs
 
 
                    if(passw != repass){
                        $("#mensaje4").fadeIn("slow");
                        return false;
                    }
          
          }); //fin click
 
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
    
 var valido=false;
    $("#repass2").keyup(function(e) {
        var pass = $("#pass2").val();
        var re_pass=$("#repass2").val();
 
        if(pass != re_pass)
        {
            $("#repass2").css({"background":"#F22" }); //El input se pone rojo
            valido=true;
        }
        else if(pass == re_pass)
        {
            $("#repass2").css({"background":"#8F8"}); //El input se ponen verde
            $("#mensaje4").fadeOut();
            valido=true;
        }
    });//fin keyu
});//fin ready


