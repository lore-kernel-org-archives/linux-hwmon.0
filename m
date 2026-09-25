Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCD84D37AC
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 18:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360619; cv=none; b=rs0q8fZMBtQfX0Meipk7+DhQrVIR/F8EIazxaH75uX9BJ/4EndCpdTUIRKKl8ysNxvOtq4JQGlOU2xbPOn6ZBvXwcokKgZUi0tAKnHVEGNmvPRV+M4qFkyXIACiJYOHdeb0uWEqiYjyHW4/zsIPDJqZhVObYklHsbSg2JT48g5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360619; c=relaxed/simple;
	bh=lMGhkIGkhdp1109tyrRUkjRi4JrBbeNAjPYgqHVt81M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X8xB+UgQVHi5DfQIrAgk1iw4jJ9ajRUWjND7s1o5N+qK8XhsaIwMkOMHj4MSah+JJ3MYF/2gY4Kp9JOJso9usRsmj+PgVE9dI61NRuU1Od/pk2/EC+AY+g37uxsxaIYLb2LG57II7pLdgYnSd1/3DGe3jYiv5Wnh8UP7arpfcKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspiral.be; spf=none smtp.mailfrom=inspiral.be; dkim=pass (2048-bit key) header.d=inspiral-be.20251104.gappssmtp.com header.i=@inspiral-be.20251104.gappssmtp.com header.b=Ea5yUblu; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspiral.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=inspiral.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inspiral-be.20251104.gappssmtp.com header.i=@inspiral-be.20251104.gappssmtp.com header.b="Ea5yUblu"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so11196565e9.3
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 11:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inspiral-be.20251104.gappssmtp.com; s=20251104; t=1790360616; x=1790965416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wu0Jjqe90OxmnT4TB+nVVElv4K9/XpKew2FI5VhX/FU=;
        b=Ea5yUblulUv+N3Lz9Iu8/umP7izIqrAwBMihv09Mm3Ztve085KJvjruys1O8G67NQo
         xBjuKQ+CNCCGJD1KmAEzTR8dRAsKAFS1ZVFbU0zofqR7TWNIb3IAxlJ8OG36LttM4zLO
         t8vj/YI7pSGjlCYJOj2VgMrMpO7NcXhcDKsONM+WlTlc/b9dtX66glntyu8OgOBHR/e7
         sRVYUrrgHUEcp7/Mz3X3EEmQIkQKxp6V85qBKC204gxyYuRNf1etXBHajSLGknMib5Lr
         JQNTBUq6VaGz7Vxkffqurk1XVZn6Wuk1KVxX7NJqKlwvchnNupZKoL62yoyxB9BIqzFS
         XZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360616; x=1790965416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wu0Jjqe90OxmnT4TB+nVVElv4K9/XpKew2FI5VhX/FU=;
        b=wCmnY0Cw8nnG/fibSNkPjTKcTT6v5db6KHwu0wVMyL+Cy+j5WrRT6SXGRscxkRA9Z/
         KMhS69/iFGrH9RnYF4jaFC35Q+B93vbUJH/CCRX3cwlI0rvWw5dc+7F3nbZyM0gawa/y
         jGxbutScMdRydX6FbTWTEaKr+97jajk0CsuD0DdQ10IJQQUMO/WI3xGwlhsvDBOC9u61
         8waOhqnAbm5O1uDTGdy7zIWM5GfLrfV2GfY4dRosJuYEAUcW07rBYWm0IhKqgmrT/zKC
         /dA+UYb//+k5XkgB63324n1SXIUzn+GRb7E+Tby1+tW389+ABVpQxFumedRHMwFfh6K3
         uS9w==
X-Gm-Message-State: AFuF++l+9Q/P0XBtPHZJNv82rN4No5xTRNOiWQ6uhotg9+kxDW1ne9ZR
	CiNnXoOv7Ji9TdhiCRwg4Ce1jUM/p0WKD3B6qFpoew4ywqesZnxmYtBYwzW74hdenCfVqMPSB11
	4H/TNnW8=
