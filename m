Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678005;
	b=TFFQ190ETESAeYnedJMg1fZ70ocZsuaY0dI7Nr4jToH1ZoITtqlffoXR7Q7Mp3daB9+H
	 u/PcfvQSLNgdgZnr4wTxeiUDID90L/rkY523Uj4UoyYrGNoJDTFOnt4B0K3I/Gwnsc2ex
	 AxXg09GLMLaoge+l0JpVVZuyoguedTkL8dYX8vb0bsVIa+sICc4wWhJLnJgCTEbZTlx+Z
	 yh8GGLgSOWugJ0HWQKsqnKHcVFGjc6Kv9m8FbsxgOsJNSbimJTBfe7kJcJB9D4P4zIPyi
	 BkUcDpHJljEk1+wF6DU4h7qnnHDs+VrvC/k9FCXRant9WWwg2/tRjI8G2ZsdnSM3fCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/226Y4aFcKPk0d3VKmImdxm39V8qyA0QwzRmeBW298A=;
	b=vg5fkBTM/JI3WXXzdRET4UwDSiCJO9MryIV6fFrHAbvm/KTsDBII7eL4IIqoyTNFMFB6
	 vT6aWy5U/KGk2JCpShf+sP5Qm1/Nots9iqm7lq2uLxmVJqIswweANc1Ytq5D8+Yk+qguH
	 aMbo5svysRRyxqJHufgQif/nNXNU05fyD9VZbvPtw4G1j/pOJLtHsjstmJDB6Cs9vlAgU
	 deSiIU5dywgK5JwdrySlXmCsEzionCyrdqI8pCLXoNdDCqg7a4e2XbbX6LoyWqmKDUMWp
	 FDZOPx3lAjaQcEObl7ufOsQIuIaroEsCIUVbX6/3RLp2xsEAqFHL97H3knAI54G9SLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NDe3mNXQ;
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BB260A2619
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 17:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30BB260A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NDe3mNXQ
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67d9a5e9bb6so1103562d50.2
        for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 09:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678003; x=1795282803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/226Y4aFcKPk0d3VKmImdxm39V8qyA0QwzRmeBW298A=;
        b=NDe3mNXQCyKWUsPt59T+7jGbsgmo5mW1rT6AsgZyh92OB21xDOtjpHJvXNkZ1b/3ls
         Yo27iCN6LI3Ky2Do0u3f3eDvQX+7XCJM2Ri18VIQHGTCYNXz3lQl8gZclD8JLArc1UD4
         YB7SipA/xm451JLDYpO2IMY31S4xnqURwQZnqD85NYbEKzlnAyDVPjFAxXSCmdIFmYZb
         Mvl0W5rTQwYG43dUOeHHPeDVIt/TjOisCzi0vzHmfkxd4BGsxrJt7pWvoo2PrXlZ/2gI
         6PmxtuWoIZvKvFKbPUubTPA1Sw+CcUkVwMKLLvOpn6w3pdNtcf02S1OLoEsvFPNHj9j0
         0RJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678003; x=1795282803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/226Y4aFcKPk0d3VKmImdxm39V8qyA0QwzRmeBW298A=;
        b=hSSvTMXsTjPuN4i5LDKkpF2HtcNhlXeVLeNKsKhduL5vtMeuodn/2GU/muTjpTTm2F
         8cef0V181I1liHIUgkhnTGUdpD06r4ZucDDbrCe+NEivyUaQ2/P4v7zLPmArXyVzBizS
         kylDCFILGmZgu0EZKuTxW0K2TNrv1xX8rf77CnBnFuYzdNx48gc7MgyoskAbzqNTUmVz
         oZjUq99pZjADa4O4HRqGyGSvWI1p5VewFiCSwVl+FgybPqPXd7TJIDh93PCjSyDR/ciq
         WHrxNuozevjc6HVhSARyJILt9pBcHYogRTDNoowOYsYTeArt3rASX3vfoCXtK82Ez3gs
         hsYQ==
