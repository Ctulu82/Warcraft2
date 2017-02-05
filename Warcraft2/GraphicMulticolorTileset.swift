class GraphicMulticolorTileset: GraphicTileset {
    private var coloredTilesets: [GraphicSurface] = []
    private var colorMap: GraphicRecolorMap!

    var colorCount: Int {
        return coloredTilesets.count
    }

    func findColor(with colorname: String) -> Int {
        return colorMap.findColor(with: colorname)
    }

    func loadTileset(colorMap: GraphicRecolorMap, from dataSource: DataSource) throws {
        fatalError("This method is not yet implemented.")
    }

    func drawTile(on surface: GraphicSurface, x: Int, y: Int, tileIndex: Int, colorIndex: Int) throws {
        fatalError("This method is not yet implemented.")
    }
}