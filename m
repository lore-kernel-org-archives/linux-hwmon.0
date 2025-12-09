Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40D042050
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Dec 2025 06:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765262276; cv=none; b=Yv2vPjhesDK9VOQKUx2/slwtUM+IZ3RnUqvHOtFx370ZyMzcHB1lnh6n3nmKQdpwOzxXSm+BUF19Jkg5Yn5iSbAyWznnvCIG/zmFiy3bSVeaRk9ad6+0ziwZQPMFMpKb/UnM6jmoR0eknD4rvi8TCgwnyvHVvIypBTg3igP6Tys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765262276; c=relaxed/simple;
	bh=PW0O6kLbo5GjDu6tRgsLUugmkutcrOHVUDP7cv3Q4TA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QFx08SgRsLkfbgoBVxi+95fjlKsCI60hXesgMQaBqQ5BtpZTrTiLYr3yldtYFTL7PB9F5eNC617BWlgWtEPj5y0uyx8wUnx/o4PQU0katkJBjCENtmwnqIUAJyZ9Lf6sPZ9XnWG3PUcUK5H2YEPE44LUe2EqTVSaIk/mabaP1/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eav+IOVO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eav+IOVO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so43776645e9.0
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Dec 2025 22:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765262273; x=1765867073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F1P6N9X8JGizDDdWBTPzV0iu18wjm9mRYXSTP8eAsXQ=;
        b=eav+IOVOpUjp7vycNYVSqLiEHismkjMoBU/LLBeNVLnG4xl9xib5aH150jpHqFygTb
         awtGJPCLh8ikQvLjaddG/1yhEjN0sSVTVQS9E2SknZFO6aZJeyBhL6Fs7XJkJ3PCWHWi
         WnTfcSEW7yj3Sqhf6uI0cYBAViTR8VcZXgXrWXhTubRdnzPe74CYEmuXmOLOggnQer+P
         nP6Bj4NLKELC+OOxrRJgEvfkCIi6+OuewYLNno07orsqk89sckNM9SS96mC4YKwa2/s/
         r5g+JEyxnGRCPRqemXqAIcuTbnfURg1WNL+QYuTef1JYFi/IpFdtaWuXcok+EbbYkapl
         asnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765262273; x=1765867073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1P6N9X8JGizDDdWBTPzV0iu18wjm9mRYXSTP8eAsXQ=;
        b=Xic338tuCdTR2VcG4m54lz4/nksW+nhiPiljH/R7zMzobe/M3VsyhgkOs6j1rWSeTE
         AMEUPajmJVdLNOeV/3jIwH4mTW7TrjeeZzUgJwpX1JBqZFFopn9fjsR0mKV9taRO8o6y
         tNUOPQ4/0/dYyhqAGHshxynIIEggbmA4pnuZLTKIyadFHzVgUU7+PfjAPsa4kKt+REKz
         sO+ufMJzNGgmlvIhHNqhObrrzBo+1sSkNqDczY29GUJx0BI7TSK/zJQtTMmpivgBIuof
         pa2KZNqHni4BJATc5l5Q6yQk3ew2B4PqRQBIf6u+dxCVTqOmpyt1f0CH2FrN+zNaMsaU
         Ovsw==
X-Gm-Message-State: AOJu0YzRqRd6K9INwDGo6FNZqYqsV75DXcYEBk9RJDIXUij6jUH/hUnf
	XLvw9EMFYZsM4GDQkerAgSQ66AfTfRgzoU1SL+eFfIwzQ3f73fCdZHUL
X-Gm-Gg: ASbGncunbeI9UwJmVRQgQdffNgIQpTvpJtdAu2JO5MdUDHE88cLnmsjZqqDJ0Y5oLFI
	3ggHzBmGaDwqjlvFdH6BInTb9GAe+DRtF6rn7fMPhxugz0VtgTZu75rr7amhzPx1iddTHzSpRhm
	MXTLmbbLm+LzdYa83UyR5f3hBVZCp1NYZbTZ782IHuZbUMcTLiOZhmdPOTQI0maiadcwYXET5tp
	nMtJ6Vagvf5NoqIiIK1oDr3iQg6wdX0MkMFghbRaYfZIwlb8+r0th8QP+3qMQgfb/wqTSSfmJpO
	7wOw4NXodwnIgxcOrNkSaltEJV+XtmoHA7UFr15xJs7tIQBQIpHVXbAEgWva1WJyScOPAYp9VxP
	gZOjBRaIcWJrw9/wbiU7s97QiTek92eyngSAnZDKQrHGT1Y6t+UwTF8AtjqIaa9JkUi0lbqRewI
	cKvnhpNBqsddDjmI0KZ2cci39WKNAMqY8=
X-Google-Smtp-Source: AGHT+IFawsKDR5qdLHY0F6q+l+etzMFFRatyM98cUTaG7A41GSePRP93GY/1Zz5bR9wifPSDgcJtNg==
X-Received: by 2002:a05:600c:4e92:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-47939e1dc67mr92867725e9.18.1765262272982;
        Mon, 08 Dec 2025 22:37:52 -0800 (PST)
Received: from happy ([144.31.69.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d9d23e1sm9615465e9.4.2025.12.08.22.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 22:37:51 -0800 (PST)
From: Denis Sergeev <denserg.edu@gmail.com>
To: pali@kernel.org,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Sergeev <denserg.edu@gmail.com>
Subject: [PATCH] hwmon: (dell-smm) Limit fan multiplier to avoid overflow
Date: Tue,  9 Dec 2025 09:37:06 +0300
Message-ID: <20251209063706.49008-1-denserg.edu@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fan nominal speed returned by SMM is limited to 16 bits, but the
driver allows the fan multiplier to be set via a module parameter.

Clamp the computed fan multiplier so that fan_nominal_speed *
i8k_fan_mult always fits into a signed 32-bit integer and refuse to
initialize the driver if the value is too large.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Denis Sergeev <denserg.edu@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index cbe1a74a3dee..f0e8a9bc0d0e 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -76,6 +76,9 @@
 #define DELL_SMM_NO_TEMP	10
 #define DELL_SMM_NO_FANS	4
 
+/* limit fan multiplier to avoid overflow */
+#define DELL_SMM_MAX_FAN_MULT (INT_MAX / U16_MAX)
+
 struct smm_regs {
 	unsigned int eax;
 	unsigned int ebx;
@@ -1253,6 +1256,12 @@ static int dell_smm_init_data(struct device *dev, const struct dell_smm_ops *ops
 	data->ops = ops;
 	/* All options must not be 0 */
 	data->i8k_fan_mult = fan_mult ? : I8K_FAN_MULT;
+	if (data->i8k_fan_mult > DELL_SMM_MAX_FAN_MULT) {
+		dev_err(dev,
+			"fan multiplier %u is too large (max %u)\n",
+			data->i8k_fan_mult, DELL_SMM_MAX_FAN_MULT);
+		return -EINVAL;
+	}
 	data->i8k_fan_max = fan_max ? : I8K_FAN_HIGH;
 	data->i8k_pwm_mult = DIV_ROUND_UP(255, data->i8k_fan_max);
 
-- 
2.50.1

