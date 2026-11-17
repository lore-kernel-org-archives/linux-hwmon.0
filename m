Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939220;
	b=fnC9+A7jFfFeNe3yukrszbP8jS0DtpptwCFr/QXcghO4IYHExa5dTvmfywA589BrcG9y
	 iZCuibjPIcj5hhH/UW93hHL2kFo1tXQVY16RmIYTwE0bUdaov66xyiu3Btn/IPl8r6eE/
	 udIDfel80Q24P4haCJXDm2O9nuFTnQB3PB33EZowPUj9M6YOeM69HmIM+H/y+0EJSmwJU
	 Cpw72ROaZwmhmw9ytY5NRXN5/cnTADelouXaYEavKDimS/RZmN69MlGhGaLQmEeoe6B9E
	 MfFCimL9n9PtsQmK81cktjpilwBddmpOGM0BnmUlZd4B+8tEhRJTifv2slHLOwu927w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6fd7grfB3tzoFbfBTrAoxkisbPV2yJhpf6JFjYB4i4M=;
	b=iPJDD0luuly2VR1RpXIj191YoSWbPAbVOXkj8hpO3NXzoFvwJ58tF881PSGvlBgYc9+O
	 5NQduft47mrww87z5N2hQQGh9NfeeQ50vRBd7Etex8tWmOm39W74C0ZNdFlTibP6W7QD8
	 Pu3ZJfcbH9i6j2Gxi0A1reKtbURgTU9oJThbIkyCPZ6BpeD9C7Ia9fzfGuereUh0DLEpN
	 Vg4IAdWp9vX8fbSI/IOKyNoEOFEoF+Un+xsxT/9EkaWVGoVOfQ/TFOGFqH9uXaqvLau/N
	 daJjGA2/UbA5CfUoq7FZNuYXszKJgl/5y8UGbf46p6ENkAl+f6LjL9GJATbSLQfIXFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MmxQwpGT;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CB4606A8AD
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 18:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7CB4606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MmxQwpGT
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67583c777abso1694637d50.1
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 10:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939219; x=1795544019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6fd7grfB3tzoFbfBTrAoxkisbPV2yJhpf6JFjYB4i4M=;
        b=MmxQwpGTj9NNy0RMrOJv3wL6yArdoKdNFg5vsACRwNLJ23zoNJoMRPCRiMrzrxbUKZ
         u6kgPFEE170tnccn+ZPH2oI0O26G5G8au84zWGuTnC/rROEJ9NuK3fx4NQoAfjBAi4Lj
         ayC+6jfzy3Ah1R9+tifrhIqiSNwFiMngsvKNOprhhhMlRjhCNFSqlW95JmVeVpphc88/
         /BblIG2qFtA847q91ML6UQ0lVaXOascRfUrWl/8YKagZcvC8eEV1DvvNObYBEKj2yWq2
         z2crBBJ1HVxCJT6L8u3MFHv+1j6DGjLIF6qtFpMIpVBZfSji33i5Oo3p1LJ5Xo3aajps
         JJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939219; x=1795544019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6fd7grfB3tzoFbfBTrAoxkisbPV2yJhpf6JFjYB4i4M=;
        b=bFgusvT8miVHxL+tHupu8Muks8AP7Nmcl1rrqAe2Wc8ofVnwwArC6gAo4+SnwS4PrD
         gXa1lxscD3m5fzsIagA8YE/vQkLB8EQfNsNjKeA/tDnHrdwy8qCztS6zuSY5ny8wUL98
         UUfKCW+OUYNc1X5FN9gwUOQNW5X7dMCVxDAzEoPVPvn5XCIkr+uFEi+dQtjJ+gEZK8zV
         xLSpdci1oBzTYgj2HApM7yqv1t2HckyqWmr+zSv7M3ROZrL4kMcCzTbBN2c2aENqgt8b
         uu9XEvxpBezqq/1HRqqOgm80gFmQ/WhS9oCPLVgFtmdKzrIaL2y1aj7tAp6vQz5FqEyY
         GOug==
X-Forwarded-Encrypted: i=1; AL+hErGYwWhQGBzYgX84dTrMErfUOx6i6HG4+G0a7jJ0gmq817sTVb29jd3pJgZZnM/g/DIAvg9IAmbZT/1GKw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/qW1d/WUaK1EGrVSIlJsPr/sJnsp3wTI0Y7xxBpww0s83K3CHq
	gUXhQhi0NJvgh9d9NBX8xHCqV6ODCgmicsD9bKQstD9OuLHwxoHj8/wh
X-Gm-Gg: AZFdTZc74oI7c0b61FqwCnee4TmJ/9AUpObB8Yl2scXoihMRYWireRp28yOAZZMIYml
	BNOMBCD5rddKjcQOHadCrAm7YASpTkWK9fpQiOIOU6ZjlqTZNu+4NReTUAlbBM5DbLMsQN2KDsi
	mOZ3PI95xeB2SSITzSHf9Sto0CSmhtSXxMzd2jFrCRd3aS2UceNjPoVoWBfpj9TdszA239EsVom
	Ohvwfitg6vh3fgAcVvmXpEDP88bOK5sBpU+kWwzi2OiHripthOi8GVgtBnM7GFeYYpix6927Nk7
	nX1scnTtAQILQNUhedbGTXNV495HUNLl7p6VujpV8WXzSB+JWux1pd9TMetAWplckzcQJGbYObW
	ADrBlK5DiaOrW+80RdZqvF5ZndegxOHMDt9jWwakIKBtFEe6kNl38VUH2xErX542gzBb+IK3bbU
	0M5Her7fjc+mYdUHGACiAUKH4fvvFXaygNQdP6qDsrWV/xl6AhyA5TA8ArTE449jFxYr52KaQeM
	ys7/njbl3CG84kEs4CObXBkL7/zbqoAVZPVcOSmhGRkXjqj9Z6lfkPuhO1805Xqkh5WdKOxrCoC
	61McxBTYwR82NSHGPUnFOU91GrIFQ1GXvJ2KlwIKwUPOrNwnk16ygrvvaGt4KLt670Y/ieTuthz
	GPv7PTbvMSAIZRng83G6O8hpccOjMBKgpnD0eCp03KnyoHRsbzhArhiYdLduiAgUFirmyg3tEcp
	umYq71KfAI75xQfm8sLA==
X-Received: by 2002:a05:690e:12cb:b0:67d:a102:b8f4 with SMTP id 956f58d0204a3-67dc74c31c3mr2212909d50.0.1794939218891;
        Tue, 17 Nov 2026 10:13:38 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd3fed78dsm268757d50.4.2026.11.17.10.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:13:38 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 13:13:31 -0500
Subject: [PATCH v3 4/7] alpha: marvel: notify environmental events
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
Message-Id: <20261117-marvel-env-v3-4-0edc370fdca9@gmail.com>
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
In-Reply-To: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2137; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=kTcqrZoPJJjAEKBBA1jTVVnkVIO/Zb02KSORE5Uuqtg=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+zPSo1y/OD5lwet4Pl0UP9Q8KXFLOvCMk/um067T0i
 OTHXs0RHR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHNN+S2G/yH3tZzbXw
 hUz/gvV5CRc7ZayXvSmybOXTvf7l2huD6p6gLDf4e7dvWTfyX5f1PO+c54ZUttXtDEDRpJ3gclP
 dQcV1V+ZwIA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

A change in the state of a sensor arrives as a system event logout
frame. Call an atomic notifier chain on each one, so that a sensor
driver can reread its sensors and tell userspace without polling.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
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

