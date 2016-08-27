Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:35657 "EHLO
        mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753953AbcH0Px2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 27 Aug 2016 11:53:28 -0400
MIME-Version: 1.0
From: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Date: Sat, 27 Aug 2016 18:52:42 +0300
Message-ID: <CAJ1xhMXZNMYMew4N2SZdhJm9FaiRjr=T63+72UdYpYfC+api_A@mail.gmail.com>
Subject: [v4.7.2: Oops] When loading IT87 HARDWARE MONITORING DRIVER
To: jdelvare@suse.com
Cc: linux-hwmon@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

I get an Oops when loading it87.ko on a 4.7.2 kernel. See below for details:

(1). ver_linux
If some fields are empty or look unusual you may have an old version.
Compare to the current minimal requirements in Documentation/Changes.

Linux box1 4.7.2-vanilla #7 SMP Sat Aug 27 09:20:18 EEST 2016 i686
Intel(R) Core(TM)2 Duo CPU E4600 @ 2.40GHz GenuineIntel GNU/Linux

GNU C               4.9.3
GNU Make             4.1
Binutils             2.25.1
Util-linux           2.26.2
Mount               2.26.2
Module-init-tools   22
E2fsprogs           1.42.13
Linux C Library     2.22
Dynamic linker (ldd) 2.22
Linux C++ Library   6.0.20
Procps               3.3.11
Net-tools           1.60
Kbd                 2.0.3
Console-tools       2.0.3
Sh-utils             8.23
Udev                 225
Modules Loaded       ch7006 coretemp crc_itu_t fuse gspca_main
hwmon_vid i2c_mux it87 ltc2990 mii nf_log_common nf_log_ipv4
nf_log_ipv6 nf_nat nf_nat_ftp nf_nat_ipv4 nf_nat_irc nf_nat_sip r8169
sil164 snd_aloop udf ulpi uvcvideo v4l2_common v4l2_dv_timings vgem
videobuf2_core videobuf2_memops videobuf2_v4l2 videobuf2_vmalloc
videodev xt_LOG xt_mark

