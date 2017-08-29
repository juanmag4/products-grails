<!DOCTYPE>
<html>
<head>
    <title>My Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Grails</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="/productsTest/index">Products List <span class="sr-only">(current)</span></a></li>
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
    <div>
        <div class="form-group">
            <label>Name</label>
            <input name="name" value="${productInstance?.name}" class="form-control" readonly />
        </div>
        <div class="form-group">
            <label>Description</label>
            <input name="description" value="${productInstance?.description}" class="form-control" readonly />
        </div>
        <div class="form-group">
            <label>Price</label>
            <input name="price" value="${productInstance?.price}" class="form-control" readonly />
        </div>
        <div class="form-group">
            <label>Stock</label>
            <input name="stock" value="${productInstance?.stock}" class="form-control" readonly />
        </div>
        %{--<g:submitButton name="Add Product" class="btn btn-primary" />--}%
        <g:link action="editProduct" id="${productInstance.id}" ><button class="btn btn-primary">Edit</button></g:link>
        <g:link action="deleteProduct" id="${productInstance.id}" ><button class="btn btn-primary">Delete</button></g:link>
    </div>
</div>
</body>
</html>