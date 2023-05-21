//
//  NaturalSciencesView.swift
//  AggiePal
//
//  Created by Mohamed Ali Boutaleb on 5/20/23.
//

import SwiftUI

struct NaturalSciencesView: View {
    var body: some View {
        List {
            Section {
                Text("In Progress")
                    .bold()
                    .listRowBackground(Color.blue.opacity(0.15))
                    .foregroundColor(.blue)
            }
            Section(header: Text("Natural Sciences & Mathematics")) {
                RequirementCell(title: "Minimum 90 Units Required", status: .inProgress, value: "90.5/90")

                DisclosureGroup {
                    Group {
                        RequirementCell(title: "ECS 036A", status: .complete, value: "6 units")
                        RequirementCell(title: "ECS 036B", status: .complete, value: "6 units")
                        RequirementCell(title: "ECS 036C", status: .complete, value: "6 units")
                        RequirementCell(title: "ECS 050", status: .complete, value: "6 units")
                        RequirementCell(title: "ECS 122A", status: .complete, value: "4 units")
                        RequirementCell(title: "ECS 122B", status: .inProgress, value: "4 units")
                        RequirementCell(title: "ECS 154A", status: .complete, value: "4 units")
                        RequirementCell(title: "ECS 170", status: .inProgress, value: "4 units")
                        RequirementCell(title: "ECS 189L", status: .inProgress, value: "4 units")
                        RequirementCell(title: "MAT 021A", status: .complete, value: "7.5 units")
                    }
                    Group {
                        RequirementCell(title: "MAT 021B", status: .complete, value: "7.5 units")
                        RequirementCell(title: "MAT 021C", status: .complete, value: "3.5 units")
                        RequirementCell(title: "MAT 021D", status: .complete, value: "4 units")
                        RequirementCell(title: "MAT 022A", status: .complete, value: "4.4 units")
                        RequirementCell(title: "MAT 022B", status: .complete, value: "7.5 units")
                        RequirementCell(title: "PHY 009D", status: .complete, value: "6 units")
                        RequirementCell(title: "PHY TR1", status: .complete, value: "6 units")
                    }
                } label: {
                    RequirementCell(title: "Natural Sciences & Mathematics", status: .inProgress, value: "")
                }
            }
        }
        .navigationTitle("Natural Sciences & Mathematics")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct NaturalSciencesView_Previews: PreviewProvider {
    static var previews: some View {
        NaturalSciencesView()
    }
}