(2). dmesg:
...
[    7.632397] it87: Found IT8718F chip at 0x290, revision 5
[    7.632419] it87: Beeping is supported
[    7.632628] BUG: unable to handle kernel NULL pointer dereference at 00000128
[    7.632966] IP: [<c11b53dc>] internal_create_group+0xec/0x2b0
[    7.633037] *pdpt = 00000000339da001 *pde = 0000000000000000
[    7.633037] Oops: 0000 [#1] SMP
[    7.634072] Modules linked in: it87(+) i2c_mux hwmon_vid gspca_main
v4l2_common videodev fuse crc_itu_t ch7006 r8169 mii coretemp
[    7.634072] CPU: 0 PID: 1537 Comm: modprobe Not tainted 4.7.2-vanilla #7
[    7.634072] Hardware name: Gigabyte Technology Co., Ltd.
P35-S3G/P35-S3G, BIOS F4 07/10/2008
[    7.634072] task: f4b2a300 ti: f2442000 task.ti: f2442000
[    7.634072] EIP: 0060:[<c11b53dc>] EFLAGS: 00010206 CPU: 0
[    7.634072] EIP is at internal_create_group+0xec/0x2b0
[    7.634072] EAX: 00000124 EBX: 00000000 ECX: 0000000d EDX: 000001ff
[    7.634072] ESI: f89cf278 EDI: 00000000 EBP: f2443bf0 ESP: f2443bd0
[    7.634072]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    7.634072] CR0: 80050033 CR2: 00000128 CR3: 33a11d00 CR4: 000006f0
[    7.634072] Stack:
[    7.634072]  f3b6c00c 0000002e 00000000 f3a4b750 f89cec5c 00000001
f3b6c80c f3b6c00c
[    7.634072]  f2443c08 c11b5683 00000000 f3b6c00c f3b6d20c 00000000
f2443c38 c14cc756
[    7.634072]  c1a7c840 00000000 f3b6c004 f2443c2c c14d9603 00000000
f3b6c004 f3b6c004
[    7.634072] Call Trace:
[    7.634072]  [<c11b5683>] sysfs_create_groups+0x33/0x90
[    7.634072]  [<c14cc756>] device_add+0x356/0x5a0
[    7.634072]  [<c14d9603>] ? pm_runtime_init+0xc3/0xd0
[    7.634072]  [<c14cc9b2>] device_register+0x12/0x20
[    7.634072]  [<c15b9733>] hwmon_device_register_with_groups.part.2+0x93/0xf0
[    7.634072]  [<c15b97de>] hwmon_device_register_with_groups+0x4e/0x60
[    7.634072]  [<c15b9835>] devm_hwmon_device_register_with_groups+0x45/0x80
[    7.634072]  [<f89cd5f1>] it87_probe+0x571/0x830 [it87]
[    7.634072]  [<c14d088a>] platform_drv_probe+0x2a/0x90
[    7.634072]  [<c14cee23>] driver_probe_device+0x1c3/0x280
[    7.634072]  [<c14ceffe>] __device_attach_driver+0x5e/0x90
[    7.634072]  [<c14cefa0>] ? driver_allows_async_probing+0x30/0x30
[    7.634072]  [<c14cd39f>] bus_for_each_drv+0x3f/0x70
[    7.634072]  [<c14ceb53>] __device_attach+0xa3/0x100
[    7.634072]  [<c14cefa0>] ? driver_allows_async_probing+0x30/0x30
[    7.634072]  [<c14cf15d>] device_initial_probe+0xd/0x10
[    7.634072]  [<c14ce27f>] bus_probe_device+0x6f/0x80
[    7.634072]  [<c14cc7ef>] device_add+0x3ef/0x5a0
[    7.634072]  [<c14d05e1>] platform_device_add+0xa1/0x220
[    7.634072]  [<f89d2796>] sm_it87_init+0x796/0x812 [it87]
[    7.634072]  [<f89d2000>] ? 0xf89d2000
[    7.634072]  [<c1000430>] do_one_initcall+0x30/0x130
[    7.634072]  [<c11489d4>] ? kfree+0x134/0x140
[    7.634072]  [<c11489d4>] ? kfree+0x134/0x140
[    7.634072]  [<c11495b5>] ? kmem_cache_alloc_trace+0xd5/0x1d0
[    7.634072]  [<c1107d33>] ? do_init_module+0x1c/0x191
[    7.634072]  [<c1107d33>] ? do_init_module+0x1c/0x191
[    7.634072]  [<c1107d62>] do_init_module+0x4b/0x191
[    7.634072]  [<c10b99e4>] load_module+0x15f4/0x1cf0
[    7.634072]  [<c115bc38>] ? kernel_read_file+0x1f8/0x220
[    7.634072]  [<c10ba239>] SyS_finit_module+0x69/0x80
[    7.634072]  [<c100187a>] do_fast_syscall_32+0x6a/0x140
[    7.634072]  [<c1785a5f>] sysenter_past_esp+0x40/0x6a
[    7.634072] Code: 81 e3 b4 11 00 00 6a 00 8b 45 ec 31 c9 53 8b 16
e8 da f4 ff ff 5a 59 85 c0 75 2c 83 c6 04 8b 06 83 45 e4 01 85 c0 74
77 8b 7d e8 <0f> b7 58 04 85 ff 74 a4 8b 10 31 c9 8b 45 ec e8 60 dd ff
ff eb
[    7.634072] EIP: [<c11b53dc>] internal_create_group+0xec/0x2b0
SS:ESP 0068:f2443bd0
[    7.634072] CR2: 0000000000000128
[    7.666639] ---[ end trace eab7ab871070673b ]---

