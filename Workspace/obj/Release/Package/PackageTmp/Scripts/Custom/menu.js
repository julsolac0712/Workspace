$(document).ready(main);
$(document).ready(MobilVersion);
var contador = 0;
function main () {
    $('#hide').click(function () {
        //Grande
		if (contador == 1) {
            $("#menu_bar").removeClass("nav-side-menu-custom-collapsed")
            $('.displayMenu').removeClass("displayNone");
            //$('#img_WorkSpaceTitle').addClass("opacity-1")
            //$('#img_WorkSpaceTitle').removeClass("opacity-0")
            //$('#img_WorkSpaceTitleMovil').removeClass("opacity-1")
            //$('#img_WorkSpaceTitleMovil').addClass("opacity-0")
            $('#img_WorkSpaceTitle').removeClass("displayNone");
            $('#img_WorkSpaceTitleMovil').addClass("displayNone")

            $('#divleftMenu').removeClass("col-md-1")
            $('#divcontent').removeClass("col-md-10")
            $('#divleftMenu').addClass("col-md-2")
            $('#divcontent').addClass("col-md-9")

			contador = 0;
        } else {
         //Pequeño
			contador = 1;
            $('#menu_bar').addClass("nav-side-menu-custom-collapsed")
            $('.displayMenu').addClass("displayNone");
            $('#img_WorkSpaceTitle').addClass("displayNone");
            $('#img_WorkSpaceTitleMovil').removeClass("displayNone")
            //$('#img_WorkSpaceTitle').removeClass("opacity-1")
            //$('#img_WorkSpaceTitle').addClass("opacity-0")

            //$('#img_WorkSpaceTitleMovil').removeClass("opacity-0")
            //$('#img_WorkSpaceTitleMovil').addClass("opacity-1")



            $('#divleftMenu').removeClass("col-md-2")
            $('#divcontent').removeClass("col-md-9")
            $('#divleftMenu').addClass("col-md-1")
            $('#divcontent').addClass("col-md-10")
		}
	});

}

function MobilVersion() {
    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
        console.log('Esto es un dispositivo móvil');
        $('#menu_bar').addClass("nav-side-menu-custom-collapsed")
        $('.displayMenu').addClass("displayNone");
        $('#img_WorkSpaceTitle').addClass("displayNone");
        $('#img_WorkSpaceTitleMovil').removeClass("displayNone")
        $('#divleftMenu').removeClass("col-md-2")
        $('#divcontent').removeClass("col-md-9")
        $('#divleftMenu').addClass("col-md-1")
        $('#divcontent').addClass("col-md-10")
    } else {
        $("#menu_bar").removeClass("nav-side-menu-custom-collapsed")
        $('.displayMenu').removeClass("displayNone");  
        $('#img_WorkSpaceTitle').removeClass("displayNone");
        $('#img_WorkSpaceTitleMovil').addClass("displayNone")
        $('#divleftMenu').removeClass("col-md-1")
        $('#divcontent').removeClass("col-md-10")
        $('#divleftMenu').addClass("col-md-2")
        $('#divcontent').addClass("col-md-9")
    }
}
