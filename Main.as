package {
	
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class Main extends MovieClip {
	
		private var _monTimer:Timer = new Timer(2000); //timer, pour ajouter des bogues aux 2 secondes
		private var _nbVies:int = 10; //entier, nombre de vies restantes
		
		public function Main() {
			//constructor code
			_monTimer.addEventListener(TimerEvent.TIMER, ajouterBibitte);
			_monTimer.start(); //démarrage du timer
		}
		
		private function ajouterBibitte(e:TimerEvent):void{
			//trace("c'est le temps d'ajouter une bibitte");
			var uneBibitte:MovieClip = new Bibitte();
			addChild(uneBibitte);
			if(stage.frameRate<=60){stage.frameRate += 2};
			//trace(stage.frameRate);
		}
		
		public function oublierBibitte(laBibitte:MovieClip):void{
			removeChild(laBibitte);
		}
		
		public function ajouterPoint():void{
			//trace("c'est le temps d'ajouter un point");
			tableau_mc.txtPoints.text=Number(tableau_mc.txtPoints.text)+1;   
		}
		
		public function enleverVie():void{
			//trace("c'est le temps d'enlever une vie, s'il en reste...");
			if(_nbVies >=1){
				_nbVies--;
				tableau_mc.txtNbVies.text=_nbVies; 
				if(_nbVies==0){terminerPartie();}
			}
		}
		
		private function terminerPartie():void{
			_monTimer.stop();
			var messageFin:MovieClip = new GameOver();
			addChild(messageFin);
		}
		
	}
}
