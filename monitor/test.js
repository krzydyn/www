javax.swing.SwingUtilities.invokeLater(function() {
	var frame = new Packages.javax.swing.JFrame();
	frame.defaultCloseOperation = javax.swing.JFrame.EXIT_ON_CLOSE;

	var menuBar = new Packages.javax.swing.JMenuBar();
	frame.setJMenuBar(menuBar);

	var fileMenu = new Packages.javax.swing.JMenu("File");
	menuBar.add(fileMenu);

	importClass(Packages.javax.swing.JMenuItem);

	var openItem = new JMenuItem("Open...");
	openItem.addActionListener(function() {
		print("put your file open code here!\n");
	});
	fileMenu.add(openItem);

	fileMenu.add(new Packages.javax.swing.JSeparator());

	var quitItem = new JMenuItem("Quit");
	quitItem.addActionListener(function() {
		java.lang.System.exit(0);
	});
	fileMenu.add(quitItem);

	frame.setSize(640, 480);
	frame.visible = true;
});

// Park the main thread.  Otherwise the application would immediately exit.
// java.util.concurrent.locks.LockSupport.park();
