Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4861A2EBBA1
	for <linux-hwmon@vger.kernel.org>; Sat, 22 Aug 2026 04:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787371363; cv=none; b=RObGlNxLV37sy/+sg1LTjR6nZgTzvoiHmYwCeDDFP3k+mITfTkcSpboToJZ7Jt/8hpud1UoAFszhcwzmaUyKjAIXu6hI1MFWGMtC4TOIYg32FIiQb+VMeksb0byiwjix6JSw/PUiUXUHU2uBm7wcgAfZV4FrKGy9tDpzjqG+rWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787371363; c=relaxed/simple;
	bh=ZOGX4l1CULh9mQIPRvHkA8NqbM4UuDyqlTZi7vkF9k8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ka0FywXPuWhUYHfu1ylKZXVE+m/oPbJyN8621QLlMKI4VFSPQ6s5yiqjwl4twoPcktAgdycj9dMxkHkXTYPpZ6xEdl3NH7WLEFaa6y8SeC0tVD1dWKj0D+BGkpi3IyTaLQGHZP59pmCZCsEdWtqtxawv4sYjG6YkOkcucCghRTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJdklO+G; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJdklO+G"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso22539265ad.2
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 21:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787371360; x=1787976160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7yidpKoHX3+b3loJFKGe+0NfiST8L3aRQxfTxEirWEI=;
        b=UJdklO+GNf5pWnJt206Yj7RYf47iHZvGggYWsa2PQ1LD5laZAC7oFTsU3e09IQxhH+
         NBlM6tlJhbDoCOa04pqLDLEOKV6zNKxIRWB8At3PXOqQk1j+X1faiXQ00W0S+Mpczg+r
         KxmfI68RpLJyB6asUMiT7JbnMJAR/rRim9J+JALMJC2xtRKJZY0ig6gPHGJD37T7glEU
         /ooeM4RM/ryIFdEmc4nfQhVOdCRD2GZ/BAFeMaupQrA7ANlJuH9qqnOmP+X3BG/SHxDz
         SL/Hj1DfCUvbxB/Ah7XVP+s/Y1kStDnB5cpsbb4R9pzcXnuS1iGQMVdxF8zSfJops2tV
         DAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787371361; x=1787976161;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7yidpKoHX3+b3loJFKGe+0NfiST8L3aRQxfTxEirWEI=;
        b=Tvln64DkV5V8DCGP1njoZxOrfSIWyMQEAiB3llJlxgVdt7PY9ZRTYIRE+x7lpaVkdl
         9WQTzHJ1+EXRe+KgeW3QqmFgVKFJKq7+RjVMcW6E9Dgjtc/W4zCJXTwuzCJYuVA+G62N
         byDrwC/H+eemUtnmf5QrIHAucMQFx37n56A8CzZdhfxn2SowwNayStxlocvAx113S0jQ
         6JgP1TaYGUk+jndZsa1fX4dguPVNK+FQ74sHjdKTExA992wK8QI3tq9yTrNvkIQfCQ8Y
         E43viOD5y3VJ4mk+ekmjZlDJBj5LirjYC/qdG1K8RhwMDTVO0dq2j1+8qrSDFVntSzHs
         t7Fw==
X-Forwarded-Encrypted: i=1; AHgh+RqaKnCS83eVHdZlh1+YHkbOKcaXDWpjS0QhUUYDyqwVWMUAiixXWyX2/3U366XR+5tC0BIxJa3v1wB4XA==@vger.kernel.org
X-Gm-Message-State: AFuF++nk6IKfgGHa++dYCAOZojY3/mn7raykytf83Va8Xnlyk6A32oUN
	8SpXCCOYYxgZy3zwC9WSdP1Vt8caYLGsz5VQciRj9+LaoJrkzxTGff+1
