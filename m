Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBFE3BB674
	for <linux-hwmon@vger.kernel.org>; Sun, 30 Aug 2026 15:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788102319; cv=none; b=g8g3DvHUSDgJKZoPk80iDwIkLAsXPUR6oxMJ4evvvnss645sTmqygsIwerYGrN6G6fovrDgmwIL00NnECoOftzeUFHvC3fJT5NugEX5qhe6h68HxuL5lk0FzouaMVnyxw9R1tDsGA1+VPqQpqZXzUsMWMJclaFbVGr2Wkx5sL9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788102319; c=relaxed/simple;
	bh=cgvbhSgZotIrgJh6ig27ZO2A9khgZqxKpiN3/Rs9emg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qC77okl7SuASFKm5pqv7NEjmRlZ1IuSzOtpORVqw4CTLy4tTTHD1T2hBWuzPTxayXiKDf2ttFFKExQPLfwatwoYcvV+6RVsTfyEU3tVmNeahNPBwmF+TuJffgq82H8NAm9IQlgniFvg0/kI4fR17TtMXyLOxQbhMmgb/viEMUrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyb9rjuW; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyb9rjuW"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc891373e0so22296135ad.2
        for <linux-hwmon@vger.kernel.org>; Sun, 30 Aug 2026 08:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788102315; x=1788707115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wk1SXiAVSOQd9bAY/y1d0H1Ln41409FfOwQavikz/jA=;
        b=iyb9rjuWV1QofowVV6iZjdBlkyAisgLSUO3RGyqouvOWLMdhYlnDM5kEPFo5KDiwaV
         KjiWFuuf+SH1ExpuIKkLBR5UC9c7Vo17zttQrzfYmR6U6YHFqdmkLEKTpsRO8HBT58UA
         Bu2yICl1lUSBAcyxT+UDdUAyne4FB8kW4wEkhjF41paxP1H8On4QZ94d5olvGVRuooxy
         2wbzxYV5AFZvLPfAqF8MZkLaotFIr4kiCl2gVrqjE/ukNVkM5izmSfOA+LXSoKIVnme0
         z0HUgmXorR3gmlqHXhl7kInASRXECWccg9kQJtLYUoqQ+ebnXggOS/YaFamWWWwmSC4m
         430Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788102315; x=1788707115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wk1SXiAVSOQd9bAY/y1d0H1Ln41409FfOwQavikz/jA=;
        b=TFyfvigtEcBvlkwOAzyzjjMQmcqTqdAzvESQtZSH5fpnZixxM6FZTJqbuiNejPSMY3
         dDVazXlCJurDbguIg6nXe0GZp+e8SWdYKrHEgZUk0OeWbvy5+X9u09bwyRT2nAglQi4l
         x23vpSwFeq3FCIZ/2snb/A/CtAnN80koVfRm94gvSFYmzvpYelzFohvV6WQGVA01b6JA
         NF5htC7aXxFPd7/xu9VlsNApJUiMVo/IfAOPpyIAJLzQYn3699gq8rNJydh8zDmj7zPB
         LboYZS+I2dkTPp9uYwMoc2ZWm4+eNZgZXqvHqHWMFVVVTUnfMDsjWbDLKWLAvBwZARVe
         XP5A==
X-Gm-Message-State: AFuF++nGVUQGYvN9PXk/x080ffWJc05QmXJrsg/SK/GhoihtnjQ6uSwB
	hyE5tRQ8b2yOLQ6h3QnEMYmIlbZRea7MR1P9y4WY331rvp+oxyKvUKVmRsZ9gA==
