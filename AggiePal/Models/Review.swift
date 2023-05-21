//
//  Review.swift
//  AggiePal
//
//  Created by Mohamed Ali Boutaleb on 5/20/23.
//

import Foundation

struct Review: Identifiable {
    var id = UUID()
    let course: String
    let date: Date
    let quality: Int
    let difficulty: Int
    let forCredit: Bool
    let attendance: Bool
    let wouldTakeAgain: Bool
    let grade: String
    let textbook: Bool
    let review: String
    let tags: [String]
    let upvotes: Int
    let downvotes: Int
}

struct RMP {
    static let stevensReviews: [Review] = [
        Review(course: "ECS032A",
               date: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 9))!,
               quality: 5, difficulty: 3, forCredit: true, attendance: false, wouldTakeAgain: true,
               grade: "A+", textbook: true,
               review: "The best you're gonna get. He is very caring and accommodates students. Everything on quizzes and homework is covered in lectures and the same with midterms and finals. Two homework and one test score get dropped, with all of it online. Lectures are recorded, and so are discussions. Never needed to attend class and got a 101%",
               tags: ["Amazing Lectures", "Inspirational", "Caring"], upvotes: 0, downvotes: 0),
    
        Review(course: "ECS032A",
               date: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 4))!,
               quality: 5, difficulty: 2, forCredit: true, attendance: false, wouldTakeAgain: true,
               grade: "A", textbook: true,
               review: "the professor is very nice, he explains material very great, I never learn Python before but his lectures helps me understand the Python like learning a new language. Honestly, take his class if you want to learn Python. Grade by 7 hws and coding style and 3 tests including finals, and quiz, but drop 2 lowest quiz, and lowest test get drop too!",
               tags: ["Lots of Homework", "Caring", "Respected"], upvotes: 1, downvotes: 0),
        
        Review(course: "ECS032A",
               date: Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 9))!,
               quality: 5, difficulty: 1, forCredit: true, attendance: false, wouldTakeAgain: true,
               grade: "A+", textbook: false,
               review: "This professor was amazing. The projects were clear cut and doable, and the exams were not difficult at all. I did not have any experience whatsoever in programming, but I never felt behind. Get Stevens if you can!",
               tags: ["Clear Grading Criteria", "Caring"], upvotes: 1, downvotes: 0),
        
        Review(course: "ECS032A",
               date: Calendar.current.date(from: DateComponents(year: 2022, month: 12, day: 7))!,
               quality: 5, difficulty: 2, forCredit: true, attendance: false, wouldTakeAgain: true,
               grade: "A+", textbook: true,
               review: "Great professor who clearly seems to care about his students and make a lot of time for them outside of class. There's many opportunities to boost your grade and lowest grades in each category are dropped, and lots of extra credit is awarded. Very fun class that gave me a great introduction to programming.",
               tags: ["Extra Credit", "Clear Grading Criteria", "Accessible Outside Class"], upvotes: 0, downvotes: 0),
        
        Review(course: "ECS32A",
               date: Calendar.current.date(from: DateComponents(year: 2022, month: 12, day: 2))!,
               quality: 5, difficulty: 2, forCredit: true, attendance: false, wouldTakeAgain: true,
               grade: "A+", textbook: true,
               review: "Amazing professor, I was a bit nervous about taking my first programming class, but he made it super simple and learnable, he makes the lectures interesting and I found his computer science jokes and references during lectures hilarious.100% recommend this professor if you are choosing who to take for ECS32A!",
               tags: ["Extra Credit", "Amazing Lectures", "Caring"], upvotes: 0, downvotes: 0),
        
        Review(course: "ECS032A",
               date: Calendar.current.date(from: DateComponents(year: 2022, month: 11, day: 9))!,
               quality: 5, difficulty: 3, forCredit: true, attendance: false, wouldTakeAgain: true,
               grade: "A-", textbook: false,
               review: "Prof Stevens is one of the best instructors for ecs. His lectures are clear an organized. Homework can get challenging but he is willing to help in his OH or after class. I learned a lot from this course and I wish he taught more of them",
               tags: ["Amazing Lectures", "Clear Grading Criteria", "Lots of Homework"], upvotes: 0, downvotes: 0),
        
        Review(course: "ECS032A",
               date: Calendar.current.date(from: DateComponents(year: 2022, month: 8, day: 18))!,
               quality: 5, difficulty: 1, forCredit: true, attendance: false, wouldTakeAgain: true,
               grade: "A+", textbook: false,
               review: "Super easy professor that actually cares about students learning. Easy A.",
               tags: ["Extra Credit", "Amazing Lectures", "Clear Grading Criteria"], upvotes: 0, downvotes: 0),
        
        Review(course: "ECS032A",
               date: Calendar.current.date(from: DateComponents(year: 2022, month: 8, day: 9))!,
               quality: 5, difficulty: 2, forCredit: true, attendance: false, wouldTakeAgain: true,
               grade: "A", textbook: true,
               review: "Great professor for an introductory class. Really lays a strong foundation for more advanced Python programming. Great class for online format.",
               tags: [], upvotes: 0, downvotes: 0),
        
        Review(course: "ECS032A",
               date: Calendar.current.date(from: DateComponents(year: 2022, month: 6, day: 22))!,
               quality: 5, difficulty: 2, forCredit: true, attendance: false, wouldTakeAgain: true,
               grade: "A", textbook: false,
               review: "Graded based o HW, exams, and extra credit. It is an easy A class if you put in some work. Recommended to people who never learned coding before. If you had learn before, you shall take ECS36 series. Btw the peer tutor/TA are super nice.",
               tags: [], upvotes: 1, downvotes: 0),
        
        Review(course: "ECS032A",
               date: Calendar.current.date(from: DateComponents(year: 2022, month: 6, day: 22))!,
               quality: 5, difficulty: 2, forCredit: true, attendance: false, wouldTakeAgain: true,
               grade: "A+", textbook: false,
               review: "If you work hard in this class, it is possible to get A. Graded based on homework, midterms, and extra credits.",
               tags: ["Extra Credit", "Lecture Heavy", "Accessible Outside Class"], upvotes: 0, downvotes: 0),
        
        Review(course: "ECS032A",
               date: Calendar.current.date(from: DateComponents(year: 2022, month: 6, day: 16))!,
               quality: 5, difficulty: 2, forCredit: true, attendance: false, wouldTakeAgain: true,
               grade: "A+", textbook: true,
               review: "He explains concepts and gives fair homework. Wanna learn some python? take him!",
               tags: ["Amazing Lectures", "Hilarious"], upvotes: 0, downvotes: 0),
        
        Review(course: "ECS032A",
               date: Calendar.current.date(from: DateComponents(year: 2022, month: 6, day: 14))!,
               quality: 5, difficulty: 2, forCredit: true, attendance: false, wouldTakeAgain: true,
               grade: "A+", textbook: false,
               review: "Awesome all around. Really chill class for CS and made everything fun and clear. Online format which was convenient and overall a good time.",
               tags: [], upvotes: 0, downvotes: 0),
        
        Review(course: "ECS032A",
               date: Calendar.current.date(from: DateComponents(year: 2022, month: 6, day: 13))!,
               quality: 5, difficulty: 5, forCredit: true, attendance: false, wouldTakeAgain: true,
               grade: "A", textbook: true,
               review: "I thought the material was difficult, but I really liked how it was organized and distilled in the slides with engaging examples. The office hours after every lecture were nice. I also liked how he demonstrated how to fix errors in his coding examples, it really helped.",
               tags: ["Amazing Lectures", "Accessible Outside Class"], upvotes: 0, downvotes: 0),
        
        Review(course: "ECS32A",
               date: Calendar.current.date(from: DateComponents(year: 2022, month: 6, day: 2))!,
               quality: 5, difficulty: 3, forCredit: true, attendance: false, wouldTakeAgain: true,
               grade: "A", textbook: true,
               review: "Amazing professor! Every lecture and assignment was incredibly clear and the material was easy to learn because of that. There are large homework assignments and short quizzes due weekly, but they are doable. Being able to drop the final saved me from burnout. Easy A and fun to learn. He makes sure everything is accessible too (lectures, code, etc)",
               tags: ["Amazing Lectures", "Clear Grading Criteria", "Lots of Homework"], upvotes: 0, downvotes: 0),
        
        Review(course: "ECS32A",
               date: Calendar.current.date(from: DateComponents(year: 2022, month: 6, day: 1))!,
               quality: 5, difficulty: 2, forCredit: true, attendance: false, wouldTakeAgain: true,
               grade: "A", textbook: true,
               review: "Took this as an online class. Stevens is a very sweet guy, the material is easy but he is approachable for help if needed. His class was organized and was easy to follow along.",
               tags: ["Caring", "Online Savvy"], upvotes: 0, downvotes: 0),
        
        Review(course: "ECS032A",
               date: Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 17))!,
               quality: 5, difficulty: 1, forCredit: true, attendance: false, wouldTakeAgain: true,
               grade: "A+", textbook: false,
               review: "Easiest intro class ever. STAY LATE AND CODE WILL SAVE YOU. Theres tutors to help you on any homework you need even if you find this class hard. Weekly assignments that can be easily done in 2 hours MAX. recorded lectures + slides + office hours. you will get an A whether you want it or not.",
               tags: ["Amazing Lectures", "Clear Grading Criteria"], upvotes: 0, downvotes: 0),
        
        Review(course: "ECS032A",
               date: Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 9))!,
               quality: 5, difficulty: 3, forCredit: true, attendance: false, wouldTakeAgain: true,
               grade: "A+", textbook: true,
               review: "W Teacher W Course. Not a terribly hard class but it can get overwhelming if you don't stay on top of all the lectures. Really try to understand all the concepts and if you don't ask questions. The TA's are also very helpful. If you do all that you're expected to do, you should get an A",
               tags: ["Amazing Lectures", "Inspirational", "Respected"], upvotes: 0, downvotes: 0),
        
        Review(course: "ECS32A",
               date: Calendar.current.date(from: DateComponents(year: 2022, month: 2, day: 24))!,
               quality: 5, difficulty: 2, forCredit: true, attendance: false, wouldTakeAgain: true,
               grade: "Not sure yet", textbook: true,
               review: "Taking this class should be a no-brainer. He teaches to the point where I'm GLAD to be in his class and really appreciate his straightforward style of teaching. Everything he explained was super clear and it made you excited about learning more. Homework was designed to NOT be stressful. Practice midterms with ans key. Drops lowest exam, quiz, hw.",
               tags: ["Respected", "Amazing Lectures"], upvotes: 0, downvotes: 0),
        
        Review(course: "ECS032A",
               date: Calendar.current.date(from: DateComponents(year: 2022, month: 2, day: 10))!,
               quality: 5, difficulty: 1, forCredit: true, attendance: false, wouldTakeAgain: true,
               grade: "B+", textbook: false,
               review: "Super easy class if you know your way around a computer. Assignments and presentation slides make it super easy to pick the material up even if you never go to lectures. Very generous with due dates, will extend them most of the time even without asking. Grade based on weekly hw, 5 quizzes, 3 tests all weighted the same. 1 score from each dropped",
               tags: ["Graded By Few Things", "Caring"], upvotes: 0, downvotes: 0),
        
        Review(course: "ECS36A",
               date: Calendar.current.date(from: DateComponents(year: 2022, month: 1, day: 3))!,
               quality: 5, difficulty: 3, forCredit: true, attendance: false, wouldTakeAgain: true,
               grade: "A-", textbook: true,
               review: "great teacher with manageable assignments and his ta's were super helpful as well",
               tags: ["Accessible Outside Class", "Clear Grading Criteria", "Caring"], upvotes: 0, downvotes: 0),
    ]
}
