Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046996;
	b=lGWHAwZpMmNQWDH7l0Ac92qEol2hgrIn/R0b9EYSVax79WpQiASmnF0LkXn4llMVPGBE
	 FcwRHeDd/RrewKbDkSVKtx3Svjzsm61+oZyXeVYw1IWKiEFLell0/vraltYWB6EjiaJVz
	 eK4B+hso2UyTV5w1SrRoL4GKuj4JDsW0rX8RLS8pGYX/OOjUq5DDuNp4rd6bRJ3IZidQv
	 5chPeCkVMfiGnR/Vok0Lo8YS0q2DZLYWABNWJuihafQubpT9g9E449xgDGAZTZJ7rIlh8
	 sEjOtdLf9FislnDOAtV2TXUG9+cIaqJF+w/rJ5QpB7abMdg7AtunMlTPBm7w+wofY/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=kPOmjZHL2MVM+96ZWfKvkOf0Mofm4xRzdrRKCy7xI80=;
	b=xrfSKEVFyiHi/0urwG7acEyPrGMtnTqZsKzNrAzWVUPL/57N7e37fqOnznrH5j3COJRx
	 tjiwmk2g2XhtFMukcnDDEsqWGUtr4BQK/XXJfBbdThti2in9QJxpKY6W0p4qqlXpsD/zL
	 KwLTKm8ien0tHhSHkxQ+5mVauxtjFjQ+sedONUz0vrxxWdT33Mfz7SSXNmpAg1GM9gs8y
	 ELn4xRLE73av77Xo5iEQ0VUZZUA8jVGDloNZmqIWi9xkJuMBPrV6s1Cj30V39dGRjNbSh
	 T+r89RHgokABdCqINQqrXQJyCKUrh+qVJ5C8u0AhSBesUUh+ZshFg38xDQwKEnei01g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7VS64mn;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3E0606A33B
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 00:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E3E0606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7VS64mn
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67db23d8892so1944042d50.2
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 16:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795046995; x=1795651795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kPOmjZHL2MVM+96ZWfKvkOf0Mofm4xRzdrRKCy7xI80=;
        b=E7VS64mnFp6l8FCWuCRBxcX9YMl/2v23EqZHLiM+UezIl2FzGpaRLOw8vT3KbvaXSj
         M3pgt2gBzEcurWOzbzCMXF6laxjCofxmNfE0sTtHEOnGWU95zoTmHm83tH43NXE4G5ma
         xn26IL6sjeUVB5LqgsfQBhdOhgr62ZwiIsR7Fzfwr5LyWz5x4tjp4Jviq9UAbQg2DLRG
         S/MsyA0nJu246TYufLB4t7Za41wSWMWtfgxnnx7EiFVJYlZ03jkf046DFKt8LnTpu5cr
         VLiFq1rlfv6OZTnJvksZ0Qz71qC6t4OrtN0CRfWnx+a/NZuQs47rakQheFeIFsGUYwWz
         wTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046995; x=1795651795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPOmjZHL2MVM+96ZWfKvkOf0Mofm4xRzdrRKCy7xI80=;
        b=IhJmBrgurfyZD+NcvFYfOwcEn4b50R0mXRr7E+YIcPRiDFYel3ER1Q8WMW8trsD41G
         jzUXYnCnm0SwJjp9cX/UqzMUXLjgtQkoMSDUumreTUYodrIGI9YYJa7h+Z0F1TQqSc1O
         AG/i/FTE9z0mheLBaQ3Q93Dwm1Yv60hbjeYCGSNJQoPrkfly9WN+qaPXqnxsbhQHrGy3
         a1mofzx+/BM3lVQyBVFbNPbWz40+IrMCQygzlHzLhcNe90tlHHRSU/pmL7AV8v6uRtHB
         +3m16xDvxJXtxq5+xplTmA4zytmjwujvLvr/Ob6JHsnh5jMwjTwEANI7uz19nzncBPJ/
         HODg==
X-Forwarded-Encrypted: i=1; AL+hErEOGJFTqd8G+iQED3vtFaRBFyoDhkjkaJb/fv1k48UpU4aG3dkNAfgIQcnsHBWyol34fnEPgZu/K0GNeA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+HUZDI2dx9NSUKemELprdJqH1RFUlI58v+ue4+vK8B00urLDdf
	52NOBhWc4JRLR5qWIeap3z+EFVPy9yz5l27nVM0uQ6+r102SwfDWI+xHi0AyjGt1
X-Gm-Gg: AZFdTZfgYcj0gH2xXWNOvVDQJ1GwXCpdBGx/BujZOF3Oqu0u0PtlD0Bk4c2Pe9aPS43
	Y3UpN0XvQLPY7cp94ER646ArblVqzPpWqE+udtlXmdidDm1UjjDZp9sbok4vJcnjH+afv8ok4kE
	9x0GYzrzM4QFG/zyDCcIg7tBuLhH/gsUsklSa/bXY27/1JoIMN3RlD/5pRBLcnO7rioB2tsBPDH
	F49f/iQH+4Eok9nd5/hWCQIOMwSpj1IFSf+lsEFTS0+X8FQ/3u/tRmtoGS7CgpzECGbRsUK4a1K
	cIEWwKnp1HA3Ng2YoL8eFCrYQcPmUKCK65fkwbEv70J0oP0RBxcglwmlZa33vYCRgo22HWVIVue
	AKrK63LegoLSlJSNaAm8r2ozIIuvxEtf5nzaS/Cs2mYBb/EjsPi24AmtOsINoXDVMglIBWwuCPG
	v/tSKEuzpQetfyKJAw7/OPbzscomXq596iKAhmFgwOakPvF0YIoszoC3FW+IwB490yox81RriEp
	sZqUmcm43DQGTcZE7AiNGsOlR72Sro89brmt7mulCG1b1OBzW4IhPfEvh+GEPrtxWsMxrYVzeS0
	wXDAJ9Sqko8RjOLD31O6t6VA8lYTtyNp1oWMTirJFPtJq6Wup6yWW2QCETblDlnYptSD+yi68Aq
	z8Q/ydAEZimJz6tFspW7VKE+NqpljJFTC9GAUbqrVbsrSYF6Ezsu0Tn3ayzsPfFzbY+MH4RPNNJ
	Als8BamsHxAMhU/vM+Sg==
X-Received: by 2002:a05:690e:1c09:b0:67d:a5bf:ac89 with SMTP id 956f58d0204a3-67dd3cfd1dbmr2362473d50.10.1795046994928;
        Wed, 18 Nov 2026 16:09:54 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd58a192esm2510247d50.15.2026.11.18.16.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:09:54 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 18 Nov 2026 19:09:48 -0500
Subject: [PATCH v4 3/7] alpha: marvel: refresh environmental readings
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
Message-Id: <20261118-marvel-env-v4-3-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
In-Reply-To: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6757; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=YTQz99AodTvjW23cOs7Td9nyoVGKiltxq+8RLcxy6vI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+2Xnlv2WrvPbwvLzqguL4Z2cNLhxPuXDNOOTiBHXtc
 IFFN82rOz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaazbMZ/jukzr91VD
 2St/WG0KWbb9ecWa/TFH88q46hr3XdHEe1ZnGG/14Wf9PTZOxM51ncODJj06c8t4d2V17tP9fMd
 JTR8tyBaD4A
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

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
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

