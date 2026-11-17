Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939219;
	b=YL1mVAflLM3VunUNOlqhbg/yUVoqP1veXarJOigA9fszFDmY6AwF8hvjlV9hvm0jqWpF
	 BkhwjbJyX0cLob3+Vaib39JJPwP9gbbvevnuC4NObGlH8OP/p/Jd+IWWLHc3aDS4MFwAC
	 mcZutWuo7jPjidoZWIjxa79bdW8jtxxovmpLCVWo1bc4vKzA6gz/46jTv8VfIOhYMuYPR
	 aUmbZU5Uan5cVEz+wFCMrd11w18Ep1gc5Ml87Xx5sYF/p0QBQGOOXQjnQpi+URWiS1yGb
	 PWy0hmLem8ZihFRmZofqUvCUjra1Jr2NspO5gPLsV2uADjVSXtiZn1MCTLxPs/il1AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+xhdYEq/htKw2ZyZOGp/5p/opQTruhVjGkyUNfRkNJc=;
	b=lIYINidxaEh6u3Beqoxm6uOLKrJ2R+cSApQNqBr5cpoUnHA71Xm8vPvbLJA57zu/Ic0J
	 flEAat1YENq3NWaB2tnXjPFSTYfrrKjof/JV9YbEliFV+tngiz5eRtQPOcue0YChZARrn
	 PSViwaBeqZIyjJ0thn6JUMSPwHTS0BqLlkjQwCZNwnFdqbF1UF47Y0szQnUVA2h9bjRSJ
	 I3MrZwlwTlRCDuKRjdDZOO5dlPbEvzIIyLtjWXUgZlIC5Edjk2UXfuKeloE6OzgC/YU3H
	 +EuLsV7DL8QpAhjavwcnH2mAX9PoyjlF4dL0dzGtv9xUeI0WsVpb/6efy/w6HCYxJDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lj3g+lpI;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AE8606A899
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 18:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83AE8606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lj3g+lpI
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4d543b6b6so51597b3.3
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 10:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939217; x=1795544017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+xhdYEq/htKw2ZyZOGp/5p/opQTruhVjGkyUNfRkNJc=;
        b=lj3g+lpI3XZgyTxM3a07+qNDOsJmd5zJMS8J9z2wJXQVN1jLnF88rzs+xlZtrMTnSc
         M80oyrbZA0G6QfnpxQLD1XejXdWSUBuudNOuSFfPK44B9aodC6JrwaDKtT3OC8Tf3N2K
         OuwfumpnZcnLUYkNr2hdZrYNBoDHqdWnQZmu8Y62hXQb8nfhjVNWiD1pTK26MPQtdbmX
         ZW1S6vd8JuFNEY2Gzm0s3ZuxcrQKHWUNIIilr9t+NUEuFezGB7rBqAUY940yojF01ZEO
         /jj5eonCfuTLR5PdRQKnCIJuRfQ4mf1V0XDE/LbVP4/t9Xe6OF6ZWyEobvvLSNV7RYYT
         2vsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939217; x=1795544017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xhdYEq/htKw2ZyZOGp/5p/opQTruhVjGkyUNfRkNJc=;
        b=tIaLfcE/dpXobl0iCvDuk/nw5N1xKvi8tW2TImSN+BvL1bIqbC82JLsCB5oK0Xpr9+
         ph/zqyi6b2agYUKqEfp1Jk4UrEA3O+n+B8y6q8cqFd7rW12scTjTEtPconzRvuvm9IUA
         QoLa8UQQBhBSXjwe/5LK4clU40uRI+UkvtqZs3Z1Y7tgLjFSYTpfzgbSElqNOW7iE1WC
         wpWUM3IAqgCTYnth2cmjTcJUYTTwCy22jd5JxtX5kdRGsNkN7BDSxpbPB0bzPheMCzxY
         QnJ7Jn8ZsLb5wyP7fEC5iXPbKXNmYXM1ZYo9xjq8F+sFC1atFfuRZCMPn4n9G7yvmeUh
         Nx+Q==
