# poc-kerberos-linux

## Prérequis :

Mon PC a été monté sur un portable faisant tourner un Ubuntu Desktop 20.04

```
$ lsb_release -a
```

```
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 20.04.2 LTS
Release:	20.04
Codename:	focal
```

Configuration physique :

```
$ lscpu
```

```
$ lscpu
Architecture :                          x86_64
Mode(s) opératoire(s) des processeurs : 32-bit, 64-bit
Boutisme :                              Little Endian
Address sizes:                          39 bits physical, 48 bits virtual
Processeur(s) :                         8
Liste de processeur(s) en ligne :       0-7
Thread(s) par cœur :                    2
Cœur(s) par socket :                    4
Socket(s) :                             1
Nœud(s) NUMA :                          1
Identifiant constructeur :              GenuineIntel
Famille de processeur :                 6
Modèle :                                94
Nom de modèle :                         Intel(R) Core(TM) i7-6820HK CPU @ 2.70GHz
Révision :                              3
Vitesse du processeur en MHz :          800.071
Vitesse maximale du processeur en MHz : 3600,0000
Vitesse minimale du processeur en MHz : 800,0000
BogoMIPS :                              5399.81
Virtualisation :                        VT-x
Cache L1d :                             128 KiB
Cache L1i :                             128 KiB
Cache L2 :                              1 MiB
Cache L3 :                              8 MiB
Nœud NUMA 0 de processeur(s) :          0-7
Vulnerability Itlb multihit:            KVM: Mitigation: Split huge pages
Vulnerability L1tf:                     Mitigation; PTE Inversion; VMX conditional cache flushes, SMT vulnerable
Vulnerability Mds:                      Mitigation; Clear CPU buffers; SMT vulnerable
Vulnerability Meltdown:                 Mitigation; PTI
Vulnerability Spec store bypass:        Mitigation; Speculative Store Bypass disabled via prctl and seccomp
Vulnerability Spectre v1:               Mitigation; usercopy/swapgs barriers and __user pointer sanitization
Vulnerability Spectre v2:               Mitigation; Full generic retpoline, IBPB conditional, IBRS_FW, STIBP conditional, RSB filling
Vulnerability Srbds:                    Mitigation; Microcode
Vulnerability Tsx async abort:          Mitigation; Clear CPU buffers; SMT vulnerable
Drapaux :                               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_
                                        perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2ap
                                        ic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority
                                         ept vpid ept_ad fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pt
                                        s hwp hwp_notify hwp_act_window hwp_epp md_clear flush_l1d
```

Installation de Visual Studio Code

```
$ code --version
```

```
1.56.2
054a9295330880ed74ceaedda236253b4f39a335
x64
```

Installation de Git

```
$ git --version
```

```
git version 2.31.1
```

Installation de Oracle VM VirtualBox

```
$ vboxmanage --version
```

```
6.1.22r144080
```

Installation de Hashicorp Vagrant

```
$ vagrant --version
```

```
Vagrant 2.2.16
```

