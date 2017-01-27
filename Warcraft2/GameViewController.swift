import UIKit
import SpriteKit
import SceneKit
import AVFoundation

class GameViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var mainGameView: UIView!
    @IBOutlet weak var resourceBar: UIView!
    @IBOutlet weak var statsActionsView: UIView!
    @IBOutlet weak var gameSceneView: SKView!

    var midiplayer: AVMIDIPlayer?
    var soundfont: URL?
    var midifile: URL?

    // var soundbank: URL!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = GameScene(fileNamed: "GameScene") {
            // Configure the view.
            let skView: SKView = gameSceneView
            skView.showsFPS = true
            skView.showsNodeCount = true

            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true

            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .fill

            skView.presentScene(scene)
        }
        self.view = mainGameView

        playMIDIFile()
    }

    func playMIDIFile() {


        soundfont = Bundle.main.url(forResource: "generalsoundfont", withExtension: "sf2")!
        midifile = Bundle.main.url(forResource: "intro", withExtension: "mid")!

        assert(soundfont != nil)
        assert(midifile != nil)

        do {
            try midiplayer = AVMIDIPlayer(contentsOf: midifile!, soundBankURL: soundfont!)

        } catch {
            assert(false)
        }

        midiplayer!.prepareToPlay()
        midiplayer!.play()

    }
}
