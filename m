Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884362;
	b=XEpC1lxjBaGkpaKUgGSGbbCoLyq6lpOwX80BKt66hu1+8ZHorfBbZQTohOdxvs+2SU6+
	 lCR0iOyFYD+qD+8oYdI097VV8kGGGNzjFONqmTsX/Tqz0ifTXlf9TLAwYCXxqx4wZ5KUr
	 m5qUn/hPr/CJvtrpRRN2DKkWeudRQhzzQI40WvS/a1rPZX7ENjHVN5ssOJYidzDZwVT3K
	 XtZtj3SPYVhAax5PSmZO8vl7SXUgnNiUwdU3nVH8yvG6sZ6M28N9xz1hI0XSjhYpGMqYZ
	 EhIiNoNeauc8XW9sK2n5Ex3WoolC9/+DpfKvAWAsQ5VbRd7TdzKOd4nlGd3ISQNhrJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wbENZChveauVVgT6hKm3TIJcmjheLSG4uWx2lXGAyh4=;
	b=DVoTJ4UofcIZOuuDolbujqaF5HX7UvxnstSnsvlx0kIBUX3DmrYTftFGacpGhJS4B0bt
	 iuhsVgK5pCuB8kTh6nc/S1FtexvFVUwlYrv20HoQuxDmviY7CjU3iVD7toNW1Bj9ecOoh
	 8laNOWgbhbsts1YeS/FnAU6uYUsYRvCZa7FqwRSuUx/VQPXzH5gO7U/9GKbR1BJpkgos1
	 oVUnpyGRzb4FxdJcYeajC287Ib48dz7DXiKSha2eCSHIJPO0OSKSF1NrWqdqfr3TxsYcp
	 ab6Mv03AajZQ0ptWH7iFD4C51XRWt6cnbvCaUEzIriqp0UwRTt1Zk/DwQzviC5wN9zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oeuzk5Ca;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8D4606A882
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 02:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A8D4606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oeuzk5Ca
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4d86f5328so11631467b3.0
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 18:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884361; x=1795489161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wbENZChveauVVgT6hKm3TIJcmjheLSG4uWx2lXGAyh4=;
        b=oeuzk5Cai02QOkBVatxcY76kHfgc4cFvWlnpleAHdg9txREH7h9S63Rah3Hf8VA004
         rApn2ryC7wf3wixS2C5v9d+nxrdBRPFsqQVsMHYUW69bs1hg7TZzFPWNolRXKDZT0zpB
         zrPI97ay9iTjEeY7smrBvfuG1B6aSR0zGUUy7HPPSnMD08IctZxQr2n8499W6xc0mIUf
         Z0zjBDXEktA6Hx6B1eUYH8E+Bl22URiq+HnqD4lo5SxWvmebTSRBVDIm5qwat9HfrGOg
         7RnQTCAMl7JbXkSYpp51OxYee5NMgFK41YUFAPRxc64TzWSYKIbkAqI4ffH7HTTzDUnO
         54Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884361; x=1795489161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbENZChveauVVgT6hKm3TIJcmjheLSG4uWx2lXGAyh4=;
        b=de9yfNmTdMVqO2jcGr76yLo82Mjopry19BlOJa57SBmn38S9mhC6oMqOVafVQbYmLA
         DwsCrYgftvEK3FlAHSubkE6gA5VqG/qgEKEA11QIA0s1Ej9ROuVJpNSv9zpWZK5w+tRs
         MRz5sckt3eWqCyJVJDnCjEvI3aKVijyXqyGdfDMBpzJoXlB0gEfk94fXi6lKQEQgXdpX
         3WPSFtlmKIgCyVV9ClzPuqR0H/zCjK5lkeXs4bdYzuxR4qzjt9f4Xl84MVjai1GsuGrC
         uPwhzOqKj+UnfVxb10rQWJQ5BA2pPSxdYXPz32h9CUPUY+gUg9jzecFaKAABqCED8jRF
         f5ZA==
X-Forwarded-Encrypted: i=1; AL+hErGlU/5tvkEnWAorpjbSssPSHJhQ8es/AtcB/E6C/F+UhteSJP8uUvXCShKzmr+xUFMyh2Df20yS//Yzcw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Df/6oCU0Rm9VNjrUlYYUNoG4ZNxUu4N+mnSAqUHkhHbWgo8tL
	X6FVe+gNSXPflHgoQGQDMcOUZomi3zxninFgswieyKCyUeqSogYUjGsU
