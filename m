Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA1B4D2EC4
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 11:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784720305; cv=none; b=nfFKbwQnSP/KABAJVIRykQ9qufmvN58jT1CULwhX1dWPX1F6iEBIS/Nw99JqM14csG7A6ORmi94IcfpcDKvOhQEEqNXdRaH/EWevDvFGVS+fwwsN7mMceCB29+wotI1bXyskrdBxlNArXXZHoGljW6/o9F+irLkQ89B6N/K5G4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784720305; c=relaxed/simple;
	bh=60w0YRlc52KcE33hL+n8Z/Mug0h6V47nV/oFoERXxHg=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=LJJoJXcaqnQnUvyc9zGF3zoGb592ENholmn21xTHh6moS/lXo7uyINaZEDxal/5Uw/lTy1AFb/98+FzJ6QXKm8NJzecGZjQBOTR+oJSupxvYEinat5ByeDk6+MQgvSw8/6+9w/mfdKTjehym7GmgfR8NvgutNVVP4njMPG2eVJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.b=MSTTyez9; arc=none smtp.client-ip=185.136.65.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.b="MSTTyez9"
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026072211380749c849518e00020782
        for <linux-hwmon@vger.kernel.org>;
        Wed, 22 Jul 2026 13:38:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=wmlJYxhu2EzyKfqOg0JEWYekO/zMAuV71yd4pxBepbo=;
 b=MSTTyez9nr90//Pw3D7JqeWxtaNCN6qcLPBdMbJSjLaqjHgtewATRHSykFI+irhQdT9xof
 JS3KED/R5ksXwGuA6EfD+9Xfp3VyLtilORFIOlC2cszfGqknGHaQlVVA4dOnCsT+Jb9yeB8v
 I5f1rLAAKSfstgcZ7+0RX5/Z5cq1q3edQcHBD3CaFMNG30Nl+3te+bbDxLQR6XvzL0i1jlRn
 ztdCeTvyqVkzKQy2tvIjdt6PnjAoM+EXvcPdadlm9YHcSaXWp4AwgEG1TTDlUqVpine1Qpv2
 yWDH0UgmMR4c9u6FwtOt/ncvX/S0iSnZIcwT4kqiEh8P8hwEcepcdznQ==;
Message-ID: <c1ff485a688b4ee00b1dc3b1d94644b54d12a69f.camel@siemens.com>
Subject: hwmon: (nct6775) Out of bounds access to NCT6116_REG_TEMP_SOURCE
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, "; Bjoern Gerhart"
 <gerhart@posteo.de>,  "; Jan Kiszka" <jan.kiszka@siemens.com>, "; Andreas
 Ziegler" <ziegler.andreas@siemens.com>
Date: Wed, 22 Jul 2026 13:38:06 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer

Hi all,

while debugging a completely different issue on 5.10 the following KASAN
report came up. To my understanding the same problem still exists in
current versions.

There seems to be a size mismatch between=20

data->REG_TEMP_SOURCE =3D NCT6116_REG_TEMP_SOURCE;  // 3 elements

and

num_reg_temp =3D ARRAY_SIZE(NCT6106_REG_TEMP);      // 6 elements

The NCT6116 tries to re-use some NCT6106 infrastructure, which seems
wrong in that case. NCT6116_REG_TEMP_SOURCE is NCT6116 specific.

To my understanding the issue was introduced with=20
commit 29c7cb485b32 ("hwmon: (nct6775) Integrate new model nct6116")

Some guidance on how to properly fix that issue is needed. I don't have
any data sheet of this piece of hardware available, so I can't tell
which registers are the correct ones.

Best regards,
Florian

[   20.345420] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   20.345427] BUG: KASAN: global-out-of-bounds in nct6775_probe+0x936/0x46=
f0 [nct6775]
[   20.345455] Read of size 2 at addr ffffffffc19561a6 by task modprobe/954