X-Gm-Gg: AR+sD11b100CpZAuwQXjaqUHmUKeizW7KTvsUFs8qFe9GAGhVrs8G17MBtjqyC8yNZb
	kd//PBjIuCqONlFORlGXuKD9kayxaJw56/xHYRG80osp3Xk9Lav0T0wkKMLH9ORs2BzT8TJDYJd
	jt4xCRhHYM+Mhv+D76VysgE71nfkT5jMtHy89uWrSI4S+XsodLHkckxcH5I0KiY6z5DiaTRTKQ2
	lQ6BMqaJg4m8Nun6WTunvTJH1ONYAHSk0alSlD7Z3xaTrqCnkwESQcb+2dmvDMfipynqNRQ1va7
	3WKsbyZ5NBwIxk9ZSLSI76PVuCMQwyr56Ja1ah5Me3tVPsPpOW1wstaNdL+tlbAMWIECzTi6YyD
	0dcXLPvXXLSMePgA/bowfEwqe/zXfMLHk6QbEOSqKMss4SP4UUt/tssAlCAA2+HAOdFbsvdvT9d
	MTzUtyqC9g8dp9niBmn1AIbEuLhZQuWoVB4K065c7B/DEXxCpYHoOY/PVtewzDka6YhMrhTzuIs
	PteyW6AOP/GQ7EdRmLrVVftBJAxAHg5vIrAtA==
X-Received: by 2002:a17:90b:3902:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-395c3377f59mr17388596a91.2.1787371360481;
        Fri, 21 Aug 2026 21:02:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860c6e6dsm2868578c88.1.2026.08.21.21.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 21:02:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1506eaff-db5e-407a-a09c-d7a6b070c9cb@roeck-us.net>
Date: Fri, 21 Aug 2026 21:02:33 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [hwmon?] KASAN: slab-out-of-bounds Read in aqc_raw_event
To: syzbot <syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, me@jackdoan.com, savicaleksa83@gmail.com,
 syzkaller-bugs@googlegroups.com
References: <6a891232.91706f20.16b6e3.02b0.GAE@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <6a891232.91706f20.16b6e3.02b0.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Aleksa,

On 8/21/26 20:06, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    e1e6e541c5c9 Merge tag 'thunderbolt-for-v7.3-rc1' of ssh:/..
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=16086e79580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=8bdeea7ee6735f91
> dashboard link: https://syzkaller.appspot.com/bug?extid=9ee5f5dc18673d6b2f37
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14737679580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15a22549580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/3b0a1f8e6a1f/disk-e1e6e541.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/f98d855e85e8/vmlinux-e1e6e541.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/db2c3a41df6d/bzImage-e1e6e541.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
> 
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in get_unaligned_be16 include/linux/unaligned.h:48 [inline]
> BUG: KASAN: slab-out-of-bounds in aqc_raw_event drivers/hwmon/aquacomputer_d5next.c:1345 [inline]
> BUG: KASAN: slab-out-of-bounds in aqc_raw_event+0x213e/0x25d0 drivers/hwmon/aquacomputer_d5next.c:1327

The problem is that syzkaller sends a bad (short) report.
aqc_raw_event() needs to validate the report size and bail out
if it is short. The fix should be straightforard if it is known
what the minimum report size is. D5NEXT_CTRL_REPORT_SIZE ?

Thanks,
Guenter

