//
//  HomeScreen.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/15/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm: HomeVM
    @EnvironmentObject private var appRouter: AppRouter
    
    @State
    private var showBottomSheet: Bool = false
    @State
    var title: String = ""
    @State
    var date: Date = Date()
    @State
    var tagName: String = "기본"
    @State
    var tagColor: Color = Color.red
    
    init(with diContainer: DIContainer) {
        self._vm = StateObject(wrappedValue: diContainer.makeHomeVM())
    }
    
    var body: some View {
        VStack {
            if vm.state.isLoading {
                ProgressView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            Task {
                                await vm.send(.onAppear)
                            }
                        }
                    }
            } else {
                // 헤더
                VStack {
                    HStack(alignment: .center) {
                        Text("My D-Day")
                            .font(.title)
                            .fontWeight(.black)
                        Spacer(minLength: 0)
                        Button(action: {
                            showBottomSheet = true
                        }) {
                            Image(systemName: "plus")
                                .frame(width: 10, height: 10)
                                .fontWeight(.black)
                                .padding(12)
                                .background(Color.red)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                    }
                    .padding()
                    let datas = vm.state.dDays
                    
                    if (datas.isEmpty) {
                        VStack {
                            Spacer(minLength: 0)
                            Text("저장된 디데이가 없어요")
                            Spacer(minLength: 0)
                        }
                    } else {
                        ScrollView {
                            VStack(spacing: 12) {
                                ForEach(datas, id: \.id) { data in
                                    DDayCardView(dDay: data)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
                .sheet(isPresented: $showBottomSheet) {
                    
                    VStack(spacing: 0) {
                        HStack(alignment: .center) {
                            Spacer(minLength: 0)
                            Button(action: {
                                showBottomSheet.toggle()
                                title = ""
                                date = Date()
                                tagName = "기본"
                                tagColor = .red
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .fontWeight(.black)
                                    .background(.white)
                                    .foregroundColor(.red)
                                    .clipShape(Circle())
                            }
                            .padding()
                        }
                        
                        Form {
                            LabeledContent("제목") {
                                TextField("", text: $title)
                                    .labelsHidden()
                                    .autocorrectionDisabled()
                            }
                            
                            DatePicker("날짜", selection: $date, displayedComponents: [.date])
                            
                            LabeledContent("태그") {
                                TextField("태그를 입력해주세요", text: $tagName)
                                    .labelsHidden()
                                    .autocorrectionDisabled()
                            }
                            
                            ColorPicker("색상", selection: $tagColor)
                        }
                        
                        Spacer(minLength: 0)
                        Button(action: {
                            Task {
                                await self.vm.send(.append(DDay(
                                    id: UUID.init(),
                                    title: title,
                                    date: date,
                                    tag: DTag(
                                        id: UUID.init(),
                                        name: tagName,
                                        colorHex: tagColor.toHex()
                                    )
                                )))
                                
                                title = ""
                                date = Date()
                                tagName = "기본"
                                tagColor = .red
                                
                            }
                            showBottomSheet.toggle()
                        }) {
                            Text("SAVE")
                                .fontWeight(.black)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical)
                        }
                        .background(Color.red)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .padding()
                    }
                    .background(Color(uiColor: .systemGroupedBackground))
                }
            }
        }
    }
}

struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    HomeView(with: .preview)
}
