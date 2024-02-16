
import SwiftUI

struct ContentView: View {
    @State var tabIndex = 0

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                VStack(alignment: .leading, spacing: 0.0) {
                    VStack {
                        Text("可処分所得の可視化")
                          .foregroundColor(.black)
                          .font(.system(size: 20.0, weight: .bold))
                          .padding(.horizontal, 20)
                          .padding(.vertical, 15)
                    }
                    VStack(alignment: .leading) {
                        CustomTopTabBar(tabIndex: $tabIndex)
                        if tabIndex == 0 {
                            SelectedMonthView(index: 0, lblmonth: "2023年10月")
                        }
                        else if tabIndex == 1 {
                            SelectedMonthView(index: 1, lblmonth: "2023年11月")
                        }
                        else {
                            SelectedMonthView(index: 2, lblmonth: "2023年12月")
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    .background(Color.white)
                }
                bottomView()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
            .background(Color(red: 0.968, green: 0.973, blue: 0.981))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BottomButtonTab1: View {
    let text: String
    @Binding var isSelected: Bool
    let icon: String
        
    var body: some View {
        VStack{
            Image(icon)
            Text(text)
                .foregroundColor(isSelected ? darkPurple : Color.init(red: 165.0/255.0, green: 165.0/255.0, blue: 165.0/255.0))
                .fontWeight(.bold)
                .font(.custom("SF Pro Display", size: 14))
        }
        .padding(12)
        .background(isSelected ? lightPurple: .white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isSelected ? darkPurple : .gray, lineWidth: 1)
        )
        
    }
}


struct BottomButtonTabBar1: View {
    @Binding var tabIndex: Int

    var body: some View {
        HStack {
            BottomButtonTab1(text: "必要不可欠", isSelected: .constant(tabIndex == 0), icon: "grayhexagon" )
                .onTapGesture { onButtonTapped(index: 0) }.frame(maxWidth: .infinity)

            BottomButtonTab1(text: "置を換え可能", isSelected: .constant(tabIndex == 1), icon: "grayminimize" )
                .onTapGesture { onButtonTapped(index: 1) }.frame(maxWidth: .infinity)

            BottomButtonTab1(text: "趣味自由用途", isSelected: .constant(tabIndex == 2), icon: "graywheel" )
                .onTapGesture { onButtonTapped(index: 2) }.frame(maxWidth: .infinity)
        }
    }
    
    private func onButtonTapped(index: Int) {
        withAnimation { tabIndex = index }
    }
}

struct btmNestedView: View {
    let iconName: String
    let title: String
    
    var body: some View {
        VStack{
            Image(iconName)
            Text(title)
                .foregroundColor(Color.init(red: 165.0/255.0, green: 165.0/255.0, blue: 165.0/255.0))
                .fontWeight(.bold)
                .font(.custom("SF Pro Display", size: 14))
        }
        .padding(12)
        .background(.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray, lineWidth: 1)
        )

    }
}

struct bottomView: View {
    @State private var selectedSegment = 0
    @State var btntabIndex = 0
    @State var icon = ""
    @State var btntabIndex1 = 0
    var body: some View {
        VStack {
            VStack {
                BottomButtonTabBar1(tabIndex: $btntabIndex1)
            }
        }
        .padding(10)
        
        VStack {
            VStack {
                BottomButtonTabBar(tabIndex: $btntabIndex, icon: $icon)
            }
            .padding(.vertical, 6)
            .background(.white)
            .cornerRadius(30)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 20)
        
        HStack {
                Image("icon")
                Text("分類詳細を再度見る")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, opacity: 0.5))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.white, lineWidth: 1)
                    )
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 20)
        .background(darkBlue)
        .cornerRadius(10)
            
    }
}
