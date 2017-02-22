<h2>MathJax - text mode mathematical equations</h2>
- crossbrowser<br>
- show TeX commands<br>
- show MathML code (presentation only)<br>
<br>
<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<script type="text/javascript">
  MathJax.Hub.Config({
    extensions: ["tex2jax.js"],
    "HTML-CSS": { scale: 100}
  });
  MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});
</script>

Block expression (150%):
<div style="font-size:150%;">
\[
  g\frac{d^2u}{dx^2} + L\sin u = 0
\]
</div>

Block expression (default):
\[
  g\frac{d^2u}{dx^2} + L\sin u = 0
\]

Inline expression: \(g\frac{d^2u}{dx^2} + L\sin u = 0\)<br>
<br>
<b>Note:</b> scaling with CSS does not work if you set font size for * class
