# google-filestore-backup-cloud-function
backup google cloud filestore using google cloud function and cloud scheduler

I have adapted the code given in https://medium.com/google-cloud/using-cloud-scheduler-and-cloud-functions-to-deploy-a-periodic-compute-engine-vm-worker-2b897ef68dc5 for google cloud filestore backup. The original code can be found at: https://github.com/martinomburajr/medium/blob/master/gcp/architecture/scheduler-functions-compute-startupscript/cloudfunctions/cloudfunctions.go

This cloud function, written in go, is configured to launch a debian virtual machine (f1.micro). The VM will mount primary filestore to the VM and backup the contents of primary filestore to google cloud storage bucket. It will also mount secondary filestore to the VM and sync the contents from primary filestore, which can be used during disaster recovery. The backup frequency can be scheduled using cloud scheduler. 

