import SwiftUI

struct CrossclimbView: View {
    
    @StateObject var viewModel = CrosslimbViewViewModel()
    
    var body: some View {
        VStack {

            ForEach(0..<5, id: \.self) { currentRow in
                CrossclimbRow(viewModel: viewModel, currentRow: currentRow)
                    .background(currentRow == viewModel.activeRowIndex ? .brandPrimary.opacity(0.5) : .black.opacity(0.05))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .onTapGesture {
                        withAnimation(.smooth) {
                            viewModel.changeActieRow(row: currentRow)
                        }
                    }
            }
            
        }.padding(.horizontal, 42)
    }
}

#Preview {
    CrossclimbView()
}
