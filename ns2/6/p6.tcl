set ns [new Simulator]
set nf [open p6.nam w]
$ns namtrace-all $nf
set nd [open p6.tr w]
$ns trace-all $nd
set er_rate 0.05

proc finish { } {
global ns nf nd
$ns flush-trace
close $nf
close $nd
exec nam p6.nam &
exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]

$n0 color blue
$n1 color red
$n2 color yellow
$n3 color purple
$n4 color green
$n5 color brown
$ns color 1 blue
$ns color 2 red

$ns duplex-link $n0 $n2 1Mb 10ms DropTail
$ns duplex-link $n1 $n2 600kb 10ms DropTail
$ns simplex-link $n2 $n3 1Mb 10ms DropTail
$ns simplex-link $n3 $n2 1Mb 10ms DropTail

set lan [$ns newLan "$n3 $n4 $n5" 4.5Mb 20ms LL Queue\DropTail MAC\Csma\Cd Channel]

$ns duplex-link-op $n0 $n2 orient right-down
$ns duplex-link-op $n1 $n2 orient right-up
$ns simplex-link-op $n2 $n3 orient right
$ns simplex-link-op $n3 $n2 orient left

set lm [new ErrorModel]
$lm ranvar [new RandomVariable/Uniform]
$lm drop-target [new Agent/Null]
$lm set rate_ $er_rate
$ns lossmodel $lm $n2 $n3

set tcp [new Agent/TCP]
$ns attach-agent $n0 $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n4 $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$tcp set packetSize_ 525
$tcp set fid_ 1

set udp [new Agent/UDP]
$ns attach-agent $n1 $udp
set null [new Agent/Null]
$ns attach-agent $n5 $null
$ns connect $udp $null
set cbr [new Application/Traffic/CBR]
$cbr set packetSize_ 500
$cbr attach-agent $udp
$cbr set interval_ 0.005
$udp set fid_ 2

$ns at 0.2 "$cbr start"
$ns at 0.4 "$ftp start"
$ns at 123.0 "$cbr stop"
$ns at 124.0 "$ftp stop"
$ns at 125.0 "finish"
$ns run
