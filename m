Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B673D3D19
	for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 03:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789444457; cv=none; b=K5KmQBp0xlZvApJQWpKZ903yKy8hppEeutFu9EP4lwwJ4MayFwaGL/zWox9bmZBMA19YJuQh9kHP9ZOpuBFX/TxPOouy04ADoLA06yvlAwFXXbQSKHwPMZw1tAgDBWMRFMpZVoOhfKm9Ce+S/5eC1eKlaZHWB2dlisBOvI8lNwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789444457; c=relaxed/simple;
	bh=Qp2CZuefhEqMmqIPy5aHwwa86xY0cNo7SeqLUI8QWHY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h3SZrk+MyAM6dadScd8MyPMDmF8+IPFQ7qhk3aBalLvJHGf61MAfy6kaLiWJBuOP7awtZPk9bLrhAN+Zu40/6OyZLnd/K47WFPXU1L46v8p2ybh/T7cQshZ6Ou4GXwSQtvcGnoTnghHM2XE3LhDxvN4erw82jSOZ+C0VTUBykwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbmgDw/Q; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbmgDw/Q"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d654f02baso2392410a91.3
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 20:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789444456; x=1790049256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sE3y70yRK8X+NYBCOKde14KdFBviiIKq+RCDo2yX8oU=;
        b=fbmgDw/QUraHWQ36HAjm7sJ3yB4bjzV4BH/hDwBPg84PS15VPRtd+Ps72caDDK04V8
         ciZHAPanB/jm0LOo9LOIjESlTpwNpGxF1z2s0mG4qtZRejEVQ7L+ZXULksby4/8zNWjA
         ZfRYa51KmbSJ6zsulCMbLveqHHUmFFEDgoqyOkqlYxyxXZa2sUkLynVbMx/0krOtgRlc
         Xu2ELH8PUoJzgNu2l49d0GL+zcsxo37aHLSvoSibP0XkCR1Diz71+4ak8PMtMe8ZucQA
         +6D/wBh8uP8+iaybfIArmN+QS+pxYAERvt58bjrzKb5uNOBn16ZULEaW7jNNeE5dP9uN
         uw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789444456; x=1790049256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sE3y70yRK8X+NYBCOKde14KdFBviiIKq+RCDo2yX8oU=;
        b=eerCxS7MWFDGOARMWV8f2Ow4tHw4387/2onXotTpzPgC3lZjeuISvmI4v48O/PgxT0
         ++737rT5lWbJzMMY6YOql11OE5qqChnOn2k5v9XpFJsjGvO/tVe3m5ygLfAqIvK3Ftah
         tNP5Inw3XFmQB5zOavtTlXlD2FsapH2UO047NhN8q6WD1JpFdcWiR/x7FxKG6rZesgUz
         h3DDEK7TlvIEFwiY50gQzHL2HvsXwOX1JsBbfwDMZ1gWoYyhuoB5XwF0z+NR9ggNW4w5
         oLlL7lMBXFTA6pljCzhnZWeOtiG9WtTAaFlV1Vtsp9ojkCQKpkSpwuFfVjsrNSiVEB0n
         o/ww==
X-Forwarded-Encrypted: i=1; AKwUvBz298RMrfBWjd+2MSKCj1ZQJVm30lwaDTW8AyhPIhHrzHDrrRl+PKprbOPZI4Yo1LPffX8spj+4lgJmHA==@vger.kernel.org
X-Gm-Message-State: AFuF++mCsMeWim1/WkG87zhcxHMqxwF9coku8GENl1AEeXP4PpAs3QJm
	XojXqhpqfpPVP59QDSFrYb/GJCIfwKwrUyWTDW2/f1q0KxdefAhady7h
