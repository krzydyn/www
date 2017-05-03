<b>Get the size of the default screen</b>
<%code_start("java")%>
Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
<%code_stop()%>

<b>Get size of each screen</b>
<%code_start("java")%>
GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
GraphicsDevice[] gs = ge.getScreenDevices();
for (int i=0; i<gs.length; i++) {
	DisplayMode dm = gs[i].getDisplayMode();
	int screenWidth = dm.getWidth();
	int screenHeight = dm.getHeight();
}
<%code_stop()%>

<b>Determine the display modes</b>
<%code_start("java")%>
GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
GraphicsDevice gs = ge.getDefaultScreenDevice();
DisplayMode[] dmodes = gs.getDisplayModes();
for (int i=0; i<dmodes.length; i++) {
	int screenWidth = dmodes[i].getWidth();
	int screenHeight = dmodes[i].getHeight();
	int bitDepth = dmodes[i].getBitDepth();
	int refreshRate = dmodes[i].getRefreshRate();
}
<%code_stop()%>
