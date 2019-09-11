using .Gadfly

function plotBoteSalvatICX(z::Integer)
    colors = [ "red", "green", "blue", "yellow", "lightgreen", "purple", "brown", "orange", "lightblue"]
    name = [ "K", "L1", "L2", "L3", "M1", "M2", "M3", "M4", "M5" ]
    lyr(bs, i, color) =
        Gadfly.layer(loge->log10(max(0.1, boteSalvatICX(bs.z, i, 10.0^loge) / 1.0e-24)), log10(bs.edge[i]), log10(1.0e9), Gadfly.Theme(default_color = color))
    bs = BoteSalvatElectron[z]
    layers = []
    for i in eachindex(bs.edge)
        push!(layers, lyr(bs, i, colors[i]))
    end
    idx = 1:length(bs.edge)
    Gadfly.plot(layers...,
      Gadfly.Guide.manual_color_key("Shell", name[idx], colors[idx]),
      Gadfly.Guide.xlabel("log(E) (eV)"), Guide.ylabel("log(σ) (barns)"),
      Gadfly.Coord.cartesian(xmin = round(log10(minimum(bs.edge)) - 0.5), xmax = 9.0, ymin = 0.0))
end
