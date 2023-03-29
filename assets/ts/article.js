const articles = [
  "hello-world",
  "variables",
  "debugging",
  "arrays",
  "if",
  "for",
  "testing",
  "string hashmap",
  "slices",
  "optionals",
  "defer",
  "functions",    
  "structs",
  "naming conventions",
  "source files are structures",
  "more learning resources",
  ];         
  let aLen = articles.length;

  let text = "<ul>";
  for (let i = 0; i < aLen; i++) {
    text += "<li>" + "<a href='https://saidvandeklundert.net/fortheloveofzig/"+ articles[i] + "'>"+  articles[i] + "</li>";
    
  }
  text += "</ul>";

  document.getElementById("indextag").innerHTML = text;