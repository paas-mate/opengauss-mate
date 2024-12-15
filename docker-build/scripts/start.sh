#/bin/bash

password=$PASSWORD
normal_user_name=$USER_NAME
normal_user_password=$USER_PASSWORD
custom_sql=$CUSTOM_SQL

cd /opt/gauss/simpleInstall

echo "yes" | sh install.sh -w $password && source ~/.bashrc
if [[ $? -ne 0 ]]; then
  echo "ERROR openGauss start filed" 1>&2
  exit 1
fi

echo "listen_addresses = '0.0.0.0'" >> /opt/gauss/data/single_node/postgresql.conf
echo "host    all            all           0.0.0.0/0            sha256" >> /opt/opengauss/data/single_node/pg_hba.conf

echo "restart opengauss......"
gs_ctl restart -D /opt/gauss/data/single_node -Z single_node
if [[ $? -ne 0 ]]; then
  echo "ERROR openGauss start filed" 1>&2
  exit 1
fi
echo "start openGauss successful"

gsql -dpostgres -p5432 -c "CREATE USER $normal_user_name IDENTIFIED BY $normal_user_password;"
gsql -dpostgres -p5432 -c "ALTER USER $normal_user_name SYSADMIN;"

if [[ -n $CUSTOM_SQL ]];then
  gsql -dpostgres -p5432 -c "$custom_sql"
fi

tail -f /dev/null
