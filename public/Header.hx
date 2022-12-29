import js.html.ImageElement;
import js.html.Console;
import js.Browser;

class Header {
    static final IMAGE_PATHS = ["/content/games/erebus/screenshots/01.jpg", "/content/games/erebus/screenshots/02.jpg", "/content/games/erebus/screenshots/03.jpg"];
    static final HEADER_IMAGE: ImageElement = cast(Browser.document.getElementsByTagName("header")[0].getElementsByTagName("img")[0], ImageElement);
    
    static function main() {
        choseAndAnimateHeaderImage();
    }

    static function choseAndAnimateHeaderImage() {
        HEADER_IMAGE.style.objectPosition = "0 0";
        HEADER_IMAGE.onload = function () {
            var imageRealHeight = getImageRealHeight(HEADER_IMAGE);
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
                    {objectPosition: "0 " + (-imageRealHeight + HEADER_IMAGE.height) + "px"},
                ],
                {
                    duration: 4000,
                    iterations: 1,
                    //fill: "forwards",
                }).onfinish = function() {
                    HEADER_IMAGE.style.objectPosition = "0 " + (-imageRealHeight + HEADER_IMAGE.height) + "px";
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
        HEADER_IMAGE.src = IMAGE_PATHS[Math.floor(Math.random() * IMAGE_PATHS.length)];
    }

    static function getImageRealHeight(img: ImageElement): Float {
        var ratio: Float = img.naturalWidth/img.naturalHeight;

        return img.width/ratio;
    }
}