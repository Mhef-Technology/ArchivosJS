<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, org.mindrot.jbcrypt.BCrypt, conexion.conectadita" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/meksh-removebg-preview.png" type="image/x-icon">
        <link rel="stylesheet" href="css/premiumpagStyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">      
        <title>Pago</title>
    </head>   
    <body>    
        <section class="box">
            <a class="to-start" href="index.html" title="Regresar"><img src="img/darkLogo.png" height="100" alt="logoMeksh"/></a>
            <form  method="post">     
                <div id="smart-button-container">
                    <div style="text-align: center;">
                        <div id="paypal-button-container"></div>
                    </div>
                </div>
                <script src="https://www.paypal.com/sdk/js?client-id=ASPhmpYqwDpYfUIoZ2xWJ6mSRrtCLvHOexsjemwI082fkS7mqb8VLFHZxYIcWCWojOFKp89zNBu-iZfB&currency=MXN" data-sdk-integration-source="button-factory"></script>
                <script>
                    function initPayPalButton() {
                        paypal.Buttons({
                            style: {
                                shape: 'rect',
                                color: 'gold',
                                layout: 'vertical',
                                label: 'pay',

                            },

                            createOrder: function (data, actions) {
                                return actions.order.create({
                                    purchase_units: [{"description": "Premium", "amount": {"currency_code": "MXN", "value": 3}}]
                                });
                            },

                            onApprove: function (data, actions) {
                                return actions.order.capture().then(function (orderData) {

                                    // Full available details
                                    console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));

                                    window.location.href = 'updateUserType.jsp';

                                });
                            },

                            onError: function (err) {
                                console.log(err);
                            }
                        }).render('#paypal-button-container');
                    }
                    initPayPalButton();
                </script>
                <div class="validar"><label class="valida"></label></div>
            </form>
            <p><a id="loginLink" href="index.html">Cancelar</a></p>

        </section>
    </body>
</html>