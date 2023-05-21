//
//  RequirementCell.swift
//  AggiePal
//
//  Created by Mohamed Ali Boutaleb on 5/20/23.
//

import SwiftUI

struct RequirementCell: View {
    
    var title: String
    var status: Progress
    var value: String
    var imageColor: Color {
        switch status {
        case .complete:
            return .green
        case .inProgress:
            return .blue
        case .incomplete:
            return .red
        case .seeAdvisor:
            return .yellow
        case .unnecessary:
            return .gray
        }
    }
    
    var systemImage: String {
        switch status {
        case .complete:
            return "checkmark.circle.fill"
        case .inProgress:
            return "circle.lefthalf.fill"
        case .incomplete:
            return "xmark.circle.fill"
        case .seeAdvisor:
            return "exclamationmark.circle.fill"
        case .unnecessary:
            return "minus.circle.fill"
        }
    }
    
    var body: some View {
        Label {
            LabeledContent(title, value: value)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
        } icon: {
            Image(systemName: systemImage)
                .foregroundColor(imageColor)
        }
    }
}


struct RequirementCell_Previews: PreviewProvider {
    static var previews: some View {
        List {
            RequirementCell(title: "Hello", status: .complete, value: "Nah")
            RequirementCell(title: "Hello", status: .complete, value: "Nah")
            RequirementCell(title: "Hello", status: .complete, value: "Nah")
        }
        
    }
}