X-Forwarded-Encrypted: i=1; AL+hErFPnzIlZV014/ZXQI+2hzKlmwg8cNla/UoUrU6DU4krv+pReQi5Fn2E1apT4lxKIwbu0cJQCIGlceR5hA==@vger.kernel.org
X-Gm-Message-State: APuU4Z84E2myuiXhACaFN6aCs97CUipwcrELjM8dr+63NAMnFYQmz8aD
	/bleWTYpg0d/o+a82vHyF3OzB0aWnyEf6+ztYwRya715zCL9e4gbR7ip
X-Gm-Gg: AYBFou0U1g4fu198VE8UdhRiq4i6yOkZdGZMvSBuYdmM1SMR2h7I+Ko4GLOi/5lzdSo
	qn+bUlmAfNv3NGKhT+xD2icsBRkQmbZdJ8xtZCDUG7eksUICjE5H7zxGi4dqNHKJBu16oQ+lUOx
	EC7tL7B3+ncU3RElWAwxwUgCzS0FhBihVAKtqhQenNDaJMIawNfD1kyobDfs1LwNeL+UXcwRakm
	UpDvBv1LN+U9rw3MfzrB0z9O/5P73vkAHrgkMy+T14Of+qs4RZFOioNlRoQu4TSpxeBDzJdVZtg
	IMzu2qQ2WMYsxb0yDK5wjlnbe2C0VQpewz6Qka5QCZSI4lSgrH6t1XyCWYIw2IOZf4lax11gYPJ
	ZztWR/R6BkHjEqkzHcMxUB4mQIyxAhj1uFhORAbFB3EQ/kA/JjHJNc35mjYUzn9/bGtHoNXCRwR
	R81JbNk9XvK3F8C6SJLqWAgThQ9lfXUsOke7N2/NeN3PpRot9p/597ONLqxKhUb2DgmRu2ZRsY6
	5MyL/NlyK8pjr1vsx6lpSJOY8eHCiCRZ0vw35LBs6nJAyWJWoHoqy/CtuniPqbtmnDfEhYUGkHR
	XiPlFFW1BEmzG/H5M2PcfFp7A4A2MU8qXDGMADU7fTItdTik8vXjj2lVzu/EPra/Na1QmEd2cMW
	kliwxIm08Y3xy1ScXMyCGOksbL4ThuHTTV346HS2q7tBGSIYoilGsRAuCkFYgMw==
X-Received: by 2002:a05:690e:48e:b0:677:cb43:4b3a with SMTP id 956f58d0204a3-67d8979ac95mr2046603d50.156.1794678003167;
        Sat, 14 Nov 2026 09:40:03 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7f1a0dsm48618117b3.1.2026.11.14.09.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:40:02 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 12:39:52 -0500
Subject: [PATCH 6/7] alpha: marvel: notify environmental events
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
Message-Id: <20261114-marvel-env-v1-6-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
In-Reply-To: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2124; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=kn6qAKEjNgVefdGm65LCAkz/4DlKpjG6hjl3uYO+Iy8=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+zHnss77lqeSh2wWmTuuz5si0HdjDcu3iJYONOorrM
 vcfZ+Cz6vjIwiDGxTBTTJElbr0iy6y2HUt9Tkv/gpnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DIEMHaN4iJweg0ZmcXFpapFuWkGRQ15+SWJJZn5esV5+QWpeQXqBXlpmWklGRn5RcSrQCL281BJ
 TV0c3I0MDE0tHCzMnC0dTE2dnJ0MnN0dHZ1cnI0tzEwNnS0cTV0tzBi5OAZhrtK4zMvRfP3jms+
 d67XBGN5n1d9xmlKT5mqfP/6nwNV/Bp9T7ZzfDP2t7OfsvB/YFG81SKZA4/Vi/knVPmLHUhjsh2
 1u1mniPcwEA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

A change in the state of a sensor arrives as a system event logout
frame. Call an atomic notifier chain on each one, so that a sensor
driver can reread its sensors and tell userspace without polling.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/marvel_env.h | 5 +++++
 arch/alpha/kernel/err_marvel.c      | 9 ++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/marvel_env.h b/arch/alpha/include/asm/marvel_env.h
index 583dca6c02d1..14b05efa6f51 100644
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

