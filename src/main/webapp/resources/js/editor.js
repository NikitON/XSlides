var textElements = 0;
var imageElements = 0;
var videoElements = 0;
var slides = 1;
var lastSlide = 1;
var currentSlide = 1;
var zIndex = 400;
var selectedElement = null;
var editable = null;

$(document).ready(
    function(){
        setEditorSize();
        /*$("#addTextDialog").dialog( {
            autoOpen : false,
            height : 550,
            width : 650,
            modal : true,
            buttons : {
                "Add text" : function(){
                    addText();
                    $("#textContainer" + textElements).html( $("#textEditor").val() );
                    $( this ).dialog( "close" );
                },
                Cancel: function() {
                    $( this ).dialog( "close" );
				},
            }
        } );*/
        $("#addTextDialog").modal({
            show : false
        });
        textEditor = $("#textEditor").css("height","200").css("width",$("#addTextDialog").width() - 20).htmlbox({
            toolbars : [
                [
                // Cut, Copy, Paste
                "separator","cut","copy","paste",
                // Undo, Redo
                "separator","undo","redo",
                // Bold, Italic, Underline, Strikethrough, Sup, Sub
                "separator","bold","italic","underline","strike","sup","sub",
                // Left, Right, Center, Justify
                "separator","justify","left","center","right",
                // Ordered List, Unordered List, Indent, Outdent
                "separator","ol","ul","indent","outdent",
                // Hyperlink, Remove Hyperlink
                "separator","link","unlink"	
                ],
                [// Show code
                "separator","code",
                // Formats, Font size, Font family, Font color, Font, Background
                ],
                [
                "separator","fontsize","fontfamily"
                ],
                [
                "separator","fontcolor","highlight"
                ],
                [
                //Strip tags
                "separator","removeformat","hr","paragraph",
                ]
            ],
            about : false,
            idir : "/xslides/resources/js/HtmlBox_4.0.3/images/",
            skin:"blue",
        });
        $("#addTextDialog").on('hidden', function () {
            $('#saveTextChanges').attr('onclick','addTextItem();');
        });
        $("#textOpacity").slider({
            value : 1,
            min : 0,
            max : 1,
            step : 0.1,
            slide: function( event, ui ) {
				$( "#textOpacityText" ).val( "Opacity : " + ui.value );
			}
        });
        //image
        $("#addImageDialog").modal({
            show : false
        });
        $("#imageOpacity").slider({
            value : 1,
            min : 0,
            max : 1,
            step : 0.1,
            slide: function( event, ui ) {
				$( "#imageOpacityText" ).val( "Opacity : " + ui.value );
			}
        });
        $("#addImageDialog").on('hidden', function () {
            $('#saveImageChanges').attr('onclick','addImageItem();');
        });
        //video
        $("#addVideoDialog").modal({
            show : false
        });
        $("#videoOpacity").slider({
            value : 1,
            min : 0,
            max : 1,
            step : 0.1,
            slide: function( event, ui ) {
				$( "#videoOpacityText" ).val( "Opacity : " + ui.value );
			}
        });
    }
);

function addTextItem()
{
    addText();
    $("#textContainer" + textElements).html( $("#textEditor").val() );
    $("#textContainer" + textElements).css( "opacity", $("#textOpacity").slider( "value" ) );
    $('#addTextDialog').modal('toggle');
}

function addImageItem()
{
    addImage();
    $("#imageContainer" + imageElements).attr( "src", $("#imageLink").val() );
    $("#imageContainer" + imageElements).css( "opacity", $("#imageOpacity").slider( "value" ) );
    $('#addImageDialog').modal('toggle');
}

function addVideoItem()
{
    addVideo();
    var videoLink = $("#videoLink").val();
    videoLink = "http://www.youtube.com/embed/" + videoLink.split('=',2)[1].split('&')[0] + "?wmode=transparent";
    $("#videoContainer" + videoElements).html( '<iframe id="videoIframe'+videoElements+'" src="'+videoLink+'" frameborder="0" allowfullscreen wmode="opaque"></iframe>');
    $("#videoIframe" + videoElements).css( "opacity", $("#videoOpacity").slider( "value" ) );
    $('#addVideoDialog').modal('toggle');
}

function setEditorSize()
{
    //$("#editor").width( $(document).width() - 20 );
    //$("#editor").height( $(document).height() - $("#editorMenu").height() - 20 );
    $("#editor").width(1000);
    $("#editor").height(500);
    //alert( $("#editor").width() + " " + $("#editor").height() );
}

