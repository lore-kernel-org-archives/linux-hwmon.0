Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7C117D2
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Feb 2024 00:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708476124; cv=none; b=tuEt3bSnmHXIA/Ixgxb/h5o+UjyfXjeYDCYAZrmZMM7CkUxi56hk1bydOvX5QaihG5DbZfuuQIC0BSTG0Kxk4LbRrn9pnH/pMmtvyQuAtHPea8m5HQtgbfJLbW09lxb/7MzrGcaAfc0nOT+lhnkURlVKa1Gjfb5lMpopzjGbmPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708476124; c=relaxed/simple;
	bh=zby7jgnRW5M1DOfK++ofOBBPL8fT6bEDBTq6UzyNV9I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rDreRrSGQp4Dbzy7Q3gql/zZlbic4dGE5O1XC0Vt5H32ReyJAQa0RJzKxCe0ewBs1crbbuQS1BzZbFYaVuGWxgRCQCNP9+YFviqB/E6WvV6iuFPkQbF0PnVMRq5lY+b4hMDrr5v8HvcVPYYpfc+dPplN5pqLJjhRZ/btYZXYSh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QL8s6R1i; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="QL8s6R1i"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Tfcsy3LTjz9str;
	Wed, 21 Feb 2024 01:41:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1708476118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6DMWrSEQkRCNU8fCpRiQQgBxoIpd+3qP91m/6TUBbDU=;
	b=QL8s6R1i81xJPW9KZGWC+kOWR9R5MM736C72uMI5r13WyZYqPr4aDHbKSgz1qUUL2KX8qi
	CJ9lePG/RHXoRvKWgAGUglaeEKn9M9ao+qYHRfULJsJRbpRgilxKnFBVocC1deFGj2xhfq
	o3HVC8ssJXw06xccZ4ANv7K7w/NuTFl1vqqFySxw68HEcNjD7cBLv/2riuemL2eGjgO5KF
	2MJt7fFPRZnGDEAsi4q7M8qa718NrWiGKinMkZO4MmyjUj3whCFFK7Ur7EziQwmJCv1esm
	mlzAaPiBOMNSax5S/nraSnNdHK3zeSY1ovQqmDbl9EfPiN6yGCvlzxGzZa1ljA==
Date: Wed, 21 Feb 2024 01:41:52 +0100
From: Erhard Furtner <erhard_f@mailbox.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: BUG: KASAN: global-out-of-bounds in nct6775_probe+0x5654/0x6fe9
 [nct6775_core] (kernel 6.8-rc5, amd64)
Message-ID: <20240221014152.53b995d4@yea>
In-Reply-To: <324097c7-05c3-47b5-b0ca-3593ce25ebbf@roeck-us.net>
References: <20240220140110.311652f6@yea>
	<324097c7-05c3-47b5-b0ca-3593ce25ebbf@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-META: zrja3r9ft8tpuma5fe9hopkp9zwpwdmy
X-MBO-RS-ID: 6db9f7b658aa2ab1f02

On Tue, 20 Feb 2024 07:45:18 -0800
Guenter Roeck <linux@roeck-us.net> wrote:


> Would it be possible to run the stack trace through scripts/decode/stackt=
race.sh ?
> I am having trouble associating the backtrace with the actual source.
>=20
> Also, did you by any chance try the same configuration on the same system=
 with
> a pre-6.8 kernel ? The source code locations I did find (unless they are =
completely
> off) point to code that wasn't changed on after v6.7, so it would help to=
 understand
> if this is a new problem or one that is exposed by your board.

Hi G=C3=BCnter!

I tried v6.6 just now and got the issue there too.

./scripts/decode_stacktrace.sh /boot/vmlinuz-6.8.0-rc5-Zen3 < ~ef/dmesg_68-=
rc5_zen3_v01

gives me:

[...]
nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
BTRFS info (device nvme0n1p7: state M): use lzo compression, level 0
loop: module loaded
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: global-out-of-bounds in nct6775_probe+0x5654/0x6fe9 nct6775_core
systemd-journald[867]: Collecting audit messages is disabled.
Read of size 2 at addr ffffffffc0863104 by task systemd-modules/868

CPU: 23 PID: 868 Comm: systemd-modules Not tainted 6.8.0-rc5-Zen3 #3
Hardware name: To Be Filled By O.E.M. B550M Pro4/B550M Pro4, BIOS P3.40 01/=
18/2024
systemd[1]: Mounted dev-hugepages.mount.
Call Trace:
 <TASK>
dump_stack_lvl+0x37/0x52=20
print_report+0x17e/0x505=20
? nct6775_reg_read (/usr/src/linux-6.7.4-gentoo/drivers/hwmon/nct6775-platf=
orm.c:352) nct6775
? srso_alias_return_thunk+0x5/0xfbef5=20
? nct6775_probe+0x5654/0x6fe9 nct6775_core
kasan_report+0xb9/0xe4=20
? nct6775_probe+0x5654/0x6fe9 nct6775_core
nct6775_probe+0x5654/0x6fe9 nct6775_core
? show_tsi_temp+0xa7/0xa7 nct6775_core
? srso_alias_return_thunk+0x5/0xfbef5=20
? add_dr+0x77/0x11f=20
? srso_alias_return_thunk+0x5/0xfbef5=20
? do_raw_spin_unlock+0x5d/0x1b6=20
? srso_alias_return_thunk+0x5/0xfbef5=20
? srso_alias_return_thunk+0x5/0xfbef5=20
? srso_alias_return_thunk+0x5/0xfbef5=20
? nct6775_platform_probe (/usr/src/linux-6.7.4-gentoo/drivers/hwmon/nct6775=
-platform.c:974) nct6775
platform_probe+0xe0/0x153=20
really_probe+0x28a/0x57b=20
? driver_probe_device+0xc7/0xc7=20
__driver_probe_device+0x20b/0x265=20
? driver_probe_device+0xc7/0xc7=20
driver_probe_device+0x45/0xc7=20
__device_attach_driver+0x15e/0x1b4=20
bus_for_each_drv+0x12c/0x15c=20
? __cond_resched+0x58/0x63=20
? bus_rescan_devices+0x14/0x14=20
? _raw_spin_unlock_irqrestore+0xd/0x1e=20
? srso_alias_return_thunk+0x5/0xfbef5=20
__device_attach+0x19a/0x241=20
? device_driver_attach+0x95/0x95=20
? do_raw_spin_unlock+0x5d/0x1b6=20
? srso_alias_return_thunk+0x5/0xfbef5=20
? srso_alias_return_thunk+0x5/0xfbef5=20
bus_probe_device+0x7d/0x14e=20
device_add+0x5e9/0xf93=20
? get_device_parent+0x336/0x336=20
? srso_alias_return_thunk+0x5/0xfbef5=20
? __insert_resource+0x2d/0x302=20
platform_device_add+0x33b/0x456=20
sensors_nct6775_platform_init+0x87b/0x1000 nct6775
 ? 0xffffffffc0887000
