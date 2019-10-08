minikube:
	mkdir -p ~/.minikube/files/etc/kubernetes/addons
	mkdir -p ~/.minikube/files/var/lib/kubelet/seccomp
	cp psp.yaml ~/.minikube/files/etc/kubernetes/addons
	cp limited-seccomp-profile.yaml ~/.minikube/files/var/lib/kubelet/seccomp
	minikube start --extra-config=apiserver.enable-admission-plugins="PodSecurityPolicy“
	kubectl apply -f nginx-hello-deployment.yaml
	nginx-hello is now running in restricted mode.
	The system calls link, unlink and mknod are restricted.


