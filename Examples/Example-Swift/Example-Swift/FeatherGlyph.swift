import Foundation
import IcoMoonKit

public class FeatherGlyph: Glyph {

    // MARK: - Initialize

    convenience init(type: Type, size: CGFloat, color: UIColor) {
        self.init(code: type.rawValue, size: size, color: color)
    }

    // MARK: - Font

    override public func fontName() -> String {
        return "Feather"
    }

    override public func fontResource() -> (String, NSBundle) {
        return ("Feather.ttf", NSBundle.mainBundle())
    }

    // MARK: -

    enum Type: String {
        case Eye = "\u{e600}"
        case PaperClip = "\u{e601}"
        case Mail = "\u{e602}"
        case Toggle = "\u{e603}"
        case Layout = "\u{e604}"
        case Link = "\u{e605}"
        case Bell = "\u{e606}"
        case Lock = "\u{e607}"
        case Unlock = "\u{e608}"
        case Ribbon = "\u{e609}"
        case Image = "\u{e60a}"
        case Signal = "\u{e60b}"
        case Target = "\u{e60c}"
        case Clipboard = "\u{e60d}"
        case Clock = "\u{e60e}"
        case Watch = "\u{e60f}"
        case AirPlay = "\u{e610}"
        case Camera = "\u{e611}"
        case Video = "\u{e612}"
        case Disc = "\u{e613}"
        case Printer = "\u{e614}"
        case Monitor = "\u{e615}"
        case Server = "\u{e616}"
        case Cog = "\u{e617}"
        case Heart = "\u{e618}"
        case Paragraph = "\u{e619}"
        case AlignJustify = "\u{e61a}"
        case AlignLeft = "\u{e61b}"
        case AlignCenter = "\u{e61c}"
        case AlignRight = "\u{e61d}"
        case Book = "\u{e61e}"
        case Layers = "\u{e61f}"
        case Stack = "\u{e620}"
        case Stack2 = "\u{e621}"
        case Paper = "\u{e622}"
        case PaperStack = "\u{e623}"
        case Search = "\u{e624}"
        case ZoomIn = "\u{e625}"
        case ZoomOut = "\u{e626}"
        case Reply = "\u{e627}"
        case CirclePlus = "\u{e628}"
        case CircleMinus = "\u{e629}"
        case CircleCheck = "\u{e62a}"
        case CircleCross = "\u{e62b}"
        case SquarePlus = "\u{e62c}"
        case SquareMinus = "\u{e62d}"
        case SquareCheck = "\u{e62e}"
        case SquareCross = "\u{e62f}"
        case Microphone = "\u{e630}"
        case Record = "\u{e631}"
        case SkipBack = "\u{e632}"
        case Rewind = "\u{e633}"
        case Play = "\u{e634}"
        case Pause = "\u{e635}"
        case Stop = "\u{e636}"
        case FastForward = "\u{e637}"
        case SkipForward = "\u{e638}"
        case Shuffle = "\u{e639}"
        case Repeat = "\u{e63a}"
        case Folder = "\u{e63b}"
        case Umbrella = "\u{e63c}"
        case Moon = "\u{e63d}"
        case Thermometer = "\u{e63e}"
        case Drop = "\u{e63f}"
        case Sun = "\u{e640}"
        case Cloud = "\u{e641}"
        case CloudUpload = "\u{e642}"
        case CloudDownload = "\u{e643}"
        case Upload = "\u{e644}"
        case Download = "\u{e645}"
        case Location = "\u{e646}"
        case Location2 = "\u{e647}"
        case Map = "\u{e648}"
        case Battery = "\u{e649}"
        case Head = "\u{e64a}"
        case Briefcase = "\u{e64b}"
        case SpeechBubble = "\u{e64c}"
        case Anchor = "\u{e64d}"
        case Globe = "\u{e64e}"
        case Box = "\u{e64f}"
        case Reload = "\u{e650}"
        case Share = "\u{e651}"
        case Marquee = "\u{e652}"
        case MarqueePlus = "\u{e653}"
        case MarqueeMinus = "\u{e654}"
        case Tag = "\u{e655}"
        case Power = "\u{e656}"
        case Command = "\u{e657}"
        case Alt = "\u{e658}"
        case Esc = "\u{e659}"
        case BarGraph = "\u{e65a}"
        case BarGraph2 = "\u{e65b}"
        case PieGraph = "\u{e65c}"
        case Star = "\u{e65d}"
        case ArrowLeft = "\u{e65e}"
        case ArrowRight = "\u{e65f}"
        case ArrowUp = "\u{e660}"
        case ArrowDown = "\u{e661}"
        case Volume = "\u{e662}"
        case Mute = "\u{e663}"
        case ContentRight = "\u{e664}"
        case ContentLeft = "\u{e665}"
        case Grid = "\u{e666}"
        case Grid2 = "\u{e667}"
        case Columns = "\u{e668}"
        case Loader = "\u{e669}"
        case Bag = "\u{e66a}"
        case Ban = "\u{e66b}"
        case Flag = "\u{e66c}"
        case Trash = "\u{e66d}"
        case Expand = "\u{e66e}"
        case Contract = "\u{e66f}"
        case Maximize = "\u{e670}"
        case Minimize = "\u{e671}"
        case Plus = "\u{e672}"
        case Minus = "\u{e673}"
        case Check = "\u{e674}"
        case Cross = "\u{e675}"
        case Move = "\u{e676}"
        case Delete = "\u{e677}"
        case Menu = "\u{e678}"
        case Archive = "\u{e679}"
        case Inbox = "\u{e67a}"
        case Outbox = "\u{e67b}"
        case File = "\u{e67c}"
        case FileAdd = "\u{e67d}"
        case FileSubtract = "\u{e67e}"
        case Help = "\u{e67f}"
        case Open = "\u{e680}"
        case Ellipsis = "\u{e681}"
    }

