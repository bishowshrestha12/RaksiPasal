<html>
<head>
</head>
<title>UploadPHoto</title>
<body>
<h2>Upload Your Photo</h2>
<form action="${pageContext.request.contextPath}/UploadPhotoServlet" method="post" enctype="multipart/form-data">

<input type="file" name="image" accept="image/*" required/>

<input type="submit"   value="Upload image">

</form>


<h2>
Your Uploaded image
</h2>
<img src= "${path}" alt = "Uploaded Image"/>

</body>

</html>