import SwiftUI

struct CrossclimbRow: View {
    
    @ObservedObject var viewModel: CrosslimbViewViewModel
    @State var currentRow: Int
    @FocusState var focusedIndex: Int?
    @State private var guessedWord = Array(repeating: "", count: 4)
    
    var body: some View {
        HStack {
            ForEach(0..<4, id: \.self) { currentTextFieldIndex in
                CrossclimbTextField(
                    viewModel: viewModel,
                    text: $guessedWord[currentTextFieldIndex],
                    currentRow: $currentRow,
                    focusedIndex: $focusedIndex,
                    currentTextFieldIndex: currentTextFieldIndex)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 60)
    }
}

#Preview {
    CrossclimbRow(viewModel: CrosslimbViewViewModel(), currentRow: 0)
}
