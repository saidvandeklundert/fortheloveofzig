// utility to display what will be rendered on the web page
// tsc
// node .\js\LocalView.js
import { Articles, renderArticleIndex } from "./ArticleBuild";

console.log(Articles);
const text = renderArticleIndex(Articles);
console.log(text);