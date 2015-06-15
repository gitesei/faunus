#!/bin/bash

function mkinput() {
echo '{
  "energy" : {
    "hydrophobicsasa" : {},
    "nonbonded" : {
      "cutoff_g2g" : '$cut_g2g',
      "ljsimple" : { "eps":0.05, "cutoff":'$cut_i2i' },
      "coulomb" : { "epsr" : 78.7, "ionicstrength":'$salt', "cutoff":'$cut_i2i' }
    }
  },

  "atomlist" : {
    "H3PO4":  { "q":0,  "r":2.0 },
    "H2PO4":  { "q":-1, "r":2.0 },
    "HPO4" :  { "q":-2, "r":2.0 },
    "PO4"  :  { "q":-3, "r":2.0 },
    "BPTI" :  { "q":7.3, "r":12.29 },
    "Na"   :  { "q": 1, "r":1.9, "mw":22.99 },
    "Cl"   :  { "q":-1, "r":1.7, "mw":35.45 },
    "I"    :  { "q":-1, "r":2.0, "mw":1 },
    "SCN"  :  { "q":-1, "r":2.0, "mw":1 },
    "ASP"  :  { "q":-1, "r":3.6, "mw":110 },
    "HASP" :  { "q":0,  "r":3.6, "mw":110 },
    "LASP" :  { "q":2,  "r":3.6, "mw":110 },
    "CTR"  :  { "q":-1, "r":2.0, "mw":16 },
    "HCTR" :  { "q":0,  "r":2.0, "mw":16 },
    "GLU"  :  { "q":-1, "r":3.8, "mw":122 },
    "HGLU" :  { "q":0,  "r":3.8, "mw":122 },
    "LGLU" :  { "q":2,  "r":3.8, "mw":122 },
    "HIS"  :  { "q":0,  "r":3.9, "mw":130 },
    "HHIS" :  { "q":1,  "r":3.9, "mw":130 },
    "NTR"  :  { "q":0,  "r":2.0, "mw":14 },
    "HNTR" :  { "q":1,  "r":2.0, "mw":14 },
    "TYR"  :  { "q":-1, "r":4.1, "mw":154 },
    "HTYR" :  { "q":0,  "r":4.1, "mw":154 },
    "LYS"  :  { "q":0,  "r":3.7, "mw":116 },
    "HLYS" :  { "q":1,  "r":3.7, "mw":116 },
    "CYS"  :  { "q":-1, "r":3.6, "mw":103 },
    "HCYS" :  { "q":0,  "r":3.6, "mw":103 },
    "ARG"  :  { "q":0,  "r":4.0, "mw":144 },
    "HARG" :  { "q":1,  "r":4.0, "mw":144 },
    "ALA"  :  { "q":0,  "r":3.1, "mw":66 },
    "ILE"  :  { "q":0,  "r":3.6, "mw":102 },
    "LEU"  :  { "q":0,  "r":3.6, "mw":102 },
    "MET"  :  { "q":0,  "r":3.8, "mw":122 },
    "PHE"  :  { "q":0,  "r":3.9, "mw":138 },
    "PRO"  :  { "q":0,  "r":3.4, "mw":90 },
    "TRP"  :  { "q":0,  "r":4.3, "mw":176 },
    "VAL"  :  { "q":0,  "r":3.4, "mw":90 },
    "SER"  :  { "q":0,  "r":3.3, "mw":82 },
    "THR"  :  { "q":0,  "r":3.5, "mw":94 },
    "ASN"  :  { "q":0,  "r":3.6, "mw":108 },
    "GLN"  :  { "q":0,  "r":3.8, "mw":120 },
    "GLY"  :  { "q":0,  "r":2.9, "mw":54 }
  },

  "processes" : {
    "H-Asp" : { "bound":"HASP" , "free":"ASP" , "pKd":4.0  , "pX":'$pH' },
    "H-Ctr" : { "bound":"HCTR" , "free":"CTR" , "pKd":2.6  , "pX":'$pH' },
    "H-Glu" : { "bound":"HGLU" , "free":"GLU" , "pKd":4.4  , "pX":'$pH' },
    "H-His" : { "bound":"HHIS" , "free":"HIS" , "pKd":6.3  , "pX":'$pH' },
    "H-Arg" : { "bound":"HARG" , "free":"ARG" , "pKd":12.0 , "pX":'$pH' },
    "H-Ntr" : { "bound":"HNTR" , "free":"NTR" , "pKd":7.5  , "pX":'$pH' },
    "H-Cys" : { "bound":"HCYS" , "free":"CYS" , "pKd":10.8 , "pX":'$pH' },
    "H-Tyr" : { "bound":"HTYR" , "free":"TYR" , "pKd":9.6  , "pX":'$pH' },
    "H-Lys" : { "bound":"HLYS" , "free":"LYS" , "pKd":10.4 , "pX":'$pH' },
    "K1"    : { "bound":"H3PO4", "free":"H2PO4","pKd":2.12,  "pX":'$pH' },
    "K2"    : { "bound":"H2PO4", "free":"HPO4", "pKd":7.21,  "pX":'$pH' },
    "K3"    : { "bound":"HPO4",  "free":"PO4",  "pKd":12.67, "pX":'$pH' }
  },

  "moleculelist": {
    "protein":  { "structure":"manybody.bpti", "Ninit":'$Np' }
  },

  "moves" : {
     "titrate" : { "prob":0.2, "processfile":"manybody.json" },
     "moltransrot" : {
       "protein" : { "dp":'$dp', "dprot":'$dprot', "prob":1.0, "permol":true } 
     } 
  },

  "analysis" : {
    "scatter" : { "qmin":0.05, "qmax":0.4, "dq":0.005, "cutoff":1e10 }
  },

  "system" : {
    "temperature" : 298.15,
    "cuboid"   : { "len" : '$boxlen' },
    "mcloop"   : { "macro":10, "micro":'$micro' },
    "unittest" : { "testfile":"manybody.test", "stable":false }
  }
}
' > manybody.json

