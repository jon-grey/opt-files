
if ! (which pgadmin4 &> /dev/null); then
    apt install postgresql-common -y -q
    yes "" | sh /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh
    apt-get install postgresql-11 pgadmin4 -y -q
fi
