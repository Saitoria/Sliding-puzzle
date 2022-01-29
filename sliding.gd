extends Node2D


var input = 0
var key
var map = [[0,1,2,3],[4,5,6,7],[8,9,10,11],[12,13,14,15]]
var imgNode = load("res://img.tscn") 
var img = []
var move = Vector2(0,0)
var speed = 4 #1,2,4

func _ready():
	input = 0
	randomize()
	for x in range(4):
		map[x].shuffle()
	for n in range(16):
		img.append(imgNode.instance())
		img[n].set_frame(n)
		add_child(img[n])
		for y in range(4):
			if map[y].find(n) != -1:
#				print(map[y].find(n))
				img[n].set_position(Vector2(map[y].find(n)*100,y*100))
#	img.shuffle()
	print(img)
	img[15].hide()
	set_physics_process(true)


func step(key,dir):
	if  Input.is_key_pressed(key) and move == Vector2(0,0) or move == dir:
		for y in range(4):
			if map[y].find(15) != -1:
				var pos = Vector2(y,map[y].find(15))+ dir
				pos.x = min(max(pos.x,0),3)
				pos.y = min(max(pos.y,0),3)
				img[map[y][map[y].find(15)]].set_position(Vector2(pos.y*100,pos.x*100))
				if img[map[pos.x][pos.y]].get_position() != Vector2(map[y].find(15)*100,y*100):
					move = dir
					print(img[map[pos.x][pos.y]].get_position())
#					img[map[pos.x][pos.y]].set_position(img[map[pos.x][pos.y]].get_position() - Vector2(dir.y*speed,dir.x*speed))
					var walk = Vector2(img[map[pos.x][pos.y]].get_position() - Vector2(dir.y*speed,dir.x*speed))
					img[map[pos.x][pos.y]].set_position(Vector2(walk.x,walk.y))
				else:
					map[y][map[y].find(15)] = map[pos.x][pos.y]
					map[pos.x][pos.y] = 15
					move = Vector2(0,0)
					break
		input = 0

func _physics_process(delta):
	step(KEY_S,Vector2(-1,0))
	step(KEY_D,Vector2(0,-1))
	step(KEY_A,Vector2(0,1))
	step(KEY_W,Vector2(1,0))
	
	if map == [[0,1,2,3],[4,5,6,7],[8,9,10,11],[12,13,14,15]]:
		get_tree().change_scene("res://GameOver.tscn")
		pass

func _input(event):
	if event is InputEventScreenDrag:
		if $TouchScreenClass.get_drag_direction(event.relative,8) == Vector2.DOWN:
			var dir = Vector2(-1,0)
			if  move == Vector2(0,0) or move == dir:
				for y in range(4):
					if map[y].find(15) != -1:
						var pos = Vector2(y,map[y].find(15))+ dir
						pos.x = min(max(pos.x,0),3)
						pos.y = min(max(pos.y,0),3)
						img[map[y][map[y].find(15)]].set_position(Vector2(pos.y*100,pos.x*100))
						if img[map[pos.x][pos.y]].get_position() != Vector2(map[y].find(15)*100,y*100):
							move = dir
							print(img[map[pos.x][pos.y]].get_position())
		#					img[map[pos.x][pos.y]].set_position(img[map[pos.x][pos.y]].get_position() - Vector2(dir.y*speed,dir.x*speed))
							var walk = Vector2(img[map[pos.x][pos.y]].get_position() - Vector2(dir.y*speed,dir.x*speed))
							img[map[pos.x][pos.y]].set_position(Vector2(walk.x,walk.y))
						else:
							map[y][map[y].find(15)] = map[pos.x][pos.y]
							map[pos.x][pos.y] = 15
							move = Vector2(0,0)
							break
		if $TouchScreenClass.get_drag_direction(event.relative,8) == Vector2.UP:
			var dir = Vector2(1,0)
			if  move == Vector2(0,0) or move == dir:
				for y in range(4):
					if map[y].find(15) != -1:
						var pos = Vector2(y,map[y].find(15))+ dir
						pos.x = min(max(pos.x,0),3)
						pos.y = min(max(pos.y,0),3)
						img[map[y][map[y].find(15)]].set_position(Vector2(pos.y*100,pos.x*100))
						if img[map[pos.x][pos.y]].get_position() != Vector2(map[y].find(15)*100,y*100):
							move = dir
							print(img[map[pos.x][pos.y]].get_position())
		#					img[map[pos.x][pos.y]].set_position(img[map[pos.x][pos.y]].get_position() - Vector2(dir.y*speed,dir.x*speed))
							var walk = Vector2(img[map[pos.x][pos.y]].get_position() - Vector2(dir.y*speed,dir.x*speed))
							img[map[pos.x][pos.y]].set_position(Vector2(walk.x,walk.y))
						else:
							map[y][map[y].find(15)] = map[pos.x][pos.y]
							map[pos.x][pos.y] = 15
							move = Vector2(0,0)
							break
		if $TouchScreenClass.get_drag_direction(event.relative,8) == Vector2.LEFT:
			var dir = Vector2(0,1)
			if  move == Vector2(0,0) or move == dir:
				for y in range(4):
					if map[y].find(15) != -1:
						var pos = Vector2(y,map[y].find(15))+ dir
						pos.x = min(max(pos.x,0),3)
						pos.y = min(max(pos.y,0),3)
						img[map[y][map[y].find(15)]].set_position(Vector2(pos.y*100,pos.x*100))
						if img[map[pos.x][pos.y]].get_position() != Vector2(map[y].find(15)*100,y*100):
							move = dir
							print(img[map[pos.x][pos.y]].get_position())
		#					img[map[pos.x][pos.y]].set_position(img[map[pos.x][pos.y]].get_position() - Vector2(dir.y*speed,dir.x*speed))
							var walk = Vector2(img[map[pos.x][pos.y]].get_position() - Vector2(dir.y*speed,dir.x*speed))
							img[map[pos.x][pos.y]].set_position(Vector2(walk.x,walk.y))
						else:
							map[y][map[y].find(15)] = map[pos.x][pos.y]
							map[pos.x][pos.y] = 15
							move = Vector2(0,0)
							break
		if $TouchScreenClass.get_drag_direction(event.relative,8) == Vector2.RIGHT:
			var dir = Vector2(0,-1)
			if  move == Vector2(0,0) or move == dir:
				for y in range(4):
					if map[y].find(15) != -1:
						var pos = Vector2(y,map[y].find(15))+ dir
						pos.x = min(max(pos.x,0),3)
						pos.y = min(max(pos.y,0),3)
						img[map[y][map[y].find(15)]].set_position(Vector2(pos.y*100,pos.x*100))
						if img[map[pos.x][pos.y]].get_position() != Vector2(map[y].find(15)*100,y*100):
							move = dir
							print(img[map[pos.x][pos.y]].get_position())
		#					img[map[pos.x][pos.y]].set_position(img[map[pos.x][pos.y]].get_position() - Vector2(dir.y*speed,dir.x*speed))
							var walk = Vector2(img[map[pos.x][pos.y]].get_position() - Vector2(dir.y*speed,dir.x*speed))
							img[map[pos.x][pos.y]].set_position(Vector2(walk.x,walk.y))
						else:
							map[y][map[y].find(15)] = map[pos.x][pos.y]
							map[pos.x][pos.y] = 15
							move = Vector2(0,0)
							break
		pass
	
	pass
