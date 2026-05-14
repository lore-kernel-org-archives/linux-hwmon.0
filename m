Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDBE3AC0F1
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 22:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778796142; cv=none; b=kDdxb4jWuF0lc/5llI9HRmcIcXWgc1PI8ivIdC1+HRL7LzqnHcI+RHM8rQS4OH7wcXKeJWP5tLF4WVQEMrEZkYZGXAHZGA6F6KSPK39pgHOtQoPGVzRIRNGKHz3stXXcIv728Navswlx3b4Dp2lM/JYMbbDf6hF9ZATbzgObAaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778796142; c=relaxed/simple;
	bh=OuNUP4VQ/cd2XOzQDsaDoxFooK7tR82O/MqAGRITIm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kmdKIasK1xxALVSgyvS3EQUSR79OXOwhwCV0OoNffoSKJujvBB4USEGp7vnWOZh7tN1+fJs6EGKf06URsTTmTMwdX747sQQfWnoerc1EeJbPWahyzUfM+U3WK6Yly7n/i1c8zTyHFbL8sl+KLc3wb/dwLxp+dcP2EuuTq6bAvFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1plhtRC; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1plhtRC"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12c19d23b19so14224424c88.0
        for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 15:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778796140; x=1779400940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bCQWuLvtl32GOyFUXVkpB+IrAH0y2Vh06ov3fjg3pns=;
        b=i1plhtRCg+TeZLPKQdWrRnu5HmI9PBfbS2h2flk/b4la0PCTjNPxtPRcEyAAWX+U+a
         heBrk4+7xNqFYhmVNs//oolI9o4rqEiovgRogzKiN4I5LJgFLUgIJat5KOLnAbTrad1V
         mddnzkt/mH38v8IZNjiNj71BR7lVoCZrvCobSlkhp2zQJRBO8/qyp+UNCJNMNdX8NGsM
         V0JVpw1qxgk54GD6FM4PSfXZHIdpFHJgvU84oKQ3XVWfFvWbQCLqYuDMZhV4tAfjfPBk
         6kEmX7qWx0ZuZbto5tuPkvXJFBAh5ujNLcWBjNm5nS9Z8mu6dl4P4i/Bp1SMkFCC7iWp
         mTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778796140; x=1779400940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCQWuLvtl32GOyFUXVkpB+IrAH0y2Vh06ov3fjg3pns=;
        b=H4IYGv1Y896TajJ5jPj5Yuha07FTwZU0BSI12nyVRvNUznT0L/j1fTVQe3d8jUjDJR
         gmP85e3uV1ZB5ojMtzua+SH7xhy9KByK712A3ey62BLur00gzm2rEiCeDzODEX2z0Lnn
         yPhgwxRPExBNjIv3m/74gD2tUsqKGoVyOppi3bhPg+8jyqwwjWEgfirM6vpvR6dj2HQT
         S68OlA1+mWyL3mfBoTkNu5GMbC1ct11T4ykCNgvXa6j/UsIz3fq6lwvw1o+/fEGohQPW
         OOgqJewQOfiwkNM5YSAvWKK4uNhLwS2EvbzCpNavpmt2J4e7Jk1oCWzrOUcB/7rppTHA
         QbjQ==
X-Gm-Message-State: AOJu0YxO9GkW5Yw17RIh5VGGOxC4lLVGRwr19+sYZQ56Arx6SXG1yciY
	r+TX6ZUoGbVQs+wA5wGYuKCXRMHU8FbK4g9Q0A9I8LTJ+LA5TOHwdukEHjD0aQ==
X-Gm-Gg: Acq92OFcOM8tYHuHyho5+GeiQkE5xhndQPybIkjLzXuTqOuUzLhftIuaUfLF+Bp1SD2
	6bxNPgFeDe6At652p7NutVZLYSw30pv3Pj26hMxLsbCr4Iqq1DmnAMP3Rmk4djI0U3cIRd0Kjln
	nqLbFnAtUCjHX0kT+E49pF6xO25CZMjRAIKpLW3Rcrz9Zu6IXQ00jCU/FTEYBhQSj+IQgDAxdZa
	Tg73g3BwWJqq8M164JCf5fNeteRwRqGcZDVaPEHCsm/YBrO9jd9EncXRJQ86OH0yPXNX8anrdeu
	ZHPn9ZGYwFoyXPcnyqv7HS2rIH7C5oaO398XEl3LuTf43bmq4RZ/iVAZCLsokLuK+DuVglyNA8W
	FZ/hOfEjevq4H0znDyjD6KmTWYQ78k6w+WiHWfI6w31pC8TZ0tHXNbaezwaYmkthd0mX9pUw/UD
	TY8DFQ1ZKuclUnDGE6fW5h7OWdxpCbDQtKJap0Zo0jEhrefP4=
X-Received: by 2002:a05:7022:907:b0:12b:ec15:69d3 with SMTP id a92af1059eb24-135047413a9mr479921c88.19.1778796139882;
        Thu, 14 May 2026 15:02:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdcf140sm6541905c88.5.2026.05.14.15.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:02:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/2] hwmon: (lm90) Stop work before releasing hwmon device
Date: Thu, 14 May 2026 15:02:13 -0700
Message-ID: <20260514220214.1380831-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko reports:

In lm90_probe(), the devm action to cancel the alert_work and report_work
(lm90_restore_conf) is registered in lm90_init_client() before
devm_hwmon_device_register_with_info() is called.

Because devm executes cleanup actions in reverse order during module
unbind or probe failure, the hwmon device is unregistered and freed first.

If lm90_alert_work() or lm90_report_alarms() runs in the window between
the hwmon device being freed and the delayed works being cancelled,
lm90_update_alarms() will dereference the freed data->hwmon_dev here.

Fix the problem by canceling the workers separately after registering
the hwmon device and before registering the interrupt handler. This ensures
that the workers are canceled after interrupts are disabled and before
the hwmon device is released.

Fixes: f6d0775119fb9 ("hwmon: (lm90) Rework alarm/status handling")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 3c10a5066b53..50b30d719225 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -2584,15 +2584,20 @@ static void lm90_restore_conf(void *_data)
 	struct lm90_data *data = _data;
 	struct i2c_client *client = data->client;
 
-	cancel_delayed_work_sync(&data->alert_work);
-	cancel_work_sync(&data->report_work);
-
 	/* Restore initial configuration */
 	if (data->flags & LM90_HAVE_CONVRATE)
 		lm90_write_convrate(data, data->convrate_orig);
 	lm90_write_reg(client, LM90_REG_CONFIG1, data->config_orig);
 }
 
+static void lm90_stop_work(void *_data)
+{
+	struct lm90_data *data = _data;
+
+	cancel_delayed_work_sync(&data->alert_work);
+	cancel_work_sync(&data->report_work);
+}
+
 static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
 {
 	struct device_node *np = client->dev.of_node;
@@ -2902,6 +2907,10 @@ static int lm90_probe(struct i2c_client *client)
 
 	data->hwmon_dev = hwmon_dev;
 
+	err = devm_add_action_or_reset(&client->dev, lm90_stop_work, data);
+	if (err)
+		return err;
+
 	if (client->irq) {
 		dev_dbg(dev, "IRQ: %d\n", client->irq);
 		err = devm_request_threaded_irq(dev, client->irq,
-- 
2.45.2

