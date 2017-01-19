//
//  GameViewController.swift
//  Warcraft2
//
//  Created by Justin Jia on 1/10/17.
//  Copyright © 2017 UC Davis. All rights reserved.
//

import UIKit
import SpriteKit
import SceneKit

class GameViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var mainGameView: UIView!
    @IBOutlet weak var resourceBar: UIView!
    @IBOutlet weak var statsActionsView: UIView!
    @IBOutlet weak var gameSceneView: UIView!
    @IBOutlet weak var myScrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        myScrollView.delegate = self

        if let scene = GameScene(fileNamed: "GameScene") {
            // Configure the view.
            let skView = self.gameSceneView as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true

            scene.parentViewController = self

            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true

            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .aspectFill

            skView.presentScene(scene)
        }

        self.view = mainGameView
    }

    func resizeMap(width: Int, height: Int) {
        myScrollView.contentSize = CGSize(width: CGFloat(width), height: CGFloat(height))
        gameSceneView.frame = CGRect(x: 0, y: 0, width: CGFloat(width), height: CGFloat(height))
    }

    func scrollViewDidScroll(_: UIScrollView) {
        // print("did scroll")
    }

    //    @IBAction func tapTest(_: Any) {
    //        print("Hello")
    //    }
}