(3). scripts/decodecode <it87_oops.txt
Code: 81 e3 b4 11 00 00 6a 00 8b 45 ec 31 c9 53 8b 16 e8 da f4 ff ff
5a 59 85 c0 75 2c 83 c6 04 8b 06 83 45 e4 01 85 c0 74 77 8b 7d e8 <0f>
b7 58 04 85 ff 74 a4 8b 10 31 c9 8b 45 ec e8 60 dd ff ff eb
All code
========
   0: 81 e3 b4 11 00 00     and    $0x11b4,%ebx
   6: 6a 00                 push   $0x0
   8: 8b 45 ec             mov    -0x14(%ebp),%eax
   b: 31 c9                 xor    %ecx,%ecx
   d: 53                   push   %ebx
   e: 8b 16                 mov    (%esi),%edx
  10: e8 da f4 ff ff       call   0xfffff4ef
  15: 5a                   pop    %edx
  16: 59                   pop    %ecx
  17: 85 c0                 test   %eax,%eax
  19: 75 2c                 jne    0x47
  1b: 83 c6 04             add    $0x4,%esi
  1e: 8b 06                 mov    (%esi),%eax
  20: 83 45 e4 01           addl   $0x1,-0x1c(%ebp)
  24: 85 c0                 test   %eax,%eax
  26: 74 77                 je     0x9f
  28: 8b 7d e8             mov    -0x18(%ebp),%edi
  2b:* 0f b7 58 04           movzwl 0x4(%eax),%ebx <-- trapping instruction
  2f: 85 ff                 test   %edi,%edi
  31: 74 a4                 je     0xffffffd7
  33: 8b 10                 mov    (%eax),%edx
  35: 31 c9                 xor    %ecx,%ecx
  37: 8b 45 ec             mov    -0x14(%ebp),%eax
  3a: e8 60 dd ff ff       call   0xffffdd9f
  3f: eb                   .byte 0xeb

Code starting with the faulting instruction
===========================================
   0: 0f b7 58 04           movzwl 0x4(%eax),%ebx
   4: 85 ff                 test   %edi,%edi
   6: 74 a4                 je     0xffffffac
   8: 8b 10                 mov    (%eax),%edx
   a: 31 c9                 xor    %ecx,%ecx
   c: 8b 45 ec             mov    -0x14(%ebp),%eax
   f: e8 60 dd ff ff       call   0xffffdd74
  14: eb                   .byte 0xeb

(4). (gdb) disassemble /r internal_create_group
Dump of assembler code for function internal_create_group:
   0xc11b52f0 <+0>: 55 push   %ebp
   0xc11b52f1 <+1>: 89 e5 mov    %esp,%ebp
   0xc11b52f3 <+3>: 57 push   %edi
   0xc11b52f4 <+4>: 56 push   %esi
   0xc11b52f5 <+5>: 53 push   %ebx
   0xc11b52f6 <+6>: 83 ec 14 sub    $0x14,%esp
   0xc11b52f9 <+9>: 85 c0 test   %eax,%eax
   0xc11b52fb <+11>: 0f 84 6f 02 00 00 je     0xc11b5570
<internal_create_group+640>
   0xc11b5301 <+17>: 85 d2 test   %edx,%edx
   0xc11b5303 <+19>: 0f 84 57 02 00 00 je     0xc11b5560
<internal_create_group+624>
   0xc11b5309 <+25>: 8b 78 18 mov    0x18(%eax),%edi
   0xc11b530c <+28>: 85 ff test   %edi,%edi
   0xc11b530e <+30>: 0f 84 7e 02 00 00 je     0xc11b5592
<internal_create_group+674>
   0xc11b5314 <+36>: 8b 71 0c mov    0xc(%ecx),%esi
   0xc11b5317 <+39>: 89 4d f0 mov    %ecx,-0x10(%ebp)
   0xc11b531a <+42>: 89 55 e8 mov    %edx,-0x18(%ebp)
   0xc11b531d <+45>: 89 45 e0 mov    %eax,-0x20(%ebp)
   0xc11b5320 <+48>: 85 f6 test   %esi,%esi
   0xc11b5322 <+50>: 0f 84 f8 01 00 00 je     0xc11b5520
