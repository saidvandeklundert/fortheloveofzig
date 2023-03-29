"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
// Render what is ultimately used in the web page.
const ArticleBuild_1 = require("./ArticleBuild");
/*
const Articles: Array<string> = [
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
]




function renderArticleIndex(articles: Array<string>): string{
    const articleLength = articles.length;

    var text:string = "<ul>";
    
    for (let i = 0; i < articleLength; i++) {
        text += "<li>" + "<a href='https://saidvandeklundert.net/fortheloveofzig/"+ articles[i] + "'>"+  articles[i] + "</li>";
    }
    
    text += "</ul>";
    return text;
    
}
*/
const text = (0, ArticleBuild_1.renderArticleIndex)(ArticleBuild_1.Articles);
document.getElementById("indextag").innerHTML = text;
//# sourceMappingURL=WebDisplay.js.map