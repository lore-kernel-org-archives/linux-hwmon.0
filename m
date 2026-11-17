Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884360;
	b=ZGCiHKm74f6f1uxKBzBBSQPQdJ7f5gZpPIyD3J1MbQ6SqLjhh0rXgVnLSPEHRUQV7qPG
	 6WgcijqhtQRTF0cDrNDeMCELn4ArNnxcHdTRYAQmpHmY8Gffa6TWiP+hkE+pyJw/+YpQN
	 F5BkgUnuH69/UTJC/HremNdGevnXsVlWW0GFcKvEiISMyzTZvkCPY1JfgN0K317WZYPx/
	 n7pP8KgAcdAvGWitGDtE5ZnCHls9sBChWBQt0pmyEFuYipebkDswmKOPAmY2NymQa0IhG
	 lzzQubfllN0FE29wQbJL+qkknH4996vvk7ORhPoHO+bynKse3FML5+l/k7PEEcbpKSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=689Tm9O+vBEQHj/FM7Y6c1v93wlxXsLmvU6MsCP0/kA=;
	b=Tds+JuoRTts/CoEOEhWC3AxA70VNDgyLxKCYRT3c3FnxCErupU4jKOC6zCJLzTMunipD
	 3qBNr+Of3l9uP1AyvfYCD+D1nz9VjxLJiczX1EKDYtojLU4jvWvE9dtbhCSt1A20rEevo
	 VxiE42i/UBGzBFFtny9LCu61B/OYooeGobQcYyfNzXHwbHz9dHKmsL2y2uDHZ+Y4nAazc
	 keGr+AWvNALzae0Sj7IAmehAa5sNI/o7OWnfO9urg0scBZwTGPY7+Diu38zfgz6SnQvOt
	 sujXHFwnMGnMonRyRKiIoiMo0mQvkWmT49NsMB+umO/cAUaI2/WoJfb61Pq9LxEEefQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GF3ZIRbU;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA3E606A89F
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 02:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CA3E606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GF3ZIRbU
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-679a2b5fe87so4331190d50.3
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 18:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884359; x=1795489159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=689Tm9O+vBEQHj/FM7Y6c1v93wlxXsLmvU6MsCP0/kA=;
        b=GF3ZIRbU7LqrXGuYUzXiVeHsCoUZGHberWUzLzJSu4GkotszijPt0mqboO5i45yf86
         1Kpq8r8oxv/AwTrhJAaagVPXl7sUccrAFod7uS7R71tEWeAnpr8yofaRz1HBY/12skTk
         fqi5nS24DdzW46ZgmaWeIZmF1nXJz6GUQqkn2LrrX18L/z3w6Ac4EbXY0Sgt3vBRNV22
         C+eT8/iWoqrfdoKnEWXyWwQg/yZzPiNoWtRO9gk45o92lcABpkHG3x9FM8VpP49qIMaR
         WDOApUvYOZtwjvHIUdKuIZtyBE6UG5y2+QW3Z/E82tIdWqaCeakF6+Ny4iN+KyOK17TJ
         VwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884359; x=1795489159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=689Tm9O+vBEQHj/FM7Y6c1v93wlxXsLmvU6MsCP0/kA=;
        b=owjt4bUw4JdMXY3uRQaZN+5xGgJwGim4fpLph8L6Uw1sYO9rRy4Kw+0ocevks1s/fR
         spvJGhZ+JUIrcpeimdF9VEGuvZUWhaffgQCYn2pEeDwePS6bG24t55R0VK0uTiib/uCy
         HR1AvbppDDP080aW5fPkK2qc53S0puCYLZ1eCMsfN2fsyTFww3R70jxqUMN4MF5CZBHh
         dyhR+eEdcBMW+hdUSyyVMnIghYU/8aqn8QCfQc8OC7t+H0VEyScxYB9aYsyRqWDc+jx+
         KCPnF3TqWwX1zRBZhKtR4ObUdhEIm9L5qwK9fb8appw4HOmptw++UnoUeFO2fPB9co06
         PzCA==
X-Forwarded-Encrypted: i=1; AL+hErHC4xWvASF2oW8EidWGs2bM4c6sk69XRQ1KURh8AprbQgt8ER3e3n040UncB2CEma01tXV1jC/+kF2/hw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/bZsljKCUQu16qtde57kfJQygo2D27FQEtCG3lOIm9/74K3vKP
	z7r2oChV8Y39U7ZO/svHqYjGIHafWH6NXJLJpLu7HcEa2LDuP5Zgk0vX