<internal_create_group+560>
---Type <return> to continue, or q <return> to quit---
   0xc11b5328 <+56>: 8b 45 f0 mov    -0x10(%ebp),%eax
   0xc11b532b <+59>: 8b 10 mov    (%eax),%edx
   0xc11b532d <+61>: 85 d2 test   %edx,%edx
   0xc11b532f <+63>: 0f 84 db 01 00 00 je     0xc11b5510
<internal_create_group+544>
   0xc11b5335 <+69>: 8b 7d e0 mov    -0x20(%ebp),%edi
   0xc11b5338 <+72>: b9 ed 01 00 00 mov    $0x1ed,%ecx
   0xc11b533d <+77>: 8b 47 18 mov    0x18(%edi),%eax
   0xc11b5340 <+80>: 6a 00 push   $0x0
   0xc11b5342 <+82>: 57 push   %edi
   0xc11b5343 <+83>: e8 f8 da ff ff call   0xc11b2e40 <kernfs_create_dir_ns>
   0xc11b5348 <+88>: 5a pop    %edx
   0xc11b5349 <+89>: 89 45 ec mov    %eax,-0x14(%ebp)
   0xc11b534c <+92>: 59 pop    %ecx
   0xc11b534d <+93>: 3d 00 f0 ff ff cmp    $0xfffff000,%eax
   0xc11b5352 <+98>: 0f 87 1a 02 00 00 ja     0xc11b5572
<internal_create_group+642>
   0xc11b5358 <+104>: 8b 45 ec mov    -0x14(%ebp),%eax
   0xc11b535b <+107>: e8 00 c5 ff ff call   0xc11b1860 <kernfs_get>
   0xc11b5360 <+112>: 8b 45 f0 mov    -0x10(%ebp),%eax
   0xc11b5363 <+115>: 8b 70 0c mov    0xc(%eax),%esi
   0xc11b5366 <+118>: 85 f6 test   %esi,%esi
   0xc11b5368 <+120>: 0f 84 e2 00 00 00 je     0xc11b5450
<internal_cre---Type <return> to continue, or q <return> to quit---
ate_group+352>
   0xc11b536e <+126>: 8b 06 mov    (%esi),%eax
   0xc11b5370 <+128>: 85 c0 test   %eax,%eax
   0xc11b5372 <+130>: 0f 84 d8 00 00 00 je     0xc11b5450
<internal_create_group+352>
   0xc11b5378 <+136>: c7 45 e4 00 00 00 00 movl   $0x0,-0x1c(%ebp)
   0xc11b537f <+143>: eb 58 jmp    0xc11b53d9 <internal_create_group+233>
   0xc11b5381 <+145>: 8d b4 26 00 00 00 00 lea    0x0(%esi,%eiz,1),%esi
   0xc11b5388 <+152>: 8b 45 f0 mov    -0x10(%ebp),%eax
   0xc11b538b <+155>: 8b 78 04 mov    0x4(%eax),%edi
   0xc11b538e <+158>: 85 ff test   %edi,%edi
   0xc11b5390 <+160>: 74 11 je     0xc11b53a3 <internal_create_group+179>
   0xc11b5392 <+162>: 8b 4d e4 mov    -0x1c(%ebp),%ecx
   0xc11b5395 <+165>: 8b 16 mov    (%esi),%edx
   0xc11b5397 <+167>: 8b 45 e0 mov    -0x20(%ebp),%eax
   0xc11b539a <+170>: ff d7 call   *%edi
   0xc11b539c <+172>: 89 c3 mov    %eax,%ebx
   0xc11b539e <+174>: 66 85 c0 test   %ax,%ax
   0xc11b53a1 <+177>: 74 29 je     0xc11b53cc <internal_create_group+220>
   0xc11b53a3 <+179>: 0f b7 c3 movzwl %bx,%eax
   0xc11b53a6 <+182>: a9 4b ee 00 00 test   $0xee4b,%eax
   0xc11b53ab <+187>: 0f 85 7f 00 00 00 jne    0xc11b5430
