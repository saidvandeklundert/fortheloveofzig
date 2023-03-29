// Generate the string that is used in the web page.
// tsc
// node .\dist\Display.js
export const Articles = [
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
export function renderArticleIndex(articles) {
    const articleLength = articles.length;
    var text = "<ul>";
    for (let i = 0; i < articleLength; i++) {
        text += "<li>" + "<a href='https://saidvandeklundert.net/fortheloveofzig/" + articles[i] + "'>" + articles[i] + "</li>";
    }
    text += "</ul>";
    return text;
}
//# sourceMappingURL=ArticleBuild.js.map