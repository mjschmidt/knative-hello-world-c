# knative-hello-world-c

## A small example for running C in Knative

This is currently only half function, I don't have a lot of C experince so as of right now this has the following bugs:
* The service does launch to knative, but at this time when you delete the function or the function attempts to scale to zero, Kubernetes does not know how to tell the container's web server to turn off which causes the funtion to hang in terminating forever.  
  * As a temporary work around, you can shut down your kubernetes cluster nodes and turn them back on. This clears the function from running at the docker level. However this is a pain to deal with.
* While the Server responed when you call it, the way it returns the message is jacked up. What do you mean by jacked up you may ask? I will give an example of what I see from the terminal below when I run the C function locally in just a docker container, and then what I see when I run the C function from Knative.
  * asdf
  * asd