<internal_create_group+320>
   0xc11b53b1 <+193>: 81 e3 b4 11 00 00 and    $0x11b4,%ebx
---Type <return> to continue, or q <return> to quit---
   0xc11b53b7 <+199>: 6a 00 push   $0x0
   0xc11b53b9 <+201>: 8b 45 ec mov    -0x14(%ebp),%eax
   0xc11b53bc <+204>: 31 c9 xor    %ecx,%ecx
   0xc11b53be <+206>: 53 push   %ebx
   0xc11b53bf <+207>: 8b 16 mov    (%esi),%edx
   0xc11b53c1 <+209>: e8 da f4 ff ff call   0xc11b48a0 <sysfs_add_file_mode_ns>
   0xc11b53c6 <+214>: 5a pop    %edx
   0xc11b53c7 <+215>: 59 pop    %ecx
   0xc11b53c8 <+216>: 85 c0 test   %eax,%eax
   0xc11b53ca <+218>: 75 2c jne    0xc11b53f8 <internal_create_group+264>
   0xc11b53cc <+220>: 83 c6 04 add    $0x4,%esi
   0xc11b53cf <+223>: 8b 06 mov    (%esi),%eax
   0xc11b53d1 <+225>: 83 45 e4 01 addl   $0x1,-0x1c(%ebp)
   0xc11b53d5 <+229>: 85 c0 test   %eax,%eax
   0xc11b53d7 <+231>: 74 77 je     0xc11b5450 <internal_create_group+352>
   0xc11b53d9 <+233>: 8b 7d e8 mov    -0x18(%ebp),%edi
   0xc11b53dc <+236>: 0f b7 58 04 movzwl 0x4(%eax),%ebx
   0xc11b53e0 <+240>: 85 ff test   %edi,%edi
   0xc11b53e2 <+242>: 74 a4 je     0xc11b5388 <internal_create_group+152>
   0xc11b53e4 <+244>: 8b 10 mov    (%eax),%edx
   0xc11b53e6 <+246>: 31 c9 xor    %ecx,%ecx
   0xc11b53e8 <+248>: 8b 45 ec mov    -0x14(%ebp),%eax
   0xc11b53eb <+251>: e8 60 dd ff ff call   0xc11b3150
<kernfs_remove_by_nam---Type <return> to continue, or q <return> to
quit---
e_ns>
   0xc11b53f0 <+256>: eb 96 jmp    0xc11b5388 <internal_create_group+152>
   0xc11b53f2 <+258>: 8d b6 00 00 00 00 lea    0x0(%esi),%esi
   0xc11b53f8 <+264>: 89 c3 mov    %eax,%ebx
   0xc11b53fa <+266>: 8b 45 f0 mov    -0x10(%ebp),%eax
   0xc11b53fd <+269>: 8d 48 10 lea    0x10(%eax),%ecx
   0xc11b5400 <+272>: 8b 50 0c mov    0xc(%eax),%edx
   0xc11b5403 <+275>: 8b 45 ec mov    -0x14(%ebp),%eax
   0xc11b5406 <+278>: e8 85 fe ff ff call   0xc11b5290 <remove_files>
   0xc11b540b <+283>: 8b 45 f0 mov    -0x10(%ebp),%eax
   0xc11b540e <+286>: 8b 00 mov    (%eax),%eax
   0xc11b5410 <+288>: 85 c0 test   %eax,%eax
   0xc11b5412 <+290>: 74 08 je     0xc11b541c <internal_create_group+300>
   0xc11b5414 <+292>: 8b 45 ec mov    -0x14(%ebp),%eax
   0xc11b5417 <+295>: e8 c4 db ff ff call   0xc11b2fe0 <kernfs_remove>
   0xc11b541c <+300>: 8b 45 ec mov    -0x14(%ebp),%eax
   0xc11b541f <+303>: e8 5c ca ff ff call   0xc11b1e80 <kernfs_put>
   0xc11b5424 <+308>: 8d 65 f4 lea    -0xc(%ebp),%esp
   0xc11b5427 <+311>: 89 d8 mov    %ebx,%eax
   0xc11b5429 <+313>: 5b pop    %ebx
   0xc11b542a <+314>: 5e pop    %esi
   0xc11b542b <+315>: 5f pop    %edi
   0xc11b542c <+316>: 5d pop    %ebp
   0xc11b542d <+317>: c3 ret
