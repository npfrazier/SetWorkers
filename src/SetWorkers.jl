module SetWorkers

  export set_workers

  function set_workers(
  	PROCS::Integer
  	)
  	## FIX NUMBER OF WORKERS
  	# they split the run of simulations
  	current_wrkrs = (nprocs()==1) ? 0 : nworkers()
  	if (current_wrkrs<PROCS)
  		println("Adding $(PROCS-current_wrkrs) workers to estimation suite...\n")
  		addprocs(PROCS-current_wrkrs)
  	end
  	if (current_wrkrs > PROCS)
  		a = procs()
  		println("Extra workers found. Removing $(current_wrkrs-PROCS) workers...\n")
  		rmprocs(a[2:(current_wrkrs-PROCS)])
  	end
    return
  end

end
