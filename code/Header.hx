import js.html.ImageElement;
import js.html.Console;
import js.Browser;

class Header {
    static var header_image_paths = ["/games/erebus/screenshots/07.jpg", "/games/erebus/screenshots/08.jpg", "/games/erebus/screenshots/09.jpg", "/games/erebus/screenshots/10.jpg", "/games/erebus/screenshots/12.jpg",
        "/header_images/erebus/corte_01.jpg", "/header_images/erebus/corte_02.jpg", "/header_images/erebus/corte_03.jpg", "/header_images/erebus/corte_05.jpg", "/header_images/erebus/corte_06.jpg"];
    static final HEADER_IMAGE: ImageElement = cast(Browser.document.getElementsByTagName("header")[0].getElementsByTagName("img")[0], ImageElement);
    
    static function main() {
        choseAndAnimateHeaderImage();
    }

    static function choseAndAnimateHeaderImage() {
        HEADER_IMAGE.style.objectPosition = "0 0";
        HEADER_IMAGE.onload = function () {
            var imageRealHeight = getImageRealHeight(HEADER_IMAGE);
            var pixelsToMove = -imageRealHeight + HEADER_IMAGE.height;
            if (pixelsToMove > 0) {
                pixelsToMove = 0;
            }
            HEADER_IMAGE.animate([
                {filter: "opacity(0%)"},
                {filter: "opacity(100%)"},
            ],
            {
                duration: 1000,
                iterations: 1,
                //fill: "forwards",
            }).onfinish = function() {
                HEADER_IMAGE.style.filter = "opacity(100%)";
                HEADER_IMAGE.animate([
                    {objectPosition: "0 0"},
                    {objectPosition: "0 " + pixelsToMove + "px"},
                ],
                {
                    duration: 4000,
                    iterations: 1,
                    //fill: "forwards",
                }).onfinish = function() {
                    HEADER_IMAGE.style.objectPosition = "0 " + pixelsToMove + "px";
                    Browser.window.setTimeout(function() {
                        HEADER_IMAGE.animate([
                            {filter: "opacity(100%)"},
                            {filter: "opacity(0%)"},
                        ],
                        {
                            duration: 2000,
                            iterations: 1,
                            //fill: "forwards",
                        }).onfinish = function() {
                            HEADER_IMAGE.style.filter = "opacity(0%)";
                            choseAndAnimateHeaderImage();
                        };
                    }, 2000);
                }
            }
        }
        HEADER_IMAGE.src = header_image_paths[Math.floor(Math.random() * header_image_paths.length)];
    }

    static function getImageRealHeight(img: ImageElement): Float {
        var ratio: Float = img.naturalWidth/img.naturalHeight;

        return img.width/ratio;
    }
}