---Type <return> to continue, or q <return> to quit---
   0xc11b542e <+318>: 66 90 xchg   %ax,%ax
   0xc11b5430 <+320>: 50 push   %eax
   0xc11b5431 <+321>: 8b 06 mov    (%esi),%eax
   0xc11b5433 <+323>: ff 30 pushl  (%eax)
   0xc11b5435 <+325>: 68 08 40 91 c1 push   $0xc1914008
   0xc11b543a <+330>: 6a 3d push   $0x3d
   0xc11b543c <+332>: 68 65 5a 92 c1 push   $0xc1925a65
   0xc11b5441 <+337>: e8 aa 3c e9 ff call   0xc10490f0 <warn_slowpath_fmt>
   0xc11b5446 <+342>: 83 c4 14 add    $0x14,%esp
   0xc11b5449 <+345>: e9 63 ff ff ff jmp    0xc11b53b1
<internal_create_group+193>
   0xc11b544e <+350>: 66 90 xchg   %ax,%ax
   0xc11b5450 <+352>: 8b 45 f0 mov    -0x10(%ebp),%eax
   0xc11b5453 <+355>: 8b 70 10 mov    0x10(%eax),%esi
   0xc11b5456 <+358>: 85 f6 test   %esi,%esi
   0xc11b5458 <+360>: 0f 84 aa 00 00 00 je     0xc11b5508
<internal_create_group+536>
   0xc11b545e <+366>: 8b 06 mov    (%esi),%eax
   0xc11b5460 <+368>: 85 c0 test   %eax,%eax
   0xc11b5462 <+370>: 0f 84 a0 00 00 00 je     0xc11b5508
<internal_create_group+536>
   0xc11b5468 <+376>: c7 45 e4 00 00 00 00 movl   $0x0,-0x1c(%ebp)
   0xc11b546f <+383>: eb 5b jmp    0xc11b54cc <internal_create_group+476>
   0xc11b5471 <+385>: 8d b4 26 00 00 00 00 lea    0x0(%esi,%eiz,1),%esi
---Type <return> to continue, or q <return> to quit---
   0xc11b5478 <+392>: 8b 45 f0 mov    -0x10(%ebp),%eax
   0xc11b547b <+395>: 8b 78 08 mov    0x8(%eax),%edi
   0xc11b547e <+398>: 85 ff test   %edi,%edi
   0xc11b5480 <+400>: 74 11 je     0xc11b5493 <internal_create_group+419>
   0xc11b5482 <+402>: 8b 4d e4 mov    -0x1c(%ebp),%ecx
   0xc11b5485 <+405>: 8b 16 mov    (%esi),%edx
   0xc11b5487 <+407>: 8b 45 e0 mov    -0x20(%ebp),%eax
   0xc11b548a <+410>: ff d7 call   *%edi
   0xc11b548c <+412>: 89 c3 mov    %eax,%ebx
   0xc11b548e <+414>: 66 85 c0 test   %ax,%ax
   0xc11b5491 <+417>: 74 2c je     0xc11b54bf <internal_create_group+463>
   0xc11b5493 <+419>: 0f b7 c3 movzwl %bx,%eax
   0xc11b5496 <+422>: a9 4b ee 00 00 test   $0xee4b,%eax
   0xc11b549b <+427>: 75 4b jne    0xc11b54e8 <internal_create_group+504>
   0xc11b549d <+429>: 81 e3 b4 11 00 00 and    $0x11b4,%ebx
   0xc11b54a3 <+435>: 6a 00 push   $0x0
   0xc11b54a5 <+437>: 8b 45 ec mov    -0x14(%ebp),%eax
   0xc11b54a8 <+440>: b9 01 00 00 00 mov    $0x1,%ecx
   0xc11b54ad <+445>: 53 push   %ebx
   0xc11b54ae <+446>: 8b 16 mov    (%esi),%edx
   0xc11b54b0 <+448>: e8 eb f3 ff ff call   0xc11b48a0 <sysfs_add_file_mode_ns>
   0xc11b54b5 <+453>: 5a pop    %edx
   0xc11b54b6 <+454>: 59 pop    %ecx
