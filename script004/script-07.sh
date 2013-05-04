Users=`getent shadow | grep ':\*:\|:\!:' | cut -d: -f1`

echo "" > resultado.txt

for User in $Users
do
        UserName=`getent passwd | grep ^$User: | cut -d: -f5 | cut -d, -f1`
        UserGroups=`groups $User | awk -F": " '{print $2}'`

        printf "%-20s | %-45s | %-20s\n" "$User" "$UserName" "$UserGroups" >> resultado.txt
done

cat resultado.txt | sort -t\| -k3 | tee resultado.txt