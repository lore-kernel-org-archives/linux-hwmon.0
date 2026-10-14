Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB1F230264
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 21:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014343; cv=none; b=lejP5NpNMYY1GATFYVlZkPJ3PP8U5s2QIz7bjJ+FhrYUu7WIJptL8tS5gYnThUiRmMmQbEJNVPnqon+nj8t1pydiRWdWuyVr6SlEg4inUsyOfLI2CaPsvdXJyyvvRiwBQp8RwEBU1yuRgN1DYEOkCM016VrEQdPxxxNj+iF/gP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014343; c=relaxed/simple;
	bh=slwOZT4SUkOgMXYZQQEUrmp7OZIrL4XK6vNO/EIEtwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HwCKpwUOlIiLWfhDTOm4CzogMqJq9Q+yIb1ZD5q2uinuD3oIgl104W37El0cRhB3zA2wPbch5UDtxJT5lUIg2Hoy205gCGGFTAYCRP9GYQT66JtT+5vCcF8YDpty0F397MHqR9clnEfmsbH9TWHMLKRwJaXhWSPMmxR+41MObDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjMo7xn9; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjMo7xn9"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so4051409eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 14:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792014341; x=1792619141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qtwnr8rANn9J3uJzwMc/IL3XxL1Ompj9KASSaQeAgu4=;
        b=JjMo7xn9reOLLjUWXk7GGJzFOh4dFV2t9dboW5MWdSgGUgYrAr2CtuK8yhEOB4kXmk
         rhN0x5B0I2FwXPwedz4+cWaMTDA8Vx1Vc807ZRN4WisTc4OhQP+UTI6s34cxopfbHDmQ
         MIcoMkx5kABPtUDM9+0/QxJSuy5aIXEo/TSvNQ4MdFqb7nCt8spYn/rSTUmh22M70cm5
         BAWAXwj+Rpt4+AxFrqrd4Hk3aZi9DscMPaFjquNDgkkaj9iP8f/EUMhor40fJJahEYxK
         uYnG+M/N0JGcvq4ld7sr0n8ZsaT7m2pH7Ha+j07CPj76idsZqCqjNmdzOPRFJ9eMiQfG
         UxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792014341; x=1792619141;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qtwnr8rANn9J3uJzwMc/IL3XxL1Ompj9KASSaQeAgu4=;
        b=la0lsNaXp7aL8HlaXJYpEl2Sy7jCGPWzCrjP9tNOOaK9FSpXAhGIBlMF1M2TJVx2ft
         JftzCb2EuED/PXnyPKg3+2801+i9xOR06qLq7xokRN6cYX/wpn1yuc0OR6pyGpLCQKym
         TmksJHwb7AX0+T5E5BF0QiT5VwRXfRahGNBb9GZN4QHo76+57V0OWC/ZPU6wJjHqRqRN
         V/QsVDkL7Wagpz74oJnrTF7pvvq3sQk8wH8nnYBhByfpn2c9j84DIiuqgmOWH1b8g8Ke
         +C43lu9A02NFyp5Nbgg8IDA6C3YvQ+LX2w/sJHc0I/n7OJL/uZFDyKX4acVk2yy0tB9G
         S3BQ==
X-Forwarded-Encrypted: i=1; AKwUvBwG6FhwWpI0Vnq/5Qa7CE5dNyq+phtZzhsPwmz8uVyVkyPstZBW2wqt+ZXNetru5bGeeS7bQPkYLmv+kQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK/mVGMftkJ05iJxiYzr5/X2htaGJAr0oS8a0g3F7VoMN2ojfPn
	ZAeDAoDN5u6GomyqILJFPBiGSGFBQDdsKfV/RUOwI31uJV/1fr4hnBlZ
X-Gm-Gg: AYBFou0NJReppJThs0FdNTVxROHhUTK9bY6TcoEobH4rGExZbV4Y3HYqHUTisjrs6y6
	OFH2s4SJxIqaW17PyAMiOIGWgauWpnT/EhxQea/ADSgdjv86dQgMuIvWIQcV9zWrR4nwsZq1YeU
	D+RUiFPU6CSJ363+nRZnfD/W5cAyKRWpK0v9MA2HTBwk7lgPGJwtFUCL91YxidHhxjjgDPgat4a
	EHWi/2f+koIxVa0tYZjl6AMdiyJ88XePK3pavPOCFl7j0+KBnCO845fg0LV6XysCEul8Hxh6Kmr
	LWmWQ6+RcSYotvJsSgkQud3SVfPhB0MVtXF98YlWdtEcBmC++WHDDC57UD5Rodw7HRmLa+wFYsp
	Z21boIgemHwHXPv0wEOwXBSu5e7Z0lI8N630dMiwtKRTGbxSK6cVdSaPzaZkNkvqdZQ5Y06GLoi
	WdLMoVVW+4DbbcRCXewcxd19+wwtR0jh/1gP4wiiBca8rPUoo6RypK2ZsOdb/djqHzAMrRycjd
