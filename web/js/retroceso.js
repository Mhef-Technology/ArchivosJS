function deshabilitar(){
    window.location.hash = "no-bcak-button";
    window.location.hash = "Again-No-back-button" //chrome
    window.onhashchange = function(){
        window.location.hash = "";
    }
}


