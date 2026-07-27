Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA915346E7D
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 03:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785123305; cv=none; b=mGtvVoLkzZs+MUe0Rj9WHtUXpVgYqPub1YHgqP4splSwaZxiNY1UMnyn2clRWbyxbEqVqZwggz4bzJnPcQUPTqj9aM99ydSgBibJrEgvNYYCrZBxqdtIOAibokgQ8C4lPofRri/SdVUX5pmjLxnIzFKWjuJmXzs8/Lm2jmkuG8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785123305; c=relaxed/simple;
	bh=w1Hv0r2r6jSycHFUZO7pD+HmNcQNoWtICO6sg/Lwaxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GPmnQk41TDMZneFKwDQxHDDWLBSTPiawIBBd3CpGl/A+MkCe9TMcNSVdjozd88GHpIT7gEfkOVlsbaMnpnPaw/eEmdbJ6/8UXtIgfnqHS0/0nzTjDyJ6JpQ8W67ISlRUa8BKurYLke01lW9NjYXCQ0aNBHX10zySnve0Dn1uJf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hI/JAAWI; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hI/JAAWI"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66893db7bccso2801879d50.1
        for <linux-hwmon@vger.kernel.org>; Sun, 26 Jul 2026 20:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785123303; x=1785728103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sc68CqtTOQLhSPfGgDFsVsO0c0+MZYn4nDNljvauFns=;
        b=hI/JAAWIOPff2uBicAmwfG8efDiTSQhXcaysJgaLz2oBdq5p8P4djneHfSwMM6wICh
         Mvu9+7nNMxsSWuYKN5zVx5cJkSkq/F6rpSaQN3rYlgn3c1O7fXmksahIuzkY3Oq01GLQ
         pF1rgkdterMFterRK2xhnxtxFydvwnD6XPjVeS4I2469KlStC7dCYUelog+ZFes1mRKs
         vIjhM7zTIKOFWMRODU3lb++qPHmW9V0NmNbc0duKSzvSvm0KaKHC0cHY/4jfbyjO0r8D
         cb+WkO/mNTeAE4CMTI/nXDt1n2kiGq+/fv9l37zz7fhS6q1YbG9U8DzJUE9Ffq91ZMQq
         nJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785123303; x=1785728103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sc68CqtTOQLhSPfGgDFsVsO0c0+MZYn4nDNljvauFns=;
        b=OeXB+CEkIDBhav76jNcq4iiHfW8+uSW8yWQ8ou091iDCTM4P+WIhOmBIcdkmf+BMLB
         Mm777/x/Lc7W7p4joam0sKfEUB+SDXAh6enRoPqBA8r2tuPGXRRsJPWqqqKlN/Nka1L9
         5/JPKkesCAE1Stw1CBmW+GIwlljJAbP7TxabjqVDYZc1HxdiH9JLMh3JVdiUCb3BH3uC
         UEz/GVOsRKLopYdlZpLJMqNXOxXLtgSSYUo2IOigz8MHXIXr5r+Wrl9+QFPd22v2kNub
         dwsFUb4V4iAQ0OImKSl862oZNntcPT5x+qEZ9Jt7MMnV9QjS1j+UO446nb1RDc4lfhgA
         VOAg==
X-Gm-Message-State: AOJu0YwRug3M0xPdXdp0e2mUUqoMH96X+Z13U3ffVtgOVtMAS/DtL8jV
	AzYBkHs3MEfO4EYCo45nIorcFB4O43opaG2OmEoyKWsveZRbNLFFbr5J
X-Gm-Gg: AR+sD12uvLfvvGYWsV+g0iO0Zep9konLo1QhOvi6RAeyjdEcpwAibsrx/xZiMYYc7ra
	xmUue4/36qjZxV2QzeUSc9tuytHCZHviWv4lV/uBDykC6Sy+hptd7zZrPA8c/DKmYp/npzL8RGP
	ZGu3GKU0D+5ldSX8V0nTCxMBTbVJ7xNoKHhtOqHS18FjoBt9TUaoxRvIWzOVlplk9qtbK2VK7p4
	BiEOVV0c5ZA7gGsuqSaT4fnB0LJJhDLcsBX2ajUR4WmKTaMLP2oOoa2asDsH/l0ulWK0dNdmYnO
	JwfyaS60bVszly8Y26ImkB2GoY9gzrtjysOvQFlZUjxjObgIbcs1XR4xzC5jbt2uJJt0HQFDhfs
	2a3mSVzeIW/YLP6WH7fF14FflVrPki1i0B+wzE0Ya375HUF5unx3M+aO5vtLk5LCSNzK9ZgXIea
	yrwKK3gXkpGOThBSqDMw==
