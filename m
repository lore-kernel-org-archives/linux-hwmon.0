Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB12C34253B
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Jan 2026 18:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769106113; cv=pass; b=bOIyFVn8pSS8oSh6OxzC6KkzEeucZGyNFRMjLjIW/45lUzbesqtcWcn7r5/NRKkMsPgsk0NQ+51cbBUcipK+yCgM8xY3RjBEhC+zUIq2OoRRpKLCShu9PUKdokSKjK9VTPhSG8HbyvIu9Wf+xsadVEQ51tfDgL4wgQIXGiMJ/zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769106113; c=relaxed/simple;
	bh=VhooRDxRH7BCE6BJvUO/eqRRlhR9iYQiXGVIVK9NRIk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=M9Vfqd6U1f/Fdim0lsZOZ/3k9spWIU1QEJvUkmTbuqlmuI7Ym37PtJ9WuOjh5QTFICyHodZUTGFIRNPb1oht6JRnS5CT75L7RaRwfFqpSp2PdszWvYs/k6NuaKJ4Hpj94dBftNam38FRW6FSDkgG4e+Qc/1dcOU5XODvCZZWBdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gooddata.com; spf=pass smtp.mailfrom=gooddata.com; dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b=X29H1S4v; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gooddata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gooddata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b="X29H1S4v"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1233b953bebso2833034c88.1
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Jan 2026 10:21:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769106099; cv=none;
        d=google.com; s=arc-20240605;
        b=AMeyK25dd5bg7Rjj3+DqOkU2H9fhDb2Vz1WHjpeHaJ/DjcOOi6V5Kq0Dp+R6qOTpKN
         TrI9kPsHYQkleApsFCmVSgqc4AnVwd4026I+IId2kQ4hJpxRJO6Xxbb5VQhMixGvhjxK
         65k/Ktrh2VOnTWCQJRTiNhrKkLGeWBSIBsQfK35DKm0vVU+AVqbMzc7Xiih/R+euHBYw
         k/mS9vMUK+dMor6xVlvnGzvIdje+D65sesqGp1rf8MnxW17xtu3edZHcrdU0TWHprztF
         qFXCsNiiBIK6uIP92vLaRhs2k0cwsCbs93h0rIsg7XrNECUFeMJr1cogqvAnpBJo1tt+
         ezTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=0MzuJtp8q1PRl9d8Ezimoh0lMOyUjuJJE2l+zzr12ig=;
        fh=QD9mW42o3Mco9zjjdVXlv4mhKtppLw2JOONVZ/Fspl0=;
        b=C04kpCS7ZA6IstfrzLyn9Dzf6b3fOIA5wGbsigewJedwXPBn+iGaRL3e4+34xinLQD
         gkDTdNvqmFqBSYyTuodONXNt6Pw0kFZwzAQZv5w7Ndrnhr8x4Dbc64TwmYzIHnQtxMBt
         V2cTNZ7okKPhZw/3g/ZEv6S6/NBq+GwS/XOvUfo2hucK3hq5upRj2avKAFEb82NhjOhE
         /A9IS1gqQpx5D9GWQXyfUBafQor8zKIb6ZM2F1rspWfpF2kpTajv9EYI1h3Pvs2gv7pJ
         55tk6zBXTMRFMByxhhTNgFrr+MZ3olEv5RY29+R9pZyjvMojISgKaI1B8NdysQFghnsA
         ljLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gooddata.com; s=google; t=1769106099; x=1769710899; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0MzuJtp8q1PRl9d8Ezimoh0lMOyUjuJJE2l+zzr12ig=;
        b=X29H1S4vp+zV5NPPWHrLySUdmMt+CEbZ2ifY+VPeIN8dFfdSZpdyT47GOrPTNxt8+s
         LmiX4oZMXICIN4S03GYzHf1lPAFEyDU7tTzRQ5L4guApUSGrCGtp746iHLh6Wt4oqYTL
         dsQ70SppdJJEEe9pq1G0b9rDtaWHom/MJ+nQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769106099; x=1769710899;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0MzuJtp8q1PRl9d8Ezimoh0lMOyUjuJJE2l+zzr12ig=;
        b=TPWR8LTgrF8EDeZZwbI6Ci6tHQushZNB+0pMv1QEhxIrGY1FtJZY0WZtqumtEvsCfi
         Wn7jGJBuaqCDxsHUPHziqyQ/XlbHyNOg48sO3Un0Db2YcQ3GFKw++ZCzAwgKBuZ20vao
         sXPKr+fCMy8HGgUry07dY/zV9Dh3CqyHRtg1lY79pFGN9OjUYlvtoOjsSsjHpx76mXGO
         a643uvdHm3oQ9QaSX6RBr7ykM8lmcPbc9wyi4+nzBwZSMsGDPBsdH8yaiMKWrmByAypv
         ZgOyvaDZ6eBOs0p+vhdXJrTMxVtnJfNqqgi/nTfJ2A1VIN3G68zELtpt5wGwXHhilcfr
         EUBg==
