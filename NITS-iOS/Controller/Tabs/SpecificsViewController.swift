//
//  SpecificsView.swift
//  NITS-iOS
//
//  Created by Emirates on 28/05/2022.
//
import Combine
import SwiftUI

struct SpecificsView: View {
    @EnvironmentObject var timerManager : TimerManager
    @EnvironmentObject var specifics : SpecificsModel
    @EnvironmentObject var settings : SettingsModel
    @State var isSubmitted = false
    @FocusState var isInputActive : Bool
    
    var body: some View {
        NavigationView {
            VStack{
                Form {
                    Section(header: Text("\(timeFormatter(seconds: timerManager.secondsLeft))")
                        .font(.title2)) {}
                    Section(header: Text("Please Specify")) {
                        TextEditor(text: $specifics.description)
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
                        
                    }
                    Section(header: Text("submit data to obtain briefing")) {}
                    Section(header: Button {
                        isSubmitted.toggle()
                        print(specifics.description)
                    } label: {
                        Text("Submit Data")
                            .foregroundColor(.white)
                            .frame(width: 350, height: 150, alignment: .center)
                    }
                        .frame(width: 300, height: 55, alignment: .center)
                            
                        .background(.blue)
                        .cornerRadius(10)
                        .sheet(isPresented: $isSubmitted) {
                            BriefingSheet()
                            
                        }) {}
                    
                }
                .navigationTitle("Specific Instructions")
            }.navigationViewStyle(.stack)
            
        }.navigationViewStyle(.stack)
    }
        
struct SpecificsView_Previews: PreviewProvider {
    static var previews: some View {
        SpecificsView()
            .environmentObject(TimerManager())
            .environmentObject(SpecificsModel())
    }

}
}