X-Gm-Gg: AYBFou0jNLMcbxi9B5UxoqF4zgluIlo0iXD3cakBHcJSeFlluz0n/BUW4tmoQKl0otu
	oMqhQKxqNi1hQhxgvexi15Xa4zB5pHdHdQ71WkUAysB+StupEogIEM2Nqq/D8DpaDmhkHKWrfrX
	/wXtL1rT9UrFWCXGsrDoXdHLXtQEN6xtRbUyzhNXMZp37yNpho1fkJhsHg1HO30M1RaFCaxUek+
	KSmdYZYLEJxY6SXYNHLE5+XziiyIHP1wePptFQ/bJ0SVYcqDXyAdSD7Qd2K/+jeZh9hg4ShnMbW
	8/yl8os4CfRzY5cBUWyx4t7bJ7S8hfJYGuh+Qsm9xiLjFn/pfMfHvaLuX/hEK8S94cIksWVEGf2
	GwM9yhiQMpYYYqzl2yHa0yAdNoUjAfaSnVBsgFI0af4fnXeWDSYflkkR69dYjeVfZwq0YqaNJMH
	825esUgZlnOWEDDLztV7ff8ICdT3bj1I/43Xp5cYiho9dPJ7UJtsFkNUlrqyNBSF9A4EsnyjUex
	PgzgloEpiTQQLTkJvxLhfRbDGWZabVoeVP1lMucHEe5JW9Jujn3aUuCfvQ=
X-Received: by 2002:a05:600c:6287:b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49fe7babaadmr106141955e9.20.1790360615582;
        Fri, 25 Sep 2026 11:23:35 -0700 (PDT)
Received: from vger.localdomain (178-119-186-126.access.telenet.be. [178.119.186.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm165253895e9.13.2026.09.25.11.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:23:34 -0700 (PDT)
From: Tom Verdonck <tom.verdonck@inspiral.be>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tom Verdonck <tom.verdonck@inspiral.be>,
	stable@vger.kernel.org,
	John Muir <john@jmuir.com>
Subject: [PATCH 2/3] hwmon: (tmp108) Fix jiffies wraparound in conversion-ready check
Date: Fri, 25 Sep 2026 20:23:23 +0200
Message-ID: <525fa49d8c50922344fa53e22be5e6133c9bbb62.1790358356.git.tom.verdonck@inspiral.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790358356.git.tom.verdonck@inspiral.be>
References: <cover.1790358356.git.tom.verdonck@inspiral.be>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tmp108 records a one-shot deadline in ->ready_time at probe (and resume)
and, on every temperature read, refuses the read with -EAGAIN while
time_before(jiffies, ready_time) is true, in order to skip the initial
conversion.

->ready_time is an unsigned long compared with time_before(), whose
signed difference is only meaningful while the two values are within
LONG_MAX jiffies of each other. Because ->ready_time is set once and
never refreshed, jiffies keeps advancing away from it, and after 2^31
jiffies the difference flips sign. On a 32-bit HZ=100 kernel that
happens ~248.5 days after boot: time_before() then permanently reports
"not ready" and the driver returns -EAGAIN on every read, without ever
touching the sensor, until the next reboot. The continuous-mode path,
which sets ->ready_time to jiffies with no added conversion delay, wraps
the same way.

Store the deadline as a 64-bit jiffies value and compare it with
get_jiffies_64()/time_before64(), which does not wrap in any practical
uptime.

Fixes: 66e1c9171339 ("hwmon: Add Texas Instruments TMP108 temperature sensor driver.")
Cc: stable@vger.kernel.org
Signed-off-by: Tom Verdonck <tom.verdonck@inspiral.be>
---
 drivers/hwmon/tmp108.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
index 9fa31bd66ff6..91d20a1ce112 100644
--- a/drivers/hwmon/tmp108.c
+++ b/drivers/hwmon/tmp108.c
@@ -78,7 +78,7 @@
 struct tmp108 {
 	struct regmap *regmap;
 	u16 orig_config;
-	unsigned long ready_time;
+	u64 ready_time;
 	const struct tmp108_params *params;
 };
 
@@ -138,7 +138,7 @@ static int tmp108_read(struct device *dev, enum hwmon_sensor_types type,
 	switch (attr) {
 	case hwmon_temp_input:
 		/* Is it too early to return a conversion ? */
-		if (time_before(jiffies, tmp108->ready_time)) {
+		if (time_before64(get_jiffies_64(), tmp108->ready_time)) {
 			dev_dbg(dev, "%s: Conversion not ready yet..\n",
 				__func__);
 			return -EAGAIN;
@@ -477,7 +477,7 @@ static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *
 		return err;
 	}
 
-	tmp108->ready_time = jiffies;
+	tmp108->ready_time = get_jiffies_64();
 	if ((tmp108->orig_config & TMP108_CONF_MODE_MASK) ==
 	    TMP108_MODE_SHUTDOWN)
 		tmp108->ready_time +=
@@ -528,7 +528,7 @@ static int tmp108_resume(struct device *dev)
 
 	err = regmap_update_bits(tmp108->regmap, TMP108_REG_CONF,
 				 TMP108_CONF_MODE_MASK, TMP108_MODE_CONTINUOUS);
-	tmp108->ready_time = jiffies +
+	tmp108->ready_time = get_jiffies_64() +
 			     msecs_to_jiffies(TMP108_CONVERSION_TIME_MS);
 	return err;
 }
-- 
2.53.0

