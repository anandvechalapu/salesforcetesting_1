trigger WelcomeModalTrigger on Account(after insert) { 
  // Create a list to store the accounts 
  List<Id> accountIds = new List<Id>(); 
  
  // Loop through the accounts 
  for (Account a : Trigger.new) { 
    // Add the account IDs to the list 
    accountIds.add(a.Id); 
  } 
  
  // Fire the lightning component to show the welcome modal 
  if(accountIds.size() > 0) { 
    showWelcomeModal(accountIds); 
  }
}

@AuraEnabled 
public static void showWelcomeModal(List<Id> accountIds) { 
  // Create an event to show the modal 
  ShowWelcomeModalEvent evt = new ShowWelcomeModalEvent(); 
  evt.setAccountIds(accountIds); 
  evt.fire(); 
}