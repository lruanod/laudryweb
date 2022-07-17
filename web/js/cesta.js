/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



$(function(){
    
    $('tr #deleteitem').click(function(e){
         /* para que no se recarge la pagina   */
        e.preventDefault();  
    
        var elemento = $(this);
        
        /* recogiendo valores del boton eliminar   */
        var idtarifa= elemento.parent().find('#idarticulo').text();  
        
        $.ajax({
            
            url:'borrariteml',
            type:'post',
            data : {idtarifa : idtarifa},
            success:function(r){               
               // alert("Quieres eliminar el servicio");
                 elemento.parent().parent().remove();
                
                 location.reload();
               //cesta-container 
                //shop-table
                // para indicar que  la cesta esta vacia 
                var elementostabla = $('#shop-table');
                if(elementostabla.length <=1){
                                               $('#cesta-container').append("<h5>No hay servicios en el Pedido</h5></br>"); 
                                             }
                    $('#txt-subtotal').text(r);
                    $('#txt-total').text(r);
                
                 
                
            }
            
        });
    });
    
   
    
});

