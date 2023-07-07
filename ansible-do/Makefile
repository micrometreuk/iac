.PHONY: run
create_droplets:	
	#ansible-playbook playbook.yml --vault-password-file .vault_pass --extra-vars '@password.yml' --tags "create droplets"
	#ansible-playbook playbook.yml --vault-password-file .vault_pass --extra-vars '@password.yml' --tags "configure droplets"
	ansible-playbook playbook.yml --vault-password-file .vault_pass --extra-vars '@password.yml' --tags "create dns records"