[   20.345465] CPU: 4 PID: 954 Comm: modprobe Tainted: G           OE     5=
.10.223-cip51-rt21+ind4 #1
[   20.345475] Hardware name: SIEMENS AG SIMATIC IPC PX-39A PRO/A5E51244450=
, BIOS V29.01.03 02/07/2023
[   20.345479] Call Trace:
[   20.345484]  dump_stack+0x7d/0xa7
[   20.345500]  print_address_description.constprop.0+0x1c/0x220
[   20.345513]  ? __kasan_kmalloc.constprop.0+0xc9/0xd0
[   20.345523]  ? __kmalloc_node_track_caller+0x194/0x5b0
[   20.345537]  ? nct6775_probe+0x936/0x46f0 [nct6775]
[   20.345574]  ? nct6775_probe+0x936/0x46f0 [nct6775]
[   20.345610]  kasan_report.cold+0x1c/0x34
[   20.345623]  ? nct6775_probe+0x936/0x46f0 [nct6775]
[   20.345662]  nct6775_probe+0x936/0x46f0 [nct6775]
[   20.345705]  ? store_temp_beep+0x270/0x270 [nct6775]
[   20.345737]  ? kernfs_create_link+0xbb/0x120
[   20.345749]  ? acpi_dev_pm_attach+0x30/0x170
[   20.345760]  platform_drv_probe+0x47/0xa0
[   20.345768]  really_probe+0x184/0x6b0
[   20.345774]  ? driver_allows_async_probing+0x80/0x80
[   20.345779]  driver_probe_device+0x119/0x180
[   20.345785]  ? driver_allows_async_probing+0x80/0x80
[   20.345790]  bus_for_each_drv+0xed/0x150
[   20.345794]  ? bus_for_each_dev+0x150/0x150
[   20.345799]  ? migrate_enable+0x1fe/0x250
[   20.345807]  __device_attach+0x13a/0x2e0
[   20.345812]  ? really_probe+0x6b0/0x6b0
[   20.345817]  ? kobject_uevent_env+0x186/0x910
[   20.345826]  bus_probe_device+0xfc/0x120
[   20.345836]  device_add+0x64c/0xd50
[   20.345845]  ? devlink_add_symlinks+0x3e0/0x3e0
[   20.345852]  ? __rcu_read_lock+0x1b/0x30
[   20.345864]  platform_device_add+0x1c0/0x370
[   20.345877]  sensors_nct6775_init+0x465/0x1000 [nct6775]
[   20.345899]  ? 0xffffffffc1970000
[   20.345905]  ? kobject_create_and_add+0x2d/0x70
[   20.345910]  ? __list_add_valid+0x41/0x70
[   20.345917]  ? idle_cpu+0x45/0x90
[   20.345921]  ? irq_exit_rcu+0x5d/0x100
[   20.345927]  ? 0xffffffffc1970000
[   20.345931]  do_one_initcall+0x87/0x340
[   20.345937]  ? perf_trace_initcall_level+0x250/0x250
[   20.345943]  ? memset_erms+0xb/0x20
[   20.345948]  ? kasan_unpoison_shadow+0x33/0x50
[   20.345954]  do_init_module+0xe4/0x390
[   20.345961]  load_module+0x3f30/0x41d0
[   20.345974]  ? module_frob_arch_sections+0x20/0x20
[   20.345981]  ? kernel_read_file+0x1d2/0x3e0
[   20.345987]  ? __x64_sys_fsopen+0x200/0x200
[   20.345993]  ? kernel_read_file_from_fd+0x5b/0xa0
[   20.345998]  __do_sys_finit_module+0x110/0x1b0
[   20.346003]  ? __ia32_sys_init_module+0x40/0x40
[   20.346008]  ? randomize_page+0x60/0x60
[   20.346018]  ? __ia32_sys_fstat+0x30/0x30
[   20.346030]  ? __audit_syscall_entry+0x193/0x200
[   20.346042]  ? ktime_get_coarse_real_ts64+0x4a/0x70
[   20.346055]  do_syscall_64+0x30/0x80
[   20.346063]  entry_SYSCALL_64_after_hwframe+0x67/0xd1
[   20.346069] RIP: 0033:0x7fc77b7a4fd9
[   20.346086] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 =
89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48=
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 87 8e 0d 00 f7 d8 64 89 01 48
[   20.346093] RSP: 002b:00007fff67806118 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000139
[   20.346108] RAX: ffffffffffffffda RBX: 000055b2be38bff0 RCX: 00007fc77b7=
a4fd9
[   20.346113] RDX: 0000000000000000 RSI: 000055b2bde4d260 RDI: 00000000000=
00001
[   20.346118] RBP: 0000000000040000 R08: 0000000000000000 R09: 00000000000=
00000
[   20.346122] R10: 0000000000000001 R11: 0000000000000246 R12: 000055b2bde=
4d260
[   20.346127] R13: 0000000000000000 R14: 000055b2be38bf50 R15: 000055b2be3=
8bff0

[   20.346222] The buggy address belongs to the variable:
[   20.346225]  NCT6116_REG_TEMP_SOURCE+0x6/0xffffffffffffde60 [nct6775]

[   20.346254] Memory state around the buggy address:
[   20.346259]  ffffffffc1956080: f9 f9 f9 f9 00 02 f9 f9 f9 f9 f9 f9 00 02=
 f9 f9
[   20.346265]  ffffffffc1956100: f9 f9 f9 f9 00 02 f9 f9 f9 f9 f9 f9 00 02=
 f9 f9
[   20.346269] >ffffffffc1956180: f9 f9 f9 f9 06 f9 f9 f9 f9 f9 f9 f9 00 02=
 f9 f9
[   20.346272]                                ^
[   20.346276]  ffffffffc1956200: f9 f9 f9 f9 00 02 f9 f9 f9 f9 f9 f9 00 02=
 f9 f9
[   20.346280]  ffffffffc1956280: f9 f9 f9 f9 00 02 f9 f9 f9 f9 f9 f9 00 02=
 f9 f9
[   20.346282] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
