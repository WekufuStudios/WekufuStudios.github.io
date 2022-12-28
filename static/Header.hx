import js.html.Console;
import js.html.Element;
import js.Browser;

class Header {
    static function main() {
        var header: Element = Browser.document.getElementsByTagName("header")[0];
        Console.log(header);
    }
}