const articles = [
    "hello-world",
    "variables",
    "debugging",
    "arrays",
    "if",
    "test",
    "more learning resources",
  ];         
  let aLen = articles.length;

  let text = "<ul>";
  for (let i = 0; i < aLen; i++) {
    text += "<li>" + "<a href='https://saidvandeklundert.net/fortheloveofzig/"+ articles[i] + "'>"+  articles[i] + "</li>";
    
  }
  text += "</ul>";

  document.getElementById("indextag").innerHTML = text;