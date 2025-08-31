//
//  CustomeTabBar.swift
//  CustomeTabBar
//
//  Created by Boray Chen on 2025/6/28.
//

import SwiftUI

struct CustomeTabBar: View {
    
    @Binding var currentTab: Tab
    
    var backgroundColors = [Color.purple, Color.blue, Color.pink]
    
    var gradientCircle = [Color.cyan, Color.cyan.opacity(0.1), Color.cyan]
    
    var body: some View {
        // calculate the size of current element
        GeometryReader { geometry in
            let width = geometry.size.width
            
            HStack(spacing: 0.0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    
                    Button {
                        withAnimation(.easeInOut) {
                            currentTab = tab
                        }
                    } label: {
                        Image(systemName: tab.rawValue)
                            .renderingMode(.template)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .offset(y: currentTab == tab ? -17 : 0)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .background(alignment: .leading) {
                Circle()
                    .fill(.ultraThinMaterial)
                    .frame(width: 80, height: 80)
                    .shadow(color: .black.opacity(0.25),
                            radius: 20,
                             x: 10,
                            y: 10)
                    .offset(x: indicatorOffset(width: width), y: -17)
                    .overlay {
                        Circle()
                            .trim(from: 0, to: CGFloat(0.5))
                            .stroke(LinearGradient(colors: gradientCircle,
                                                   startPoint: .top,
                                                   endPoint: .bottom))
                            .rotationEffect(.degrees(135))
                            .frame(width: 80, height: 80)
                            .offset(x: indicatorOffset(width: width), y: -17)
                    }
                
            }
        }
        .frame(height: 24)
        .padding(.top, 30)
        .background(.ultraThinMaterial)
        .background(LinearGradient(colors: backgroundColors,
                                   startPoint: .leading,
                                   endPoint: .trailing))
        
    }
    
    func indicatorOffset(width: CGFloat) -> CGFloat {
        let index = CGFloat(getIndex())

        if index == 0 {
            return 10
        }
                
        let buttonWidth: CGFloat = (width / CGFloat(Tab.allCases.count))
        
        return index * buttonWidth + buttonWidth / 2 - 40 // subtract radius (80/2)
    }
    
    func getIndex() -> Int {
        switch currentTab {
        case .home:
            return 0
        case .favorite:
            return 1
        case .search:
            return 2
        case .profile:
            return 3
        }
    }
}

#Preview {
    ContentView()
}
