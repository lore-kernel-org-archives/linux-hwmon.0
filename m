Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678001;
	b=PvMAheB+t7dUOy5iYluKzFdovt+w1UaOrUJ9ceepBST/pNMn37tdtLkIjMW1qdRJgxRn
	 RH8dVxHn7/qGQRdBFTTK7ov9QAo2inrADh2ffeqgtch7rPkzT4ojWyaeJ/hZn3w7oFOBT
	 spCknelk+GdRy0+M6fPL/v1mnJ5ozhuXgpdF0Gi7zWq6MHgEISQBkOYLfAbVc+2oS9ptL
	 DVXaxRRijeOXYA9dZ4Nidlzz+d2tR1t+W55KVXWx/qJ0VFT9asuR7G9rVuyAs/guJcMDQ
	 DH+M6SEidtiJZePEcYh9TJQ+m40Awnb1g34Qk1H3NAaZws1d7XJYII3CSCqP+iq5/Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Lyal3OiBd+dT9BC358VwYP1xMvu/A2SqglZVPhlyxLg=;
	b=cWhKHG62me8za/zyxsy0ErF6QB9gXs25B6DvhQUGkGbHkoYgmnvZTCKMX0Szc62XkeBi
	 17RC0wBULSOljFLWZqs/kYY5ztPbix6rTdRhC2mR2GNCN8M6TZBYlFQx91maQR26sXHvy
	 I9sOlpTU+zSOI/A6sQBQwCMzl4NIUYZpzIp1Ly6mh2ooBFQHCLe9pvAjkA6VrsAO/cNCk
	 FAn8TTpd+Q4ImMDGbFFvbqUwBQ0KVVPGz0aYWNO3hwVDuNwrm0yAset1DgImyFimNH3EC
	 ZRdo2QRfW3GJWfFGIqwp/NJfEVc/EId96kFvYIGZFfoxfzPMd+vgRfa+7QIkpnZkl1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7Js8QzN;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E96606A880
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 17:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93E96606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7Js8QzN
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-675617e81f9so2239976d50.3
        for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 09:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677999; x=1795282799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lyal3OiBd+dT9BC358VwYP1xMvu/A2SqglZVPhlyxLg=;
        b=C7Js8QzNBNhT8bsatWEGhvlzBN6jeTSYgOsPLNr/9v4GbZ1GRn/qzyBEydnjYdBhss
         eUhS/vNq7zC0HatHggHMpI9lUnsudaf9btf3EaEBBP/sFi9BgL324g0N/Q4mknXas4sq
         Dt2zqw+CC7wF4ypOWxOFoxPjnDf7v06nhVgSiWntOD9v7myBlXZetXEHJ1s9Nd1jgZVh
         HRv0W4OcDwg3faMYXRlMU/mHAR53I3kuUNlRowtOIRZ/PbfDrwDUPFItmQXqJ49cEZN7
         2IeHezGihUM2chlihjLlEA6AgKTM+x2Du94fVGjHejoHfS9dNJDNKb9gp/1/jX8s7eSq
         uz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678000; x=1795282800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lyal3OiBd+dT9BC358VwYP1xMvu/A2SqglZVPhlyxLg=;
        b=pgnyeuEchUPLTe8sKaVRPBgypEsr9etzRqLI02T8fdzZfbFcsGCLfah9wwYCYHufkO
         bCd6uwEQY5HKrPXBdcmk3YPLTRW63uBYouDPqe3F3wrPZVqOnY2UppvaSVQNxAe6eona
         aY8qIUmRD9NPOMk0Ew9tZogSaDCtTBADuxyEXch5XsUlfFVHBv0pRKIOpCOEWTSq4dYS
         YRqcjc/4sJ2ghiSXK7espj1wOrdvwDSFFF4d02OMeDYmebs/oWZ8fNrejSFdE6exM+NT
         lAZ9kgTuryVUgxyXLmntDNjuxInDzs1JoNN4cg0kfhg15JlRpdFuR3ym70A4aPvZ62Pn
         UwYg==
