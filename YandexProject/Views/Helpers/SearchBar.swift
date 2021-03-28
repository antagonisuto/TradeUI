import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    @State private var isEditing = false
        
    var body: some View {
        HStack {
            
            TextField("Find company or ticker", text: $text)
                .padding(15)
                .padding(.horizontal, 35)
                //.background(Color(.systemGray6))
                .cornerRadius(10)
                //.border(Color.gray, width: 2)
                .overlay(
                    HStack {
                        Image("Search")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 15)
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                                
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
            .overlay(RoundedRectangle(cornerRadius: 30)
                .stroke(Color.black, lineWidth: 1))
                .onTapGesture {
                    self.isEditing = true
                }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
