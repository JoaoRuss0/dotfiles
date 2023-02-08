function conky_loop_cpus(columns, include_per, include_freq, include_bar)
	local handle = io.popen('nproc')
	local num_cpus = handle:read("*n")
	handle:close()

	if num_cpus % columns ~= 0 then
		return "${color red}"..num_cpus.." cpus are not divisible by "..columns.." columns${color grey}"
	end

	local cpus_stats = ""
	local cpus_count_per_column = num_cpus/columns

	for i=1, cpus_count_per_column do
		if (i~=1) then
			cpus_stats = cpus_stats.."${offset 8}"
		end 

		for j=0, columns-1 do
			local cpu_number = i+j*cpus_count_per_column

			cpus_stats = append_cpu_to_stats(cpu_number, cpus_stats, include_per, include_freq, include_bar)

			if j ~= columns-1 then
				cpus_stats = cpus_stats.." "
			end
		end

		if (i~=cpus_count_per_column) then
			cpus_stats = cpus_stats.."\n"
		end
	end

	return cpus_stats
end

function append_cpu_to_stats(cpu_number, cpus_stats, include_per, include_freq, include_bar)
	cpus_stats = cpus_stats.."${color grey}["..string.format("%02d", cpu_number).."]${color}"	

	if include_per == 'true' then
		cpus_stats = cpus_stats.." ${alignr}${cpu cpu"..cpu_number.."}%"
	end

	if include_freq == 'true' then
		cpus_stats = cpus_stats.." ${alignr}${freq "..cpu_number.."}MHz"
	end

	if include_bar == 'true' then
		cpus_stats = cpus_stats.." ${alignr}${voffset 2}${cpubar cpu"..cpu_number.."}${voffset -2}"
	end
	
	return cpus_stats
end
