import UIKit

class MiniMapView: UIView {

    weak var renderer: MapRenderer?

    convenience init(frame: CGRect, renderer: MapRenderer) {
        self.init(frame: frame)
        self.renderer = renderer
    }

    override func draw(_ rect: CGRect) {
        guard let renderer = renderer else {
            return
        }
        let context = UIGraphicsGetCurrentContext()!
        let layer = CGLayer(context, size: bounds.size, auxiliaryInfo: nil)!
        renderer.drawMiniMap(on: layer)
        context.draw(layer, in: rect)
    }
}
