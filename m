Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780B5395AF7
	for <linux-hwmon@vger.kernel.org>; Thu,  8 Oct 2026 18:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791483307; cv=none; b=kPnfx+cAA4gh/2S6hlDTNsJyrFrmMIdd2a8yxTQ16xNixJIuESmoC/MGHmWVqA50joAV48J9WIslIvZhA9KneXtA8IRqfxbQSLbwu7FihDomvC0BVcogXaFoZx1yIzGiA5HxxDSBloZumj21LF0BxDSFQh0ihJEbQ+jzxXCvwa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791483307; c=relaxed/simple;
	bh=ydfPCJ1OQXXsKZ3a7N0BaltkKaB7gefe1XWo6LMJjjM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=MtS3czzf5LKBoqoxflMH/6/FyWpyM+GwMMwR9tCxapUXJqYLMGRe/FjiN5V9d9AAfhqUvi8Rfuxy4qG7yz9+DjWtR5Et7CNi9kDGJUb6Nx+eE9oxfpBNZkt16zO9TVAeXlPfZCg+kXLwmmIJQL09jBpuTYOx9C4eM3wm5QsJ09o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b597558c4cso8942987b6e.1
        for <linux-hwmon@vger.kernel.org>; Thu, 08 Oct 2026 11:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791483304; x=1792088104;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RFIZtfa0xM/emya6z4lTND/8eQlzJiCOodKCHz0hJEg=;
        b=QtFMQKofXzMWSUeRL1BhGP+nKCxuui4cHOJIBSPUvcVZI9x7To8XQUH7F4C0c99BJO
         AScO7bjYRv1Xxfi1pwP72Xok/8Wv75O/lgiRoCLjVDNi5/VvZb31ZgRvgEqqOHU8n2cP
         NHVZPTfXBx0+m2zPi9daIb9znlEud3sy0DwhSkPANeS+xIyQRsuJeu0O5dPPZrqTQl+Q
         wrwD4IjNDFQxzhwjnxt1d7XVjpFKkiqMQUXjX1f7fRW+Tryl7Idctd8/cTS62S2xN0Lh
         chi6QA9OgQdkscrHMUH3zZYz0SWZqeeIHJaHzWX4McwZz/lcGbOiT41iq93nY52cUGJv
         Od1g==
X-Gm-Message-State: AFuF++kbZlZI3brEjSf+OsKdCi5t1rKko7GKXlxh0BJ0cshiOh9gRqBu
	5AxVJESiftssf/LIAlO6ChoRPv7QLPkoXd6LD7mD9Aycu5w5n+cPeRe97SAGtMaEqIKxVGUMrBU
	CrWgC5Uq+3bdlgF2+dz7vioqJ/TfmGfTtl1S/BSgtNHgjXVEGty5aXHT8jlI=
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f07:b0:4f5:97bf:e56b with SMTP id
 5614622812f47-4fc45d57bf6mr6348640b6e.17.1791483304390; Thu, 08 Oct 2026
 11:15:04 -0700 (PDT)
Date: Thu, 08 Oct 2026 11:15:04 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac7dda8.8cdf6287.1eb53.0038.GAE@google.com>
Subject: [syzbot] [hwmon?] inconsistent lock state in ccp_raw_event
From: syzbot <syzbot+0f98b0c0bdeaab2dc2fd@syzkaller.appspotmail.com>
To: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@roeck-us.net, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    69f80fef3153 Merge tag 'ata-7.3-rc7' of git://git.kernel.o..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16845f25580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=23e5acac5c98285f
dashboard link: https://syzkaller.appspot.com/bug?extid=0f98b0c0bdeaab2dc2fd
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16786715580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0f98b0c0bdeaab2dc2fd@syzkaller.appspotmail.com

