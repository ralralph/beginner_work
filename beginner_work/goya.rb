require 'cgi'
cgi = CGI.new

cgi.out("type" => "text/html", "charset" => "UTF-8") {
  get = cgi['goya']
"<html>
<body>
 <p>ゴーヤの詳細データは下記になります</p>
  #{get}
 </body>
 </html>"
}
