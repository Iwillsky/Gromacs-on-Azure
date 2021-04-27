# Gromacs-on-Azure

Run gromacs on Azure CycleCloud platform

**Introduction**

GROMACS is a versatile tool package to perform molecular dynamics. It is primarily designed for biochemical molecules like proteins, lipids and nucleic acids that have a lot of complicated bonded interactions. Latest version is 2021.1 with several new features and performance improvement. GROMACS can utilize GPU power to fasten the analysis.

Leveraging public cloud platform to build GROMACS system is agile without any CAPEX investment first. Azure provides rich HPC offerings to build high performance cluster, including HC, HB series powerful VMs and NC series Nvidia GPU VMs. Azure also provide CycleCloud platform to fasten the HPC cluster building and scale automatically according different workload. CycleCloud supports rich type HPC schedulers include SLURM, Grid Engine, LSF, PBS and etc., so on-premises HPC cluster can move to Azure cloud seamlessly. CycleCloud can integrates with existing Active Directory to protect sensitive HPC workloads securely. Cost alerting and controls plus performance monitoring features of CycleCloud help you get the most value from your environments.

This repo provides the guide how to build Gromacs cluster for Molecular Dynamics on Azure cloud with detailed instructions step by step.
    
![image](https://user-images.githubusercontent.com/45908192/116180315-465fc780-a74b-11eb-9e06-4d147d0384f5.png)
