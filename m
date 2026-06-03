Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16093A9624
	for <linux-hwmon@vger.kernel.org>; Wed,  3 Jun 2026 14:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495860; cv=none; b=XjbP4GIH24epFyng1j4GggKLbNqYgC1z/NlFqBVAaVzcgjev2dyAJBdu1y95yUQ7mHTAht0F8f/Qh2qN5FjaighkrGqmlqHJF98ynmSJiKNkdUc9po7cOVBfeAWaLdgh6QswhtZybHmHdCjES2Fsju6zBx1G3v1xA/DnZP2s0xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495860; c=relaxed/simple;
	bh=PXGq2oJHYuR07tw/Kib0nF1l7MnIdzNMgPKwVCmcgYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QX+RTOAWOtin8bpyVGuI/DKxWChX/5aK2p5+wmRB2zNVU9otV4tA+sfrxN4kTmx288PbJN9g98ThYbNKdneePPGHp6h509TcTXilcSC1L1uXSwDMDMtnv5sgM6hkHz/LbcYttY378TrXKw7VNc6e97AMYGrjUDbp9gQf0gB0J60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xm6J9c/o; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xm6J9c/o"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so499588f8f.1
        for <linux-hwmon@vger.kernel.org>; Wed, 03 Jun 2026 07:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780495856; x=1781100656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuOo/Hx++0VnvuJWbrTH7yLIcehi5V7tCIyNywrXIck=;
        b=Xm6J9c/oq79QOkr/PNtuYb7s1JGKCN6BoGsPgZp0s7Obb35s/CABVTgfPv1h0FNQiv
         jV2/vs5c1G0sM7po7jWOh5wmtW6/7UbzJJjIARCR3sgYbMTRUMMM5JlzzAp4CWCNADJi
         KZ1knv6x1N+M2vy0l+QH9JyYhtzFiOrgUeegBQAbumqz37wmH0fGjysH8xhJ0uUuG8v0
         APrQLSsugtZ9K1+MuQBs7xY0oDPQA3gIC+kDbauYw5s4r4WBA1cbz98WdJQLypssUYFm
         4sR3oJwjKvLwuks8hgbwKrfYCEYIu+K75tvbneer+hQtTQyBSt9DiVqDKdvU3LMcktkK
         U/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495856; x=1781100656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GuOo/Hx++0VnvuJWbrTH7yLIcehi5V7tCIyNywrXIck=;
        b=dqS8754zFkwjjW7Noi1H7HNOUKmnKmnINz6KkohpOTLuHGuHzjsNN79dqAi5YdH7YM
         OQ0ezbPI3N6nAqrAcNoOR848yOdTfr4fVrX8dooF7qVtVOe9j98WucOBgLwyuFSYDv0a
         5dMVZa8aVlSgsanmatrqulKenkGD7ftq49GEfjPnyk40PCKmDGXVFeIUh6ohYr4ITyt5
         0IWUtZO+fR8K1JH5pQMkW14WQfWN9U1di4tFYNe6eXE8CS7FQpFXWW+Z7Bpm3bxRV4eQ
         XW/0NOWiQwFfn0jhy80D221Vh7iT+a3+V8adslEfwHQcPUOaHaYFo/CP2zoQh2xsYVhx
         fgnw==
X-Gm-Message-State: AOJu0YyNMOuszKXja4H13EWKnXMe/9gSkhBw8GpOxYI/gShBKc0dbu8p
	tCZ73Sxztqtbpq7DNyFJp6hdrovu1Yd09pX02hu1IfvG175J1KQ6eM+e
X-Gm-Gg: Acq92OGAfQFC1FVdMFUlBgmV3kYSeCZ+b1yNMyUhdNV7jsRrbmKII730shmlsYQlUub
	qk0AxwMdS0n/QXiTZSuPpsmTGTDPiCgJZCGLdhnfhB9dZEp11bMz+qvK6UDf270nnnm/+lbV55d
	o/1SCZ0WCEtqOGPTq2xab/HBQQWGaPhXRBsk2itSvW8n890AOYD+mSmkRImiCu5zWRA6bUPztOY
	Fsijf05cSGmxbdiVuXzeUw6VxWtFN3r1SWOawEeecBLq2JlaKhKhjcX+4kvBfwFgJL1+vvou5mM
	9fYWjwbuJYMSo8GriiGOS0nGIhU7ZP51d/JF8g3gjQWkXjZZsBu7XNuVfdqFEro35mUqDzWBPBH
	hjBpX4P7BpVVsoQV9hsEVUUuCCOcd0LF0ESOhenMYmW0vc/CdFtRtR1o54w5NcPpBXqVXmAFKMJ
	hXVrlBOVfd64tc6bbXxmVFXFg=
X-Received: by 2002:adf:e0c4:0:b0:446:708e:1e8d with SMTP id ffacd0b85a97d-4602134325fmr3929718f8f.30.1780495856085;
        Wed, 03 Jun 2026 07:10:56 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm7217131f8f.2.2026.06.03.07.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:10:55 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] hwmon: (emc1403) Add regulator support
Date: Wed,  3 Jun 2026 17:10:33 +0300
Message-ID: <20260603141033.111300-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603141033.111300-1-clamor95@gmail.com>
References: <20260603141033.111300-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for VCC power supply for this sensor. It is required on some
devices for the sensor to start up and work properly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/hwmon/emc1403.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index ac84200be71a..dfdd3982efb7 100644
--- a/drivers/hwmon/emc1403.c
+++ b/drivers/hwmon/emc1403.c
@@ -19,6 +19,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/sysfs.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/util_macros.h>
 
 #define THERMAL_PID_REG		0xfd
@@ -660,6 +661,12 @@ static int emc1403_probe(struct i2c_client *client)
 {
 	struct thermal_data *data;
 	struct device *hwmon_dev;
+	int ret;
+
+	ret = devm_regulator_get_enable(&client->dev, "vcc");
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to enable regulator\n");
 
 	data = devm_kzalloc(&client->dev, sizeof(struct thermal_data),
 			    GFP_KERNEL);
-- 
2.53.0

