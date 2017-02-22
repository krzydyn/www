<b>Generate ActionEvent on Main window close</b>
<%code_start("java")%>
final MyPanel panel=new MyPanel();
JFrame f=new JFrame("Window title");
f.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
f.setContentPane(panel);
f.addWindowListener(new WindowAdapter() {
	public void windowClosing(WindowEvent e) {
		panel.actionPerformed(new ActionEvent(e.getSource(),0,"quit"));
	}
});
f.pack();
f.setLocationRelativeTo(null); //center on screen
f.setVisible(true);
<%code_stop()%>
<br>
