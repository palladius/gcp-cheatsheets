
Stranegly enough with the normal API (`gcloud build SOMETHING`) you get access to the 
multiple builds you triggered from the triggers: 

     gcloud builds list 

To get a list of your Build Triggers instead you need to use the BETA instead (!!):

    gcloud beta builds triggers list

