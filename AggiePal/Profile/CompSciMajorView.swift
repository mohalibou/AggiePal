//
//  CompSciMajorView.swift
//  AggiePal
//
//  Created by Mohamed Ali Boutaleb on 5/20/23.
//

import SwiftUI

struct CompSciMajorView: View {
    var body: some View {
        List {
            Section {
                Text("Incomplete")
                    .bold()
                    .listRowBackground(Color.red.opacity(0.15))
                    .foregroundColor(.red)
            }
            Section {
                RequirementCell(title: "100-106 Units Required", status: .incomplete, value: "87/100")
                RequirementCell(title: "2.0 Major GPA", status: .complete, value: "3.666/4.0")
                RequirementCell(title: "Upper Div 2.0 Major GPA", status: .complete, value: "3.666/4.0")
                RequirementCell(title: "18 Upper Div Units Taken in Residence", status: .inProgress, value: "")
            }
            
            Section(header: Text("Preparatory Subject Matter")) {
                DisclosureGroup {
                    RequirementCell(title: "MAT 021A", status: .complete, value: "4 Units")
                    RequirementCell(title: "MAT 021B", status: .complete, value: "4 Units")
                    RequirementCell(title: "MAT 021C", status: .complete, value: "4 Units")
                } label: {
                    RequirementCell(title: "Calculus", status: .complete, value: "")
                }
                DisclosureGroup {
                    RequirementCell(title: "MAT 022A", status: .complete, value: "3 Units")
                } label: {
                    RequirementCell(title: "Linear Algebra", status: .complete, value: "")
                }
                DisclosureGroup {
                    RequirementCell(title: "ECS 020", status: .complete, value: "4 Units")
                } label: {
                    RequirementCell(title: "Discrete Math", status: .complete, value: "")
                }
                DisclosureGroup {
                    RequirementCell(title: "ECS 036A", status: .complete, value: "4 Units")
                    RequirementCell(title: "ECS 036B", status: .complete, value: "4 Units")
                    RequirementCell(title: "ECS 036C", status: .complete, value: "4 Units")
                    RequirementCell(title: "ECS 050", status: .complete, value: "4 Units")
                } label: {
                    RequirementCell(title: "Lower Division Programming", status: .complete, value: "")
                }
                DisclosureGroup {
                    RequirementCell(title: "PHY 9A", status: .complete, value: "4 Units")
                    RequirementCell(title: "PHY 9B", status: .complete, value: "4 Units")
                    RequirementCell(title: "PHY 9C", status: .complete, value: "4 Units")
                } label: {
                    RequirementCell(title: "Science", status: .complete, value: "")
                }
            }
            
            Section(header: Text("Depth Subject Matter")) {
                DisclosureGroup {
                    RequirementCell(title: "ECS 122A", status: .complete, value: "4 Units")
                } label: {
                    RequirementCell(title: "Algorithm Design and Analysis", status: .complete, value: "")
                }
                
                DisclosureGroup {
                    RequirementCell(title: "ECS 122B", status: .inProgress, value: "4 Units")
                } label: {
                    RequirementCell(title: "Theory of Computation or Algorithms", status: .inProgress, value: "")
                }
                
                DisclosureGroup {
                    RequirementCell(title: "Still Need: ECS 140A", status: .incomplete, value: "")
                } label: {
                    RequirementCell(title: "Programming Languages", status: .incomplete, value: "")
                }
                
                DisclosureGroup {
                    RequirementCell(title: "Still Need: ECS 150", status: .incomplete, value: "")
                } label: {
                    RequirementCell(title: "Operating Systems", status: .incomplete, value: "")
                }
                
                DisclosureGroup {
                    RequirementCell(title: "ECS 154A", status: .complete, value: "4 Units")
                } label: {
                    RequirementCell(title: "Computer Architecture", status: .complete, value: "")
                }
                
                DisclosureGroup {
                    RequirementCell(title: "Still Need: ECS 132 or MAT 135A or STA 131A", status: .incomplete, value: "")
                } label: {
                    RequirementCell(title: "Probability", status: .incomplete, value: "")
                }
            }
            
            Section(header: Text("Computer Science Electives")) {
                
                RequirementCell(title: "Complete 7 Elective Classes", status: .incomplete, value: "")
                DisclosureGroup {
                    RequirementCell(title: "ECS 122B", status: .inProgress, value: "4 Units")
                    RequirementCell(title: "ECS 170", status: .inProgress, value: "4 Units")
                    RequirementCell(title: "ECS 189", status: .inProgress, value: "4 Units")
                } label: {
                    RequirementCell(title: "Minimum 4 ECS Classes", status: .incomplete, value: "")
                }
                
                DisclosureGroup {
                    RequirementCell(title: "Still Need: 1 Qualifying MAT or STA Class", status: .incomplete, value: "")
                } label: {
                    RequirementCell(title: "Minimum 1 MAT or STA Class", status: .incomplete, value: "")
                }
                
                DisclosureGroup {
                    RequirementCell(title: "STS 115", status: .complete, value: "4 Units")
                } label: {
                    RequirementCell(title: "Other Elective Classes", status: .unnecessary, value: "")
                }
            }
        }
        .navigationTitle("Major in Computer Science")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CompSciMajorView_Previews: PreviewProvider {
    static var previews: some View {
        CompSciMajorView()
    }
}
