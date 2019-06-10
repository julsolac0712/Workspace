$(function () {
    Inicializa_FilePicker()
});

function Inicializa_FilePicker() {
    $(".bootstrap-file-input").fileinput({
        language: "es",
        showUpload: false
    });
    $(".bootstrap-file-input-small").fileinput({
        language: "es",
        showCaption: false,
        showPreview: false,
        showUpload: false
    });
}