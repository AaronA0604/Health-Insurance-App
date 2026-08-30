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
    var answers: [Answer]
    var answerSelected: (Answer) -> Void
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(question)
                .font(.title3)
            
            ForEach(answers, id: \.text) { answer in
                Button {
                    answerSelected(answer)
                } label: {
                    HStack {
                        Text(answer.text)
                            .padding()
                            .foregroundStyle(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.tint)
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
            question: Questions().questions[0].question,
            answers: Questions().questions[0].answers,
            answerSelected: { _ in }
        )
    }
}
