//
//  DataListView.swift
//  MokeyDataList
//
//  Created by catalina lozano on 29/08/23.
//

import SwiftUI

struct DataListView: View {
    @StateObject var vm = ListaVM()
    
    var body: some View {
        Text(vm.msgs)
        
    }
}

struct DataListView_Previews: PreviewProvider {
    static var previews: some View {
        DataListView()
    }
}
