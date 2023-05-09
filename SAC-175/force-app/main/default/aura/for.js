({
    //aura method
    showModal : function(component, event, helper) {
        component.set("v.showModal", true);
    },

    //aura method to close Modal/Popup
    closeModal : function(component, event, helper) {
        component.set("v.showModal", false);
    },
  
    //aura method to close Modal/Popup when user click outside
    closeModalOnClickOutside : function(component, event, helper) {
        let modal = component.find('modal');
        let isClickInside = modal.getElement().contains(event.target);
        
        if(!isClickInside) {
            component.set("v.showModal", false);
        }
    }
})