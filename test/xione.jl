# Tests boteSalvatICX, boteSalvatEdgeEnergy and boteSalvatAvailable
using Test
using BoteSalvatICX

@testset "ICX" begin

    # Comparing with values generated by xion.f
    @test isapprox(boteSalvatICX(12,4,7.71792E+01),3.85315E-18,atol=3e-20)
    @test isapprox(boteSalvatICX(12,4,1.29569E+04),1.24124E-18,atol=1e-20)
    @test isapprox(boteSalvatICX(12,4,5.78762E+06),1.30393E-19,atol=1e-21)

    @test isapprox(boteSalvatICX(23,2,2.90068E+08),5.64142E-21,atol=1e-23)
    @test isapprox(boteSalvatICX(23,2,1.53993E+04),2.63509E-20,atol=1e-22)

    @test isapprox(boteSalvatICX(45,7,6.68344E+08),1.62343E-20,atol=1e-22)
    @test isapprox(boteSalvatICX(45,7,1.22321E+03),2.11571E-19,atol=2e-21)

    @test isapprox(boteSalvatICX(67,1,1.63117E+05),1.36404E-23,atol=1e-25)
    @test isapprox(boteSalvatICX(78,9,2.98538E+03),2.02808E-20,atol=1e-22)

    @test isapprox(boteSalvatICX(99,3,1.00000E+09),1.39024E-22,atol=1e-24)
    @test isapprox(boteSalvatICX(99,3,2.66073E+04),3.85171E-24,atol=1e-25)

    @test isapprox(boteSalvatICX(1,1,6.87860E+02),1.57729E-17,atol=1e-19)

end

@testset "EdgeEnergy" begin
    # Not a very good set of values...
    @test isapprox(boteSalvatEdgeEnergy(67,9),1.36386E+3,atol=4.0)
    @test isapprox(boteSalvatEdgeEnergy(57,4),5.48366E+3,atol=4.0)
    @test isapprox(boteSalvatEdgeEnergy(42,1),1.99691E+4,atol=40.0)
    @test isapprox(boteSalvatEdgeEnergy(42,1),1.99691E+4,atol=40.0)
end

@testset "Available" begin
    @test boteSalvatAvailable(1,1)==true
    @test boteSalvatAvailable(1,2)==false
    @test boteSalvatAvailable(11,2)==true
    @test boteSalvatAvailable(12,4)==true
    @test boteSalvatAvailable(12,5)==false
    @test boteSalvatAvailable(26,6)==true
    @test all(i->boteSalvatAvailable(33,i),1:9)
    @test boteSalvatAvailable(33,10)==false
    @test all(z->boteSalvatAvailable(z,9),33:99)
end