---Type <return> to continue, or q <return> to quit---
   0xc11b54b7 <+455>: 85 c0 test   %eax,%eax
   0xc11b54b9 <+457>: 0f 85 39 ff ff ff jne    0xc11b53f8
<internal_create_group+264>
   0xc11b54bf <+463>: 83 c6 04 add    $0x4,%esi
   0xc11b54c2 <+466>: 8b 06 mov    (%esi),%eax
   0xc11b54c4 <+468>: 83 45 e4 01 addl   $0x1,-0x1c(%ebp)
   0xc11b54c8 <+472>: 85 c0 test   %eax,%eax
   0xc11b54ca <+474>: 74 3c je     0xc11b5508 <internal_create_group+536>
   0xc11b54cc <+476>: 8b 7d e8 mov    -0x18(%ebp),%edi
   0xc11b54cf <+479>: 0f b7 58 04 movzwl 0x4(%eax),%ebx
   0xc11b54d3 <+483>: 85 ff test   %edi,%edi
   0xc11b54d5 <+485>: 74 a1 je     0xc11b5478 <internal_create_group+392>
   0xc11b54d7 <+487>: 8b 10 mov    (%eax),%edx
   0xc11b54d9 <+489>: 31 c9 xor    %ecx,%ecx
   0xc11b54db <+491>: 8b 45 ec mov    -0x14(%ebp),%eax
   0xc11b54de <+494>: e8 6d dc ff ff call   0xc11b3150
<kernfs_remove_by_name_ns>
   0xc11b54e3 <+499>: eb 93 jmp    0xc11b5478 <internal_create_group+392>
   0xc11b54e5 <+501>: 8d 76 00 lea    0x0(%esi),%esi
   0xc11b54e8 <+504>: 50 push   %eax
   0xc11b54e9 <+505>: 8b 06 mov    (%esi),%eax
   0xc11b54eb <+507>: ff 30 pushl  (%eax)
   0xc11b54ed <+509>: 68 08 40 91 c1 push   $0xc1914008
   0xc11b54f2 <+514>: 6a 5a push   $0x5a
---Type <return> to continue, or q <return> to quit---
   0xc11b54f4 <+516>: 68 65 5a 92 c1 push   $0xc1925a65
   0xc11b54f9 <+521>: e8 f2 3b e9 ff call   0xc10490f0 <warn_slowpath_fmt>
   0xc11b54fe <+526>: 83 c4 14 add    $0x14,%esp
   0xc11b5501 <+529>: eb 9a jmp    0xc11b549d <internal_create_group+429>
   0xc11b5503 <+531>: 90 nop
   0xc11b5504 <+532>: 8d 74 26 00 lea    0x0(%esi,%eiz,1),%esi
   0xc11b5508 <+536>: 31 db xor    %ebx,%ebx
   0xc11b550a <+538>: e9 0d ff ff ff jmp    0xc11b541c
