module SetWorkers

  export set_workers

  function set_workers(
  	PROCS::Integer
  	)
  	## FIX NUMBER OF WORKERS
  	# they split the run of simulations
  	current_list = workers()
  	if nworkers()<(PROCS)
  		println("Adding $(PROCS-nworkers()) workers to estimation suite...\n")
  		addprocs(PROCS-nworkers())
  	end
  	if nworkers() > PROCS
  		a = procs()
  		println("Extra workers found. Removing $(nworkers()-PROCS) workers...\n")
  		rmprocs(a[2:(nworkers()-PROCS)])
  	end
  end

end
