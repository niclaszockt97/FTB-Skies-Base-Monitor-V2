local modem = peripheral.wrap("down")
local monitor = peripheral.wrap("left")
local es = peripheral.wrap("ultimateSmeltingFactory_0")
local ef = peripheral.wrap("eliteEnrichingFactory_0")
local mec = peripheral.wrap("ae2:controller_0")
local ec = peripheral.wrap("eliteEnergyCube_0")
local ei = peripheral.wrap("thermal:charge_bench_0")

monitor.clear()

--Enrichment Factory Statisch

monitor.setCursorPos(1,1)
monitor.setTextColour(20)
monitor.write("Enrichment Factory")
monitor.setTextColour(1)
monitor.setCursorPos(1,2)
monitor.write("Energiespeicher: ")
monitor.setCursorPos(1,3)
monitor.write("Energieverbrauch: ")
monitor.setCursorPos(1,4)
monitor.write("Energielevel: ")

--Energized Smelter

monitor.setCursorPos(1,6)
monitor.setTextColour(20)
monitor.write("Energized Smelter")
monitor.setCursorPos(1,7)
monitor.setTextColour(1)
monitor.write("Energiespeicher: ")
monitor.setCursorPos(1,8)
monitor.write("Energieverbrauch: ")
monitor.setCursorPos(1,9)
monitor.write("Energielevel: ")

--Energy Cube

monitor.setCursorPos(30,1)
monitor.setTextColour(20)
monitor.write("Energy Cube")
monitor.setTextColour(1)
monitor.setCursorPos(30,2)
monitor.write("Speicher:")
monitor.setCursorPos(30,3)
monitor.write("Max Capacity:")
monitor.setCursorPos(30,4)
monitor.write("Füllstand:")

--Energetic Infuser

monitor.setCursorPos(30,6)
monitor.setTextColour(20)
monitor.write("Energetic Infuser")
monitor.setTextColour(1)
monitor.setCursorPos(30,7)
monitor.write("Speicher:")
monitor.setCursorPos(30,8)
monitor.write("Verbrauch:")
monitor.setCursorPos(30,9)
monitor.write("Füllstand:")

while true do





	--ME Controller

	mec.getEnergy()

	--Enrichment Factory 1

	eef = ef.getEnergy()
	enef = ef.getEnergyUsage()
	eneffl = ef.getEnergyFilledPercentage()
	
	--Smelting Factory 1

	ees = es.getEnergy()
	enes = es.getEnergyUsage()
	enesfl = es.getEnergyFilledPercentage()

	--Energy Cube
	
	eec = ec.getEnergy()
	ecef = ec.getMaxEnergy()
	ecfl = ec.getEnergyFilledPercentage()

	--Energetic Infuser

	eic = ei.getEnergy()
	
	
	--Logik Enrichment Factory Füllstand Warnung 
	
	if eneffl < 0.5 then
			monitor.setTextColour(3)
			monitor.setCursorPos(1,18)
			monitor.write("EF Energie Low")
			monitor.setTextColour(1)
	else
			monitor.setCursorPos(1,18)
			monitor.write("               ")
	end
	
	
	--Logik Smelting Factory Füllstand Warnung
	
	if enesfl < 0.5 then
			monitor.setTextColour(3)
			monitor.setCursorPos(16,18)
			monitor.write("SF Energie Low")
			monitor.setTextColour(1)
	else
			monitor.setCursorPos(16,18)
			monitor.write("               ")
	end 
	
	
	--Logik Energy Cube Füllstand Warnung
	
	if ecfl < 0.5 then
			monitor.setTextColour(3)
			monitor.setCursorPos(32,18)
			monitor.write("EC Energie Low")
			monitor.setTextColour(1)
	else
			monitor.setCursorPos(32,18)
			monitor.write("               ")
	end
	
	--Ausgabe auf Monitor

	--Enrichment Factory

	monitor.setTextScale(1)
	monitor.setCursorPos(20,2)
	monitor.write(eef)
	monitor.setCursorPos(20,3)
	monitor.write(enef)
	monitor.setCursorPos(20,4)
	monitor.write(math.floor(eneffl * 100))

	-- Energized Smelter	
	
	monitor.setCursorPos(20,7)
	
	monitor.write(ees)
	monitor.setCursorPos(20,8)
	monitor.write(enes)
	monitor.setCursorPos(20,9)
	monitor.write(math.floor(enesfl * 100))
	
	--Energy Cube
	
	monitor.setCursorPos(45,2)
	monitor.write(eec)
	monitor.setCursorPos(45,3)
	monitor.write(math.floor(ecef))
	monitor.setCursorPos(45,4)
	monitor.write(math.floor(ecfl * 100))
	
	--Energetic Infuser
	
	monitor.setCursorPos(45,7)
	monitor.write(eic)
	monitor.setCursorPos(45,8)
	monitor.write("---")
	monitor.setCursorPos(45,9)
	monitor.write("---")
	
	sleep(1)

end