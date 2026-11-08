Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794110416;
	b=v6pwrRN0GMwWUuepDbn1tUm3cW+hwDhTSay19Y4VoCNSHvTPBkVUeoGVElFMgzE1ZqUX
	 OIjqQ4dDErSe4TBKTxNpI0Citi4k7JigvEZWHSq9mCiyNeKhhLVS0uh5VyjUq3Pme6z5K
	 Jhd/9Hwq0IfQZnBH6T4AJg7LLsWdynC9rkfuB6yYm2AEKSo/TL75AkV2dXViUY7PowIox
	 zPramqqDfYA0+VdS+Ym+K+5lwYr7WDCBOtj/oyA0wTD68VG0n+Rq5hTYB5vXgDqZJOwM1
	 uhQ0TY7Sl2tJmJDQ8H3Z5/htiNY9OTfPoFS6c9Higu2NgVaGCpt8LzP7+dY9r76Yarg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794110416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xnYL0DJtZZ3tlZVfdy8paYBQ7EQBD8QtAUTuaXFNMTE=;
	b=15wQT6YH38iX57ZoeWLRnBdokoYFBMxD1MMev/NOrzfKDBQDWk9QeuXFYmxmcDAQtweB
	 dwDOhkn4FhKcdB18vnjUUJD0r+Cyrz/XuTQ8hOtQT3XQZyh/ewTnYhavYSI7na4FKSzbg
	 UCieKJlHiijZ1cPHjey2UW5Tb4hfuNgOWkJT5Vju8WikFirGLSgouGilDt/T02pUSfWgM
	 5hOlc3Q6GJBfCS56u2FVOf8gbp+0mh6zADX7XH3YNElT85v4du1RB1g4U6wPfeIdS03sU
	 JbaV7QAbooEs5yQ/jH7QzCbmmFH/cn0Xcq5+Zt7MeP7qDt2z0GaPfV4lGPB/IKhIZPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SB8Rtg1b;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E409606A31C
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 04:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E409606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SB8Rtg1b
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so1001005e9.0
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Nov 2026 20:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794110415; x=1794715215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnYL0DJtZZ3tlZVfdy8paYBQ7EQBD8QtAUTuaXFNMTE=;
        b=SB8Rtg1bW7TaYUbYlOhqPK4aPjOwEWBhl/8/By4g7mUKToEUxzK8BuH7hs1lX2/cDF
         NXmcL0R5WFztCdsMrpI+KnYEvZ4chleCD64+b7uzOqcGjxybaq2rCuRg2ZHeFGvffre0
         +TmpIeECHOL3xmyZUOoQBRG5iq4i7Plqqe/L5GQOjMILNIka7t2cGcgqdNOszRqnbyhI
         6j42BvMdvwGPNHiQeQnsljI7D38INbXYiISVn9jSIvc7wsKHIBLs1j0f5Zv0dISZCF1o
         jHrDJZilfu/ySd+hxUSXiswE1MHu3PwyW1SU9l0g6ojrJ2EkA1mFmuPJlY6ku16BfZQ4
         48Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794110415; x=1794715215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnYL0DJtZZ3tlZVfdy8paYBQ7EQBD8QtAUTuaXFNMTE=;
        b=HlHCuWoGF/ae3+P2ITZ4NNqnA3WRMgYdAGAJ3aStHeTLQ9HlT9x5d6nCP8S0wQQihe
         Sik8ttRCGCc4a6yHYOSS2D3Gs4ZPZP4InWe5l+jwfyrW7rZ/Ls6SVUqzquK8PKGid5l9
         OHe08glXFjkEDJxA9lVGJjQcw7FcGxDwLs0bemRco+iF6IyWSwf2tK1gKdAHZxUTkCoO
         sdKQVJXrIAUWW91NXmF3yV0qw1WcjMQGWtL8O/SpEvYVba+ia9cF1rAWg62woMTOgFNr
         8SCPWkiAi9swTfU9pN+KfB5+GhxyF99xbud+YnS9U4Elm32cjA4umU2g+tTj2Sop6FRc
         Jsdg==
X-Forwarded-Encrypted: i=1; AL+hErGNcwto/2nnHRX+f15roEM/MYvJ9+eKDMslbgir/0cVQFYCQdUkc3nDcvj7DqpSk0Au9dhYbmaIdY9oaw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8cdHrKLJ45khUeVuZYvoVblK0l2CNI8CiEyI9nLtDQkwXkw/E4
	XHfG8RltHeZFrnCsrgiD5gBBzuF0qI/x6t+M3d9T7nctLbthaLE6rdaY