X-Received: by 2002:a05:690e:4881:10b0:667:e51a:118e with SMTP id 956f58d0204a3-668c79b0525mr1390182d50.15.1785123302847;
        Sun, 26 Jul 2026 20:35:02 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-668c6d63596sm2751525d50.6.2026.07.26.20.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 20:35:00 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 00:34:38 -0300
Subject: [hwmon PATCH v3 1/6] hwmon: (adt7470) Fix fans stuck in manual
 mode on I2C errors
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-adt7470_thermalzone-v3-1-21424d550c3d@gmail.com>
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
In-Reply-To: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 "Mark M. Hoffman" <mhoffman@lightlink.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, sashiko-bot@kernel.org
X-Mailer: b4 0.15.2

During adt7470_read_temperatures(), the driver temporarily switches
the PWM channels to manual mode, performs the temperature collection,
and then restores the original configuration registers.

However, if an I2C transaction fails at any point after entering manual
mode, the function aborts and returns immediately. This leaves the
configuration registers un-restored, permanently trapping the fans in
manual mode.

Introduce a recovery path to ensure that the original PWM configuration
registers are always restored, even when intermediate I2C operations
fail.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/r/20260716213252.EACA71F000E9@smtp.kernel.org
Fixes: ef67959c4253 ("hwmon: (adt7470) Convert to use regmap")
Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 40 +++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 664349756dc2..481d51617f4b 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -205,11 +205,12 @@ static inline int adt7470_write_word_data(struct adt7470_data *data, unsigned in
 /* Probe for temperature sensors.  Assumes lock is held */
 static int adt7470_read_temperatures(struct adt7470_data *data)
 {
-	unsigned long res;
+	struct device *dev = regmap_get_device(data->regmap);
+	u8 pwm[ADT7470_FAN_COUNT];
 	unsigned int pwm_cfg[2];
-	int err;
+	unsigned long res;
+	int err, err2;
 	int i;
-	u8 pwm[ADT7470_FAN_COUNT];
 
 	/* save pwm[1-4] config register */
 	err = regmap_read(data->regmap, ADT7470_REG_PWM_CFG(0), &pwm_cfg[0]);
@@ -233,19 +234,19 @@ static int adt7470_read_temperatures(struct adt7470_data *data)
 	err = regmap_update_bits(data->regmap, ADT7470_REG_PWM_CFG(2),
 				 ADT7470_PWM_AUTO_MASK, 0);
 	if (err < 0)
-		return err;
+		goto out_restore;
 
 	/* write pwm control to whatever it was */
 	err = regmap_bulk_write(data->regmap, ADT7470_REG_PWM(0), &pwm[0],
 				ADT7470_PWM_COUNT);
 	if (err < 0)
-		return err;
+		goto out_restore;
 
 	/* start reading temperature sensors */
 	err = regmap_update_bits(data->regmap, ADT7470_REG_CFG,
 				 ADT7470_T05_STB_MASK, ADT7470_T05_STB_MASK);
 	if (err < 0)
-		return err;
+		goto out_restore;
 
 	/* Delay is 200ms * number of temp sensors. */
 	res = msleep_interruptible((data->num_temp_sensors >= 0 ?
@@ -256,13 +257,30 @@ static int adt7470_read_temperatures(struct adt7470_data *data)
 	err = regmap_update_bits(data->regmap, ADT7470_REG_CFG,
 				 ADT7470_T05_STB_MASK, 0);
 	if (err < 0)
-		return err;
+		goto out_restore;
 
+out_restore:
 	/* restore pwm[1-4] config registers */
-	err = regmap_write(data->regmap, ADT7470_REG_PWM_CFG(0), pwm_cfg[0]);
-	if (err < 0)
-		return err;
-	err = regmap_write(data->regmap, ADT7470_REG_PWM_CFG(2), pwm_cfg[1]);
+	err2 = regmap_write(data->regmap, ADT7470_REG_PWM_CFG(0), pwm_cfg[0]);
+	if (err2 < 0) {
+		dev_warn_ratelimited(dev,
+				     "failed to restore PWM{1,2} config (%d)\n",
+				     err2);
+
+		if (!err)
+			err = err2;
+	}
+
+	err2 = regmap_write(data->regmap, ADT7470_REG_PWM_CFG(2), pwm_cfg[1]);
+	if (err2 < 0) {
+		dev_warn_ratelimited(dev,
+				     "failed to restore PWM{3,4} config (%d)\n",
+				     err2);
+
+		if (!err)
+			err = err2;
+	}
+
 	if (err < 0)
 		return err;
 

-- 
2.55.0