function addText()
{
    textElements = textElements + 1;
    $("#editor").append("<div class=\"ui-widget-content textInEditor\" id=\"text" + textElements + "\" onclick=\"selectElement('text"+textElements+"');\" style=\"z-index:"+zIndex+";\"><div id=\"textContainer"+textElements+"\"></div></div>");
    zIndex = zIndex + 1;
    $("#text" + textElements).dblclick(function(){
        var element = $(this).attr("id").split("text")[1];
        $("#saveTextChanges").attr("onclick","$('#textContainer"+element+"').html($('#textEditor').val()); $('#textContainer"+element+"').css( 'opacity', $('#textOpacity').slider( 'value' ) ); $('#addTextDialog').modal('toggle');");
        $("#addTextDialog").modal("toggle");
    });
    $("#text" + textElements).resizable();
    $("#text" + textElements).draggable( { containment : "#editor" } );
    $("#text" + textElements).selectable();
}

function addImage()
{
    imageElements = imageElements + 1;
    $("#editor").append("<div class=\"ui-widget-content imageInEditor\" id=\"image" + imageElements + "\" onclick=\"selectElement('image"+imageElements+"');\" style=\"z-index:"+zIndex+";\"><img id=\"imageContainer"+imageElements+"\"></div>");
    zIndex = zIndex + 1;
    $("#image" + imageElements).resizable({
        resize: function(event, ui){
            $(this).children("img").width($(this).width());
            $(this).children("img").height($(this).height());
            $("#imageContainer"+imageElements).width($("#image" + imageElements).width());
            $("#imageContainer"+imageElements).height($("#image" + imageElements).height());
        }
    });
    $("#image" + imageElements).dblclick(function(){
        var element = $(this).attr("id").split("image")[1];
        $("#saveImageChanges").attr("onclick","$('#imageContainer"+element+"').attr('src',$('#imageLink').val()); $('#imageContainer"+element+"').css( 'opacity', $('#imageOpacity').slider( 'value' ) ); $('#addImageDialog').modal('toggle');");
        $("#addImageDialog").modal("toggle");
    });
    $("#image" + imageElements).draggable( { containment : "#editor" } );
    $("#image" + imageElements).selectable();
}

function addVideo()
{
    videoElements = videoElements + 1;
    $("#editor").append("<div class=\"ui-widget-content videoInEditor\" id=\"video" + videoElements + "\" onclick=\"selectElement('video"+videoElements+"');\" style=\"z-index:"+zIndex+";\"><div id=\"videoContainer"+videoElements+"\"></div></div>");
    zIndex = zIndex + 1;
    $("#video" + videoElements).resizable({
        resize: function(event, ui){
            $(this).children("div").children("iframe").width($(this).width());
            $(this).children("div").children("iframe").height($(this).height());
        }
    });
    $("#video" + videoElements).dblclick(function(){
        selectElement($(this).attr("id"));
        deleteSelected();
        $('#addVideoDialog').modal('toggle');
    });
    $("#video" + videoElements).draggable( { containment : "#editor" } );
    $("#video" + videoElements).selectable();
}

function unselectElement()
{
    if( selectedElement != null )
    {
        $("#editor").children("#"+selectedElement).css("border","solid 1px black");
        selectedElement = null;
        $(".operationWithSelected").attr( "class", "btn btn-primary operationWithSelected disabled" );
    }
}

function selectElement( elementId )
{
    unselectElement();
    selectedElement = elementId;
    $("#editor").children("#"+selectedElement).css("border","dotted 2px black");
    $(".operationWithSelected").attr( "class", "btn btn-primary operationWithSelected" );
}

function deleteSelected()
{
    if( selectedElement != null )
    {
        $("#"+selectedElement).remove();
        unselectElement();
    }
}

function moveUp()
{
    if( selectedElement != null )
    {
        var elementZIndex = $("#"+selectedElement).css("z-index");
        var upNeighbor = null;
        var upNeighborZIndex = parseInt(elementZIndex) + 1024;
        var editor = document.getElementById("editor");
        for(var childItem in editor.childNodes){
            if( editor.childNodes[childItem].nodeType == 1 )
                if( elementZIndex < editor.childNodes[childItem].style.zIndex)
                    if(editor.childNodes[childItem].style.zIndex < upNeighborZIndex ){
                        upNeighbor = editor.childNodes[childItem];
                        upNeighborZIndex = editor.childNodes[childItem].style.zIndex;
                    }
        }
        if( upNeighbor != null )
        {
            upNeighbor.style.zIndex = elementZIndex;
            document.getElementById(selectedElement).style.zIndex = upNeighborZIndex;
        }
    }
}

