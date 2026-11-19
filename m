Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046999;
	b=43NbxIURqOmX/xCAtk4YuMg02A4c9Zxbk5hdVTWbT4pdL3Poq4AunlttXihFUzMssCZr
	 K+zPgFEsuF+pHH5xSGkbpENJRcqR+n0jVwDuwlcIvrobKqUj5IUKpEpq/5bKbjda8+heo
	 TtyklhzJRIi2mRFgAwwVBvh+/Q0TDIY7jCkk7VvWa0lUfQ9MuvLUTzgckTylybZEYuNDs
	 Ull17rzVJd3h8r+EOfSxgCneVPwGoRwxcqbnQkdHBj5B8cJ6TLxHeE5zKPL9em3AqBpUi
	 EHDj+4TQJEataIPKKcrzfrendi9loQyk+pKgR7kw/ctRCFoiWoDqGsBWKpYVbPVdncg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
	b=4R0WKSpUXJc6QVxIXwG0T665ksQkkHe0sw25Z2MyHghcNAVnk35jNWJR8ybPLU/ABt67
	 ConuMlwHXVABSft66ge84Yz+6W/vUIGZ1YASgPDLYXRVSfkalONh+Nxb1cg23jR0vcWC8
	 VfuQs16yPWGnC8Dv7/VZcX6DwgJCFFi+RTxSIcPz/ObkSjlW0cftJ02EJKP78ACGhL0kN
	 +vUIA4MJ0DwBUQSSsnB0uQaObd5iKg12bgsFg8qixd9+ed5M/oeHprp8suo6G8TmmSAOF
	 AGnlLG72elxlK6XQTbHR9G5mIevz0C/HJCw8+QdzdEz8sFM3YDbYa48WbEwaUw8LEcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZAuzRk/b";
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785FE60A2606
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 00:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 785FE60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAuzRk/b
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4d5e645d1so12608667b3.1
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 16:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795046998; x=1795651798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
        b=ZAuzRk/bH1C4XHaHJdlF0uXoYYurW2uwPPgfvYAThPdAbsuhTmt1wlr7vnOoallGgd
         Am8JwCShq150uXr2awS7XyI4TvG/bUNdQW0zqh0XUnDvJJEFpegQSMpCzdxWNA4WYGQ5
         sd0h7CMjf6EktPMHEFp7I7zjGcexZD5AKtbqHnOUgOciVzg+4r0A0sC9tz0Jefm1DKAw
         8sX/w5yYU7VfLNmSnaM4Iw7nsADPQvBlVKb5KfS6Z67dStOeq6DQ+VGFdcuWd4Xcjia2
         lY2OvjuZf7D0edokHbv//lmLbSBi+reqa6oXUzaClNqXpCKCdsvUHIcT3vQ7ip5SEE+H
         c/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046998; x=1795651798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
        b=IXsVMXOM5E1mOo/9B6KXaSnsnlcQDwk/TsKT49j0nAqlix8UcybAnt5s6L8W7SXLI/
         48TWKmlsO3++sEsDidwCzHXX4lu6eizP7c0LXTKC+JsoUVaowQhwue91P34Zc0YUA/H+
         yOsF3XLDMe1Bq/KnlSa/paCyL9QZ6OZnnJuoPubV5DNsp+i4K11M+BjgTuO4+pmUbhpI
         GEa3j7REljKMeYFRVLKMD7JXC6kHSKp5gU8rSSpwsxk6gyI+CdV5s22MXmsZStEQSpYH
         CEOgdKm98Izb9BxA3ufZYXJ9TtWuRdpMqgIqQrAn/lT0jRwXVoD5XetW4uoNf18VOqbu
         Q8HQ==
X-Forwarded-Encrypted: i=1; AL+hErEnJa4j0SfDkJ7/NS9rqV5zoHzOlT9ErfNA2dAdeVIOalfDzaY84BlsSsFKZe6Rlqll8R5XX+FfznU8nA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Tzw1dSHyruftQZYpf2Noa0nN7KzPNRYjiHu9AnGxdlVkr+ovI
	qOTP/xieCP3XXjgtWfra5xG0zQOI/Ea/cWZACc/IwYa5Nbdlc3B2mteHchDK4l5A
X-Gm-Gg: AZFdTZf6978/seYUZqa8+NhmH2nkj62UTDxHlc9g/rBevdJH0o/9bnzQhFgbzvSc6h/
	PEJdY8wVBv4u/UCQEiPnM0tCz3o1WuEz5ug5f0A7M8zyIH8kEEhquydMpC4F5y6X06W1OArtqkn
	fgg6N65X7Lv5MeqG5+n4giRGzd1wV9e84QDNICQc8SOFT/JSk7fJ/bFQn1E83ROvhjClC6Xu84L
	h1xKOh8448O8BsYnNFSuBwivZDqP3OjXZEs8V09tsS6NBr7J/TPRFQA6KJ00AP1kibBX7t19miG
	CMqiBpG4N+bfe2vwM0D1Gu0M3UqG3vZqapmKdZLKw74eHNcoSZtTB153F7455hXv0551+WJngtE
	oTvdBjiSncf0sHgYz04JJXUwS+7fxYvBqNb8PegD5eSQLVwCLaqwcYAAsHhu/iTRUXgf1ulBwt7
	iANJmJlGZVdPZI6Z1dZi5UOB7jEBwcZw9QUtgKrHequ0dRwlyaa5/O6/8MM82LaHy9qNybWKmS9
	rPJQMx7yt4UoWNo/zhF37Ss4SqWsyIJNTk79rXHRx243llphbu04cwfvtg5jXPFRvNHkq/LgwQR
	sIHU0chsXJN99mN9veaIWJN05RYt1B1/yGuwg4oGNDx9mkAG3oWUbxbPSlRcJhc79klepTj15/1
	ZbAT5ld51qhpdN9hTOS88wTl3YNmbmZ3BNCGUfAqgeZq0asC3bnJDVucMVsLA/by8OJ8mMNGxa1
	19EBh8OBCBnJtNYz165w==
X-Received: by 2002:a05:690c:9a05:b0:8b4:e2dc:3f20 with SMTP id 00721157ae682-8b4febf1d10mr16920757b3.3.1795046998443;
        Wed, 18 Nov 2026 16:09:58 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe10d935sm25708467b3.41.2026.11.18.16.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:09:57 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 18 Nov 2026 19:09:50 -0500
Subject: [PATCH v4 5/7] alpha: marvel: register a platform device for the
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
Message-Id: <20261118-marvel-env-v4-5-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
In-Reply-To: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=eCxTz6/wFgOEYqUhWdz1P8hGqwqPQw6s+J+8BeCiWlI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+2XkprM/7qq30VG5m4Kxye17zp8biqRvsPTcJbq+qu
 hD/dJtax0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFwz4ynDLybDw7+5jL
 4/ThWsO5z3fdmFfX2dBxK8fIQubMw46v+g/A9Qhe5V0Yny98/pxd3OXu4/VW6TkNCW77PPBi7hi
 1O9J76SFwA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Register a "marvel_env" platform device on Marvel systems booted from
SRM, for the hwmon driver to bind to.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
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