X-Gm-Gg: AZFdTZc8Fs5eRzyjXBQ8RD8FKcMFJGSEw+0zUQQGZo9nvm2MnxCYadhAuCNSSLaCSXi
	H7utQd8imzRBCucsWvzVzfAPFdwdAL7CDqaIiRib/lEunw0pxd0ojyFmANLZi24MhsIwfh0CH/o
	6pSvM98t+A5yYlZHCVxtr41Nlco5XBgjoZ/tgdiE1G9EmM3cAxbmVxOF2FfFyb3qBZTCWlp7D1Q
	xElC9pGQKEu9EwsfsOZ5X5ZnlQiuYtUdEeBv+ZwRTajx3Yz7yJhgogDUQtIU1ZSQ9vuRFpfyetJ
	ncbEjp21kdbrVU2SiGTpnlotLN0K/ZUpFRR7ZryqhErjhWcK1dgP/wn+9Ss7iMjybJD6ov9l7Kk
	T2BTQdPC4Hltvdgi2vbevggY2aJr+iLTvknKp4XY3wmf1maI3KvTNEZ41Tt4iu9QLUqWKX6TsNv
	+Ne0BQlbz1j+V7DOZ9CnYt66AGwydKT+WJaAJRAJKWxk/yAIoZWfJsaRqRuVA6KO9R3oydHrULW
	qN2THf+XbuwhyverYBzXwN4J//rYRNJF/XPH4yiEnHqUGh4WA2O3VbEeoNgYE54m5x3ibEfu6Ot
	C8KJe7p94+M0CcXnjTSl7qwXYvTFHeA4QiNlLkI4NaYXtTHf/io+y9reYpVBT9SH6oVJuS1joz5
	XJLoCdP4YO69omUluJdYfPkVFqe28hPiPNiafyGjyWDfRjf/afIs/K1A4pWr/o4aIBTv2Xchmgj
	BjIIzWoeyhhz6QAszQL/2mmN1gcM7Caiu8vpS68Gw=
X-Received: by 2002:a05:690c:4990:b0:8b4:d9d2:df80 with SMTP id 00721157ae682-8b4d9d2e1d8mr21916577b3.24.1794884361016;
        Mon, 16 Nov 2026 18:59:21 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4eb7f0530sm14639707b3.1.2026.11.16.18.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:59:20 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 16 Nov 2026 21:59:12 -0500
Subject: [PATCH v2 5/7] alpha: marvel: register a platform device for the
 environmental sensors
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
Message-Id: <20261116-marvel-env-v2-5-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=5M8/bkKqDW1fR0jpsWeEFd603SI7R5txSS4IygbKcb0=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+H/rz1dCx72xPpqbywdN/3jC0WtSu4M80OLKmd/7El
 AgfxeiSjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnmYj8jwxzzhKipG2
 N+O7z9d1t8U4jUYsULYuzvNq/rvj4tJ+ug4C9Ghh8JOjw2RRnhLwsj5R6/2iVcqOzztbHJa9uZr
 5vvnlHhYAIA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Register a "marvel_env" platform device on Marvel systems booted from
SRM, for the hwmon driver to bind to.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/core_marvel.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index 7525f3ed6b62..169a1df6adb2 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/memblock.h>
 #include <linux/workqueue.h>
+#include <linux/platform_device.h>
 
 #include <asm/ptrace.h>
 #include <asm/smp.h>
@@ -1139,3 +1140,13 @@ long marvel_cfgtree_partial_update(unsigned long offset)
 	return status;
 }
 EXPORT_SYMBOL_GPL(marvel_cfgtree_partial_update);
+
+static int __init marvel_env_init(void)
+{
+	if (alpha_mv.init_arch != marvel_init_arch || !alpha_using_srm)
+		return 0;
+
+	return PTR_ERR_OR_ZERO(platform_device_register_simple("marvel_env",
+							       -1, NULL, 0));
+}
+device_initcall(marvel_env_init);

-- 
2.56.1

