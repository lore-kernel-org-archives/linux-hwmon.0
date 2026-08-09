Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628902868A7;
	Sun,  9 Aug 2026 14:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786285541; cv=none; b=btzEjvNDnhOebbGaRNHpIQWtDBVKqFAB1FXPHxRajo101gQTgK6V/Zu3Z4nxIdUhRjMjYMCBtkISGQijwxzhp057YxZgP/XjFZyLyRd3uXY2qa8LBdvFCiT4MdCXU1KSMjVnLA9vsJYe0RX8ulMmhdldIRrOQJleuTPZzmYiSxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786285541; c=relaxed/simple;
	bh=/ppCbzvwMjRcK+lyuZw5yIyOchACSbGoHzzqvaGkrNU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=kQ0JnKg1ANPyO2D0KbWaSjYbRDYHZrJdcyEolVTstP0jkL6Q2mhNQ2t0w+HfRsCHqlUQcF0uiofBOx/Xo16YgUP6C1hfcHnP1/mhyZV4g6nNTrJ8XJnwx2GzFnSwWp9erELDctco0Tu9wkbNKGtyb5TdFTRSnHeY2dnXkhBUl4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=y5THH3r0; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="y5THH3r0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1786285530; bh=OeVJISZu+YsE7TSueKm4e1cXlP6PIs5vQr98NxoGQVk=;
	h=Date:To:Cc:From:Subject;
	b=y5THH3r0ugaJuNnKQh3sg2/meA4ilZK/Fg+ZdCVVo5jjfY0uzBqv1FAcVKXkV+PVd
	 3dvirQmfiJmkaAOU9QRwuTnS11kx+IyJmrn5xs15AzVV860oqk4TDpV9VqUtzTcxKB
	 WyMPfKuk/vgvPW2Mg1loH+xrPofnK4fGmzW+Qya8=
Received: from [IPV6:2409:8a00:7894:a160:3949:d046:3341:37f5] ([2409:8a00:7894:a160:3949:d046:3341:37f5])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 65CB2CEC; Sun, 09 Aug 2026 22:25:28 +0800
X-QQ-mid: xmsmtpt1786285528t4l0546z8
Message-ID: <tencent_688B6C532F79B1B95054EFF933F399A15407@qq.com>
X-QQ-XMAILINFO: NVJ0hJNx7N5Sah7DcXazwQxstdx07YNps5ahbKPpQKVjp2OHi/OlaMI6QW4XG9
	 Q+rhlrNTdxSsErIeiRlyQfHZZ1Op6cOeHUEhio33OaPwpyZETbR0ud5jAlvy49xpHqzWFVl5vQZc
	 pp+Zn77HYAvO5N9iyPtYgq99J50hQw5zYCZS3zwFpFSaT2BvWxMcjIBXoB72N/5mhvqx7sjx65KZ
	 CwFfJXSvpobNSgPl06wt+PbvwQAvkUo3vFREQVEh/OkVJxx2DQGumBhvGYHz8sDTGiIXujbkeDPU
	 SjGUgq4jVDbwkYXCjYahIQw8LDXYaFWGVW4lXDJq4l+wUrTy24DVZ0g17Fza1/HWjtHP8LC9eLdp
	 UCTpD/9PVOKMOma2jZcgVMVToz0Hj8x5XOV/FQdizdgiwmG6H5hCHNgA8ZnVMvMcJzTMKs//w0pk
	 R5JwoU/rOpXIbYuLtZkKtVMoFyvmTgrwers/LAR1HPaIZJDMU5hCgwrA6+WlJHHdBHBYK2nyxBXJ
	 6Sp5oaz50N79uuqfU6XbzvePy4ee+15GSySikhWQQVhIta0MOZQ195djPg3+mrdkJYBiEVgAAeVX
	 hgzyol2SZB2kCzdsVL6fb9VtBmrY54kHvHf1VStvW1VShk0etmtXh6fTiPmOYZGEzyQeLh8lDIZU
	 sho8sNDz/7AyG1bZfNpS/HwzVN6CndWEo2Gks0RrYsjUVuXNn//2zAVJ46yHLgK18EHyeArpAhaY
	 MgN4I6Wdq3LFMpBUSrOwgE1Vd4YnMwhpJRCdEhso1mkcQkYONrtswF5gFbPGzYeb8WZJBhT/ZmWJ
	 gt4ww9g6HILQY0pjwKgPcZucyvPwS8e/63YaDdbNmCLZgCk9l4m1c6w5AubLBZ9Dxes8h1NDfVfT
	 4fRxvDcB3w63HHBnt90ZyKqqPw5Rm4udEIJoHxbW/xbajjQ9Z5V2twABPURxH2fY0r/w/1kyVVfx
	 vr4bOfQbdgvbVCJVqIeTMzE1Qps2PLdaHqdSduDwJ4Rt+vLXXQpGoTz+a5jm13A2FF9OC9VKre6d
	 YManS7jvD5T5NBTQhQeOhR5VjqDnnbUyn99kXhdvQ6OCr3cJDY/LltrYej/kcHDaFnAL4kqPHBo4
	 9czZSrVaz4ymctOHo=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-OQ-MSGID: <e67b720c-6816-4083-9a40-29d9c6fe4755@qq.com>
