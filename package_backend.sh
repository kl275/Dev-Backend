echo "Packaging Backend files"

packageNum=`./testRabbitMQClient.php backendPackage-v | xargs`
	cd temp/
	echo "Enter MySQL Password: "
		mkdir mySqlData
			cd mySqlData/
				mysqldump -u root -p IT490 > backup_sql.sql
				cd ..
				cd ..
	
	beScrDIR=/home/rabbitmqphp_example/
		cp -a $beScrDIR* temp/

	tar -czvf backendPackage-v"$packageNum".tar.gz -C temp/ . 
		
		rm -r temp/RabbitMQ/
		rm -r temp/mySqlData/
        echo `ls | grep backendPackage-v"$packageNum"`
		echo "Packaging Done."
	
	# Scp package to the deploy server
	echo "Sending"
	scp -r backendPackage-v"$packageNum".tar.gz kevv@192.168.1.13:/home/kevv/git/it490Deploy/packages/
	
	cp backendPackage-v"$packageNum".tar.gz backendPackages/
	rm backendPackage-v"$packageNum".tar.gz
	echo "Trial 1"
	php updatePackage.php backendPackage-v"$packageNum".tar.gz "$packageNum"
	echo "Trial 2"

