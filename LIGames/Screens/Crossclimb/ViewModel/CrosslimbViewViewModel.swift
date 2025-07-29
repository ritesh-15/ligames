import Foundation

final class CrosslimbViewViewModel: ObservableObject {
    
    @Published var activeRowIndex: Int = 0
    
    func changeActieRow(row: Int) {
        self.activeRowIndex = row
    }
}
