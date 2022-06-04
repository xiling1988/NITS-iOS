//
//  IntentionsView.swift
//  NITS-iOS
//
//  Created by Emirates on 28/05/2022.
//

import SwiftUI

struct IntentionsView: View {
    @EnvironmentObject var intentions : IntentionsModel
    @State var isPickerOpen = false
    var body: some View {
        NavigationView {
            VStack{
                Form {
                    Section(header: Text("category")) {
                        HStack{
                            Text("Category")
                            Spacer()
                            Button {
                                isPickerOpen.toggle()
                            } label: {
                            HStack {
                                Text(intentions.catSelection)
                                Image(systemName: "chevron.right")
                            }
                            .font(.callout)
                            .foregroundColor(.secondary)
                            }}
                            if isPickerOpen {
                                Picker(selection: $intentions.catSelection) {
                                    ForEach(intentions.scenarios, id: \.self) {cat in
                                        Text(cat)
                                    }} label: {
                                        Text("test")
                                        }
                                        .pickerStyle(.wheel)
                                        .onTapGesture {
                                            isPickerOpen.toggle()
                                        }}}
                    Section(header: Text("description")) {
                        TextEditor(text: $intentions.description)
                            .frame(width: 300, height: 300)
                        }
                    Button {
                        print(intentions.catSelection)
                        print(intentions.description)
                    } label: {
                        Text("test")
                    }
                    Section(header: Text("press next tab to continue...")) {
                    }

                    
                }
                
            }.navigationTitle("Captain's Intentions")
        }.navigationViewStyle(.stack)
        }
    }


struct IntentionsView_Previews: PreviewProvider {
    static var previews: some View {
        IntentionsView()
            .environmentObject(IntentionsModel())
    }
}
