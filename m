Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D23416843
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 18:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360618; cv=none; b=VqcZJRyPVLAN9Q1hA6zow522ojxqhD64VybbNcPo/gojz2TrZtmeS8q4Hp1pRgYxlttPlwi4zJR3RF9/fESmbvnqa0HaNIkObyhisClCz2kwhXRKPOy1NrTaVMYvyKYpAXXEwPcYt8qhUSok0EMyQKEE14BBbmskPpD/xK5JYr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360618; c=relaxed/simple;
	bh=/RXIEdBfSd8D6osEYZ1YidMBoUc4bIY9Xc3UHnj34Zo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=scJ5CKrqJl3mwuYyPFSawZP947r16y29295/S4gh1agzA1C2KriJkj/CcRJIZnGlaA1RqIabOjcRVnhEVMxhNH/9Xs665en91BEwL0m+rV3xKZKrFblh5rvAF3rWcCWNqz5aps+XWnk3HxktIzqEUPCNT5+g5+zD0IDFeJJHPUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspiral.be; spf=none smtp.mailfrom=inspiral.be; dkim=pass (2048-bit key) header.d=inspiral-be.20251104.gappssmtp.com header.i=@inspiral-be.20251104.gappssmtp.com header.b=JSty6xIM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspiral.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=inspiral.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inspiral-be.20251104.gappssmtp.com header.i=@inspiral-be.20251104.gappssmtp.com header.b="JSty6xIM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so9156215e9.1
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 11:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inspiral-be.20251104.gappssmtp.com; s=20251104; t=1790360614; x=1790965414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YGzeXfDrgiYqRCtYgTkGIXW4Hfhn589xMj/GX/7sOpA=;
        b=JSty6xIM4ZlRXsSf1eqXB3AhwyAGpSJ5ySrIS9PFO10nIyhSY0jYspFbN8UUri9JvY
         yvyoB4XS1LYXD6Geg+yqem6WD2RJQ0Ei93MbSNgginz78F1UjXyr9+XGoAi5wvrg9mOR
         QjTLDmyQU0yh7DdzknFdkj8B8SCTvjraWGvoWTeDHEd3jR4pMv48I8fQM2lR9qlkvF/B
         KmB6f1bLlbzCm85aij8S+1y7FguZjy8oLugghBY3+v2ThuvDwF74DKsvUJbiXNV60FUZ
         lQQdLd50Ec4lmGkUqruLVu2iU2eLv4VYz0OTnxSCaJugrVDxuu+vr6echnyGDiFfkB/+
         m4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360614; x=1790965414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YGzeXfDrgiYqRCtYgTkGIXW4Hfhn589xMj/GX/7sOpA=;
        b=Bt6exWEjfE7TXfqj4uihmYt1SS5fgNNf5dA/nFYnHdkPGP3iFRR1FTPEb4I5rNh6fA
         zaNMQ2Mlnl2v2VKtMX1cl2ZKIoBbNV+tVKOb5U8uAI3YCn4ZfCninLl9TEyXNgHept2t
         XFOynRV14/5Q2kRUEIGCeL3ebgQTCh0D5IX53ZLRoQcQdN2401Z/iQtazc9/fJJSl/k6
         B2BqrnJUMhhfDAeqtd40xnQkm9tFFfcctG9ggaBmKpH0nkv915g27jsy1dmmHFNJk7Ap
         iWaq7hjXEEHbxv7yDcIlR8G0Il461wDHnaZ2Ngz0FNbbsnUW2qhl4mOdiThNXnmgwlZA
         8BQg==
X-Gm-Message-State: AFuF++lzTaxvqDQBdcZDMrx9iScn6aCGCphBAZXgG+A1DWMw4va43fGr
	As4mgoSly4lBwLOeJ7yiBE1uwS8XvtBvmv/JUJCq6xqvgYMmJGzgljzQnYJGkW4Y9kE=
