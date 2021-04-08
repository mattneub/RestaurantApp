//
// Created by Daniel Coleman on 2/6/21.
//

import UIKit

// This interface gives us a common language to talk to objects that have a coordinateSpace, and bounds.  We use it in tests where we want to test layout.  Sometimes, a layout requirement
// is about a view being laid out relative to the screen.  Other times, a layout requirement is about a view being laid out relative to another view.  This way, we can ignore the
// distinction, and write the test in terms of how two bounds, translated to common coordinate system, relate to each other.

public enum ViewOrScreen {
    case view(UIView)
    case screen(UIScreen)
    public var bounds : CGRect {
        switch self {
        case .view(let v): return v.bounds
        case .screen(let s): return s.coordinateSpace.bounds
        }
    }
}

public extension UIView {
    func convert(_ point: CGPoint, to vos: ViewOrScreen) -> CGPoint {
        switch vos {
        case .view(let v): return self.convert(point, to:v)
        case .screen(let s): return self.convert(point, to:s.coordinateSpace)
        }
    }
    func convert(_ point: CGPoint, from vos: ViewOrScreen) -> CGPoint {
        switch vos {
        case .view(let v): return self.convert(point, from:v)
        case .screen(let s): return self.convert(point, from:s.coordinateSpace)
        }
    }
}
