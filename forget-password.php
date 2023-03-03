<!doctype html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   
      <title>Resetarea parolei prin email</title>
       <!-- CSS -->
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   </head>
   <body>
      <div class="container">
          <div class="card">
            <div class="card-header text-center">
              Trimite link de resetare a parolei
            </div>
            <div class="card-body">
              <form action="password-reset-token.php" method="post">
                <div class="form-group">
                  <label for="exampleInputEmail1">Adresa email</label>
                  <input type="email" name="email" class="form-control" id="email" aria-describedby="emailHelp">
                  <small id="emailHelp" class="form-text text-muted">Adresa de email nu va fi impartasita altor parti.</small>
                </div>
                <input type="submit" name="password-reset-token" class="btn btn-primary" value="Trimite">
              </form>
            </div>
          </div>
      </div>
 
   </body>
</html>