X-Gm-Gg: AYBFou3Fz8Tbx5mcI4+GZYmAhgZJ6b+5fg27c/DDi5//zv/4KREfdPY8MsGDbjQNin9
	6rYtF5yFYuqDz4Gi7ue+xs3kyf19mq27T58iXg0h67yaxQeOpN8avu27nf/ro6y1ZjYBYoLIJ+C
	gMTkJkCqoKtvp8dpeyI/1f7kug+0K8MRv7S0/iYSufl0pdL3Sv3eTsg4mCnoq5myqDE9x9h/0XA
	95Z6Bnl6EZEaZH+sD35N6rq2WMErrcLLEAnNTd0XOtN3UgsbMRIOp4c1p6LlpZF1hX8/Gu6cg1n
	mMgy56YES4q4GN/iBqPBzxAoiSmS3NlJyRNaazS3bl4/ZA3qhgx1BaBHrY/5Vgx4/g2jcmI5lZq
	OetrDKU9o5odfCrukhdhOKoOCeNtaiM+/v32p7mf+pYAKZ6pXwD8WIt677MGvkeu7vd+C2m/pDX
	dC6FOwb8/0qLJdy7AkS27S0aIvaB2NZj5uLqeKK+iF79ei80o6l/AoEsQzRDxhxL0pNYMBJ1lBD
	sifkQ==
X-Received: by 2002:a17:903:390f:b0:2d8:d4d3:3fbd with SMTP id d9443c01a7336-2d8d4d340a5mr111990395ad.17.1788102314920;
        Sun, 30 Aug 2026 08:05:14 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32874498f9esm19898384eec.20.2026.08.30.08.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 08:05:14 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (gpio-fan) fix pm_runtime imbalance for alarm-only fans
Date: Sun, 30 Aug 2026 22:05:08 +0700
Message-Id: <20260830150508.1475105-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260828105018.2392383-1-congnt264@gmail.com>
References: <20260828105018.2392383-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_enable() runs unconditionally in probe, but the devm cleanup
that calls pm_runtime_disable() is only registered when control GPIOs
are present. Alarm-only fans never get it, so unbind warns about the
missing disable.

Switch to devm_pm_runtime_enable(), registered before gpio_fan_stop()'s
devm action so LIFO teardown runs gpio_fan_stop() first. gpio_fan_stop()
calls set_fan_speed(0) -> pm_runtime_put_sync(), which needs PM still
enabled to reach gpio_fan_runtime_suspend() and turn the regulator off;
registering enable after gpio_fan_stop() (as v1 did) reverses that order
and leaves the regulator on.

Fixes: 0d01110e6356 ("hwmon: (gpio-fan) Add regulator support")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/b9792be3-fcd6-468c-9149-7e33640ee167@roeck-us.net
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v2:
- v1's devm_pm_runtime_enable() was registered after gpio_fan_stop()'s
  devm action, reversing LIFO teardown order and leaving the regulator
  enabled on unbind (Guenter/Sashiko). Moved it earlier so gpio_fan_stop()
  registers first.

 drivers/hwmon/gpio-fan.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 084828e1e281..988f52d11ce2 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -524,8 +524,6 @@ static void gpio_fan_stop(void *data)
 	mutex_lock(&fan_data->lock);
 	set_fan_speed(data, 0);
 	mutex_unlock(&fan_data->lock);
-
-	pm_runtime_disable(fan_data->dev);
 }
 
 static int gpio_fan_probe(struct platform_device *pdev)
@@ -553,6 +551,16 @@ static int gpio_fan_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(fan_data->supply),
 				     "Failed to get fan-supply");
 
+	/*
+	 * Register before gpio_fan_stop()'s devm action: LIFO teardown must
+	 * run gpio_fan_stop() (needs PM enabled to disable the regulator)
+	 * before this disables PM.
+	 */
+	pm_runtime_set_suspended(&pdev->dev);
+	err = devm_pm_runtime_enable(&pdev->dev);
+	if (err)
+		return err;
+
 	/* Configure control GPIOs if available. */
 	if (fan_data->gpios && fan_data->num_gpios > 0) {
 		if (!fan_data->speed || fan_data->num_speed <= 1)
@@ -580,8 +588,6 @@ static int gpio_fan_probe(struct platform_device *pdev)
 			return err;
 	}
 
-	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
 	/* If current GPIO state is active, mark RPM as active as well */
 	if (fan_data->speed_index > 0) {
 		int ret;
-- 
2.25.1

