trigger UpdateMobileField on Student__c (after insert) {
    List<Student__c> students = new List<Student__c>();

    for (Student__c s : Trigger.new) {
        if (s.Phone__c != null && s.Phone__c.length() <= 15) {
            s.Mobile__c = s.Phone__c;
            students.add(s);
        }
    }

    if (students.size() > 0) {
        update students;
    }
}