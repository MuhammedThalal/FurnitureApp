//
//  Home.swift
//  FurnitureShop App
//
//  Created by muhammed thalal on 06/08/22.
//

import SwiftUI

struct Home: View {
    @State private var selectedIndex: Int = 0
    private let categories = ["All","Chair","Lamp","Cofa","Kitchen","Table"]
    var body: some View {
        NavigationView {
            ZStack{
                Color("Bg")
                    .ignoresSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading){
                        AppbarView()
                        
                        TagLineView()
                            .padding()
                        
                        SearchAndScanView()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(0 ..< categories.count) { i in
                                    CategoriesView(isActive: i == selectedIndex, text: categories[i])
                                        .onTapGesture {
                                            selectedIndex = i
                                        }
                                }
                            }
                            .padding()
                        }
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack {
                                ForEach(0 ..< 4) { Index in
                             NavigationLink(destination: DetailScreen(),
                                            label: {
                                 ProductcardView(image: Image("chair_\(Index + 1)"),size: 210)
                                     })
                                        .navigationBarHidden(true)
                                        .foregroundColor(.blue)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        Text("Best")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                            .padding(.top)
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack {
                                ForEach(0 ..< 4) { Index in
                                    ProductcardView(image: Image("chair_\(Index + 1)"), size: 180)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                    
                    }
                }
                HStack{
                    BottomNavigationBar(image: Image("Home")){}
                    BottomNavigationBar(image: Image("fav")){}
                    BottomNavigationBar(image: Image("shop")){}
                    BottomNavigationBar(image: Image("User")){}

                }
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .padding(.horizontal)
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
      }
 }

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
.previewInterfaceOrientation(.portrait)
    }
}


struct AppbarView: View {
    var body: some View {
        HStack{
            Button(action: {}) {
                Image("menu")
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10.0)
            }
            Spacer()
            
            Button(action: {}) {
                Image(uiImage: #imageLiteral(resourceName: "Profile"))
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Fine The \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
        + Text("Furniture!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundColor(Color("Primary"))
    }
}

struct SearchAndScanView: View {
    @State private var search: String = ""
    var body: some View {
        HStack{
            HStack {
                Image("Search")
                    .padding(.trailing,8)
                TextField("Search Furniture",text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing)
            
            Button(action:{}) {
                Image("Scan")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoriesView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            Text(text)
                .font(.system(size: 17))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary"): Color.black.opacity(0.5))
            
            if (isActive){
                Color("Primary")
                .frame(width: 15, height: 2)
                .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductcardView: View {
    let image: Image
    let size: CGFloat
    var body: some View {
        VStack{
            image
                .resizable()
                .frame(width: 210, height: 200 * (size/210))
                .cornerRadius(20.0)
            
            Text("Luxuary Swedian chair")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack (spacing: 2){
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image("star")
                }
                Spacer()
                
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .cornerRadius(20.0)
        .padding()
        .background(Color.white)
    }
}

struct BottomNavigationBar: View {
    let image: Image
    let action: ()-> Void
    var body: some View {
        Button(action: action, label:{
            image
                .frame(maxWidth: .infinity)
        })
    }
}