X-Forwarded-Encrypted: i=1; AL+hErEAemVkqfUYSYrAmv9IPSvEHMPXg4zzQjyhORQW4aZIN3ajc1FBjBiIB3bJ+WC8K6CtDgmbxyJZ0VzVow==@vger.kernel.org
X-Gm-Message-State: APuU4Z/jLXxhRmccQVaA41YvmrbcuzpIQl/jKbRMpq4N79yb+/hX2M6g
	mLaxYCI8IgNYj73w2ZNP1MdSLiHJWtYRAFKMcUqvFITFaMm7wpOxk8iP
X-Gm-Gg: AZFdTZeOFzCwrPUulxzREy8NzaztzfSsnIok63ra9wpTLk26SiOLjAFqtuvlLtE9qPo
	QbhaWLNJsH0M17MdJDdKgKPxMxI4B46fa4/fgPMKPidbugsiq8M9cQlKxh2jqFaLiN4KHAcR+GC
	rIajMfW4QsnZzla4uF+RZJY39IeM7nvyMHGwyigtR0Y/XHp/ETBnWLyvT6YZMWsBq0fLjALkYHy
	ElOryAJ/vNNbXrTiP5ZjOnaQgts6gLM8tcSsIx0pjQkp9V+16W4ZqkvUwfp+myrppIDK/fLEeAY
	2YDHuyTGRruHYfffB2I7Ati//WkwkOomhNncUcZIu1axbvhXIgTQv4SmfA+Vsx7Y0LIRoksRZQ3
	+5WI93+PpUKa0lLm78BZmqDxxvcrTp9vCRvj6xCzBYZtWol3iy26r8gbTgmUA9JWrk6PQjURTtJ
	faGzAwf+8CNNxkxr47QqhNDuR0JRGaE6RmpAaR1j7KfSPddsesEnakHdt9Jg1+I0lmESqxzpE9H
	c1ax8GOeGW9bwPO7qEyoN0iBbjHN/bgbYZsVjT43TevGNSaGAldq1rGkCTzdJDRZPrcpcWBJ/sg
	qXh4e4HaQdUkYEjIwTAZMrAKDFi99Dc4izEmDHsYmUe8VZxvj9H8mSRa2ndaYHki+wZrlcOKtit
	Xw7CnhURIwD4EHavS8gzgV19C+M9qMgHc14UOfY7LnEB0kfUeYZi8JT1ZAULC1B7s+K8vRyRsM0
	Nbu44MROINmOiilxtMqA==
X-Received: by 2002:a05:690c:607:b0:8b4:d44a:c4ce with SMTP id 00721157ae682-8b4fed802b0mr344847b3.82.1794939217274;
        Tue, 17 Nov 2026 10:13:37 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe030c3fsm2865527b3.14.2026.11.17.10.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:13:34 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 13:13:30 -0500
Subject: [PATCH v3 3/7] alpha: marvel: refresh environmental readings
 through the console
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-marvel-env-v3-3-0edc370fdca9@gmail.com>
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
In-Reply-To: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6707; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=TNbC0S5edY9PJbiq1Kli6iS6/msJo3xMW+Ba13WeM6s=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+zPSYFn1K5fLzryoXNmY9NS5+9GDel/xF/07t4Zvoq
 PG8xf+pfcdHFgYxLoaZYooscesVWWa17Vjqc1r6F8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Zwhk6BjFQ+T0GDQyi4tLU4t00wqKHPLySxJLMvPzivXyC1LzCtIL9NIy00oyMvKLilOBRujlpZa
 Yujq6GRkamFg6Wpg5WTiamjg7Oxk6uTk6Ors6GVmamxg4WzqauFqaM3BxCsBc88aB4Z/S/U3OXz
 g2Ryn6XzHqOBHSNvlaU4WbSHDqTPfl9+y6CwUY/gf8CZr1KXjP5xcvbrdON70+/YRsj3/TovY3m
 23FNvr9yWACAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The SRM console keeps the readings of the temperature, fan, voltage and
