"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
// utility to display what will be rendered on the web page
// tsc
// node .\js\LocalView.js
const ArticleBuild_1 = require("./ArticleBuild");
console.log(ArticleBuild_1.Articles);
const text = (0, ArticleBuild_1.renderArticleIndex)(ArticleBuild_1.Articles);
console.log(text);
//# sourceMappingURL=LocalView.js.map