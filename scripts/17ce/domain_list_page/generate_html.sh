#!/bin/bash
# http://192.168.10.253:1080/get_domain.html
#
TEMP_FILE=$(mktemp)
DATE=$(date)

/usr/bin/mysql -N 17ce -e 'select name,rate from record where rate>50 order by rate desc limit 10 ;' >$TEMP_FILE 
if [ $? -ne 0 ]; then
    echo "failed to get data."
    exit 1
fi

HTML_FILE="/var/www/sites/domain_check/get_domain.html"


cat > $HTML_FILE << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Create User</title>

  <link rel="stylesheet" href="/static/css/bootstrapValidator.min.css">
  <script src="/static/js/bootstrapValidator.min.js"></script>

  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="/static/css/bootstrap.css">
  <link rel="stylesheet" href="/static/css/main.css">

  <!-- Optional theme -->
  <link rel="stylesheet" href="/static/css/bootstrap-theme.css">

  <!-- Latest compiled and minified JavaScript -->
  <script src="/static/js/bootstrap.min.js"></script>

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="/static/js/jquery.min.js"></script>


</head>


<body>
<div>
<form method="post" action="">
        
        <table class="table table-striped table-hover table-condensed table-bordered">
        <thead>
            <tr style="color: blue;">
                <td >域名</td>
                <td >国内网站访问成功率</td>
            </tr>
        </thead>

        <tbody>

EOF

while read line; do
    DOMAIN=$(echo $line | awk '{print $1}')
    RATE=$(echo $line | awk '{print $2}')
    cat >> $HTML_FILE << EOF
    <tr>
        <td>$DOMAIN</td>
        <td>$RATE</td>
    </tr>
EOF
    
done < $TEMP_FILE


cat >> $HTML_FILE << EOF
</tbody>
</form>
</div>
</br>
<span style="color: blue;"> 页面最近更新: $DATE </span>
<span></span>
</body>
</html>
EOF

/bin/rm $TEMP_FILE
