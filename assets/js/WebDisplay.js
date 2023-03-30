// Render what is ultimately used in the web page.
//import { Articles, renderArticleIndex } from "./ArticleBuild";
const Articles = [
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
    "errors",
    "more learning resources",
];
function renderArticleIndex(articles) {
    const articleLength = articles.length;
    var text = "<ul>";
    for (let i = 0; i < articleLength; i++) {
        text += "<li>" + "<a href='https://saidvandeklundert.net/fortheloveofzig/" + articles[i] + "'>" + articles[i] + "</li>";
    }
    text += "</ul>";
    return text;
}
const text = renderArticleIndex(Articles);
document.getElementById("indextag").innerHTML = text;
//# sourceMappingURL=WebDisplay.js.map