"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.renderArticleIndex = exports.Articles = void 0;
// Generate the string that is used in the web page.
// tsc
// node .\js\Display.js
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
    const articleLength = articles.length;
    var text = "<ul>";
    for (let i = 0; i < articleLength; i++) {
        text += "<li>" + "<a href='https://saidvandeklundert.net/fortheloveofzig/" + articles[i] + "'>" + articles[i] + "</li>";
    }
    text += "</ul>";
    return text;
}
exports.renderArticleIndex = renderArticleIndex;
//# sourceMappingURL=ArticleBuild.js.map