    // MARK: -

    public class func Eye(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Eye, size: size, color: color)
    }

    public class func PaperClip(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .PaperClip, size: size, color: color)
    }

    public class func Mail(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Mail, size: size, color: color)
    }

    public class func Toggle(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Toggle, size: size, color: color)
    }

    public class func Layout(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Layout, size: size, color: color)
    }

    public class func Link(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Link, size: size, color: color)
    }

    public class func Bell(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Bell, size: size, color: color)
    }

    public class func Lock(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Lock, size: size, color: color)
    }

    public class func Unlock(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Unlock, size: size, color: color)
    }

    public class func Ribbon(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Ribbon, size: size, color: color)
    }

    public class func Image(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Image, size: size, color: color)
    }

    public class func Signal(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Signal, size: size, color: color)
    }

    public class func Target(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Target, size: size, color: color)
    }

    public class func Clipboard(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Clipboard, size: size, color: color)
    }

    public class func Clock(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Clock, size: size, color: color)
    }

    public class func Watch(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Watch, size: size, color: color)
    }

    public class func AirPlay(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .AirPlay, size: size, color: color)
    }

    public class func Camera(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Camera, size: size, color: color)
    }

    public class func Video(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Video, size: size, color: color)
    }

    public class func Disc(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Disc, size: size, color: color)
    }

    public class func Printer(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Printer, size: size, color: color)
    }

    public class func Monitor(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Monitor, size: size, color: color)
    }

    public class func Server(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Server, size: size, color: color)
    }

    public class func Cog(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Cog, size: size, color: color)
    }

    public class func Heart(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Heart, size: size, color: color)
    }

    public class func Paragraph(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Paragraph, size: size, color: color)
    }

    public class func AlignJustify(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .AlignJustify, size: size, color: color)
    }

    public class func AlignLeft(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .AlignLeft, size: size, color: color)
    }

    public class func AlignCenter(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .AlignCenter, size: size, color: color)
    }

    public class func AlignRight(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .AlignRight, size: size, color: color)
    }

    public class func Book(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Book, size: size, color: color)
    }

    public class func Layers(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Layers, size: size, color: color)
    }

    public class func Stack(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Stack, size: size, color: color)
    }

    public class func Stack2(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Stack2, size: size, color: color)
    }

    public class func Paper(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Paper, size: size, color: color)
    }

    public class func PaperStack(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .PaperStack, size: size, color: color)
    }

    public class func Search(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Search, size: size, color: color)
    }

    public class func ZoomIn(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .ZoomIn, size: size, color: color)
    }

    public class func ZoomOut(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .ZoomOut, size: size, color: color)
    }

    public class func Reply(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Reply, size: size, color: color)
    }

    public class func CirclePlus(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .CirclePlus, size: size, color: color)
    }

    public class func CircleMinus(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .CircleMinus, size: size, color: color)
    }

    public class func CircleCheck(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .CircleCheck, size: size, color: color)
    }

    public class func CircleCross(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .CircleCross, size: size, color: color)
    }

    public class func SquarePlus(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .SquarePlus, size: size, color: color)
    }

    public class func SquareMinus(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .SquareMinus, size: size, color: color)
    }

    public class func SquareCheck(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .SquareCheck, size: size, color: color)
    }

    public class func SquareCross(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .SquareCross, size: size, color: color)
    }

    public class func Microphone(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Microphone, size: size, color: color)
    }

    public class func Record(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Record, size: size, color: color)
    }

    public class func SkipBack(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .SkipBack, size: size, color: color)
    }

    public class func Rewind(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Rewind, size: size, color: color)
    }

    public class func Play(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Play, size: size, color: color)
    }

    public class func Pause(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Pause, size: size, color: color)
    }

    public class func Stop(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Stop, size: size, color: color)
    }

    public class func FastForward(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .FastForward, size: size, color: color)
    }

    public class func SkipForward(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .SkipForward, size: size, color: color)
    }

    public class func Shuffle(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Shuffle, size: size, color: color)
    }

    public class func Repeat(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Repeat, size: size, color: color)
    }

    public class func Folder(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Folder, size: size, color: color)
    }

    public class func Umbrella(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Umbrella, size: size, color: color)
    }

    public class func Moon(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Moon, size: size, color: color)
    }

    public class func Thermometer(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Thermometer, size: size, color: color)
    }

    public class func Drop(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Drop, size: size, color: color)
    }

    public class func Sun(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Sun, size: size, color: color)
    }

    public class func Cloud(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Cloud, size: size, color: color)
    }

    public class func CloudUpload(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .CloudUpload, size: size, color: color)
    }

    public class func CloudDownload(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .CloudDownload, size: size, color: color)
    }

    public class func Upload(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Upload, size: size, color: color)
    }

    public class func Download(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Download, size: size, color: color)
    }

    public class func Location(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Location, size: size, color: color)
    }

    public class func Location2(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Location2, size: size, color: color)
    }

    public class func Map(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Map, size: size, color: color)
    }

    public class func Battery(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Battery, size: size, color: color)
    }

    public class func Head(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Head, size: size, color: color)
    }

    public class func Briefcase(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Briefcase, size: size, color: color)
    }

    public class func SpeechBubble(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .SpeechBubble, size: size, color: color)
    }

    public class func Anchor(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Anchor, size: size, color: color)
    }

    public class func Globe(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Globe, size: size, color: color)
    }

    public class func Box(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Box, size: size, color: color)
    }

    public class func Reload(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Reload, size: size, color: color)
    }

    public class func Share(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Share, size: size, color: color)
    }

    public class func Marquee(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Marquee, size: size, color: color)
    }

    public class func MarqueePlus(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .MarqueePlus, size: size, color: color)
    }

    public class func MarqueeMinus(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .MarqueeMinus, size: size, color: color)
    }

    public class func Tag(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Tag, size: size, color: color)
    }

    public class func Power(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Power, size: size, color: color)
    }

    public class func Command(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Command, size: size, color: color)
    }

    public class func Alt(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Alt, size: size, color: color)
    }

    public class func Esc(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Esc, size: size, color: color)
    }

    public class func BarGraph(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .BarGraph, size: size, color: color)
    }

    public class func BarGraph2(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .BarGraph2, size: size, color: color)
    }

    public class func PieGraph(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .PieGraph, size: size, color: color)
    }

    public class func Star(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Star, size: size, color: color)
    }

    public class func ArrowLeft(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .ArrowLeft, size: size, color: color)
    }

    public class func ArrowRight(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .ArrowRight, size: size, color: color)
    }

    public class func ArrowUp(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .ArrowUp, size: size, color: color)
    }

    public class func ArrowDown(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .ArrowDown, size: size, color: color)
    }

    public class func Volume(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Volume, size: size, color: color)
    }

    public class func Mute(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Mute, size: size, color: color)
    }

    public class func ContentRight(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .ContentRight, size: size, color: color)
    }

    public class func ContentLeft(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .ContentLeft, size: size, color: color)
    }

    public class func Grid(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Grid, size: size, color: color)
    }

    public class func Grid2(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Grid2, size: size, color: color)
    }

    public class func Columns(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Columns, size: size, color: color)
    }

    public class func Loader(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Loader, size: size, color: color)
    }

    public class func Bag(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Bag, size: size, color: color)
    }

    public class func Ban(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Ban, size: size, color: color)
    }

    public class func Flag(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Flag, size: size, color: color)
    }

    public class func Trash(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Trash, size: size, color: color)
    }

    public class func Expand(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Expand, size: size, color: color)
    }

    public class func Contract(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Contract, size: size, color: color)
    }

    public class func Maximize(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Maximize, size: size, color: color)
    }

    public class func Minimize(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Minimize, size: size, color: color)
    }

    public class func Plus(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Plus, size: size, color: color)
    }

    public class func Minus(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Minus, size: size, color: color)
    }

    public class func Check(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Check, size: size, color: color)
    }

    public class func Cross(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Cross, size: size, color: color)
    }

    public class func Move(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Move, size: size, color: color)
    }

    public class func Delete(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Delete, size: size, color: color)
    }

    public class func Menu(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Menu, size: size, color: color)
    }

    public class func Archive(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Archive, size: size, color: color)
    }

    public class func Inbox(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Inbox, size: size, color: color)
    }

    public class func Outbox(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Outbox, size: size, color: color)
    }

    public class func File(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .File, size: size, color: color)
    }

    public class func FileAdd(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .FileAdd, size: size, color: color)
    }

    public class func FileSubtract(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .FileSubtract, size: size, color: color)
    }

    public class func Help(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Help, size: size, color: color)
    }

    public class func Open(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Open, size: size, color: color)
    }

    public class func Ellipsis(size: CGFloat, color: UIColor) -> FeatherGlyph {
        return FeatherGlyph(type: .Ellipsis, size: size, color: color)
    }

}
