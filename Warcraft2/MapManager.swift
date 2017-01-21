//
//  MapManager.swift
//  Warcraft2
//
//  Created by Andrew van Tonningen on 1/19/17.
//  Copyright © 2017 UC Davis. All rights reserved.
//

import Foundation
import SpriteKit

class MapManager {

    var mapFileName = ".map"
    var mapTileTypes: [[TerrainManager.ETileType]] =
        Array(repeating: Array(repeating: .ttGrass, count: 20), count: 20)

    var sampleMapData = "Maze \n96 64\nGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG\nGFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFG\nGFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFG\nGFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFG\nGFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFG\nGGGGGGGGGGGGGGGGGGFFFFFFFGGGGGGGGGGGGGGGGGGGGGGGGFFFFFFFFFGGGGGGGGGGGGGGGGGGFFFFFFFFGGGGGGGGGGGDRR\nGGGGGGWWWWWWWWWWWGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGFFFFGGGGGGGGGGGGGGGGGGGGGFFFFGGGGGGGGGGGGGGGDRR\nGGGGGGWGGGGGGGGGWGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGFFFGGGGGGGGGGGGGGGGGGGFFFFGGGGGGGGGGGGGGGGGDRR\nGGGGGGWGGGGGGGGGWGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGFFFFGGGGGGGGGGGGGGGGGDRR\nGGGGGGWGGWWWWWGGWGGGGGGGGGGGGGGGGGRRRRGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGDDDDDDGGGGGGGGGGGGGGDRR\nGGGGGGWGGWGGGWGGWGGGGGGGGGGGGGGGGRRRRGGGGGGGGGGGGGGGFFFFGGGGGGGGGGGGGGGGGDDDRRRDDGGGGGGGGGGGGGGDRR\nGGGGGGWGGWGGGWGGWGGGGGGGGGGGGGGGRRRGGGGGGGGGGGGGGGGFFFFFGGGGGGGGGGGGGGGGGGDDDRRRRDDGGGGGGGGGGGGDRR\nGGGGGGWGGWGGGWGGWGGGGGGGGGGGGGGGRRRGGGGGGGGGGGGGGGGGFFFFFGGGGGGGGGGGGGGGGGGGDDRRRRDDGGGGGGGGGGGDRR\nGGGGGGWGGGGGGWGGWGGGGGGGGGGGGGGGGRRRGGGGGGGGGGGGGGGGGFFFFFGGGGGGGGGGGGGGGGGGGDDRRRRDDGGGGGGGGGGDRR\nGGGGGGWGGGGGGWGGWGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGFFFFGGGGGGGGGGGGGGGGGGGGDDRRRRDDGGGGGGGGDDRR\nGGGGGGWWWWWWWWGGWGGGGGGGGGGGRRRGGGGGGGGGGGGGGGGGGGGGGGFFFGGGGGGGGGGGGGGGGGGGGGGDDRRRRDDGGGGGGGDRRR\nGGGGGGGGGGGGGGGGWGGGGGGGGGGRRRRRRGGGGGGGGGGGGGGGGGGGFFFFFGGGGGGGGGGGGGGGGGGGGGGGDDRRRRDDDDDDDRRRRR\nGGGGGGGGGGGGGGGGWGGGGGGGGGRRRRRRRGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGDDDDRRRRRRRRRRRRRR\nGGGGGGGGGGGGGGGGGGGGGGGGGRRRRRRRGGGGGGGGGGGGGGGGRRRRRRRRRGGGGGGGGGGGGGGGGGGGGGGRRDDDDRRRRRRRRRRRRR\nGGGGGGGGGGGGGGGGGGGGGGGGGRRRRRRRGGGGGGGGGGGGGGRRRRRRRRRRRGGGGGGGGGGGGGGGGGGGGGGRRRDDDDRRRRRRRRRRRR\nGGGGGGGGGGGGGGGGGGGGGGGGRRRRRRRRRGGGGGGGGGGGGRRRRRRRRRRRRRGGGGGGGGGGGGGGGGGGGGGRRRRDDDDDRRRRRRRRRR\nRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRDDDDDRRRRRRRRRR\nRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRDDDDDRRRRRRRRRRR\nRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRDDDDDRRRRRRRRRRRR\nRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRDDDDDRRRRRRRRRRRRR\nRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRDDDDDRRRRRRRRRRRRRR\nRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRDDDDDRRRRRRRRRRRRRRR\nRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRDDRRRRRRRRRRRRRRRRRRRRRRRRRRRDDDDDRRRRRRRRRRRRRRRR\nRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRDDDDRRRRRRRRRRRRRRRRRRRRRRRRRDDDDDRRRRRRRRRRRRRRRRR\nRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRDDDDDDRRRRRRRRRRRRRRRRRRRRRRRDDDDDRRRRRRRRRRRRRRRRRR\nRRRRRRRRRRRRRRRRRRRRRDDDDDDRRRRRRRRRRRRRRRRRRDDDDDDDDRRRRRRRRRRRRRRRRRRRDDDDDDDRRRRRRRRRRRRRRRRRRR\nRRRRRRRRRRRRRRRRRRRRDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDRRRRRRRRRRRRRRRRRRRR\nRRRRRRRRRRRRRRRRRRRRDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDRRRRRRRRRRRRRRRRRRRR\nRRRRRRRRRRRRRRRRRRRRDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDRRRRRRRRRRRRRRRRRRRR\nRRRRRRRRRRRRRRRRRRRRDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDRRRRRRRRRRRRRRRRRRRR\nRRRRRRRRRRRRRRRRRRRDDDDDDDRRRRRRRRRRRRRRRRRRRDDDDDDDDRRRRRRRRRRRRRRRRRRDDDDDDRRRRRRRRRRRRRRRRRRRRR\nRRRRRRRRRRRRRRRRRRDDDDDRRRRRRRRRRRRRRRRRRRRRRRDDDDDDRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR\nRRRRRRRRRRRRRRRRRDDDDDRRRRRRRRRRRRRRRRRRRRRRRRRDDDDRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR\nRRRRRRRRRRRRRRRRDDDDDRRRRRRRRRRRRRRRRRRRRRRRRRRRDDRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR\nRRRRRRRRRRRRRRRDDDDDRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR\nRRRRRRRRRRRRRRDDDDDRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR\nRRRRRRRRRRRRRDDDDDRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR\nRRRRRRRRRRRRDDDDDRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR\nRRRRRRRRRRRDDDDDRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR\nRRRRRRRRRRRDDDDRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR\nRRRRRRRRRRDDDDDRRRRGGGGGGGGGGGGGGGGGGGGGGRRRRRRRRRRRRRGGGGGGGGGGGGGGGRRRRRRRRRGGGGGGGGGGGGGGGGGGGG\nRRRRRRRRRRRRDDDDRRRGGGGGGGGGGGGGGGGGGGGGGGRRRRRRRRRRRGGGGGGGGGGGGGGGGGRRRRRRRGGGGGGGGGGGGGGGGGGGGG\nRRRRRRRRRRRRRDDDDRRGGGGGGGGGGGGGGGGGGGGGGGGGRRRRRRRRRGGGGGGGGGGGGGGGGGRRRRRRRGGGGGGGGGGGGGGGGGGGGG\nRRRRRRRRRRRRRRDDDDGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGRRRRRRRGGGGGGGGGGGGGGGGGGGGGG\nRRRRRDDDDDDDRRRRDDGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGFFFFFGGGGGGGGGGGGGGGGRRRRRRGGGGGGGGGGGGGGGGGGGGGGG\nRRRDDGGGGGGDDRRRRDDGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGFFFGGGGGGGGGGGGGGGGGGRRRGGGGGGGGGGGGGGGGGGGGGGGG\nRRDDGGGGGGGGDDRRRRDDGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGFFFFGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG\nRRDGGGGGGGGGGDDRRRRDDGGGGGGGGGGGGGGGGGGGGGGGGGGGGFFFFFGGGGGGGGGGGGRRRGGGGGGGGGGGGGGGGGGGGGGGGGGGGG\nRRDGGGGGGGGGGGDDRRRRDDGGGGGGGGGGGGGGGGGGGGGGGGGGFFFFFGGGGGGGGGGGGRRRGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG\nRRDGGGGGGGGGGGGDDRRRRDDGGGGGGGGGGGGGGGGGGGGGGGGFFFFFGGGGGGGGGGGGGRRRGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG\nRRDGGGGGGGGGGGGGDDRRRRDDGGGGGGGGGGGGGGGGGGGGGGGGFFFFGGGGGGGGGGGRRRRGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG\nRRDGGGGGGGGGGGGGGDDDDDGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGRRRRGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG\nRRDGGGGGGGGGGGGGGGGFFFFGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG\nRRDGGGGGGGGGGGGGGGGFFFFGGGGGGGGGGGGGGGGGGGGGGGGGFFFGGGGGGGGGGGGGGGGGGGGGGGFFFGGGGGGGGGGGGGGGGGGGGG\nRRDGGGGGGGGGGGGGGGFFFFGGGGGGGGGGGGGGGGGGGGGGGGGFFFFGGGGGGGGGGGGGGGGGGGGGGGFFFGGGGGGGGGGGGGGGGGGGGG\nRRDGGGGGGGGGGFFFFFFFFGGGGGGGGGGGGGGGGGGGGGGGGFFFFFFFFFGGGGGGGGGGGGGGGGGGGFFFFFFFGGGGGGGGGGGGGGGGGG\nGFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFG\nGFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFG\nGFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFG\nGFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFG\nGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG"

    func loadMap() {
        let fileLines: [String] = self.sampleMapData.components(separatedBy: "\n")
        mapTileTypes = []

        for i in 3 ..< fileLines.count {
            var tileRow: [TerrainManager.ETileType] = []
            for tileCharCode in fileLines[i].characters {
                switch tileCharCode {
                case "G":
                    tileRow.append(.ttGrass)
                case "F":
                    tileRow.append(.ttTree)
                case "D":
                    tileRow.append(.ttDirt)
                case "W":
                    tileRow.append(.ttWall)
                case "w":
                    tileRow.append(.ttWallDamaged)
                case "R":
                    tileRow.append(.ttRock)
                case " ":
                    tileRow.append(.ttWater)
                default:
                    fatalError("Uknown tile code")
                }
            }
            mapTileTypes.append(tileRow)
        }

        // In future, will load .map file

        // Load map width and height

        // Load map tile types
    }
}
