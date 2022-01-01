//
//  ProgressBar.swift
//  Trivia
//
//  Created by Abhishek Agarwal on 25/12/21.
//

import SwiftUI

struct ProgressBar: View {
    let progress: CGFloat
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.gray)
                .cornerRadius(40)
                .frame(width: 360, height: 10)

            Rectangle()
                .foregroundColor(Color.yellow)
                .cornerRadius(40)
                .padding(.horizontal, 2)
                .frame(width: progress, height: 6)
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 0)
    }
}
