//
// Created by Daniel Coleman on 2/6/21.
//

import UIKit

// This interface gives us a common language to talk to objects that have a coordinateSpace, and bounds.  We use it in tests where we want to test layout.  Sometimes, a layout requirement
// is about a view being laid out relative to the screen.  Other times, a layout requirement is about a view being laid out relative to another view.  This way, we can ignore the
// distinction, and write the test in terms of how two bounds, translated to common coordinate system, relate to each other.
public protocol Bounded {

    var coordinateSpace: UICoordinateSpace { get }
    var bounds: CGRect { get }
}

extension UIScreen : Bounded { }
extension UIView : Bounded { }