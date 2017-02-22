<h2>Fastest alghorithm to find two lines intersection point</h2>

<%code_start("java")%>
/**
 * Returns the intersection of two lines, or null if there isn't one.
 * @param infinite - true if the lines should be regarded as infinite, false
 * if the intersection must be within the given segments.
 * @return a Point2D or null.
 */
public static Point2D intersection(
		double X1, double Y1,double X2, double Y2, //Line A
		double X3, double Y3,double X4, double Y4, //Line B
		boolean infinite){
	double sx1=X2-X1, sy1=Y2-Y1;
	double sx2=X4-X3, sy2=Y4-Y3;
	double D=sy2*sx1-sx2*sy1;

	// lines can be considered parallel.
	if (Math.abs(D) < Const.eps) return null;

	double ua=(sx2*(Y1-Y3)-sy2*(X1-X3))/D;
	double ub=(sx1*(Y1-Y3)-sy1*(X1-X3))/D;

	// check if lines are within the bounds
	if(!infinite && (ua>1.0||ua<0.0||ub>1.0||ub<0.0)) return null;

	return new Point2D.Double(X1+ua*sx1, Y1+ua*sy1);
}
public static Point2D intersection(Line2D l1,Line2D l2,boolean infinite){
	return intersection(l1.getX1(),l1.getY1(),l1.getX2(),l1.getY2(),
			l2.getX1(),l2.getY1(),l2.getX2(),l2.getY2(), infinite);
}
<%code_stop()%>