power supply sensors in the power and environment (P&E) nodes of the
config tree (GCT), and refreshes those of one node when asked through
config tree callback 0x28, function 0x1f. The Alpha Architecture
Reference Manual reserves every callback code it does not list, so this
is a Marvel console extension; its code and function number come from
Tru64 UNIX. Define CCB_CFGTREE in asm/console.h, and add the callback
and marvel_cfgtree_partial_update() for a sensor driver to use,
retrying, as Tru64 UNIX does, while the console reports busy.

On an ES47 the callback takes 13 to 300 ms per node with interrupts
disabled. The console callbacks are not reentrant: a refresh on one CPU
while another printed to the SRM console killed the second CPU, and the
service processor reset the partition. So export the srmcons callback
lock and hold it around the call. The lock is declared even when SRM
support is not built; there alpha_using_srm is the constant 0, and the
call is compiled out.

Tru64 UNIX makes this and its other runtime config tree callbacks only on
the master CPU, and the Marvel PAL TOY calls are already known to work
only on the boot CPU, so make the call there as well.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/console.h    |  5 ++++
 arch/alpha/include/asm/marvel_env.h | 12 ++++++++++
 arch/alpha/kernel/core_marvel.c     | 48 +++++++++++++++++++++++++++++++++++++
 arch/alpha/kernel/proto.h           |  1 +
 arch/alpha/kernel/srmcons.c         |  3 ++-
 arch/alpha/lib/callback_srm.S       |  1 +
 6 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/console.h b/arch/alpha/include/asm/console.h
index 1cabdb6064bb..4f5cf589aff7 100644
--- a/arch/alpha/include/asm/console.h
+++ b/arch/alpha/include/asm/console.h
@@ -4,6 +4,9 @@
 
 #include <uapi/asm/console.h>
 
+/* Not architected: a Marvel console extension, as used by Tru64 UNIX. */
+#define CCB_CFGTREE		0x28
+
 #ifndef __ASSEMBLER__
 extern long callback_puts(long unit, const char *s, long length);
 extern long callback_getc(long unit);
@@ -15,6 +18,8 @@ extern long callback_read(long channel, long count, const char *buf, long lbn);
 extern long callback_getenv(long id, const char *buf, unsigned long buf_size);
 extern long callback_setenv(long id, const char *buf, unsigned long buf_size);
 extern long callback_save_env(void);
+extern long callback_cfgtree(long func, unsigned long arg1, unsigned long arg2,
+			     unsigned long arg3, unsigned long arg4);
 
 extern int srm_fixup(unsigned long new_callback_addr,
 		     unsigned long new_hwrpb_addr);
diff --git a/arch/alpha/include/asm/marvel_env.h b/arch/alpha/include/asm/marvel_env.h
new file mode 100644
index 000000000000..16ccd2002a11
--- /dev/null
+++ b/arch/alpha/include/asm/marvel_env.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ALPHA_MARVEL_ENV_H
+#define __ALPHA_MARVEL_ENV_H
+
+/*
+ * Ask the console to refresh the environmental readings of the GCT node at
+ * @offset from the start of the GCT. Returns the console status, which is 1
+ * or -0x4a on success.
+ */
+long marvel_cfgtree_partial_update(unsigned long offset);
+
+#endif /* __ALPHA_MARVEL_ENV_H */
diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index 92e3312e786e..bd918028b410 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -20,10 +20,13 @@
 #include <linux/string.h>
 #include <linux/module.h>
 #include <linux/memblock.h>
+#include <linux/workqueue.h>
 
 #include <asm/ptrace.h>
 #include <asm/smp.h>
 #include <asm/gct.h>
