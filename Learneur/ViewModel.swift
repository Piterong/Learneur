//
//  ViewModel.swift
//  Learneur
//
//  Created by Piter Wongso on 24/07/22.
//

import Foundation
import FirebaseFirestore
import FirebaseCore

class ViewModel : ObservableObject {
    @Published var list = [TechnicalLearningObjectives]()
    private var listenerRegistration: ListenerRegistration?
    let db = Firestore.firestore()
    
    func getData() {
        
        db.collection("TechLO").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map{ d in
                            self.db.collection("TechLO").document(d.documentID)
                                .addSnapshotListener { documentSnapshot, error in
                                  guard let document = documentSnapshot else {
                                    print("Error fetching document: \(error!)")
                                    return
                                  }
                                  guard let data = document.data() else {
                                    print("Document data was empty.")
                                    return
                                  }
                                  print("Current data: \(data)")
                                }
                            return TechnicalLearningObjectives(id: d.documentID,
                                                               code: d["Code"] as? String ?? "",
                                                               objective: d["Objective"] as? String ?? "",
                                                               challengeRecommendation: d["Challenge Recommendation"] as? String ?? "",
                                                               bookmarked: d["Bookmarked"] as? Bool ?? true,
                                                               completed: d["Completed"] as? Bool ?? false,
                                                               documentation: d["Documentation"] as? String ?? "",
                                                               coreKeyword: d["Core Keywords"] as? String ?? "",
                                                               electiveKeyword: d["Elective Keywords"] as? String ?? "",
                                                               goal: d["Goal"] as? String ?? "",
                                                               goalSN: d["Goal Short Name"] as? String ?? "")
                        }
                    }
                }
            }
        }
    }
    
    
    func toggleBookmark (lo : TechnicalLearningObjectives){
        let db = Firestore.firestore()
        db.collection("TechLO").document(lo.id).updateData(["Bookmarked":lo.bookmarked], completion: { error in
                if error == nil {
                    self.getData()
                }else{
                    self.getData()
                }
        })
//        do {
//            try db.collection("TechLO").document(lo.id).setData(["Bookmarked": lo.bookmarked],merge: true)
//            }
//            catch {
//              print(error)
//            }
    }
    func toggleCompleted (lo : TechnicalLearningObjectives){
        let db = Firestore.firestore()
        db.collection("TechLO").document(lo.id).updateData(["Completed":lo.completed], completion: { error in
                if error == nil {
                    self.getData()
                }else{
                    self.getData()
                }
        })
//        do {
//            try db.collection("TechLO").document(lo.id).setData(["Bookmarked": lo.bookmarked],merge: true)
//            }
//            catch {
//              print(error)
//            }
//}
    }
}
