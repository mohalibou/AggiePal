//
//  TeacherView.swift
//  AggiePal
//
//  Created by Mohamed Ali Boutaleb on 5/20/23.
//

import SwiftUI
import Charts

struct TeacherView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var isShowingReview = false
    @State private var selection: Review? = nil
    
    var body: some View {
        List {
            Section {
                VStack {
                    Image("stevens")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 120)
                    HStack(spacing: 32) {
                        VStack {
                            Text("5/5")
                                .bold()
                            Text("Quality")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(Color.green.opacity(0.25))
                        .cornerRadius(8)
                        VStack {
                            Text("92%")
                                .bold()
                            Text("Would Take Again")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                                .minimumScaleFactor(0.1)
                        }
                        VStack {
                            Text("3.3")
                                .bold()
                            Text("Difficulty")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .listRowBackground(Color(colorScheme == .light ? UIColor.secondarySystemBackground : .black))
            }
            Section(header: Text("Rating Distribution").font(.title2).foregroundColor(.primary).bold().textCase(nil)) {
                Chart {
                    ForEach(data) { score in
                        BarMark(x: .value("Count", score.count),
                                y: .value("Score", score.score))
                                    .annotation(position: .trailing) {
                                        Text("\(score.count)")
                                            .foregroundColor(Color.gray)
                                            .font(.system(size: 12, weight: .bold))
                                    }
                    }
                }
                .frame(height: 250)
                .chartXAxis(.hidden)
            }
            
            Section(header: Text("Reviews").font(.title2).foregroundColor(.primary).bold().textCase(nil)) {
                ForEach(RMP.stevensReviews) { review in
                    Button {
                        selection = review
                    } label: {
                        ReviewView(review: review)
                    }
                    .buttonStyle(.plain)
                    .sheet(item: $selection) {
                        FullReviewView(review: $0)
                    }
                }
            }
        }
        .navigationTitle("Kristian Stevens")
    }
}

struct ReviewView: View {
    
    var review: Review
    
    var qualityColor: Color {
        switch(review.quality) {
        case 5:
            return .green
        case 4:
            return .green
        case 3:
            return .yellow
        case 2:
            return .red
        case 1:
            return .red
        default:
            return .white
        }
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            VStack {
                Text("Quality")
                Text("\(review.quality).0")
                    .font(.custom("", size: 24))
                    .bold()
                    .padding(12)
                    .background(qualityColor.opacity(0.25))
                    .cornerRadius(8)
                Text("Difficulty")
                Text("\(review.difficulty).0")
                    .font(.custom("", size: 24))
                    .bold()
                    .padding(12)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(8)
            }
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(review.course)
                        .font(.title3)
                        .bold()
                    Spacer()
                    Text(review.date.formatted(.dateTime.month().day().year()))
                }
                Text(review.review)
                    .lineLimit(5)
                Text("Tap to see more...")
                    .foregroundColor(.secondary)
                    .underline()
                    .font(.subheadline)
            }
        }
    }
}

struct FullReviewView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var review: Review
    
    var qualityColor: Color {
        switch(review.quality) {
        case 5:
            return .green
        case 4:
            return .green
        case 3:
            return .yellow
        case 2:
            return .red
        case 1:
            return .red
        default:
            return .white
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack(alignment: .top, spacing: 16) {
                        VStack {
                            Text("Quality")
                            Text("\(review.quality).0")
                                .font(.custom("", size: 24))
                                .bold()
                                .padding(12)
                                .background(qualityColor.opacity(0.25))
                                .cornerRadius(8)
                            Text("Difficulty")
                            Text("\(review.difficulty).0")
                                .font(.custom("", size: 24))
                                .bold()
                                .padding(12)
                                .background(Color.gray.opacity(0.25))
                                .cornerRadius(8)
                        }
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text(review.course)
                                    .font(.title3)
                                    .bold()
                                Spacer()
                                Text(review.date.formatted(.dateTime.month().day().year()))
                            }
                            Text("For Credit: **\(review.forCredit ? "Yes" : "No")**")
                            Text("Attendance: **\(review.attendance ? "Mandatory" : "Not Mandatory")**")
                            Text("Would Take Again: **\(review.wouldTakeAgain ? "Yes" : "No")**")
                            Text("Grade: **\(review.grade)**")
                            Text("Textbook: **\(review.textbook ? "Yes" : "N/A")**")
                        }
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(review.tags, id: \.self) { tag in
                                ZStack {
                                    Capsule()
                                        .foregroundColor(.gray)
                                    Text(tag)
                                        .bold()
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 8)
                                }
                                
                            }
                        }
                        
                    }
                    .padding(.vertical, 8)
                    
                    Text(review.review)
                    HStack(spacing: 24) {
                        Spacer()
                        HStack {
                            Image(systemName: "hand.thumbsup.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("\(review.upvotes)")
                        }
                        HStack {
                            Image(systemName: "hand.thumbsdown.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("\(review.downvotes)")
                        }
                        
                        
                    }
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
            .navigationTitle("Review")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TeacherView_Previews: PreviewProvider {
    static var previews: some View {
        TeacherView()
    }
}

struct Rating: Identifiable {
    var id = UUID()
    var score: String
    var count: Int
    
}

var data: [Rating] = [
    Rating(score: "Awesome 5", count: 50),
    Rating(score: "Great 4", count: 11),
    Rating(score: "Good 3", count: 3),
    Rating(score: "OK 2", count: 3),
    Rating(score: "Awful 1", count: 1)
]
