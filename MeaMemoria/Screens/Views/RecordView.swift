//
//  RecordView.swift
//  MeaMemoria
//
//  Created by Hassan Alkhafaji on 6/26/24.
//

import SwiftUI

struct RecordView: View {
    
    @State var isRecording = false
    
    @State private var showingAlert = false
    
    @StateObject var viewModel = RecordingListViewModel(dataService: AudioManager())
    
    @State var recordingFailed = false
    
    var body: some View {
        ZStack {
  
    
            HStack {
                Text("Record your message")
                    .foregroundStyle(Color("darkb"))
                Image(systemName: isRecording ? "pause.circle": "mic.circle")
                    .font(.system(size: 48))
                    .foregroundStyle(Color("darkb"))
                    .onTapGesture {
                        if isRecording == false {
                            do {
                                try viewModel.audioManager.startRecording()
                               
                            } catch {
                                print("The start recording function didnt work")
                                recordingFailed = true
                            }
                            withAnimation(.easeInOut(duration: 0.2)) {
                                isRecording.toggle()
                            }
                        } else {
                           viewModel.audioManager.stopRecording()
                            withAnimation(.easeInOut(duration: 0.2)) {
                                isRecording.toggle()
                            }
                            // MARK: try to find where you've saved the recording url and put it here
//                            let memory = MemoryModel(id: UUID(), imageName: vm.imageName, voiceRecording: vm.recordingViewModel.audioManager.)
                            
                        }
                    }//End onTap
                
                    .alert("Could not record", isPresented: $recordingFailed) {
                        Button("dismiss") {}
                    }
            }
            .font(.title3)
            .padding()
            .clipShape(Capsule())
            .background(Color("lighto"))
            .cornerRadius(12)
            .shadow(radius: 10, x: 0.0, y: 10)
        }
    }
}


#Preview {
    RecordView()
}
