
import SwiftUI

struct BottomButtonTab: View {
    let text: String
    @Binding var isSelected: Bool
    let icon: String
    
    var body: some View {
        VStack{
            icon != "" ? Image(icon) : nil
            Text(text)
                .fontWeight(isSelected ? .heavy : .regular)
                .font(.custom("SF Pro Display", size: 14))
                .padding(10)
                .foregroundColor(isSelected ? Color.black : darkGrey)
                .background(isSelected ? Color.init(red: 243.0/255.0, green: 243.0/255.0, blue: 243.0/255.0): .white)
                .cornerRadius(isSelected ? 20: 0)
        }
        
    }
}


struct BottomButtonTabBar: View {
    @Binding var tabIndex: Int
    @Binding var icon: String

    var body: some View {
        HStack {
            BottomButtonTab(text: "必要不可欠", isSelected: .constant(tabIndex == 0), icon: icon )
                .onTapGesture { onButtonTapped(index: 0) }.frame(maxWidth: .infinity)

            BottomButtonTab(text: "置を換え可能", isSelected: .constant(tabIndex == 1), icon: icon )
                .onTapGesture { onButtonTapped(index: 1) }.frame(maxWidth: .infinity)

            BottomButtonTab(text: "趣味自由用途", isSelected: .constant(tabIndex == 2), icon: icon )
                .onTapGesture { onButtonTapped(index: 2) }.frame(maxWidth: .infinity)
        }
    }
    
    private func onButtonTapped(index: Int) {
        withAnimation { tabIndex = index }
    }
}