<internal_create_group+300>
   0xc11b550f <+543>: 90 nop
   0xc11b5510 <+544>: 8b 45 e0 mov    -0x20(%ebp),%eax
   0xc11b5513 <+547>: 8b 40 18 mov    0x18(%eax),%eax
   0xc11b5516 <+550>: 89 45 ec mov    %eax,-0x14(%ebp)
   0xc11b5519 <+553>: e9 3a fe ff ff jmp    0xc11b5358
<internal_create_group+104>
   0xc11b551e <+558>: 66 90 xchg   %ax,%ax
   0xc11b5520 <+560>: 8b 59 10 mov    0x10(%ecx),%ebx
   0xc11b5523 <+563>: 85 db test   %ebx,%ebx
   0xc11b5525 <+565>: 0f 85 fd fd ff ff jne    0xc11b5328
<internal_create_group+56>
   0xc11b552b <+571>: 8b 01 mov    (%ecx),%eax
   0xc11b552d <+573>: ba df bc 90 c1 mov    $0xc190bcdf,%edx
   0xc11b5532 <+578>: bb ea ff ff ff mov    $0xffffffea,%ebx
   0xc11b5537 <+583>: 85 c0 test   %eax,%eax
---Type <return> to continue, or q <return> to quit---
   0xc11b5539 <+585>: 0f 44 c2 cmove  %edx,%eax
   0xc11b553c <+588>: 50 push   %eax
   0xc11b553d <+589>: 8b 45 e0 mov    -0x20(%ebp),%eax
   0xc11b5540 <+592>: ff 30 pushl  (%eax)
   0xc11b5542 <+594>: 68 cc 3f 91 c1 push   $0xc1913fcc
   0xc11b5547 <+599>: 6a 78 push   $0x78
   0xc11b5549 <+601>: 68 65 5a 92 c1 push   $0xc1925a65
   0xc11b554e <+606>: e8 9d 3b e9 ff call   0xc10490f0 <warn_slowpath_fmt>
   0xc11b5553 <+611>: 83 c4 14 add    $0x14,%esp
   0xc11b5556 <+614>: e9 c9 fe ff ff jmp    0xc11b5424
<internal_create_group+308>
   0xc11b555b <+619>: 90 nop
   0xc11b555c <+620>: 8d 74 26 00 lea    0x0(%esi,%eiz,1),%esi
   0xc11b5560 <+624>: 8b 58 18 mov    0x18(%eax),%ebx
   0xc11b5563 <+627>: 85 db test   %ebx,%ebx
   0xc11b5565 <+629>: 0f 85 a9 fd ff ff jne    0xc11b5314
<internal_create_group+36>
   0xc11b556b <+635>: 90 nop
   0xc11b556c <+636>: 8d 74 26 00 lea    0x0(%esi,%eiz,1),%esi
   0xc11b5570 <+640>: 0f 0b ud2
   0xc11b5572 <+642>: 89 c3 mov    %eax,%ebx
   0xc11b5574 <+644>: 83 f8 ef cmp    $0xffffffef,%eax
   0xc11b5577 <+647>: 0f 85 a7 fe ff ff jne    0xc11b5424
<internal_create_group+308>
---Type <return> to continue, or q <return> to quit---
   0xc11b557d <+653>: 8b 45 e0 mov    -0x20(%ebp),%eax
   0xc11b5580 <+656>: 8b 7d f0 mov    -0x10(%ebp),%edi
   0xc11b5583 <+659>: 8b 40 18 mov    0x18(%eax),%eax
   0xc11b5586 <+662>: 8b 17 mov    (%edi),%edx
   0xc11b5588 <+664>: e8 63 f6 ff ff call   0xc11b4bf0 <sysfs_warn_dup>
   0xc11b558d <+669>: e9 92 fe ff ff jmp    0xc11b5424
<internal_create_group+308>
   0xc11b5592 <+674>: bb ea ff ff ff mov    $0xffffffea,%ebx
   0xc11b5597 <+679>: e9 88 fe ff ff jmp    0xc11b5424
<internal_create_group+308>
End of assembler dump.

Please let me know if you require further details.

Thanks.