X-Gm-Gg: AZFdTZd8kItSd4r9bvdGJM94r12o8Tpl2QPN2jFLpLljk4w/atxaiPH7d+C6gHmDQMc
	lSoiK1bn4tttPYqE8WpjD+4IjyFprtvOu63icSKE+I2OXYTVPds5EkAQYJs0uKPwKPAA7yybvSr
	CK52765G978VZAPtVx/jEa9tbBfg+GJckwByquM63riJvqng8kcazV+pIcyVzEhLPbAGTEZuBdg
	VfWMho4ChM6NWN4jyv8DSgdu5d6/6yOAEpypgKMsPoSFjuxX+Qdp4gWAXzyTCbTNMCNel8tmWzB
	pfIMplyEjmq4j01Vxq/LZ7y8tzq3zVhhvoqE82irIBpgzL9ExzKyFTWMMvkvjr+Kj+liDFa2VOR
	uIu/AY/kiH8jT1o4eKjqQ7PFbJfyzmmlZ9yT2K/MYzVvYgUk4RCsgn1DJAXIzzPUzRb+TPMHY3J
	tTJxXksTNcQhFCTbdGf0iIq8Fu2CvdC1S1xm3LsA1P1rllG+flvlDq8SZM7vplMv/UkjkfYvrxw
	VaWOUx3kzWLUQWnvkplG2mlmQP9uYN00XhXHI91Jlfv6Ziq9r1gemGObXpJzp/WYjsoMnoKyOuv
	j2bMDH2ZPCP0X+1uZ3BZHLUdD1pH5PHEBu5/sRtb59WGhZYWvKcsWhylfjkkYOlWrYZgKq/friH
	1fGOrsWlqadoSR4Qjo1UtvVeG5gA9vZr4N6okNGRRebZtPOqFrrBmHbJ9d8MuWGac0z8oRfS4yV
	qWTAp0uuzbvokAWgr9KYQ=
X-Received: by 2002:a05:690e:1388:b0:67d:b4ba:b4cb with SMTP id 956f58d0204a3-67db4bab988mr2441881d50.27.1794884359223;
        Mon, 16 Nov 2026 18:59:19 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dbbdb9d0csm3768907d50.1.2026.11.16.18.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:59:17 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 16 Nov 2026 21:59:11 -0500
Subject: [PATCH v2 4/7] alpha: marvel: notify environmental events
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
Message-Id: <20261116-marvel-env-v2-4-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2087; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=DL1ALKxKn/ychnU0MAIXks8gfYB5EJCjJIeCgE+gavc=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+H/oTdbLrVEKd2SzHxK2p4Y+zItjcnJ5wi+cfEH3Ie
 ldYdcmXjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLkmIIfhJ6OdfMbWBV
 Pm/Lue9DZq+83lhpXaC4s3sfel3V6TdlNsSg3DX7H4o4axMVKP5Q164m++1rJtef7ypVRC9/Hly
 f8VK+5ocgAA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

A change in the state of a sensor arrives as a system event logout
frame. Call an atomic notifier chain on each one, so that a sensor
driver can reread its sensors and tell userspace without polling.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/marvel_env.h | 5 +++++
 arch/alpha/kernel/err_marvel.c      | 9 ++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/marvel_env.h b/arch/alpha/include/asm/marvel_env.h
index 16ccd2002a11..dbbf827a18ad 100644
--- a/arch/alpha/include/asm/marvel_env.h
+++ b/arch/alpha/include/asm/marvel_env.h
@@ -2,6 +2,8 @@
 #ifndef __ALPHA_MARVEL_ENV_H
 #define __ALPHA_MARVEL_ENV_H
 
+#include <linux/notifier.h>
+
 /*
  * Ask the console to refresh the environmental readings of the GCT node at
  * @offset from the start of the GCT. Returns the console status, which is 1
@@ -9,4 +11,7 @@
  */
 long marvel_cfgtree_partial_update(unsigned long offset);
 
+/* Called from machine check context on each environmental system event. */
+extern struct atomic_notifier_head marvel_env_notifier;
+
 #endif /* __ALPHA_MARVEL_ENV_H */
diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
index 46c521cea9a0..6e0b0aabdaca 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -17,10 +17,14 @@
 #include <asm/smp.h>
 #include <asm/err_common.h>
 #include <asm/err_ev7.h>
+#include <asm/marvel_env.h>
 
 #include "err_impl.h"
 #include "proto.h"
 
+ATOMIC_NOTIFIER_HEAD(marvel_env_notifier);
+EXPORT_SYMBOL_GPL(marvel_env_notifier);
+
 static const char *
 marvel_env_state(u16 state)
 {
@@ -82,8 +86,11 @@ marvel_process_680_frame(struct ev7_lf_subpackets *lf_subpackets, int print)
 			status = MCHK_DISPOSITION_REPORT;
 	}
 
-	if (print)
+	/* The frame is processed twice; notify on the printing pass only. */
+	if (print) {
 		marvel_print_680_frame(lf_subpackets);
+		atomic_notifier_call_chain(&marvel_env_notifier, 0, NULL);
+	}
 
 	return status;
 }

-- 
2.56.1