X-Gm-Gg: AYBFou2p7DR4eFeu8sk2FST6/PfanI11lejy1A6K4++DUGOsxfkbecUKMUp/a6dUuPP
	ejyZociAiZS8dITFbf50iSSvN2OV+K8k8uRM+C71x+EaJ5zNrgTg7Q9vsE9Uovq5I99Mmt8BW1s
	hoh0tGo10vXbA38amg+ziA7VXAQEVdhX13DgmnojiPCulxAHbJMGArmEaZ7KCNC1vqsj9MrfZUP
	+O2N9+2d5/6GLYqcpedYGxDLJ+2p/HcBGx1PkRPE8csJMw39eu+fUhD/pfVR/m9+ASiqURRfqHP
	Q0+Q/Ouvp2qLWyOzc9+0WK/nJxC2xNRx+jXEP17sX5Yvdg5BCAhnR406h52NVkogVIrb+gcksmU
	yWzIZ7zXJEumTTvRdnmbr++LFUIvgEBca47mIUj4/KNqWhSEq9Oh0dmsoukZgszQSfxvz9gMoDN
	xjKB5OyS7CHdceZNHovMZHj4dqti4HVBYiloEB+Ezgp9rb4H6pSkhBtgpxd9I3AGy1hiGfpPgF7
	PuLG6A7KQ/aoe+8
X-Received: by 2002:a17:90b:384f:b0:39d:f770:774 with SMTP id 98e67ed59e1d1-39df77007e9mr7101818a91.20.1789444455695;
        Mon, 14 Sep 2026 20:54:15 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd0baaasm2385768a91.9.2026.09.14.20.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 20:54:15 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Simon Guinot <sguinot@lacie.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (gpio-fan) fix use-after-free of alarm_work on unbind
Date: Tue, 15 Sep 2026 10:54:09 +0700
Message-Id: <20260915035409.4177780-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fan_alarm_irq_handler() schedules alarm_work, but nothing ever cancels
it. free_irq() (via devm) only waits for an in-progress IRQ handler,
not queued work -- a pending alarm_work can run after fan_data is
devm-freed, dereferencing it in fan_alarm_notify().

Cancel it via a devm action registered before devm_request_irq(), so
teardown frees the IRQ first, then cancels whatever's already queued.
Guenter pointed out cancel_work_sync() still leaves a window if
something schedules the work again after it's canceled; use
disable_work_sync() instead, which permanently disables it too.

Fixes: d6fe1360f42e ("hwmon: add generic GPIO fan driver")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260830152150.27F5F1F000E9@smtp.kernel.org
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v2:
- Use disable_work_sync() instead of cancel_work_sync(), per Guenter:
  cancel_work_sync() only drains the current instance, so anything
  that calls schedule_work() again afterward would still requeue it.
  disable_work_sync() permanently disables the work item too.

 drivers/hwmon/gpio-fan.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 084828e1e281..28cfd50aa859 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -81,9 +81,16 @@ static ssize_t fan1_alarm_show(struct device *dev,
 
 static DEVICE_ATTR_RO(fan1_alarm);
 
+static void gpio_fan_cancel_alarm_work(void *data)
+{
+	struct gpio_fan_data *fan_data = data;
+
+	disable_work_sync(&fan_data->alarm_work);
+}
+
 static int fan_alarm_init(struct gpio_fan_data *fan_data)
 {
-	int alarm_irq;
+	int alarm_irq, err;
 	struct device *dev = fan_data->dev;
 
 	/*
@@ -95,6 +102,17 @@ static int fan_alarm_init(struct gpio_fan_data *fan_data)
 		return 0;
 
 	INIT_WORK(&fan_data->alarm_work, fan_alarm_notify);
+
+	/*
+	 * Register before devm_request_irq() below: LIFO teardown must free
+	 * the IRQ (stopping new schedule_work() calls) before this cancels
+	 * whatever alarm_work is already queued or running.
+	 */
+	err = devm_add_action_or_reset(dev, gpio_fan_cancel_alarm_work,
+					fan_data);
+	if (err)
+		return err;
+
 	irq_set_irq_type(alarm_irq, IRQ_TYPE_EDGE_BOTH);
 	return devm_request_irq(dev, alarm_irq, fan_alarm_irq_handler,
 				IRQF_SHARED, "GPIO fan alarm", fan_data);
-- 
2.25.1

