//
//  QuestionCard.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 8/21/26.
//
// TODO: fix this file using ChatGPT conversation
import SwiftUI

struct QuestionCard: View {
    var question: String
    var answers: [String]
    var answerSelected: (String) -> Void
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(question)
                .font(.title3)
            
            ForEach(answers, id: \.self) { answer in
                Button {
                    answerSelected(answer)
                } label: {
                    HStack {
                        Text(answer)
                            .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.tint, lineWidth: 4)
                    )
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
        )
    }
}

#Preview {
    Background {
        QuestionCard(
            question: "How often do you usually visit doctors or other healthcare providers in a typical year?",
            answers: ["Rarely (1-2 visits)", "Occasionally (3-5 visits)", "Often (6-10 visits)", "Very often (10+ visits or ongoing treatment)"],
            answerSelected: { _ in }
        )
    }
}