================================
WARNING: inconsistent lock state
syzkaller #0 Not tainted
--------------------------------
inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
sshd-session/5916 [HC0[0]:SC1[1]:HE0:SE0] takes:
ffff888035e82868 (&ccp->wait_input_report_lock){+.?.}-{3:3}, at: spin_lock include/linux/spinlock.h:347 [inline]
ffff888035e82868 (&ccp->wait_input_report_lock){+.?.}-{3:3}, at: ccp_raw_event+0x51/0x110 drivers/hwmon/corsair-cpro.c:161
{SOFTIRQ-ON-W} state was registered at:
  lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
  __raw_spin_lock include/linux/spinlock_api_smp.h:190 [inline]
  _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:173
  spin_lock include/linux/spinlock.h:347 [inline]
  ccp_raw_event+0x51/0x110 drivers/hwmon/corsair-cpro.c:161
  __hid_input_report+0x41c/0x580 drivers/hid/hid-core.c:2175
  uhid_dev_input2+0xbc/0x150 drivers/hid/uhid.c:609
  uhid_char_write+0x4a1/0xc90 drivers/hid/uhid.c:767
  vfs_write+0x296/0xba0 fs/read_write.c:685
  ksys_write+0x150/0x270 fs/read_write.c:739
  do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
  do_int80_emulation+0x198/0x500 arch/x86/entry/syscall_32.c:166
  asm_int80_emulation+0x1a/0x20 arch/x86/include/asm/idtentry.h:598
irq event stamp: 3883
hardirqs last  enabled at (3882): [<ffffffff8bea0fe0>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:210 [inline]
hardirqs last  enabled at (3882): [<ffffffff8bea0fe0>] _raw_spin_unlock_irqrestore+0x30/0x80 kernel/locking/spinlock.c:221
hardirqs last disabled at (3883): [<ffffffff8bea0d9a>] __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:153 [inline]
hardirqs last disabled at (3883): [<ffffffff8bea0d9a>] _raw_spin_lock_irqsave+0x1a/0x60 kernel/locking/spinlock.c:181
softirqs last  enabled at (3844): [<ffffffff8a4c1319>] tcp_sendmsg+0x39/0x50 net/ipv4/tcp.c:1452
softirqs last disabled at (3879): [<ffffffff81891ceb>] __do_softirq kernel/softirq.c:679 [inline]
softirqs last disabled at (3879): [<ffffffff81891ceb>] invoke_softirq kernel/softirq.c:519 [inline]
softirqs last disabled at (3879): [<ffffffff81891ceb>] __irq_exit_rcu+0xcb/0x220 kernel/softirq.c:758

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&ccp->wait_input_report_lock);
  <Interrupt>
    lock(&ccp->wait_input_report_lock);

 *** DEADLOCK ***

locks held by sshd-session/5916: 0, last CPU#0

