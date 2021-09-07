#!/bin/bash

TURN_ON=false
for ARGUMENT in "$@"
do
    if [ "$ARGUMENT" = "on" ]; then
        TURN_ON=true
    fi
done

# INFORMAR O APPLICATION ID
APPLICATION_ID=7

# INFORMAR A CONTROLLER
CONTROLLER=labs-fhdumontcontroller-rqzqw02j.appd-cloudmachine.com:8090

# LOGIN AUTOMÁTICO NA UI

# CRIAR TEMPORARY ACCESS TOKEN: ADMINISTRATION > API CLIENTS
TEMPORARY_ACCESS_TOKEN='eyJraWQiOiJjOTkwZDJkOS0xZTU0LTQxMWMtOGViNy0wNWIzOWI4OWRiOTQiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJBcHBEeW5hbWljcyIsImF1ZCI6IkFwcERfQVBJcyIsImp0aSI6ImpTR3VwTTBibDd4V1lsTVZqSUk5a2ciLCJzdWIiOiJBUEkgVGVzdHMiLCJpZFR5cGUiOiJBUElfQ0xJRU5UIiwiaWQiOiIxZTc3MmU4Ny01YjcxLTQwNWQtYTFmYi04ZGMwMmVkZWNhOTkiLCJhY2N0SWQiOiJjOTkwZDJkOS0xZTU0LTQxMWMtOGViNy0wNWIzOWI4OWRiOTQiLCJ0bnRJZCI6ImM5OTBkMmQ5LTFlNTQtNDExYy04ZWI3LTA1YjM5Yjg5ZGI5NCIsImFjY3ROYW1lIjoiY3VzdG9tZXIxIiwidGVuYW50TmFtZSI6IiIsImZtbVRudElkIjpudWxsLCJhY2N0UGVybSI6W10sInJvbGVJZHMiOltdLCJpYXQiOjE2MzEwMjY3MDAsIm5iZiI6MTYzMTAyNjU4MCwiZXhwIjoxNjMxMTEzMTAwLCJ0b2tlblR5cGUiOiJBQ0NFU1MifQ.HzZWpXzbzgWY9L93OCLq8eKcZi6apI_7tZCp6k-f-ak'

# CONTROLE DE LOGIN
jsessionId=""
csrfToken=""
# cookies=($(curl -s -I --header "Authorization: Basic ${b64AuthKey}" -X GET http://${CONTROLLER}/controller/auth?action=login | grep -Fi set-cookie))
cookies=($(curl -s -I --header "Authorization:Bearer $TEMPORARY_ACCESS_TOKEN" -X GET http://${CONTROLLER}/controller/auth?action=login | grep -Fi set-cookie))
length=${#cookies[@]}
for ((i = 0; i != length; i++)); do
	cookie=${cookies[i]}
	if [[ $cookie == *"JSESSIONID"* ]]; then
  		jsessionId=$cookie
  	elif [[ $cookie == *"X-CSRF-TOKEN"* ]]; then
  		IFS='=' 
  		read -ra ADDR <<< "$cookie"
  		csrfToken=${ADDR[1]}
        csrfToken=${csrfToken%?}
	fi
done

echo $jsessionId
echo $csrfToken

# SE LOGOU COM SUCESSO
if [[ $jsessionId != "" ]] && [[ $csrfToken != "" ]]; then

    URL="http://$CONTROLLER/controller/restui/applicationManagerUiBean/instrumentationLevel/$APPLICATION_ID/PRODUCTION"

    if [ $TURN_ON == true ];then
        echo "TURN ON Development Mode"
        URL="http://$CONTROLLER/controller/restui/applicationManagerUiBean/instrumentationLevel/$APPLICATION_ID/DEVELOPMENT"
    else
        echo "TURN OFF Development Mode"
    fi

    # HABILITANDO/DESABILITANDO DEVELOPMENT LEVEL 
    curl -s \
        --header "Accept: application/json, text/plain, */*" \
        --header "Accept-Encoding: gzip, deflate" \
        --header "Cache-Control: no-cache" \
        --header "Content-Type: application/json;charset=utf-8" \
        --header "Cookie: $jsessionId X-CSRF-TOKEN=$csrfToken" \
        --header "Host: ${CONTROLLER}" \
        --header "X-CSRF-TOKEN: $csrfToken" \
        --header "X-CSRF-TOKEN: $csrfToken" \
        -X POST \
        $URL
	
else
	echo "Problem with response headers."
fi