+#include <asm/console.h>
+#include <asm/marvel_env.h>
 #include <asm/tlbflush.h>
 #include <asm/vga.h>
 
@@ -1094,3 +1097,48 @@ marvel_agp_info(void)
 
 	return agp;
 }
+
+/*
+ * The console refreshes the environmental packets of a GCT node through
+ * config tree callback function 0x1f, returning -26 while it is busy. The
+ * callback runs for up to 300 ms with interrupts disabled. Hold the console
+ * callback lock: a concurrent callback from another CPU, such as SRM console
+ * output, kills that CPU. Make the call on the boot CPU, as Tru64 UNIX does
+ * for its config tree callbacks; the PAL TOY calls also work only there.
+ */
+#define CFGTREE_PARTIAL_UPDATE	0x1f
+#define CFGTREE_BUSY		(-26)
+
+static long marvel_cfgtree_partial_update_local(void *arg)
+{
+	unsigned long flags;
+	long status;
+
+	spin_lock_irqsave(&srmcons_callback_lock, flags);
+	status = callback_cfgtree(CFGTREE_PARTIAL_UPDATE, (unsigned long)arg,
+				  0, 0, 0);
+	spin_unlock_irqrestore(&srmcons_callback_lock, flags);
+
+	return status;
+}
+
+long marvel_cfgtree_partial_update(unsigned long offset)
+{
+	long status;
+	int tries;
+
+	if (!alpha_using_srm)
+		return -ENODEV;
+
+	for (tries = 0; tries < 100; tries++) {
+		status = work_on_cpu(boot_cpuid,
+				     marvel_cfgtree_partial_update_local,
+				     (void *)offset);
+		if (status != CFGTREE_BUSY)
+			break;
+		usleep_range(10000, 20000);
+	}
+
+	return status;
+}
+EXPORT_SYMBOL_GPL(marvel_cfgtree_partial_update);
diff --git a/arch/alpha/kernel/proto.h b/arch/alpha/kernel/proto.h
index c418333d0b89..dc4ae0e0ed05 100644
--- a/arch/alpha/kernel/proto.h
+++ b/arch/alpha/kernel/proto.h
@@ -111,6 +111,7 @@ extern void * __init move_initrd(unsigned long);
 extern struct screen_info vgacon_screen_info;
 
 /* srmcons.c */
+extern spinlock_t srmcons_callback_lock;
 #if defined(CONFIG_ALPHA_GENERIC) || defined(CONFIG_ALPHA_SRM)
 extern void register_srm_console(void);
 extern void unregister_srm_console(void);
diff --git a/arch/alpha/kernel/srmcons.c b/arch/alpha/kernel/srmcons.c
index d19e51ec711d..45a10d539f19 100644
--- a/arch/alpha/kernel/srmcons.c
+++ b/arch/alpha/kernel/srmcons.c
@@ -24,7 +24,8 @@
 #include "proto.h"
 
 
-static DEFINE_SPINLOCK(srmcons_callback_lock);
+/* The console callbacks are not reentrant. */
+DEFINE_SPINLOCK(srmcons_callback_lock);
 static int srm_is_registered_console = 0;
 
 /* 
diff --git a/arch/alpha/lib/callback_srm.S b/arch/alpha/lib/callback_srm.S
index 36b63f295170..6d3c9ce6b815 100644
--- a/arch/alpha/lib/callback_srm.S
+++ b/arch/alpha/lib/callback_srm.S
@@ -94,6 +94,7 @@ CALLBACK(reset_env, CCB_RESET_ENV, 4)
 CALLBACK(save_env, CCB_SAVE_ENV, 1)
 CALLBACK(pswitch, CCB_PSWITCH, 3)
 CALLBACK(bios_emul, CCB_BIOS_EMUL, 5)
+CALLBACK(cfgtree, CCB_CFGTREE, 6)
 
 EXPORT_SYMBOL(callback_getenv)
 EXPORT_SYMBOL(callback_setenv)

-- 
2.56.1

