Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97491A9FA8
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198158; cv=none; b=uSBuF3v3q+refSmiBpQz3GKSklaoNeUXRk//OWqRZC9aWvXZTN8QUBUJmDWepRmy5QAm+a8AKJXD6FSv14u5t8+reXnWYfFyqKU9ca4k3BTIUFVQ+ZKWSeysvu2/x1F1FBaEisQnOc1ZMlod5b76hwZ6tngtGBRYsFbEFWXz/mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198158; c=relaxed/simple;
	bh=w1Hv0r2r6jSycHFUZO7pD+HmNcQNoWtICO6sg/Lwaxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sWZVAs3RxSRBTcr2NgqBGQ2xe0D58DX4wsfHN6KEhzyRsgI/ZedyGh6EpZXof59m8BohhajT0lpPacOf1X+bEsLzRt/TKykvbo4U7t2DIVqYQZnkKXGTg21ljbktvA7fNh2C9L28HThfANlFmgPPYgxAWLodB1DQ6I4oosy5W5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sP+wOSmI; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sP+wOSmI"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-81f52945098so8204487b3.0
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 17:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785198156; x=1785802956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sc68CqtTOQLhSPfGgDFsVsO0c0+MZYn4nDNljvauFns=;
        b=sP+wOSmIZC9CowfynQ86ETdir2JMrdMhfxUz95iXPyEW++JmemcQnSe/sqlAcCoLr7
         Z0hUJwR87vBKA6Faicw2c+HrzajDH5D4DpALaXU3OyUoX5sL+1TXjFVwcWsBIl9jZ5dv
         3TreQYzHHphTIzgp/Q3IG5gvUgRUOhXFteMo9CWtN92/JZ7c90ivIZSegWXpKwR+zaR8
         Fdw8m8lbxIq0bf5VU12olSaS4G08Ms5V4aknvyA0rBBztD0gjAmEvJ2abt5XOTnBCBdE
         E7a+axk+5y6Cgyd+/fE+FPH70UmALxDSkyZ8Jxji0bX/fDJV14Gc+vHErs4ikZVrPtyC
         blBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785198156; x=1785802956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sc68CqtTOQLhSPfGgDFsVsO0c0+MZYn4nDNljvauFns=;
        b=gza1IC0AsW5tJXGP5Go00s8apHVasLLympUcFjLyNZx60FJv8KcZ/qRfuQZGJ9fAbJ
         rWnm/KsQczRK5MyRt0xoa0ZzRijbkoSmFSHvT5EBpWDODJKCHZ44UTfNszRO+CdO1oyA
         kgTdFRuEliO/VJZbCL5Gd12QaDMSsYecWXi/KphPa+npEVkUQ01AXJvhaZDjbEP31CA4
         jk9eHhsnYVcRFzgb1L9lHHIXVADuO1sJIoTJ5R2AIlkhRBiXTEZ6qYamTqwi9rgob3Gd
         inkl/CsnaNvibIUHgSNsemLe2P4I/RdYQZAubOJO0GdD6jmBPEaWIu8f4aV5sZ3pXXfZ
         CCEQ==
X-Gm-Message-State: AOJu0YxtBwlLFt6pfqx0NAUCkAvQR5m09/Moydx4WFRjTnBiSmf+qPeg
	J6PqDw5VoKtidlTqn67Ys3v2J70KxZ/zjxmzMGxHI4vHpsUSLhDXK01TxshmCU19
X-Gm-Gg: AR+sD12kMOMHCQIVssW4KM/mxKYBoP1H/bO9JrW2V5LsL0hW2iJkOtMheOdv6v2JQQ7
	gnu3nsX8ANzI1AohchG1D5cabe/2u3g+L6KokdR+bWPtXFzg3MWTdLUtt3dQvWOHUOKc9EXjKlA
	RgT8y4PP11q4pY3k7BJAyKpAy4Nt59CTqq1/W03OQSiBTlZPIR5CWOsElGwn4sO93lKewILmtXa
	vaVsozBtZd1ubAFw6M2RdQ3iaYPAKU4HSZd3WmJBiCKxR92Zu77nsxbSQz+DTT0EH34S6IBOWXC
	b39YUlneuY7vYNqrA4bs/YnayHfNo7voNzYTrVaYirfJWCmeQsZZrY+BEAE9kZyLzn/gaSxDK5y
	xs9D08YfO8fDMutpUPG30m+PGuBCRqxRc9O7x0nRzD8OKLoHa1yHnhEVqVmQtPam5YHErfpXePm
	mSUrNg7onsanQbfzX93B0xkjs4yf7d3ADTOlDpRO715FlymrRFhghRp5Bh6MLm0EWThs4MODQRa
	AX/Jtkj9rXGyJI=
X-Received: by 2002:a05:690c:e255:10b0:81e:94bd:6473 with SMTP id 00721157ae682-81f993e072dmr236667b3.30.1785198155733;
        Mon, 27 Jul 2026 17:22:35 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f655acc7csm39583707b3.0.2026.07.27.17.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:22:33 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 21:22:17 -0300
Subject: [hwmon PATCH v2 1/8] hwmon: (adt7470) Fix fans stuck in manual
 mode on I2C errors
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-adt7470_fixes-v2-1-598e38a46ba6@gmail.com>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
In-Reply-To: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
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

