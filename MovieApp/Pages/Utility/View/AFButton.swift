//
//  AFButton.swift
//  MovieApp
//
//  Created by Kishan Soni on 12/07/25.
//

import SwiftUICore

struct AFButton: View {
    var title: String

    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