X-Gm-Gg: AYBFou1W026JjEKB21fsdbTVP8N0lJjT49oYjFAZTS23ZHISnVhvtXfKHmb0s3C7iM7
	k6rqI03yghfsX9KWsMUsBuMjF0vj60pXZ36K6TdacTsYu/Gut0ruxboIuLM91nqlr73tDqABDWX
	SlMV0VL+e2QKbLc/sTrZoLImWWzznzVgPna5lENfi1tR95E/De9HJ/pW4hVtYMV3uEEv80Cqg9e
	/FoK3qOyg1zxZ6sefekjrIkj0cbrrd7v/nl0ytwKuDI5q0RBHL3xw/hfZRtWkKuRRQ8FtsneGUu
	EevA3RDpQ3/l5RC4ps8gUzZGKMLK5fUYCAnwcb85HzRR+G6Vy+e1bjoO2nDK63oimVVPIHRYUNy
	eRmaYJdzh57YWd98t41JC25s8rxkbZOEbxcawJUR8xoRw31jkJxbPXrnWmqNzbutDHy5uYCdZW+
	blWe/imf8J6OESpoY96K+IjvPBeRvpTm1SGFl4+QQrgmalN84tLQAxSvvqGq2VRA5WDs9C3wriS
	A/F5EWGF4e3Afu1v3Uy/Yg6Aug2TSPfprrk1Fjwz5hOjIDuQBr10XxOyOGFB+aEljvLzFMC4z6u
	pVKX2MBnREbcCKlCFVyrpyMl5wXirypyp75a423K
X-Received: by 2002:a05:6000:4028:b0:492:b5e9:4916 with SMTP id ffacd0b85a97d-4958373113fmr1368345f8f.24.1794110414849;
        Sat, 07 Nov 2026 20:00:14 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f3163sm1736310f8f.11.2026.11.07.20.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:00:13 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Sun, 08 Nov 2026 03:59:54 +0000
Subject: [PATCH 2/3] hwmon: (max31760) Leave standby mode at probe
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
Message-Id: <20261108-max31760-fixes-v1-2-a61450463059@gmail.com>
References: <20261108-max31760-fixes-v1-0-a61450463059@gmail.com>
In-Reply-To: <20261108-max31760-fixes-v1-0-a61450463059@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Nurettin Bolucu <Nurettin.Bolucu@analog.com>, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794110404; l=1405;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=wEFiFQuq9PYuDNkpFDriR7t5sEW0+xVHTdlkclQYLRU=;
 b=7IeNYSGTtldUgyFfC6Kte2YFdZSIQctytc54D4Dda3FuvteH9MyRiHF8EmWfQszD+9T1aQKpo
 d8esftuSgyvBDUXwljL5sEY+bJrPOa+vVQLy/3E3s4igMzXFkBAaXMQ
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

The driver never clears the standby bit (CR2_STBY) during probe.
While max31760_resume() clears this bit on resume, probe only
configured CR2_ALERTS.

If the chip was left in standby (for example, by boot firmware or a
previously running OS before a warm reboot), it remains in standby:
temperature sensing, fan speed counting, and PWM output are halted.
This occurs on the Samsung Galaxy XR, where the bootloader places the
chip in standby during boot.

Clear CR2_STBY alongside setting CR2_ALERTS in probe.

Fixes: 38b04ad02d0d ("drivers: hwmon: Add max31760 fan speed controller driver")
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/hwmon/max31760.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/max31760.c b/drivers/hwmon/max31760.c
index e3d86dc4257e..e967555a21af 100644
--- a/drivers/hwmon/max31760.c
+++ b/drivers/hwmon/max31760.c
@@ -533,8 +533,9 @@ static int max31760_probe(struct i2c_client *client)
 
 	dev_set_drvdata(dev, state);
 
-	/* Set alert output to comparator mode */
-	ret = regmap_set_bits(state->regmap, REG_CR2, CR2_ALERTS);
+	/* Leave standby mode, set alert output to comparator mode */
+	ret = regmap_update_bits(state->regmap, REG_CR2, CR2_STBY | CR2_ALERTS,
+				 CR2_ALERTS);
 	if (ret)
 		return dev_err_probe(dev, ret, "cannot write register\n");
 

-- 
2.55.0

