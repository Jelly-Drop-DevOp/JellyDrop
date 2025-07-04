class_name Game_Clock
extends Node

#tick signal the clock emits that other programs can hook into
#Game_Clock.ref.tick.connect(_on_clock_tick)
#GameClock.tick.connect(_on_clock_tick) should reference this
signal tick
#constant which determines the minimum amount of time per clock tick
#float directly equal to seconds 1.0 = 1 second .5 half second
const TICK_DURATION : float = 1.0
#float used to measure progress twords next tick
var _tick_progression : float = 0.0



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_tick_progression += delta
	if _tick_progression >= TICK_DURATION:
		_tick()

func _tick() -> void:   
	tick.emit(TICK_DURATION)
	_tick_progression -= TICK_DURATION


func _ready() -> void:
	_catchup(1,1)
	pass

#emits tick signal for every TICK_DURATION between old and new time
#used for processing time in between sessions
func _catchup(old_time : float, new_time : float) -> void:
	for i in (new_time - old_time) / TICK_DURATION:
		_tick()
