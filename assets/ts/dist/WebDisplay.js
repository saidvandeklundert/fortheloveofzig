"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.renderArticleIndex = exports.Articles = void 0;
// Render what is ultimately used in the web page.
// import { Articles, renderArticleIndex } from "./ArticleBuild";
exports.Articles = [
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
function renderArticleIndex(articles) {
    var articleLength = articles.length;
    var text = "<ul>";
    for (var i = 0; i < articleLength; i++) {
        text += "<li>" + "<a href='https://saidvandeklundert.net/fortheloveofzig/" + articles[i] + "'>" + articles[i] + "</li>";
    }
    text += "</ul>";
    return text;
}
exports.renderArticleIndex = renderArticleIndex;
var text = renderArticleIndex(exports.Articles);
document.getElementById("indextag").innerHTML = text;
//# sourceMappingURL=WebDisplay.js.map