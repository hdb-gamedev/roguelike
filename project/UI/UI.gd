extends Control

func _ready():
	Globulars.connect("health_changed", self, "change_health")
	Globulars.connect("max_health_changed", self, "change_health")
	
func change_health():
	$bar.fill = Globulars.health / Globulars.max_health
