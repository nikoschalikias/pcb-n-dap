#N-DAP_2.do 21 dec 2009, from BLCAMP,FLO
#core1_2.DO 14 APRIL 2007
#From CANMUX project
#CREATED FROM EURO386 AND GPS2 PROJECTS

###########  Advanced dofile  ############
#vset sets repaint in visual layers
vset Unroute oN
vset system Place_error off
view object_colors (set_color signal 2 BLUE)
repaint

#----- N-DAP ROULES --------------------------
#unit mil
#grid smart (wire 1) (via 1)

#unit mm
#grid smart (wire 0.0254) (via 0.0254)

unit mm
grid smart (wire 0.002) (via 0.002)

bestsave on F:\ORCAD4\ORCAD\N-DAP\N-DAP.bst
status_file F:\ORCAD4\ORCAD\N-DAP\N-DAP.sts

grid via 1 (direction x) (offset 0) 
grid via 1 (direction y) (offset 0) 


#rule net 3.3V (width 20)
#rule net VCC50 (width 30)
#rule net VCC33 (width 10)
#rule net DC-BAR (width 40)
#rule net GND  (width 20)

#rule net CAN-L (width 20)
#rule net CAN-H (width 20)


#rule PCB (width 5.905)
rule PCB (width 0.152)

#rule layer BottomLayer (width 16)
#rule layer MidLayer1 (width 16)

#rule PCB (clearance 5.905)
rule PCB (clearance 0.152)

#rule layer BottomLayer (clearance 10)
#rule layer MidLayer1 (clearance 10)

#circuit net GND (use_via  Via1)
#circuit net VCC (use_via  Via1)


CIRCUIT NET GND (PRIORITY 245)


#CRYSTAL CONNECTION
#circuit net X1 (priority 240)
#circuit net X2 (priority 240)
#circuit net RESET (priority 240)
#XTAL via keepout
#define (via_keepout (rect signal 5887 5322 5642 4894))
#define (via_keepout (rect signal 2560 2464.4 2969.7 2676.1))


#define (WIRE_keepout (rect  TOPLayer 5232.1 3236 5489.5 2903.5))


#FPGA
#define (region region1 (rect  BOTTOMLayer 6840 6058 7766 5132))
#define (region region2 (rect  TOPLayer 6840 6058 7766 5132))
#rule region region1 (width 10)
#rule region region1 (clearance 6)
#rule region region2 (width 10)
#rule region region2 (clearance 6)

rule net GND (junction_type supply_only)
# rule net VCC(junction_type supply_only)
rule net 3.3V (junction_type supply_only)

direction TopLayer orthogonal
select layer TopLayer

direction BottomLayer orthogonal
select layer BottomLayer

direction MidLayer1 orthogonal
select layer MidLayer1
view object_colors (set_color signal 2 lightmagenta)
repaint

#direction MidLayer2 orthogonal
#select layer MidLayer2

#direction MidLayer3 orthogonal
#select layer MidLayer2

#direction MidLayer4 orthogonal
#select layer MidLayer2




#-->
UNMITER

#fanout 3 (direction   in_out) (location anywhere) (max_len -1) (pin_type all)  (pin_share off) (via_share off) (smd_share off) (share_len -1)
#-->

clean 2


#smart_route
#critic

# not tested <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
LIMIT WAY 250

#>>>>>>>>deselected ******bus diagonal
#### Initial Route phase
route 5
if (complete_wire < 100)
      then (clean 5)
#
#### Route phase 1
setexpr count (5)
while (count >0 && complete_wire < 100)
      (
       setexpr comp_rate (complete_wire)
	   spread
       route 5 11; clean 5
       if (complete_wire < 100 && complete_wire > comp_rate)
          then (
                setexpr count (count - 1)
               )
          else (setexpr count (0))
      )
#
#### Route phase 2
 if (complete_wire < 100)
       then (clean 2)
 setexpr count2 (3)
 while (count2 >0 && complete_wire < 100)
       (
        setexpr comp_rate2 (complete_wire)
        route 25 16; clean 2
       if (complete_wire > comp_rate2)
           then (
                 setexpr count2 (count2 - 1)
                )
           else (
                 setexpr count2 (0)
                )
       )
#
#### Route phase 3    <<<<<<<*****simplified*********** delete conflicts added
 if (complete_wire > 99)
       then  (delete conflicts)  

 if (complete_wire < 100)
       then (clean 2)
 setexpr count3 (10)
 while (count3 >0 && complete_wire < 100)
       (
        setexpr comp_rate3 (complete_wire)
		if (complete_wire > 98.8)
			then  (delete conflicts)  
        route 23 16; clean 2
        setexpr count3 (count3 - 1)
       )




#### Final Cleanup
 clean 5
 write routes $/premiter.rte
#unit mil
#grid wire 1
 
unit mm
#grid wire 0.0254  # = 1 mil
grid wire 0.01  


#**********************************************************
#         POST ROUTE  MITER  (Sugessted by Greg Smith)
#**********************************************************
# miter(style diagonal)(pin 1)
# miter(style diagonal)
# unmiter
# miter(style diagonal)(pin 1)
# miter(style diagonal)

# miter (pin 1000)
# miter (pin 500)
# miter (pin 100)
# miter (pin 50)
# miter (pin 20)
# miter (slant 1000)
# miter (bend 2000 62)
# miter (bend 64 2)

# Post Route Nikos 
 spread
 clean
 critic
 center

write routes F:\orcad4\orcad\N-DAP\N-DAP.rte
report status F:\orcad4\orcad\N-DAP\final.sts


