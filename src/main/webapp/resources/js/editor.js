var textElements = 0;
var imageElements = 0;
var videoElements = 0;
var zIndex = 400;
var selectedElement = null;

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
        $("#textEditor").css("height","200").css("width","200").htmlbox({
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
                "separator","formats"
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
            idir : "./js/HtmlBox_4.0.3/images/",
            skin:"blue",
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
    $("#editor").width( $(document).width() - 20 );
    $("#editor").height( $(document).height() - $("#editorMenu").height() - 20 );
}

function addText()
{
    textElements = textElements + 1;
    $("#editor").append("<div class=\"ui-widget-content textInEditor\" id=\"text" + textElements + "\" onclick=\"selectElement('text"+textElements+"');\" style=\"z-index:"+zIndex+";\"><div id=\"textContainer"+textElements+"\"></div></div>");
    zIndex = zIndex + 1;
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
            $("#imageContainer"+imageElements).width($("#image" + imageElements).width());
            $("#imageContainer"+imageElements).height($("#image" + imageElements).height());
        }
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
            $("#videoIframe"+videoElements).width($("#video" + videoElements).width());
            $("#videoIframe"+videoElements).height($("#video" + videoElements).height());
        }
    });
    $("#video" + videoElements).draggable( { containment : "#editor" } );
    $("#video" + videoElements).selectable();
}

function unselectElement()
{
    if( selectedElement != null )
    {
        $("#"+selectedElement).css("border","solid 1px black");
        selectedElement = null;
        $(".operationWithSelected").attr( "class", "btn btn-primary operationWithSelected disabled" );
    }
}

function selectElement( elementId )
{
    unselectElement();
    selectedElement = elementId;
    $("#"+selectedElement).css("border","dotted 2px black");
    $(".operationWithSelected").attr( "class", "btn btn-primary operationWithSelected" );
}

function deleteSelected()
{
    if( selectedElement != null )
    {
        $("#"+selectedElement).remove();
        selectedElement = null;
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

function saveCurrentPresentation()
{
	$.get(
	"/xslides/saveCurrentPresentation",
	{content : $("#editor").html()}
	);
}