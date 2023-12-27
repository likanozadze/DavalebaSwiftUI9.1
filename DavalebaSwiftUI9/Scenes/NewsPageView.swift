//
//  NewsPageView.swift
//  DavalebaSwiftUI9
//
//  Created by Lika Nozadze on 12/27/23.
//

import SwiftUI

struct NewsPageView: View {
    
    @StateObject var viewModel: NewsPageViewModel
    @Environment(\.sizeCategory) var sizeCategory
    
    // MARK: - Body
    var body: some View {
        
        VStack {
            
            UITableViewRepresentableView(data: viewModel.articles)
        }
        .minimumScaleFactor(sizeCategory.customMinScaleFactor)
        .onAppear {
            viewModel.fetchNews()
            
        }
    }
}

extension ContentSizeCategory {
    var customMinScaleFactor: CGFloat {
        switch self {
        case .extraSmall, .small, .medium:
            return 1.0
        case .large, .extraLarge, .extraExtraLarge:
            return 0.8
        default:
            return 0.6
       
        }
    }
}


#Preview {
    NewsPageView(viewModel: NewsPageViewModel())
}