X-Forwarded-Encrypted: i=1; AJvYcCXQpGOrJ445iNoRALpgsDVpx4dnvmU77ttvb+o/vEKF8BnBTFQYT8YiFkfclaR/DFwN7g6is7hc5Bq8rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMvxwqGNe3HdyiMJ4vqyA89IsdnHStAKyeWgmwbdwvv9erdCKh
	KTApUCX3N1WgINtjSpK/8pMfhbuYiYMoMpH8do90dDGQbIknBekOdSqMjjQYrG6ppK0zxVQQ13c
	I58+A0iPsAYutFgRng/OaBYbdvTsgi/IdXxlqHHbT
X-Gm-Gg: AZuq6aIhqp8hAggfEGoLdQDRBy90SZtN5wlIai4hPV3xsiGTAw78wNp4gn1ACCr0Y98
	eLbVz7OU1L4qIV5nXCOGBGm1Gkbr6AXzGpSDqdDyodKRcq4VaKti/1wq/Tljlgmlp8dfaLAodbH
	lEotVHzwEX+UR2wPTsfLnDEMyN1enZ6wDl/ekkmfkW2fGsRgLSHmTskSNB23Nq/KmA0eM5gLMTm
	pzLyNJy4xDc1FmQu/Iy5pfhR9R/YtUZ1eY79+bNvjEQdpkzWewYQJKJfh5/gIsRK7cixuZT
X-Received: by 2002:a05:7300:a507:b0:2b1:7910:b102 with SMTP id
 5a478bee46e88-2b739bd5d0fmr155624eec.37.1769106098756; Thu, 22 Jan 2026
 10:21:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>
Date: Thu, 22 Jan 2026 19:21:11 +0100
X-Gm-Features: AZwV_Qh_bOcLy7884GZpUPmlbyyvzCqiPSLKlOSY7iBGuh3BMOizgEkJIsajebE
Message-ID: <CAK8fFZ58fidGUCHi5WFX0uoTPzveUUDzT=k=AAm4yWo3bAuCFg@mail.gmail.com>
Subject: acpi_power_meter: power*_average sysfs read hangs, mutex deadlock in
 hwmon_attr_show since v6.18.y
To: linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc: Igor Raits <igor@gooddata.com>, Daniel Secik <daniel.secik@gooddata.com>, 
	Zdenek Pesek <zdenek.pesek@gooddata.com>, Jiri Jurica <jiri.jurica@gooddata.com>
Content-Type: text/plain; charset="UTF-8"

Hello,

after upgrading from kernel 6.17.y to 6.18.y we started to observe a regression
in the ACPI power meter hwmon interface. Reading power*_average sysfs
attributes blocks indefinitely and causes tasks to enter uninterruptible
sleep (D state).

This affects both simple tools (e.g. cat) and monitoring agents scraping
hwmon (Prometheus via Grafana Alloy), eventually leading to hung task warnings
and stalled metric collection.

$ cat /sys/devices/LNXSYSTM:00/LNXSYBUS:00/ACPI000D:00/hwmon/hwmonX/power1_average
# blocks foreverJaroslav Pulchart

Blocked tasks show the following call chain:

