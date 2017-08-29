<!DOCTYPE>
<html>
<head>
    <title>My Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    %{--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">--}%
    <asset:stylesheet src="productsStyles.css"/>
</head>
<body>
<nav class="navbar navbar-default navbar-position">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">Grails</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="/productsTest/addProduct">Add Product <span class="sr-only">(current)</span></a></li>
            </ul>
            <g:form class="navbar-form navbar-left" name="searchProducts" url="[controller: 'productsTest', action: 'searchProducts']" >
                <div class="form-group">
                    <g:textField name="query" value="${params.query}" placeholder="Search" class="form-control" />
                </div>
                <button type="submit" class="btn btn-default">Search</button>
            </g:form>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container">
    <div class="table-border table-position">
        <table class="table">
            <thead>
            <tr>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Stock</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${productsList}" status="index" var="product">
                <tr>
                    <td><g:link action="showProduct" id="${product.id}" >${product.name}</g:link></td>
                    <td>${product.description}</td>
                    <td>${product.price}</td>
                    <td>${product.stock}</td>
                    <td><g:link action="editProduct" id="${product.id}" ><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></g:link></td>
                    <td><g:link action="deleteProduct" id="${product.id}" ><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></g:link></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>