notifications = document.getElementsByClassName("notification");
if (navigator.doNotTrack != 1) {
    for (let i=0; i<notifications.length; i++) {
        let notificationStatus = localStorage.getItem(notifications[i].id);
        console.debug(`Checked if user has confirmed the ${notifications[i].id} notification, and resulted in ${notificationStatus}.`);
        if (notificationStatus !=="true") notifications[i].hidden=false;
    }
}
function confirmNotification(popupId) {
    localStorage.setItem(popupId, true);
    document.getElementById(popupId).hidden=true;
}