X-Forwarded-Encrypted: i=1; AL+hErHx9MYZ4za6jUkADq0Dx7FHHaegtp5Xva2e+/0Lj9N7wCQ5HA1ElOFfTGQmoUmMxveWN+PCPNNTOiMvZw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9iZW5VfC7Z+sIPk1f584CqfBolhcIM9bK6HdKDxK1VB2DFRqTC
	Cb8hdVyxuzilyWl+P2gNk7hSZjR3fahstCmLm93pTla+jaGgkyqVfi1m
X-Gm-Gg: AYBFou0Bj73KjEO7Kze4nqp/PjpCuRyDUPK3OPrHV6G/Ykbh8QXssMcbdWf/pWQILWK
	pxbzNerUiMT/roc+LfViPvl9Z4un9KUaHb+f1H8d0tS+pekpJC4YE+ybH4QucD81guBF+Ah5dEf
	/og2r/9aJM8ha/vQb3/at0qcw16OQswNhPIv7m06qTwpE4eADu6f91MaG6Xug/uliqgUar3vmbf
	EyO5uVkyfuAzjMoaRNFipFLnNRhQwdjzC3eHwL69aUDoMJQ+UTlRRB1qdyfIOysIdpoWhbRKtAc
	C1cdxB98JiyM33ogiNRPUirZdmZDy3vJCN/2cvAsJ9hk8LoqgxLhSiCyhFOM39C8JbV6Yg+epty
	x6D9QJM1pNa7Q+qe8NzZiHO0SS3DoM9UmlUs70r9pkF4siXbkMQaQiBk5Nv3UZGUajvC097j+b9
	+pChn0CJXVQ+eX6mOQeNdmzbBhzi5SemY/U9+UrzVqBMdhYrDsGutJjZ/GowwQN0Svs+k2Xj9I/
	lnTsZo5v1AU55znpBeOmD53P65EKJ2Y18mIMIllos2JpkyQMj/ZhFCjLMJ2xqo3bSewQ91jEci6
	41QKcWwPvSYbIrCSpLPlFgMOG14i38di9hZeVl/Lvl8a3XrxI73C/Kcq3cHU+nehElwPkl1/tBz
	aEvd4O/E/CTIe0yyVGXlWIMJT32ztnrshFPqW9aeF3sDhw0DPvGLsKcyC6GqENA==
X-Received: by 2002:a05:690e:b83:b0:67c:1fc:2a49 with SMTP id 956f58d0204a3-67d970207c9mr2180388d50.54.1794677998636;
        Sat, 14 Nov 2026 09:39:58 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a55ab71sm5322721d50.4.2026.11.14.09.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:39:57 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 12:39:50 -0500
Subject: [PATCH 4/7] alpha: marvel: register a platform device for the
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
Message-Id: <20261114-marvel-env-v1-4-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
In-Reply-To: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=mVh4JvfcK0k3ESBDJMdG/SRPetVbGyQ1JJmKBQZfeiU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+zHm8bJGPx8k1Qg5dEu2+fbeTjyY5LHjjENeTlfdPg
 mE3u3NUx0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFxjys3IsOjQh333tt
 0W+8x1PjbuR/OyiMigNWFFrC8Et9yt5NC9eY/hDx/PoUdFf0/1N257rHlpu1WB+6S17qxr9xxom
 J3AJzRZmAkA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Register a "marvel_env" platform device on Marvel systems booted from
SRM, for the hwmon driver to bind to.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/core_marvel.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index bd918028b410..d2e1e45cdf1e 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/memblock.h>
 #include <linux/workqueue.h>
+#include <linux/platform_device.h>
 
 #include <asm/ptrace.h>
 #include <asm/smp.h>
@@ -1142,3 +1143,13 @@ long marvel_cfgtree_partial_update(unsigned long offset)
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