function moveDown()
{
    if( selectedElement != null )
    {
        var elementZIndex = $("#"+selectedElement).css("z-index");
        var downNeighbor = null;
        var downNeighborZIndex = parseInt(elementZIndex) - 1024;
        var editor = document.getElementById("editor");
        for(var childItem in editor.childNodes){
            if( editor.childNodes[childItem].nodeType == 1 )
                if( elementZIndex > editor.childNodes[childItem].style.zIndex)
                    if(editor.childNodes[childItem].style.zIndex > downNeighborZIndex ){
                        downNeighbor = editor.childNodes[childItem];
                        downNeighborZIndex = editor.childNodes[childItem].style.zIndex;
                    }
        }
        if( downNeighbor != null )
        {
            downNeighbor.style.zIndex = elementZIndex;
            document.getElementById(selectedElement).style.zIndex = downNeighborZIndex;
        }
    }
}

String.prototype.replaceAll = function(search, replace){
    return this.split(search).join(replace);
}

function addSlide()
{
    slides = slides + 1;
    lastSlide = lastSlide + 1;
    $("#slidePanel").append("<a id='moveTo"+lastSlide+"' class='btn btn-primary' style='display:inline; margin:1px;' onclick='selectSlide("+lastSlide+");'>"+lastSlide+"</a>");
    $("#presentation").append("<div class='step' id='"+lastSlide+"' data-x='"+1000*(lastSlide-1)+"' data-y='0' data-rotate='0' data-scale='1'></div>");
}

function savePresentation()
{
	$.get(
	"/XSlides/saveCurrentPresentation",
	{content : $("#presentation").html().replaceAll("border: 1px solid black;","")}
	);
    //alert( $("#presentation").html().replaceAll("border: 1px solid black;","") );
}

function selectSlide(id)
{
    unselectElement();
    $("#editor").children("div").css("position","absolute");
    $("#editor").children("div").resizable("destroy");
    $("#editor").children("div").draggable("destroy");
    $("#editor").children("div").selectable("destroy");
    $("#"+currentSlide).html( $("#editor").html() );
    $("#"+currentSlide).attr("data-x",$("#data-x").val());
    $("#"+currentSlide).attr("data-y",$("#data-y").val());
    $("#"+currentSlide).attr("data-rotate",$("#data-rotate").val());
    $("#"+currentSlide).attr("data-scale",$("#data-scale").val());
    $("#editor").html( $("#"+id).html() );
    var i;
    for( i = 1; i <= textElements; i++ )
        if( $("#editor").children("#text"+i).length )
        {
            $("#editor").children("#text"+i).resizable();
            $("#editor").children("#text"+i).draggable();
        }
    for( i = 1; i <= imageElements; i++ )
        if( $("#editor").children("#image"+i).length )
        {
        
            $("#editor").children("#image"+i).resizable({
                resize: function(event, ui){                 
                    $(this).children("img").width($(this).width());
                    $(this).children("img").height($(this).height());
                }
            });
            $("#editor").children("#image"+i).draggable({ containment : "#editor" });
        }
    for( i = 1; i <= videoElements; i++ )
        if( $("#editor").children("#video"+i).length )
        {
            $("#editor").children("#video"+i).resizable({
                resize: function(event, ui){
                    $(this).children("div").children("iframe").width($(this).width());
                    $(this).children("div").children("iframe").height($(this).height());
                }
            });
            $("#editor").children("#video"+i).draggable({ containment : "#editor" });
            $("#video" + i).selectable();
        }
    $("#data-x").val( $("#"+id).attr("data-x") );
    $("#data-y").val( $("#"+id).attr("data-y") );
    $("#data-rotate").val( $("#"+id).attr("data-rotate") );
    $("#data-scale").val( $("#"+id).attr("data-scale") );
    $("#moveTo"+currentSlide).attr("class","btn btn-primary");
    $("#moveTo"+id).attr("class","btn btn-primary disabled");
    currentSlide = id;
}

function deleteCurrentSlide()
{
    if( !$("#"+currentSlide).length )
        return;
    if( slides == 1 )
        return;
    unselectElement();
    slides = slides - 1;
    $("#"+currentSlide).remove();
    $("#moveTo"+currentSlide).remove();
    currentSlide = 1;
    while( !$("#moveTo"+currentSlide).length )
        currentSlide = currentSlide + 1;
    var slideNumber = 1;
    for( var i = 1; i <= lastSlide; i++ )
    {
        if( $("#moveTo"+i).length )
        {
            $("#moveTo"+i).text(slideNumber);
            slideNumber = slideNumber + 1;
        }
    }
    $("#editor").html( $("#"+currentSlide).html() );
    $("#data-x").val( $("#"+currentSlide).attr("data-x") );
    $("#data-y").val( $("#"+currentSlide).attr("data-y") );
    $("#data-rotate").val( $("#"+currentSlide).attr("data-rotate") );
    $("#data-scale").val( $("#"+currentSlide).attr("data-scale") );
    $("#moveTo"+currentSlide).attr("class","btn btn-primary disabled");
}