[  528.108418] u[  617.816097]  __mutex_lock.constprop.0+0x3c9/0xa00
[  617.823094]  hwmon_attr_show+0x36/0x130
[  617.828889]  dev_attr_show+0x19/0x60
[  617.834095]  sysfs_kf_seq_show+0xbf/0x140
[  617.841102]  seq_read_iter+0x112/0x510
[  617.847099]  ? security_file_permission+0x8e/0xa0
[  617.854101]  vfs_read+0x215/0x340
[  617.860095]  ksys_read+0x61/0xe0
[  617.866096]  do_syscall_64+0x5d/0xa70
[  617.872097]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  617.880076] RIP: 0033:0x408d8e
[  617.885204] RSP: 002b:000000c004fed498 EFLAGS: 00000206 ORIG_RAX:
0000000000000000
[  617.896098] RAX: ffffffffffffffda RBX: 000000000000001e RCX: 0000000000408d8e
[  617.905398] RDX: 0000000000000080 RSI: 000000c004db7a80 RDI: 000000000000001e
[  617.915098] RBP: 000000c004fed4d8 R08: 0000000000000000 R09: 0000000000000000
[  617.925099] R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
[  617.935103] R13: 0000000000000040 R14: 000000c003e03880 R15: 0000000000000054
[  617.944105]  </TASK>
[  620.891393] usb 3-1.2: USB disconnect, device number 15
[  740.286380] INFO: task alloy:5901 blocked for more than 122 seconds.
[  740.292941]       Tainted: G            E       6.18.6-1.gdc.el9.x86_64 #1
[  740.299938] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  740.313368] task:alloy           state:D stack:0     pid:5901
tgid:5899  ppid:1      task_flags:0x400140 flags:0x00080001
[  740.326290] Call Trace:
[  740.331572]  <TASK>
[  740.336311]  __schedule+0x2b5/0x690
[  740.341312]  schedule+0x23/0x80
[  740.347316]  schedule_preempt_disabled+0x11/0x20
[  740.354335]  __mutex_lock.constprop.0+0x3c9/0xa00
[  740.360318]  hwmon_attr_show+0x36/0x130
[  740.366315]  dev_attr_show+0x19/0x60
[  740.372315]  sysfs_kf_seq_show+0xbf/0x140
[  740.378315]  seq_read_iter+0x112/0x510
[  740.384312]  ? security_file_permission+0x8e/0xa0
[  740.391316]  vfs_read+0x215/0x340
[  740.397336]  ksys_read+0x61/0xe0
[  740.403310]  do_syscall_64+0x5d/0xa70
[  740.409321]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  740.417340] RIP: 0033:0x408d8e
[  740.422111] RSP: 002b:000000c003401498 EFLAGS: 00000206 ORIG_RAX:
0000000000000000
[  740.431439] RAX: ffffffffffffffda RBX: 000000000000001c RCX: 0000000000408d8e
[  740.441336] RDX: 0000000000000080 RSI: 000000c00479d800 RDI: 000000000000001c
[  740.451326] RBP: 000000c0034014d8 R08: 0000000000000000 R09: 0000000000000000
[  740.461320] R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
[  740.471322] R13: 0000000000000040 R14: 000000c004d4d6c0 R15: ffffffffffffffff
[  740.480548]  </TASK>
[  740.485315] INFO: task alloy:5903 blocked for more than 123 seconds.
[  740.494310]       Tainted: G            E       6.18.6-1.gdc.el9.x86_64 #1
[  740.503355] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  740.513305] task:alloy           state:D stack:0     pid:5903
tgid:5899  ppid:1      task_flags:0x400140 flags:0x00080001
[  740.526807] Call Trace:
[  740.532010]  <TASK>
[  740.536313]  __schedule+0x2b5/0x690
[  740.542319]  schedule+0x23/0x80
[  740.547444]  schedule_preempt_disabled+0x11/0x20
[  740.555324]  __mutex_lock.constprop.0+0x3c9/0xa00
[  740.561576]  hwmon_attr_show+0x36/0x130
[  740.567326]  dev_attr_show+0x19/0x60
[  740.572315]  sysfs_kf_seq_show+0xbf/0x140
[  740.578311]  seq_read_iter+0x112/0x510
[  740.584311]  ? security_file_permission+0x8e/0xa0
[  740.591316]  vfs_read+0x215/0x340
[  740.596477]  ksys_read+0x61/0xe0
[  740.601312]  do_syscall_64+0x5d/0xa70
[  740.606333]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  740.614312] RIP: 0033:0x408d8e
[  740.618667] RSP: 002b:000000c002217498 EFLAGS: 00000206 ORIG_RAX:
0000000000000000
[  740.628317] RAX: ffffffffffffffda RBX: 0000000000000027 RCX: 0000000000408d8e
[  740.638353] RDX: 0000000000000080 RSI: 000000c006f78e80 RDI: 0000000000000027
[  740.648314] RBP: 000000c0022174d8 R08: 0000000000000000 R09: 0000000000000000
[  740.657348] R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
[  740.667288] R13: 0000000000000040 R14: 000000c0047276c0 R15: ffffffffffffffff
[  740.676348]  </TASK>
[  740.680440] INFO: task alloy:5921 blocked for more than 123 seconds.
[  740.689314]       Tainted: G            E       6.18.6-1.gdc.el9.x86_64 #1
[  740.698323] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  740.708314] task:alloy           state:D stack:0     pid:5921
tgid:5899  ppid:1      task_flags:0x400140 flags:0x00080001
[  740.721209] Call Trace:[  741.467334]  power_meter_read+0x1ea/0x2c0
[acpi_power_meter]
[  741.475320]  hwmon_attr_show+0x5e/0x130
[  741.481343]  dev_attr_show+0x19/0x60
[  741.487325]  sysfs_kf_seq_show+0xbf/0x140
[  741.494315]  seq_read_iter+0x112/0x510
[  741.498537]  ? security_file_permission+0x8e/0xa0
[  741.503544]  vfs_read+0x215/0x340
[  741.507125]  ksys_read+0x61/0xe0
[  741.510650]  do_syscall_64+0x5d/0xa70
[  741.514578]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  741.519954] RIP: 0033:0x408d8e
[  741.523283] RSP: 002b:000000c007a8b498 EFLAGS: 00000206 ORIG_RAX:
0000000000000000
[  741.531260] RAX: ffffffffffffffda RBX: 000000000000001f RCX: 0000000000408d8e
[  741.538718] RDX: 0000000000000080 RSI: 000000c0060a3000 RDI: 000000000000001f
[  741.546256] RBP: 000000c007a8b4d8 R08: 0000000000000000 R09: 0000000000000000
[  741.553731] R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
[  741.561265] R13: 0000000000000040 R14: 000000c006dbae00 R15: ffffffffffffffff
[  741.568728]  </TASK>
[  741.571167] INFO: task alloy:6139 blocked for more than 123 seconds.
[  741.577893]       Tainted: G            E       6.18.6-1.gdc.el9.x86_64 #1
[  741.585112] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  741.593345] task:alloy           state:D stack:0     pid:6139
tgid:5899  ppid:1      task_flags:0x400140 flags:0x00080001
[  741.604775] Call Trace:
[  741.607508]  <TASK>
[  741.609883]  __schedule+0x2b5/0x690
[  741.613629]  schedule+0x23/0x80
[  741.617023]  schedule_preempt_disabled+0x11/0x20
[  741.621921]  __mutex_lock.constprop.0+0x3c9/0xa00
[  741.626946]  hwmon_attr_show+0x36/0x130
[  741.631052]  dev_attr_show+0x19/0x60
[  741.634903]  sysfs_kf_seq_show+0xbf/0x140
[  741.639231]  seq_read_iter+0x112/0x510
[  741.643261]  ? security_file_permission+0x8e/0xa0
[  741.648236]  vfs_read+0x215/0x340
[  741.651800]  ksys_read+0x61/0xe0
[  741.655302]  do_syscall_64+0x5d/0xa70
[  741.659221]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  741.664566] RIP: 0033:0x408d8e
[  741.667876] RSP: 002b:000000c003805498 EFLAGS: 00000206 ORIG_RAX:
0000000000000000
[  741.675821] RAX: ffffffffffffffda RBX: 0000000000000023 RCX: 0000000000408d8e
[  741.683331] RDX: 0000000000000080 RSI: 000000c00731d000 RDI: 0000000000000023
[  741.690831] RBP: 000000c0038054d8 R08: 0000000000000000 R09: 0000000000000000
[  741.698340] R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
[  741.705812] R13: 0000000000000040 R14: 000000c00552e380 R15: ffffffffffffffff
[  741.713298]  </TASK>
[  741.715755] INFO: task alloy:6146 blocked for more than 247 seconds.
[  741.722459]       Tainted: G            E       6.18.6-1.gdc.el9.x86_64 #1
[  741.729641] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  741.737842] task:alloy           state:D stack:0     pid:6146
tgid:5899  ppid:1      task_flags:0x400140 flags:0x00080001
[  741.749353] Call Trace:
[  741.752118]  <TASK>
[  741.754483]  __schedule+0x2b5/0x690
[  741.758268]  schedule+0x23/0x80
[  741.761738]  schedule_preempt_disabled+0x11/0x20
[  741.766704]  __mutex_lock.constprop.0+0x3c9/0xa00
[  741.771723]  hwmon_attr_show+0x36/0x130
[  741.775911]  dev_attr_show+0x19/0x60
[  741.779802]  sysfs_kf_seq_show+0xbf/0x140
[  741.784140]  seq_read_iter+0x112/0x510
[  741.788171]  ? security_file_permission+0x8e/0xa0
[  741.793223]  vfs_read+0x215/0x340
[  741.796834]  ksys_read+0x61/0xe0
[  741.800372]  do_syscall_64+0x5d/0xa70
[  741.804312]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  741.809713] RIP: 0033:0x408d8e
[  741.813030] RSP: 002b:000000c004fed498 EFLAGS: 00000206 ORIG_RAX:
0000000000000000
[  741.820985] RAX: ffffffffffffffda RBX: 000000000000001e RCX: 0000000000408d8e
[  741.828512] RDX: 0000000000000080 RSI: 000000c004db7a80 RDI: 000000000000001e
[  741.836025] RBP: 000000c004fed4d8 R08: 0000000000000000 R09: 0000000000000000
[  741.843517] R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
[  741.850996] R13: 0000000000000040 R14: 000000c003e03880 R15: 0000000000000054
[  741.858511]  </TASK>

Any help or guidance on how to fix this issue would be greatly appreciated.

Best,
Jaroslav Pulchart
