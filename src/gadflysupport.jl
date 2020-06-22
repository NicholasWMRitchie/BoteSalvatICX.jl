using .Gadfly

#using Colors
#Gadfly.parse_colorant(c::Array{Colorant,1}) = c

function plotBoteSalvatICX(z::Integer)
    colors = [ "red", "green", "blue", "yellow", "lightgreen", "purple", "brown", "orange", "lightblue"]
    name = [ "K", "L1", "L2", "L3", "M1", "M2", "M3", "M4", "M5" ]
    lyr(bs, i, color) =
        Gadfly.layer(loge->log10(max(0.1, boteSalvatICX(bs.z, i, 10.0^loge) / 1.0e-24)), log10(bs.edge[i]), log10(1.0e9), Gadfly.Theme(default_color = color))
    bs = BoteSalvatElectron[z]
    idx = eachindex(bs.edge)
    layers = [ lyr(bs, i, colors[i]) for i in idx]
    Gadfly.plot(layers...,
      Gadfly.Guide.manual_color_key("Shell", name[idx], colors[idx]),
      Gadfly.Guide.xlabel("log(E) (eV)"), Guide.ylabel("log(σ) (barns)"),
      Gadfly.Coord.cartesian(xmin = round(log10(minimum(bs.edge)) - 0.5), xmax = 9.0, ymin = 0.0))
end

function plotBoteSalvatICXRatio(z::Integer)
    colors = [ "red", "green", "blue", "yellow", "lightgreen", "purple", "brown", "orange", "lightblue"]
    name = [ "K", "L1", "L2", "L3", "M1", "M2", "M3", "M4", "M5" ]
    lyr(i, ip, color) =
        Gadfly.layer(u->boteSalvatICX(z, i, u*boteSalvatEdgeEnergy(z,i)) / boteSalvatICX(z, ip, u*boteSalvatEdgeEnergy(z,ip)), 1.2, 10.0, Gadfly.Theme(default_color = color))
    layers = ( lyr(i, i>4 ? 5 : (i>1 ? 2 : 1), colors[i]) for i in eachindex(name) )
    Gadfly.plot(layers...,
      Gadfly.Guide.manual_color_key("Shell", name[eachindex(name)], colors[eachindex(name)]),
      Gadfly.Guide.xlabel("U (eV/eV)"), Guide.ylabel("σ/σ' (barns/barns)"),
      Gadfly.Coord.cartesian(xmin = 1.0, xmax = 10.0, ymin = 0.0))
end

function plotBoteSalvatICXRatio2(u::AbstractFloat)
    colors = [ "red", "green", "blue", "yellow", "lightgreen", "purple", "brown", "orange", "lightblue"]
    name = [ "K", "L1", "L2", "L3", "M1", "M2", "M3", "M4", "M5" ]
    function lyr(i, ip)
        zs = filter(z->( boteSalvatAvailable(z,i) && boteSalvatAvailable(z, ip)),1:92)
        xs = map(z->boteSalvatICX(z, i, u*boteSalvatEdgeEnergy(z,i)) / boteSalvatICX(z, ip, u*boteSalvatEdgeEnergy(z,ip)),zs)
        Gadfly.layer(x=zs, y=xs, Gadfly.Theme(default_color = colors[i]))
    end
    layers = ( lyr(i, i>4 ? 5 : (i>1 ? 2 : 1)) for i in eachindex(name) )
    Gadfly.plot(layers...,
      Gadfly.Guide.manual_color_key("Shell", name[eachindex(name)], colors[eachindex(name)]),
      Gadfly.Guide.xlabel("Atomic Number"), Guide.ylabel("σ/σ' (barns/barns)"),
      Gadfly.Coord.cartesian(xmin = 1.0, xmax = 92.0, ymin = 0.0))
end
