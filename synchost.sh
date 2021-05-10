#!/bin/bash
ThisNodename=`grep "SLURMD_OPTIONS=-N " /etc/sysconfig/slurmd | awk '{print $NF}'`
Hostlistfile=$1
echo $ThisNodename >> $Hostlistfile