import js.html.Console;
import js.html.ImageElement;
import js.Browser;

class ImageViewer {
    static function main() {
        var imageViewer = Browser.document.getElementById("image-viewer");
        var imageViewerImage: ImageElement = cast(imageViewer.firstElementChild, ImageElement);
        var imageGrids = Browser.document.getElementsByClassName("image-grid");
        
        // We don't need to continue if there is not an image grid in this page
        if (imageGrids.length == 0) {
            return;
        }

        imageViewer.onclick = function () {
            imageViewer.style.display = "none";
            Browser.document.body.style.overflow = "auto";
        }

        for (imageGrid in imageGrids) {
            for (child in imageGrid.children) {
                var imageElement: ImageElement = cast(child, ImageElement);
                if (imageElement == null) {
                    Console.error("ERROR: All the children of an image grid must be images");
                    continue;
                }
                imageElement.onclick = function() {
                    imageViewerImage.src = imageElement.src;
                    imageViewer.style.display = "flex";
                    Browser.document.body.style.overflow = "hidden";
                }
            }
        }
    }
}