? superio_wmi_exit (/usr/src/linux-6.7.4-gentoo/drivers/hwmon/nct6775-platf=
orm.c:205) nct6775
? superio_outb (/usr/src/linux-6.7.4-gentoo/drivers/hwmon/nct6775-platform.=
c:220) nct6775
? superio_inb (/usr/src/linux-6.7.4-gentoo/drivers/hwmon/nct6775-platform.c=
:229) nct6775
? superio_exit (/usr/src/linux-6.7.4-gentoo/drivers/hwmon/nct6775-platform.=
c:189) nct6775
? nct6775_asuswmi_read+0xc6/0xc6 nct6775
 ? 0xffffffffc0887000
do_one_initcall+0xf4/0x2a1=20
? efi_enabled.constprop.0+0x50/0x50=20
? srso_alias_return_thunk+0x5/0xfbef5=20
? local_clock_noinstr+0xc/0xa8=20
? srso_alias_return_thunk+0x5/0xfbef5=20
? srso_alias_return_thunk+0x5/0xfbef5=20
? kasan_unpoison+0x3c/0x47=20
do_init_module+0x272/0x5a2=20
? kfree+0xc8/0x14f=20
load_module+0x3529/0x386d=20
? module_frob_arch_sections+0x16/0x16=20
? __vmalloc_node+0xa9/0xc8=20
? mode_strip_umask.isra.0+0x73/0x73=20
? init_module_from_file+0xc4/0xfb=20
? srso_alias_return_thunk+0x5/0xfbef5=20
init_module_from_file+0xc4/0xfb=20
? __do_sys_init_module+0x19f/0x19f=20
? srso_alias_return_thunk+0x5/0xfbef5=20
? do_raw_spin_unlock+0x5d/0x1b6=20
__do_sys_finit_module+0x2b8/0x468=20
? init_module_from_file+0xfb/0xfb=20
do_syscall_64+0x84/0xee=20
entry_SYSCALL_64_after_hwframe+0x4b/0x53=20
RIP: 0033:0x7f3a1a92d479
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 =
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff f=
f 73 01 c3 48 8b 0d 87 89 0c 00 f7 d8 64 89 01 48
All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0:	ff c3                	inc    %ebx
   2:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   9:	00 00 00=20
   c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  11:	48 89 f8             	mov    %rdi,%rax
  14:	48 89 f7             	mov    %rsi,%rdi
  17:	48 89 d6             	mov    %rdx,%rsi
  1a:	48 89 ca             	mov    %rcx,%rdx
  1d:	4d 89 c2             	mov    %r8,%r10
  20:	4d 89 c8             	mov    %r9,%r8
  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
  28:	0f 05                	syscall
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping =
instruction
  30:	73 01                	jae    0x33
  32:	c3                   	ret
  33:	48 8b 0d 87 89 0c 00 	mov    0xc8987(%rip),%rcx        # 0xc89c1
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	ret
   9:	48 8b 0d 87 89 0c 00 	mov    0xc8987(%rip),%rcx        # 0xc8997
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W
RSP: 002b:00007ffe6900a178 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
RAX: ffffffffffffffda RBX: 000055ee345bd630 RCX: 00007f3a1a92d479
RDX: 0000000000000000 RSI: 00007f3a1ad6f70f RDI: 0000000000000008
RBP: 0000000000000000 R08: 00007f3a1a9f6b20 R09: fffffffffffffe98
R10: 0000000000000050 R11: 0000000000000246 R12: 0000000000020000
R13: 00007f3a1ad6f70f R14: 000055ee345bd320 R15: 0000000000000000
 </TASK>

The buggy address belongs to the variable:
_sub_I_65535_1+0x10f60/0xe5c nct6775_core

Memory state around the buggy address:
 ffffffffc0863000: 00 00 00 00 f9 f9 f9 f9 00 00 f9 f9 f9 f9 f9 f9
 ffffffffc0863080: 04 f9 f9 f9 f9 f9 f9 f9 04 f9 f9 f9 f9 f9 f9 f9
>ffffffffc0863100: 04 f9 f9 f9 f9 f9 f9 f9 00 02 f9 f9 f9 f9 f9 f9
                   ^
 ffffffffc0863180: 04 f9 f9 f9 f9 f9 f9 f9 00 06 f9 f9 f9 f9 f9 f9
 ffffffffc0863200: 00 06 f9 f9 f9 f9 f9 f9 00 06 f9 f9 f9 f9 f9 f9
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Disabling lock debugging due to kernel taint
[...]


Regards,
Erhard
