//
// Created by Daniel Coleman on 2/26/21.
//

import RestaurantAppLib

class MenuItemCellBuilderMock : MenuItemCellBuilder {

    // This is what the guts of something like Mockito probably looks like.  Unfortunately (though personally I very much prefer these types of languages) Swift is so statically typed
    // it doesn't support the kind of dynamic swizzling needed to implement mocks generically.  The logic is the same everywhere we want to do this: we want to record every call to a
    // method, which really just means storing the parameters sent, then call some implementation we can inject from the outside.  It also helps to provide a convenience method to
    // reset everything
    public func cell(forItem item: RestaurantMenuItem) -> MenuItemCell {

        cellForItemCalls.append(CellForItemCall(item: item))
        return cellForItemImp(item)
    }

    public var cellForItemImp: (_ item: RestaurantMenuItem) -> MenuItemCell = { _ in MenuItemCellMock() }
    struct CellForItemCall { let item: RestaurantMenuItem }
    public var cellForItemCalls: [CellForItemCall] = []

    public func reset() {

        cellForItemCalls = []
        cellForItemImp = { _ in MenuItemCellMock() }
    }
}
