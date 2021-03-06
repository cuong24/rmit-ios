//
//  CircleImage.swift
//  Assignment1
//
//  Created by Cuong Nguyen Quoc on 17/07/2022.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("Cat-1")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
