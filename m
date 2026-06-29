Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1146C35DA40
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 23:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782775390; cv=none; b=ZsK+nDL7vhZCmBIN8GsGK4GBBHpEZeCIrSbDVUpHfs2V++qJgahj1OGc8Uy8APiRK79FbHowFm3KZiNuM1HGhcRHnITAnC0OkndzRi6Z8l0UhUbfytSfVV1VkeA9U82n6vkIDHJY0awtFjHaWFINu82cFMdV/Vz8is4/n6U9JFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782775390; c=relaxed/simple;
	bh=efYk11ZCWxrY55Mit9d2UgJMXjbeZySO/UNFjlofFaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NPHKK5nuZ+t6U4JWaDklbzvs+B9SNLTiDf6sjakm/nIoQat7bjNEUkrWtBtimVNrH1e8UOjuJIcD4w7GEw4d/d6+5LJ9eUCtWBfJRJtnMFPUj+UCAGCX7bPENq0axSDBYPGXq7O9wXGOCSp19lXsbKqSHCVT4L7Nu2/es9xrO8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0AcS4VE; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0AcS4VE"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c99672293cso19657745ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 16:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782775388; x=1783380188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pHq51axyNN50pTcQ5BZ3MrLI1WA3CeXoLijDNKlQcJs=;
        b=Z0AcS4VEIPvSR+e3KEQPUCypM5xs8NFCYez5UZfePhX73ShKkawrP9hBYMoodJHIy7
         vtu4/qOmqhf3EcQK4z+HTJvtKaHqtvZb3E06SJoKhXZY4r1nDhyxyEGGaR3nzEy+p8by
         5AByIK9Fae6x0sy+OlA1Gb1upCyiAmQady+QKi5hcDONxg2b7U2Adx7L+vJ0bX2XxswG
         MJFRJ7XRgWKmjNhKy4hZsZPGBBik+od9qg8sxsTQcqTnIA7KiCLvcbeORAMjuEoympnx
         iZePdeQTXJSdYK1AxTYeJlGiqMCebg7cg/YtR5tJZttZAnWphTraRH+Z3VFfFs/ZpQpL
         V1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782775388; x=1783380188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHq51axyNN50pTcQ5BZ3MrLI1WA3CeXoLijDNKlQcJs=;
        b=KkTBR/HaVo66mbKvINENsFCoTIjhIas5arP9PEVZmZzsU2LzCm73jB7DSre+tSZPTN
         TqJ8Yp/W3uy+bkXn71hxMTjQVa2IYvKK9zVEndLgzo0/mxjQBXippXIUb2EU3Z7ngeZm
         xw3Dsgt3E/1K6VM2tpAHa1uTBVNNm2vtlcXUHfsVvOZD472Jv63wXn+sZFYrYwLm9PlW
         CFsZSkbiB4qXVebVskLB1R3UoTQshq+Nyr3Yvm2JHmQXTERnLARLyldQeiaYOCo2SckL
         tLSOzwHHqvCC6Xwys6sbD+EvWJHYx7Ah/9Q7PBzpyEQCm6/aq3q0CkNYgnifQRfuTG4A
         SFjg==
X-Gm-Message-State: AOJu0YxHtkrxtGEB7+XLYf5ZzEP9eK1O6o99AR40ryNoFz84yGID4fL9
	76V7f889Y1SGB+Z9B7s/dtfwPtV34PYPEOjmEeqMRtfNg6iDIEVBQniXyWZBCw==
X-Gm-Gg: AfdE7ckDFJ1GtiuIOwrULnwjkXLktrE4JYtVWSizwa4jVskbg1qP6D4s3WdG+6hLsSn
	xNa9WmXG18DpILZM/3G48x+AqpSKLusrxZEMqjZrGTKPz6VvWUTAfmmc5zKv/USDwwC8agQyG/j
	1Kpmtnq5wI0DaZxSQCwxfEhdfeyf31jw2DnMqnvN2sIird7Nn6EPDRcmhA9pvPvX8J8svADEaB7
	r8URD/DXxhzlO0qiKjMH7hVoTi9ASYTD8l9BrIsYd7t5oAm0dP9R1CXu2aLTJj4kHC0ygeXCzJb
	iY+9+ZFTlKUQ0/KuL5DzZ0t5qv4pVL4a6sBs/soApCDdnG5krgSqS0gXMSQPGFqNa1dHyw20iVN
	9P5qLnOrNY2yjfT1XIiLYFUPnxrAPwZIqIlJYPkw3fUNsOWMmWkA4OGlO75zV201pNZsQzhdxa4
	edIj3f3vZGges0sd/3yxd0xUpVmA==
X-Received: by 2002:a17:902:fc86:b0:2c9:ae0b:61e3 with SMTP id d9443c01a7336-2ca2d50e216mr8585405ad.2.1782775388228;
        Mon, 29 Jun 2026 16:23:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382ac8c7sm1286375ad.61.2026.06.29.16.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 16:23:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] hwmon: (aspeed-g6-pwm-tach) Guard fan RPM calculation against divide-by-zero
Date: Mon, 29 Jun 2026 16:23:05 -0700
Message-ID: <20260629232305.2013406-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko reports:

In the aspeed-g6-pwm-tacho driver, the aspeed_tach_val_to_rpm() function
calculates the fan RPM using the tachometer value. However, it does not
check if the tachometer value is zero before performing the division.

If the hardware reports a tachometer value of 0 (which can happen due to
an extremely fast pulse, a stuck edge, or a hardware glitch), the
calculated tach_div evaluates to 0. The subsequent call to do_div() with
tach_div as the divisor triggers a divide-by-zero exception, leading to
a kernel panic.

Check the divisor against zero to fix the problem.

Fixes: 7e1449cd15d1 ("hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach")
Cc: Billy Tsai <billy_tsai@aspeedtech.com>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/aspeed-g6-pwm-tach.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-pwm-tach.c
index 4f6e6d440dd4..5d611a8e5269 100644
--- a/drivers/hwmon/aspeed-g6-pwm-tach.c
+++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
@@ -293,7 +293,10 @@ static int aspeed_tach_val_to_rpm(struct aspeed_pwm_tach_data *priv, u32 tach_va
 		priv->clk_rate, tach_val, tach_div);
 
 	rpm = (u64)priv->clk_rate * 60;
-	do_div(rpm, tach_div);
+	if (tach_div)
+		do_div(rpm, tach_div);
+	else
+		rpm = 0;
 
 	return (int)rpm;
 }
-- 
2.45.2

