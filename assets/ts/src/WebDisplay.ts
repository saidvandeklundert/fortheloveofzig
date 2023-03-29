// Render what is ultimately used in the web page.
import { Articles, renderArticleIndex } from "./ArticleBuild";


const text = renderArticleIndex(Articles);
document.getElementById("indextag").innerHTML = text;