// Generated by CoffeeScript 1.3.3
/*
@author Tantaman
*/

var continuation;

requirejs.config({
  paths: {
    "css": "vendor/amd_plugins/css",
    "text": "vendor/amd_plugins/text"
  },
  shim: {
    'vendor/amd/jszip': {
      exports: 'JSZip'
    },
    'vendor/amd/jszip-deflate': ['vendor/amd/jszip']
  }
});

window.browserPrefix = "";

if ($.browser.mozilla) {
  window.browserPrefix = "-moz-";
} else if ($.browser.msie) {
  window.browserPrefix = "-ms-";
} else if ($.browser.opera) {
  window.browserPrefix = "-o-";
} else if ($.browser.webkit) {
  window.browserPrefix = "-webkit-";
}

if (!(window.localStorage != null)) {
  window.localStorage = {
    setItem: function() {},
    getItem: function() {},
    length: 0
  };
}

if (!(Function.bind != null) || (Function.prototype.bind != null)) {
  Function.prototype.bind = function(ctx) {
    var fn;
    fn = this;
    return function() {
      return fn.apply(ctx, arguments);
    };
  };
}

if (window.location.href.indexOf("preview=true") !== -1) {

} else {
  continuation = function() {
    return requirejs(["ui/editor/Editor", "model/presentation/Deck", "storage/FileStorage"], function(Editor, Deck, FileStorage) {
      var deck, editor, lastPres, pres;
      deck = new Deck();
      editor = new Editor({
        model: deck
      });
      window.zTracker = {
        z: 0,
        next: function() {
          return ++this.z;
        }
      };
      $("body").append(editor.render());
      lastPres = localStorage.getItem("StrutLastPres");
      //if (lastPres != null) {
      //  pres = FileStorage.open(lastPres);
      //  if (pres != null) {
      //  	alert(JSON.stringify(pres));
      //    deck["import"](pres);
      //  }
      //}
      if(editable)
    	  deck["import"](JSON.parse(editable));
      //if (!(lastPres != null)) {
      //  return deck.newSlide();
      if (!(editable != null)) {
          return deck.newSlide();
      }
    });
  };
  requirejs(["vendor/amd/backbone", "state/DefaultState"], function(Backbone, DefaultState) {
    Backbone.sync = function(method, model, options) {
      if (options.keyTrail != null) {
        return options.success(DefaultState.get(options.keyTrail));
      }
    };
    window.slideConfig = {
      size: {
        width: 1024,
        height: 768
      }
    };
    return continuation();
  });
}
