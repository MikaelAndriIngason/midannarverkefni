<html>
<head>
  <title>{{title or 'No title'}}</title>
  <link rel="stylesheet" href="/static/skeleton.css">
  <link rel="icon" href="/static/Icon.png">
</head>
<body class="container">
    <header>
        <h2><img src="/static/Icon.png" height="50" width="50"> {{title}}</h2>
        %if title != "Forsíða":
            <a href="/" class="button button-primary">Forsíða</a>
        % end
    </header><hr>

    {{!base}}
  
    <footer>
        <hr><p>Copyright &copy; 2018, Mikael</p>
    </footer>
</body>
</html>
