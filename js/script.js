function loadXMLDoc(dName, callback) {
    'use strict';

    let xHttp;

    if (window.XMLHttpRequest) {
        xHttp = new XMLHttpRequest();
    } else {
        xHttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    // force the correct MIME type, since nginx seems to think xsl is application/octet-stream
    xHttp.overrideMimeType("application/xml");
    xHttp.open("GET", dName, true);

    xHttp.onreadystatechange = function() {
        if (xHttp.readyState === 4 && xHttp.status === 200) {
            callback(xHttp.responseXML);
        }
    };

    xHttp.send();
}

function transform(xml, xsl) {
    "use strict";

    loadXMLDoc(
        xml,
        function(source) {
            loadXMLDoc(
                xsl,
                function(stylesheet) {
                    displayResult(source, stylesheet);
                }
            );
        }
    );
}

function displayResult(xml, xsl) {
    'use strict';

    const musicCatalogue = document.getElementById("musicCatalogue");

    //set a &nbsp to make prevent FF to append the text by double click
    musicCatalogue.innerHTML = "&nbsp;";

    // code for IE
    if (window.ActiveXObject) {
        musicCatalogue.innerHTML = xml.transformNode(xsl);
    }

    // code for Mozilla, Firefox, Opera, etc.
    else if (document.implementation && document.implementation.createDocument) {
        const xsltProcessor = new XSLTProcessor();

        xsltProcessor.importStylesheet(xsl);
        musicCatalogue.appendChild(xsltProcessor.transformToFragment(xml, document));
    }
}


function init(){
    'use strict';
    document.getElementById("Btn").addEventListener("click", function () {
        transform("resources/music_catalogue.xml","resources/music_transform.xsl")
    });
}

window.onload = init;