stack backtrace:
CPU: 0 UID: 0 PID: 5916 Comm: sshd-session Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
Call Trace:
 <IRQ>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_usage_bug+0x28c/0x2e0 kernel/locking/lockdep.c:4086
 valid_state+0xbe/0xf0 kernel/locking/lockdep.c:4100
 mark_lock_irq+0x36/0x380 kernel/locking/lockdep.c:4311
 mark_lock+0x117/0x190 kernel/locking/lockdep.c:4797
 mark_usage kernel/locking/lockdep.c:-1 [inline]
 __lock_acquire+0x71e/0x2de0 kernel/locking/lockdep.c:5242
 lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
 __raw_spin_lock include/linux/spinlock_api_smp.h:190 [inline]
 _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:173
 spin_lock include/linux/spinlock.h:347 [inline]
 ccp_raw_event+0x51/0x110 drivers/hwmon/corsair-cpro.c:161
 __hid_input_report+0x41c/0x580 drivers/hid/hid-core.c:2175
 hid_irq_in+0x492/0x710 drivers/hid/usbhid/hid-core.c:287
 __usb_hcd_giveback_urb+0x378/0x540 drivers/usb/core/hcd.c:1657
 dummy_timer+0xa91/0x4cc0 drivers/usb/gadget/udc/dummy_hcd.c:2023
 __run_hrtimer kernel/time/hrtimer.c:2074 [inline]
 __hrtimer_run_queues+0x3bc/0xa10 kernel/time/hrtimer.c:2131
 hrtimer_run_softirq+0x1e3/0x2e0 kernel/time/hrtimer.c:2148
 handle_softirqs+0x226/0x860 kernel/softirq.c:645
 __do_softirq kernel/softirq.c:679 [inline]
 invoke_softirq kernel/softirq.c:519 [inline]
 __irq_exit_rcu+0xcb/0x220 kernel/softirq.c:758
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:775
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1062
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
RIP: 0010:finish_task_switch+0x413/0xc60 kernel/sched/core.c:5384
Code: 04 00 00 41 c7 84 24 20 0e 00 00 00 00 00 00 0f 1f 44 00 00 49 83 c4 48 4c 89 e7 e8 57 e0 53 0a e8 92 2e 3a 00 fb 4c 8b 65 c8 <49> 8d bc 24 18 17 00 00 48 89 f8 48 c1 e8 03 42 0f b6 04 30 84 c0
RSP: 0000:ffffc90002e77420 EFLAGS: 00000202
RAX: 0000000000000f25 RBX: ffff8880b863c8e0 RCX: 8000000000000001
RDX: 0000000000000000 RSI: ffffffff8e4173d3 RDI: ffffffff8c6dad80
RBP: ffffc90002e77470 R08: ffffffff907a657f R09: 1ffffffff20f4caf
R10: dffffc0000000000 R11: fffffbfff20f4cb0 R12: ffff888033a53e80
R13: ffff8880b863c8a8 R14: dffffc0000000000 R15: 1ffff110170c791c
 context_switch kernel/sched/core.c:5536 [inline]
 __schedule+0x17e3/0x58f0 kernel/sched/core.c:7284
 __schedule_loop kernel/sched/core.c:7361 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7376
 schedule_hrtimeout_range_clock+0x15b/0x330 kernel/time/sleep_timeout.c:216
 poll_schedule_timeout+0xd0/0x1a0 fs/select.c:241
 do_poll fs/select.c:965 [inline]
 do_sys_poll+0x80a/0x1110 fs/select.c:1015
 __do_sys_ppoll fs/select.c:1112 [inline]
 __se_sys_ppoll+0x209/0x2b0 fs/select.c:1092
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb54728d407
Code: 48 89 fa 4c 89 df e8 38 aa 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffdec20af40 EFLAGS: 00000202 ORIG_RAX: 000000000000010f
RAX: ffffffffffffffda RBX: 00007fb547941300 RCX: 00007fb54728d407
RDX: 00007ffdec20af80 RSI: 0000000000000004 RDI: 000055fddcf9d150
RBP: 00007ffdec20aff0 R08: 0000000000000008 R09: 0000000000000000
R10: 00007ffdec20b080 R11: 0000000000000202 R12: 0000000000000001
R13: 00007ffdec20b080 R14: 000000000000006d R15: 0000000000000004
 </TASK>
----------------
Code disassembly (best guess), 1 bytes skipped:
   0:	00 00                	add    %al,(%rax)
   2:	41 c7 84 24 20 0e 00 	movl   $0x0,0xe20(%r12)
   9:	00 00 00 00 00
   e:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  13:	49 83 c4 48          	add    $0x48,%r12
  17:	4c 89 e7             	mov    %r12,%rdi
  1a:	e8 57 e0 53 0a       	call   0xa53e076
  1f:	e8 92 2e 3a 00       	call   0x3a2eb6
  24:	fb                   	sti
  25:	4c 8b 65 c8          	mov    -0x38(%rbp),%r12
* 29:	49 8d bc 24 18 17 00 	lea    0x1718(%r12),%rdi <-- trapping instruction
  30:	00
  31:	48 89 f8             	mov    %rdi,%rax
  34:	48 c1 e8 03          	shr    $0x3,%rax
  38:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
  3d:	84 c0                	test   %al,%al


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
