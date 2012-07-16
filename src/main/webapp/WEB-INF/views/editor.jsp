<%@ include file="static/taglibs.resource" %>
<!DOCTYPE html>
<html>
    <head>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/ui-lightness/jquery-ui-1.8.21.custom.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap/css/bootstrap.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap/css/bootstrap-responsive.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/editor.css"/>">
    <script src="<c:url value="/resources/js/jquery-1.7.2.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery-ui-1.8.21.custom.min.js"/>"></script>
    <script src="<c:url value="/resources/js/HtmlBox_4.0.3/htmlbox.min.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap/bootstrap-modal.js"/>"></script>
    <script src="<c:url value="/resources/js/editor.js"/>"></script>
    </head>
    <body>
        <header>
        
            <div class="modal hide" id="addTextDialog">
                <div class="modal-header">
                    <h3>Add Text</h3>
                </div>
                <div class="modal-body">
                    <textarea id="textEditor"></textarea>
                    <input type="text" class="add-on" id="textOpacityText" value="Opacity : 1"><div id="textOpacity"></div>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn" data-dismiss="modal" id="closeTextDialog" onclick="$('#addTextDialog').modal('toggle');">Close</a>
                    <a href="#" class="btn btn-primary" id="saveTextChanges" onclick="addTextItem();">Save changes</a>
                </div>
            </div>
            
            <div class="modal hide" id="addImageDialog">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">x</button>
                    <h3>Add Image</h3>
                </div>
                <div class="modal-body">
                    <label class="control-label" for="imageLink">Image Link:</label><input class="span2" type="text" id="imageLink">
                    <input type="text" class="add-on" id="imageOpacityText" value="Opacity : 1"><div id="imageOpacity"></div>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn" data-dismiss="modal" onclick="$('#addImageDialog').modal('toggle')">Close</a>
                    <a href="#" class="btn btn-primary" id="saveImageChanges" onclick="addImageItem()">Save changes</a>
                </div>
            </div>
            
            <div class="modal hide" id="addVideoDialog">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">x</button>
                    <h3>Add Video</h3>
                </div>
                <div class="modal-body">
                    <label class="control-label" for="videoLink">Video Link(YouTube):</label><input class="span2" type="text" id="videoLink">
                    <input type="text" class="add-on" id="videoOpacityText" value="Opacity : 1"><div id="videoOpacity"></div>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn" data-dismiss="modal" onclick="$('#addVideoDialog').modal('toggle')">Close</a>
                    <a href="#" class="btn btn-primary" onclick="addVideoItem()">Save changes</a>
                </div>
            </div>
            
            <div id="editorMenu">
                <a class="btn btn-primary" onclick="$('#addTextDialog').modal('toggle')" href="#">
                    <i class="icon-pencil icon-white"></i>Add Text
                </a>
                <a class="btn btn-primary" onclick="$('#addImageDialog').modal('toggle')" href="#">
                    <i class="icon-picture icon-white"></i>Add Image
                </a>
                <a class="btn btn-primary" onclick="$('#addVideoDialog').modal('toggle')" href="#">
                    <i class="icon-facetime-video icon-white"></i>Add Video
                </a>
                <a class="btn btn-primary disabled operationWithSelected" onclick="deleteSelected();" href="#">
                    <i class="icon-trash icon-white"></i>Delete selected
                </a>
                <a class="btn btn-primary disabled operationWithSelected" onclick="moveUp();" href="#">
                    <i class="icon-arrow-up icon-white"></i>Move up
                </a>
                <a class="btn btn-primary disabled operationWithSelected" onclick="moveDown();" href="#">
                    <i class="icon-arrow-down icon-white"></i>Move down
                </a>
                </a>
                <a class="btn btn-primary" onclick="savePresentation();" href="#">
                Save
                </a>
                <a class="btn btn-primary" onclick="$('#slideProperties').toggle('slow');" href="#">
                Slide properties
                </a>
                <a class="btn btn-primary" href="/xslides/">
                Exit
                </a>
                <div id="slidePanel">
                <a class="btn btn-primary" onclick="addSlide();" href="#">
                    <i class="icon-plus icon-white"></i>Add slide
                </a>
                <a class="btn btn-primary" onclick="deleteCurrentSlide();" href="#">
                    <i class="icon-minus icon-white"></i>Delete current slide
                </a>
                <a id='moveTo1' class='btn btn-primary disabled' style='display:inline; margin:1px;' onclick='selectSlide(1);'>1</a>
                </div>
            <div id="slideProperties" style="display:none;position:absolute;z-index:100000;">
                X : <input id="data-x" value="0" /> <br>
                Y : <input id="data-y" value="0"/> <br>
                Rotate : <input id="data-rotate" value="0"> <br>
                Scale : <input id="data-scale" value="1"> <br>
            </div>
            </div>
            <div id="editor" onclick="unselectElement();">
            </div>
            <div id="presentation" style="display:none;"><div class='step' id='1' data-x='0' data-y='0' data-rotation='0' data-scale='1'></div></div>
        </header>
    </body>
</html>