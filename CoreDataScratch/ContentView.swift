//
//  ContentView.swift
//  CoreDataScratch
//
//  Created by Mehdi on 2024-02-12.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PersonViewModel()
    
    @State var name: String = ""
    @State var age: String = ""
    
    var body: some View {
        NavigationView{
            VStack {
                TextField("name", text: $name)
                    .padding()
                
                TextField("age", text: $age)
                    .padding()
                
                Button("add person"){
                    addPerson()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(20)
                
                List{
                    ForEach(viewModel.persons){ entity in
                        VStack{
                            NavigationLink {
                                EditPerson(entity: entity, viewModel: viewModel)
//                                Text(entity.name ?? "no name")
//                                Text(String(entity.age))
                            } label: {
                                Text(entity.name ?? "no name")
                            }
                            
                            Text("Update")
                                .onTapGesture {
                                    viewModel.updatePerson(entity: entity, newName: name, newAge: Int(age) ?? 0)
                                }
                        }
                        .padding()
                        .background(Color.pink)
                        .cornerRadius(10)
                    }
                    
                    
//                    .onDelete(perform: { indexSet in
//                        viewModel.deletePerson(indexSet: indexSet)
//                    })
                    
                    
                }
                
            }
            .padding()
            
        }
        
    }
    
    func addPerson(){
        if name.isEmpty{
            return
        }
        if age.isEmpty{
            return
        }
        viewModel.addPerson(name: name, age: Int(age) ?? 0)
        age = ""
        name = ""
    }
}

#Preview {
    ContentView()
}
