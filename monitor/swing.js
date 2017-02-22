//object JComponent
function JComponent() {
	this.paintComponent:function(g){}
}
JComponent.prototype.fg=COLOR.Black;
JComponent.prototype.bg=COLOR.White;
JComponent.prototype.comps=[];
JComponent.prototype.add=function(c) {JComponent.prototype.comps.push(c);}
JComponent.prototype.paintComponent=function(){}
