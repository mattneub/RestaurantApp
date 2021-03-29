//
// Created by Daniel Coleman on 2/6/21.
//

import RestaurantAppLib
import UIKit

class RestaurantMenuListViewModelMock: NSObject, RestaurantMenuListViewModel {

    var items: [RestaurantMenuItem] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fatalError("Not Implemented")
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("Not Implemented")
    }
}
