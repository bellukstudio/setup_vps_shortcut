.PHONY: all docker nginx php pgsql pgadmin mysql phpmyadmin pm2

all: docker nginx php pgsql pgadmin mysql phpmyadmin pm2 ## Setup all components

update: ## Update package lists
	sudo apt update && sudo apt upgrade -y

docker: ## Install latest Docker & Docker Compose
	sudo apt install -y ca-certificates curl gnupg lsb-release
	sudo mkdir -p /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	echo "deb [arch=$$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt update
	sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
	sudo usermod -aG docker $$(whoami)

nginx: ## Install Nginx
	sudo apt install -y nginx

php: ## Install PHP 8.0 - 8.3 with common extensions
	sudo add-apt-repository ppa:ondrej/php -y
	sudo apt update
	for v in 8.0 8.1 8.2 8.3; do \
		sudo apt install -y php$$v php$$v-cli php$$v-fpm php$$v-mysql php$$v-pgsql php$$v-xml php$$v-curl php$$v-mbstring php$$v-bcmath php$$v-zip; \
	done

pgsql: ## Install PostgreSQL
	sudo apt install -y postgresql postgresql-contrib

pgadmin: ## Install pgAdmin 4
	curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/pgadmin-keyring.gpg
	sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/pgadmin-keyring.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list'
	sudo apt update
	sudo apt install -y pgadmin4-web
	sudo /usr/pgadmin4/bin/setup-web.sh

mysql: ## Install MySQL Server
	sudo apt install -y mysql-server

phpmyadmin: ## Install phpMyAdmin
	sudo apt install -y phpmyadmin

pm2: ## Install PM2 (Node.js process manager)
	curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
        sudo npm install -g npm
	sudo apt install -y nodejs
	sudo npm install -g pm2
