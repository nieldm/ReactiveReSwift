import ReactiveReSwift
import Foundation

/*
 The docs says that you can do

 ```let appReducer = Reducer(authenticationReducer, bookmarksReducer, repositoriesReducer)

 but the library doesn't support it "It's A Trap!"
 */
struct ReducerStack<ObservableProperty: ObservablePropertyType> {

    typealias StoreReducer = Reducer<ObservableProperty.ValueType>

    var reducer: Reducer<ObservableProperty.ValueType>

    public init(_ reducers: StoreReducer...) {
        self.reducer = { action, state in
            return reducers.reduce(into: state, { $0 = $1(action, $0) })
        }
    }
}