X-Gm-Gg: AYBFou21yMig57G1vpTEO/DkF8im/btBC8RXQrz8mobx8I3zPM/8BXk7FN0TLwg3Qov
	XE0KFrdAzAte4ISGlqrSpzJ3TD6fCKBBEMlSj4Cw9WlVYNanVCo3SBPD4AMR5I3TY3L1iL/BBZO
	YNdECTU0HRzt5+JQMz2ibL1E5LWB3rAXc8jhLwwxiMmz0oNl4tYB27FwXR5hFdINrSVITs1gDhG
	yf+vtgj3kiGHye5fF5iqukn9lNY9plG3RaxLXbon4qwlxwJ0+jo5PagKfqcADwfPUvGrGp8qDSh
	PCcYKyO27YHgBPLE4aH3yVN7qrWj932PkyTr43dEvrzN+K6orNMAwC1f6/cLt2XVqNbgkwQ1VZt
	cc7pDpthA8DXtQF3Flq3zgxDXdCXNqYhMQ+uPdbXeJyOXfza62iQjjUPvSJe8bWIxDL480nRLRT
	/so9dLV1X/8Xg6is8yu7uTwyI/kfmQnCkqwhPIsWQGmyrj53cLTlZg1+q71bx6h608xAAX9NPec
	dGIS2KqsGQ73UraUsdJIJSJTegd4rWJMbbHPABjJoCbSyPo
X-Received: by 2002:a05:600c:6207:b0:49c:fc6c:be13 with SMTP id 5b1f17b1804b1-49fe66ff146mr124005245e9.25.1790360613975;
        Fri, 25 Sep 2026 11:23:33 -0700 (PDT)
Received: from vger.localdomain (178-119-186-126.access.telenet.be. [178.119.186.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm165253895e9.13.2026.09.25.11.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:23:31 -0700 (PDT)
From: Tom Verdonck <tom.verdonck@inspiral.be>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tom Verdonck <tom.verdonck@inspiral.be>,
	stable@vger.kernel.org,
	Nishanth Menon <nm@ti.com>
Subject: [PATCH 1/3] hwmon: (tmp102) Fix jiffies wraparound in conversion-ready check
Date: Fri, 25 Sep 2026 20:23:22 +0200
Message-ID: <2952f070f82913aea96eec25d28008d3b9058656.1790358356.git.tom.verdonck@inspiral.be>
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

tmp102 records a one-shot deadline in ->ready_time at probe (and resume)
and, on every temperature read, refuses the read with -EAGAIN while
time_before(jiffies, ready_time) is true, in order to skip the first
~35 ms conversion.

->ready_time is an unsigned long compared with time_before(), whose
signed difference is only meaningful while the two values are within
LONG_MAX jiffies of each other. Because ->ready_time is set once and
never refreshed, jiffies keeps advancing away from it, and after 2^31
jiffies the difference flips sign. On a 32-bit HZ=100 kernel that
happens ~248.5 days after boot: time_before() then permanently reports
"not ready" and the driver returns -EAGAIN on every read, without ever
touching the sensor, until the next reboot.

Store the deadline as a 64-bit jiffies value and compare it with
get_jiffies_64()/time_before64(), which does not wrap in any practical
uptime.

Fixes: 3d8f7a89a197 ("hwmon: (tmp102) Improve handling of initial read delay")
Cc: stable@vger.kernel.org
Signed-off-by: Tom Verdonck <tom.verdonck@inspiral.be>
---
 drivers/hwmon/tmp102.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 50a8b050d8da..8c8463ddb6c4 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -58,7 +58,7 @@ struct tmp102 {
 	const char *label;
 	struct regmap *regmap;
 	u16 config_orig;
-	unsigned long ready_time;
+	u64 ready_time;
 	u16 sample_time;
 };
 
@@ -106,7 +106,7 @@ static int tmp102_read_temp(struct device *dev, u32 attr, long *val)
 	switch (attr) {
 	case hwmon_temp_input:
 		/* Is it too early to return a conversion ? */
-		if (time_before(jiffies, tmp102->ready_time)) {
+		if (time_before64(get_jiffies_64(), tmp102->ready_time)) {
 			dev_dbg(dev, "%s: Conversion not ready yet..\n", __func__);
 			return -EAGAIN;
 		}
@@ -354,7 +354,7 @@ static int tmp102_probe(struct i2c_client *client)
 	 * Mark that we are not ready with data until the first
 	 * conversion is complete
 	 */
-	tmp102->ready_time = jiffies + msecs_to_jiffies(CONVERSION_TIME_MS);
+	tmp102->ready_time = get_jiffies_64() + msecs_to_jiffies(CONVERSION_TIME_MS);
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
 							 tmp102,
@@ -387,7 +387,7 @@ static int tmp102_resume(struct device *dev)
 	err = regmap_update_bits(tmp102->regmap, TMP102_CONF_REG,
 				 TMP102_CONF_SD, 0);
 
-	tmp102->ready_time = jiffies + msecs_to_jiffies(CONVERSION_TIME_MS);
+	tmp102->ready_time = get_jiffies_64() + msecs_to_jiffies(CONVERSION_TIME_MS);
 
 	return err;
 }
-- 
2.53.0