Date: Sun, 9 Aug 2026 22:25:28 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
From: Yang Zi <2959243019@qq.com>
Subject: [BUG] KASAN: wild-memory-access in quirk_amd_nb_node (node bitmap
 index out of bounds) [fam15h_power] [syzkaller]
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

While fuzzing kernel v7.1 with syzkaller (KASAN) I hit a wild-memory-access during
early init when the AMD Northbridge PCI final quirk runs.

Reproducer summary (attached report):

    BUG: KASAN: wild-memory-access in node_state include/linux/nodemask.h:409
    BUG: KASAN: wild-memory-access in quirk_amd_nb_node+0xbe/0x140
            arch/x86/kernel/quirks.c:557
    Read of size 8 at addr 1fffffff8501e1f0 by task swapper/0/1

Call chain: kernel_init -> kernel_init_freeable -> do_initcalls ->
pci_apply_final_quirks -> pci_fixup_device -> pci_do_fixups ->
quirk_amd_nb_node (PCI device 0000:00:05.0).

Root cause: in quirk_amd_nb_node the node index is built without any range
check:

    node = pcibus_to_node(dev->bus) | (val & 7);
    if (node_online(node))                       // node_state -> test_bit(node, ...)
        set_dev_node(&dev->dev, node);

`node_online(node)` expands to `test_bit(node, node_states[N_ONLINE].bits)`,
using `node` directly as a bit index. When the hardware returns a bogus/large
`(val & 7)` combined with an unmapped `pcibus_to_node`, `node` becomes far
out of `MAX_NUMNODES` and `test_bit` reads beyond the `node_states` bitmap ->
wild-memory-access (read 8 bytes).

The crash report attached below:

BUG: KASAN: wild-memory-access in instrument_atomic_read include/linux/instrumented.h:82 [inline]
BUG: KASAN: wild-memory-access in _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
BUG: KASAN: wild-memory-access in node_state include/linux/nodemask.h:409 [inline]
BUG: KASAN: wild-memory-access in quirk_amd_nb_node+0xbe/0x140 arch/x86/kernel/quirks.c:557
Read of size 8 at addr 1fffffff8501e1f0 by task swapper/0/1

CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.1.0 #1 PREEMPT(lazy) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xa2/0xd0 lib/dump_stack.c:120
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x264/0x2c0 mm/kasan/generic.c:200
 instrument_atomic_read include/linux/instrumented.h:82 [inline]
 _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
 node_state include/linux/nodemask.h:409 [inline]
 quirk_amd_nb_node+0xbe/0x140 arch/x86/kernel/quirks.c:557
 pci_do_fixups drivers/pci/quirks.c:187 [inline]
 pci_fixup_device+0x2f3/0x3d0 drivers/pci/quirks.c:262
 pci_apply_final_quirks+0x7b/0x200 drivers/pci/quirks.c:277
 do_one_initcall+0x142/0x5c0 init/main.c:1392
 do_initcall_level+0xac/0xd0 init/main.c:1454
 do_initcalls+0x59/0xa0 init/main.c:1470
 kernel_init_freeable+0x1d7/0x250 init/main.c:1703
 kernel_init+0x1d/0x1d0 init/main.c:1593
 ret_from_fork+0x319/0x5d0 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Regards,
Yang Zi