echo "
monopole_charge        $Zp
monopole_radius        $Rp
" > manybody.input
} # end of mkinput

# Executable
exe=./manybody

# Protein charge (approximate, for counter ion calc.)
Zp=7.0

# Protein max radius used for cutoff determination
Rp=20. #17

# Number of protein molecules in simulation
Np=20

# 1:1 salt concentration (mol/l)
Cs=0.020

# Default displacements
dp=60
dprot=6

# Flow control
eqrun=true
prodrun=true
copy=false

# Protein concentration [mol/l]
for Cp in 0.004
do
  # Custom displacements for specific concentrations
  if [ "${Cp}" = "0.001496" ]; then dp=60; dprot=6; fi

  # Calc. simulation volume [aa^3]
  V=`python -c "print $Np/(1e-27*6.022e23*${Cp})"`
  boxlen=`python -c "print $V**(1/3.)"`

  # Counter ion contribution to ionic strength
  salt=`python -c "print 0.5*$Zp*$Cp + $Cs"`

  # Debye length and cutoff (3xDebye length)
  D=`python -c "print 3.04/${salt}**0.5"`
  cut_i2i=`python -c "print 3*$D"`
  cut_g2g=`python -c "print $Rp+$Rp+$cut_i2i"`

  for pH in 4.1
  do
    prefix="pH${pH}-Cp${Cp}"

    if [ "$eqrun" = true ]; then
      echo "Equilibration run...(state file deleted)"
      rm -fR state
      micro=100
      mkinput
      mpiexec -hosts "localhost:4" $exe
    fi

    if [ "$prodrun" = true ]; then
      echo "Production run..."
      micro=1000
      mkinput
      mpiexec -hosts "localhost:4" $exe #> $prefix.out
    fi

    if [ "$copy" = true ]; then
      mv confout.pqr $prefix.pqr
      mv avgcharge.pqr $prefix.avgcharge.pqr
      mv state $prefix.state
      mv debye.dat $prefix.debye
      mv rdf_p2p.dat $prefix.rdf
      mv manybody.input $prefix.input
    fi
  done
done