X-Received: by 2002:a05:693c:42c9:b0:359:9e84:dc99 with SMTP id 5a478bee46e88-3599e84ea9bmr14808536eec.0.1792014340729;
        Wed, 14 Oct 2026 14:45:40 -0700 (PDT)
Received: from nixos-minipc ([2803:9810:b675:f600:58b2:f893:fc2:ec6b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm62801856eec.3.2026.10.14.14.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 14:45:40 -0700 (PDT)
From: =?UTF-8?q?Sebasti=C3=A1n=20Peyrott?= <speyrott@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	linux-hwmon@vger.kernel.org,
	linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (minisforum-um780xtx) Fix clamp() build failure with GCC 11
Date: Wed, 14 Oct 2026 18:45:22 -0300
Message-ID: <20261014214522.243253-1-speyrott@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <fda0e59f-20e1-4a94-a714-288940dcdd37@paulmck-laptop>
References: <fda0e59f-20e1-4a94-a714-288940dcdd37@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GCC 11 fails to build the driver:

  error: call to '__compiletime_assert_727' declared with attribute error:
  clamp() low limit 0 greater than high limit points[1] - 1

The store function returns -EIO unless points[0] < points[1], so
points[1] - 1 cannot be negative when the clamp is reached. GCC 11 jump
threading, however, duplicates the clamp() limit check and does not prune
the copy in which points[1] is zero, so the compile-time check in clamp()
fires on an unreachable path. GCC 8 to 10 and 12 to 16 accept the code.

Select both limits first and use a single clamp_val(). This does not
change behavior.

Fixes: 9d980da93bbc ("hwmon: Add Minisforum UM780 XTX EC monitoring and fan control")
Reported-by: Paul E. McKenney <paulmck@kernel.org>
Closes: https://lore.kernel.org/r/fda0e59f-20e1-4a94-a714-288940dcdd37@paulmck-laptop
Assisted-by: LLM
Signed-off-by: Sebastián Peyrott <speyrott@gmail.com>
---
Reproduced on next-20261014 (x86_64) with GCC 11.5.0, both with
allmodconfig and with defconfig plus this driver; GCC 8.5, 9.5, 10.5,
12.4, 13.4, 14.4, 15.3 and 16.1 build the unmodified driver. With this
change, the driver builds without warnings with W=1 using GCC 11, 13, 14,
15 and 16 (x86_64 allmodconfig) and GCC 16 (i386 allmodconfig). A small
standalone reproducer of the clamp() pattern fails only with GCC 11, and
the patched form builds with GCC 8 through 16.

Tested on the UM780 XTX: the installed driver and this version produce
identical rounding and clamping results for both system fan thresholds,
with every value verified against the EC registers and the original
thresholds restored afterwards. Module load and unload are also clean.

An LLM-based coding assistant helped reproduce and analyse the failure
and prepare this patch. I reviewed the change and the test results.

 drivers/hwmon/minisforum-um780xtx.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/minisforum-um780xtx.c b/drivers/hwmon/minisforum-um780xtx.c
index f5d6e18cb651..962ebf41ffb7 100644
--- a/drivers/hwmon/minisforum-um780xtx.c
+++ b/drivers/hwmon/minisforum-um780xtx.c
@@ -180,7 +180,7 @@ static ssize_t um780xtx_sys_point_temp_store(struct device *dev,
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 	u8 points[2];
 	u8 readback;
-	long value;
+	long value, lo, hi;
 	int ret;
 
 	ret = kstrtol(buf, 10, &value);
@@ -198,13 +198,15 @@ static ssize_t um780xtx_sys_point_temp_store(struct device *dev,
 	if (points[0] >= points[1] || points[1] >= data->sys_point3)
 		return -EIO;
 
+	if (!sattr->index) {
+		lo = 0;
+		hi = points[1] - 1;
+	} else {
+		lo = points[0] + 1;
+		hi = data->sys_point3 - 1;
+	}
 	value = DIV_ROUND_CLOSEST(value, 1000);
-	if (!sattr->index)
-		value = clamp_val(value, 0, points[1] - 1);
-	else
-		value = clamp_val(value, points[0] + 1,
-				  data->sys_point3 - 1);
-	points[sattr->index] = value;
+	points[sattr->index] = clamp_val(value, lo, hi);
 
 	ret = ec_write(um780xtx_sys_point_offsets[sattr->index],
 		       points[sattr->index]);

base-commit: 4781ca52761e666cf18b591e6bb0478396c90320
-- 
2.54.0