> Read of size 2 at addr ffff888108aba257 by task swapper/1/0
> 
> CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted syzkaller #0 PREEMPT(lazy)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
> Call Trace:
>   <IRQ>
>   __dump_stack lib/dump_stack.c:94 [inline]
>   dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
>   print_address_description mm/kasan/report.c:378 [inline]
>   print_report+0x13d/0x4b0 mm/kasan/report.c:482
>   kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
>   get_unaligned_be16 include/linux/unaligned.h:48 [inline]
>   aqc_raw_event drivers/hwmon/aquacomputer_d5next.c:1345 [inline]
>   aqc_raw_event+0x213e/0x25d0 drivers/hwmon/aquacomputer_d5next.c:1327
>   __hid_input_report.constprop.0+0x319/0x470 drivers/hid/hid-core.c:2168
>   hid_irq_in+0x55d/0x710 drivers/hid/usbhid/hid-core.c:287
>   __usb_hcd_giveback_urb+0x38d/0x610 drivers/usb/core/hcd.c:1657
>   usb_hcd_giveback_urb+0x3ca/0x4a0 drivers/usb/core/hcd.c:1741
>   dummy_timer+0xdb2/0x36f0 drivers/usb/gadget/udc/dummy_hcd.c:2019
>   __run_hrtimer kernel/time/hrtimer.c:2032 [inline]
>   __hrtimer_run_queues+0x462/0x9c0 kernel/time/hrtimer.c:2096
>   hrtimer_run_softirq+0x17d/0x2c0 kernel/time/hrtimer.c:2113
>   handle_softirqs+0x1dd/0x990 kernel/softirq.c:622
>   __do_softirq kernel/softirq.c:656 [inline]
>   invoke_softirq kernel/softirq.c:496 [inline]
>   __irq_exit_rcu+0x160/0x210 kernel/softirq.c:735
>   irq_exit_rcu+0x9/0x30 kernel/softirq.c:752
>   instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
>   sysvec_apic_timer_interrupt+0x8f/0xb0 arch/x86/kernel/apic/apic.c:1062
>   </IRQ>
>   <TASK>
>   asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
> RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:64
> Code: 60 ab 01 e9 83 f7 02 00 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 0f 00 2d 23 ef 09 00 fb f4 <c3> cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90 90 90
> RSP: 0018:ffffc9000013fe10 EFLAGS: 00000246
> RAX: 000000000004b053 RBX: ffff8881022d9e00 RCX: ffffffff877c9945
> RDX: 0000000000000000 RSI: ffffffff890f4061 RDI: ffffffff87b15700
> RBP: ffffed102045b3c0 R08: 0000000000000001 R09: ffffed103eae670d
> R10: ffff8881f573386b R11: 0000000000000000 R12: 0000000000000000
> R13: 0000000000000000 R14: 1ffff92000027fc6 R15: dffffc0000000000
>   arch_safe_halt arch/x86/include/asm/paravirt.h:62 [inline]
>   default_idle+0x9/0x10 arch/x86/kernel/process.c:768
>   default_idle_call+0x6c/0xb0 kernel/sched/idle.c:122
>   cpuidle_idle_call kernel/sched/idle.c:199 [inline]
>   do_idle+0x3a7/0x5b0 kernel/sched/idle.c:355
>   cpu_startup_entry+0x4f/0x60 kernel/sched/idle.c:454
>   start_secondary+0x21d/0x2d0 arch/x86/kernel/smpboot.c:312
>   common_startup_64+0x13e/0x158
>   </TASK>
> 
> Allocated by task 23:
>   kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
>   kasan_save_track+0x14/0x30 mm/kasan/common.c:78
>   poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
>   __kasan_kmalloc+0x8f/0xa0 mm/kasan/common.c:415
>   kasan_kmalloc include/linux/kasan.h:263 [inline]
>   __do_kmalloc_node mm/slub.c:5334 [inline]
>   __kmalloc_noprof+0x309/0x7c0 mm/slub.c:5359
>   _kmalloc_noprof include/linux/slab.h:992 [inline]
>   hcd_buffer_alloc+0x1f5/0x290 drivers/usb/core/buffer.c:134
>   usb_alloc_coherent+0x5f/0xa0 drivers/usb/core/usb.c:1011
>   hid_alloc_buffers drivers/hid/usbhid/hid-core.c:859 [inline]
>   usbhid_start+0x5cf/0x23a0 drivers/hid/usbhid/hid-core.c:1108
>   hid_hw_start+0x65/0x140 drivers/hid/hid-core.c:2428
>   aqc_probe+0x1a5/0x3510 drivers/hwmon/aquacomputer_d5next.c:1536
>   __hid_device_probe drivers/hid/hid-core.c:2829 [inline]
>   hid_device_probe+0x50e/0x800 drivers/hid/hid-core.c:2866
>   call_driver_probe drivers/base/dd.c:628 [inline]
>   really_probe+0x241/0xa60 drivers/base/dd.c:706
>   __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
>   driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
>   __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
>   bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
>   __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
>   device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
>   bus_probe_device+0x64/0x160 drivers/base/bus.c:620
>   device_add+0x121d/0x1970 drivers/base/core.c:3772
>   hid_add_device+0x2bf/0x440 drivers/hid/hid-core.c:3010
>   usbhid_probe+0xa64/0x10b0 drivers/hid/usbhid/hid-core.c:1452
>   usb_probe_interface+0x386/0x9b0 drivers/usb/core/driver.c:399
>   call_driver_probe drivers/base/dd.c:628 [inline]
>   really_probe+0x241/0xa60 drivers/base/dd.c:706
>   __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
>   driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
>   __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
>   bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
>   __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
>   device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
>   bus_probe_device+0x64/0x160 drivers/base/bus.c:620
>   device_add+0x121d/0x1970 drivers/base/core.c:3772
>   usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2268
>   usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
>   usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:293
>   call_driver_probe drivers/base/dd.c:628 [inline]
>   really_probe+0x241/0xa60 drivers/base/dd.c:706
>   __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
>   driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
>   __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
>   bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
>   __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
>   device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
>   bus_probe_device+0x64/0x160 drivers/base/bus.c:620
>   device_add+0x121d/0x1970 drivers/base/core.c:3772
>   usb_new_device.part.0+0xcc2/0x1686 drivers/usb/core/hub.c:2708
>   usb_new_device drivers/usb/core/hub.c:5833 [inline]
>   hub_port_connect drivers/usb/core/hub.c:5580 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5720 [inline]
>   port_event drivers/usb/core/hub.c:5884 [inline]
>   hub_event.cold+0x51a/0xe9d drivers/usb/core/hub.c:5966
>   process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
>   process_scheduled_works kernel/workqueue.c:3405 [inline]
>   worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
>   kthread+0x370/0x450 kernel/kthread.c:436
>   ret_from_fork+0x69a/0xc80 arch/x86/kernel/process.c:158
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> 
> The buggy address belongs to the object at ffff888108aba200
>   which belongs to the cache kmalloc-96 of size 96
> The buggy address is located 22 bytes to the right of
>   allocated 65-byte region [ffff888108aba200, ffff888108aba241)
> 
> The buggy address belongs to the physical page:
> page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888108aba680 pfn:0x108aba
> flags: 0x200000000000200(workingset|node=0|zone=2)
> page_type: f5(slab)
> raw: 0200000000000200 ffff888100041280 ffff8881000401c8 ffffea00046bf250
> raw: ffff888108aba680 0000000800200017 00000000f5000000 0000000000000000
> page dumped because: kasan: bad access detected
> page_owner tracks the page as allocated
> page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2c00(GFP_NOIO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 11, tgid 11 (kworker/0:1), ts 4259009323, free_ts 4258897945
>   set_page_owner include/linux/page_owner.h:32 [inline]
>   post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1859
>   prep_new_page mm/page_alloc.c:1867 [inline]
>   get_page_from_freelist+0xf25/0x3400 mm/page_alloc.c:3946
>   __alloc_frozen_pages_noprof+0x28f/0x2b90 mm/page_alloc.c:5304
>   alloc_slab_page mm/slub.c:3266 [inline]
>   allocate_slab mm/slub.c:3380 [inline]
>   new_slab+0xa2/0x670 mm/slub.c:3426
>   refill_objects+0xe3/0x410 mm/slub.c:7310
>   refill_sheaf mm/slub.c:2804 [inline]
>   __pcs_replace_empty_main+0x376/0x680 mm/slub.c:4675
>   alloc_from_pcs mm/slub.c:4773 [inline]
>   slab_alloc_node mm/slub.c:4905 [inline]
>   __kmalloc_cache_node_noprof+0x4b3/0x670 mm/slub.c:5504
>   _kmalloc_node_noprof include/linux/slab.h:1193 [inline]
>   __get_vm_area_node+0x101/0x330 mm/vmalloc.c:3237
>   __vmalloc_node_range_noprof+0x228/0x1630 mm/vmalloc.c:4064
>   __vmalloc_node_noprof+0xad/0xf0 mm/vmalloc.c:4165
>   __vmalloc_noprof+0xa3/0x120 mm/vmalloc.c:4181
>   pcpu_mem_zalloc+0x54/0xb0 mm/percpu.c:512
>   pcpu_alloc_chunk mm/percpu.c:1449 [inline]
>   pcpu_create_chunk+0x119/0x620 mm/percpu-vm.c:338
>   pcpu_balance_populated mm/percpu.c:2073 [inline]
>   pcpu_balance_workfn+0xb2c/0xdc0 mm/percpu.c:2215
>   process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
>   process_scheduled_works kernel/workqueue.c:3405 [inline]
>   worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
> page last free pid 11 tgid 11 stack trace:
>   reset_page_owner include/linux/page_owner.h:25 [inline]
>   __free_pages_prepare mm/page_alloc.c:1406 [inline]
>   __free_frozen_pages+0x716/0xf50 mm/page_alloc.c:2950
>   __kasan_populate_vmalloc_do mm/kasan/shadow.c:393 [inline]
>   __kasan_populate_vmalloc+0x1ea/0x210 mm/kasan/shadow.c:424
>   kasan_populate_vmalloc include/linux/kasan.h:580 [inline]
>   alloc_vmap_area+0x95d/0x2bb0 mm/vmalloc.c:2145
>   __get_vm_area_node+0x1ca/0x330 mm/vmalloc.c:3248
>   __vmalloc_node_range_noprof+0x228/0x1630 mm/vmalloc.c:4064
>   __vmalloc_node_noprof+0xad/0xf0 mm/vmalloc.c:4165
>   __vmalloc_noprof+0xa3/0x120 mm/vmalloc.c:4181
>   pcpu_mem_zalloc+0x54/0xb0 mm/percpu.c:512
>   pcpu_alloc_chunk mm/percpu.c:1444 [inline]
>   pcpu_create_chunk+0xce/0x620 mm/percpu-vm.c:338
>   pcpu_balance_populated mm/percpu.c:2073 [inline]
>   pcpu_balance_workfn+0xb2c/0xdc0 mm/percpu.c:2215
>   process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
>   process_scheduled_works kernel/workqueue.c:3405 [inline]
>   worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
>   kthread+0x370/0x450 kernel/kthread.c:436
>   ret_from_fork+0x69a/0xc80 arch/x86/kernel/process.c:158
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> 
> Memory state around the buggy address:
>   ffff888108aba100: 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc
>   ffff888108aba180: 00 00 00 00 00 00 00 00 01 fc fc fc fc fc fc fc
>> ffff888108aba200: 00 00 00 00 00 00 00 00 01 fc fc fc fc fc fc fc
>                                                   ^
>   ffff888108aba280: 00 00 00 00 00 00 00 00 01 fc fc fc fc fc fc fc
>   ffff888108aba300: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
> ==================================================================
> ----------------
> Code disassembly (best guess), 3 bytes skipped:
>     0:	e9 83 f7 02 00       	jmp    0x2f788
>     5:	0f 1f 00             	nopl   (%rax)
>     8:	90                   	nop
>     9:	90                   	nop
>     a:	90                   	nop
>     b:	90                   	nop
>     c:	90                   	nop
>     d:	90                   	nop
>     e:	90                   	nop
>     f:	90                   	nop
>    10:	90                   	nop
>    11:	90                   	nop
>    12:	90                   	nop
>    13:	90                   	nop
>    14:	90                   	nop
>    15:	90                   	nop
>    16:	90                   	nop
>    17:	90                   	nop
>    18:	f3 0f 1e fa          	endbr64
>    1c:	66 90                	xchg   %ax,%ax
>    1e:	0f 00 2d 23 ef 09 00 	verw   0x9ef23(%rip)        # 0x9ef48
>    25:	fb                   	sti
>    26:	f4                   	hlt
> * 27:	c3                   	ret <-- trapping instruction
>    28:	cc                   	int3
>    29:	cc                   	int3
>    2a:	cc                   	int3
>    2b:	cc                   	int3
>    2c:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
>    33:	00 00 00
>    36:	66 90                	xchg   %ax,%ax
>    38:	90                   	nop
>    39:	90                   	nop
>    3a:	90                   	nop
>    3b:	90                   	nop
>    3c:	90                   	nop
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup
> 

