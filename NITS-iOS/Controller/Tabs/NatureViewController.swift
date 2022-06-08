//
//  NatureView.swift
//  NITS-iOS
//
//  Created by Emirates on 28/05/2022.
//

import SwiftUI

struct NatureView: View {
    @EnvironmentObject var nature : NatureModel
    @EnvironmentObject var settings : SettingsModel
    @State var isPickerOpen = false
    @FocusState var isInputActive : Bool
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
                                Text(nature.catSelection)
                                Image(systemName: "chevron.right")
                            }
                            .font(.callout)
                            .foregroundColor(.secondary)
                            }}
                            if isPickerOpen {
                                Picker(selection: $nature.catSelection) {
                                    ForEach(nature.categories, id: \.self) {cat in
                                        Text(cat)
                                    }} label: {
                                        Text("test")
                                        }
                                        .pickerStyle(.wheel)
                                        .onTapGesture {
                                            isPickerOpen.toggle()
                                        }}}
                    Section(header: Text("description")) {
                        TextEditor(text: $nature.description)
                            .frame(width: 300, height: 300)
                            .focused($isInputActive)
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Spacer()
                                    
                                    Button("Done") {
                                        isInputActive = false
                                    }
                                }
                            }
                    Section(header: Text("press next tab to continue...")) {
                    }

                    
                }
                
            }.navigationTitle("Nature of Emergency")
        }.navigationViewStyle(.stack)
        }

    }


struct NatureView_Previews: PreviewProvider {
    static var previews: some View {
        NatureView()
            .environmentObject(NatureModel())
            .environmentObject(SettingsModel())
    }
}
}
