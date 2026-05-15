Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CBC367F3C
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 01:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778808344; cv=none; b=K8bLZtoF6bXbpSEy7ssQpES9sgXbGHs2E/6240tRNZKbdM+aCvAisIEgdVQFi2vJtTmyIFXpPEh08MB4LGmmH2s5kELMQ4BBGzaEnAMFtq2/9ytIYcZdqM8J1Y8adfnOtCVJ5fAi8CRc/BxjWLgaOrT0uK37cNkZIsoP4993M4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778808344; c=relaxed/simple;
	bh=mmBElePN10Hi//6CUrhyN96ImfdkFTJYklICvcvDtIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cRM3oOeV8eKl14063tjTNnHy56WISuJFEBMrHscTaOR2JjmSFwbiLMwe40g10tu4Xvx39AamRyi05VjhY3yKHKfQ8sn6Qu90K5r0TU8P1yYBiW8yDx9/sHw9xRpLQ1BCNOJuMALGEv5dJ4Apepu/H+ESwzZQXkTXaZojcZHoods=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RaJmC/Hk; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RaJmC/Hk"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30246cfd41aso2864582eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 18:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778808342; x=1779413142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3qvuSKx0WzhCvaHlP5Q0xRTMXrANWYdIlRxTeOy42s=;
        b=RaJmC/HkMoPojYtniDrUQINlPiqYFRa/kojQISyo2DxgH14tJ8XB158v1DvMSUU6xu
         qcVhp9GsjQfteHP6seGbMqWl52OTgrEWv9GUlGsGdAKnBLCSlIvjZwfW6A2anltAQUbs
         k+juq9Cv4BqyPB3fJuNGkIWmb5TQuzAm0UNTDeqLAQYcbxI7vxUCNakN4PSJsHI9VkwZ
         IxTVxXphJwg/kRiZcI9+E9uuuAjq1JrRJsrPlflloJOWLQVSBnlELcmZ05TreNj1Ci6D
         nE2hMHx1H3I6M5txAM0BAd5dwLJzavvjBGOBOYeRm/UBcSirs+cLOxo1c5yBUJfZQxHM
         zzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778808342; x=1779413142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3qvuSKx0WzhCvaHlP5Q0xRTMXrANWYdIlRxTeOy42s=;
        b=sbx7GtkNtUzCclPDdNvyUoawQV9/XL8ZUcjOD417CAlplLeue7o8AkXGejcdxVARJT
         stOM7tCPdChp8dOWBSP1Zs+al9to2KAQQ7x1i0sgTxS9roK3qE3eAeVNa5bgswMaFFZ5
         McjLLWO/yVhsJKGHEu0Wdey0o5VZSIe77K89+LGrx8WT6W5LMSUUkxwBwIXBE6y29nSr
         1yQga3b4yyVbBxJE3moHYWEzxHxxeWpcBbYfOmbKvlLQ214f/cWySrV0n8CV0Wf4eRoP
         gU46Ye1ei8GYAL09UxlYq71Qo514HAAEqICgHYUyv3lXxZKllJXbYQePEd2zHwG/FWcA
         OcJA==
X-Gm-Message-State: AOJu0Yw6EixTJBuFOkKWbq6O9eRxJ4OfgJOYvS44ikr08BfGF9YmW2Uy
	+/ZKHuKPfxqtnso6DZ2G8TJqKNYju+JkxD7gIgNi4rMsxvD3kO7ip35lVjgWxw==
X-Gm-Gg: Acq92OGBMD1/OIBcqQAgZlJRSdhIuAanxTU/DUi5hYStiAo6TJQQnuVCzlAEVyLvOYp
	2bME9ZsceFsu5irRHzouUH6I87u545Lx+/mCgS9enpLLLAXEPL9pF3eX8GLwWja2TS45blDYSR+
	Rsl658Ga7XWOZoHxKmN/CulaTIFQIK2FgbSs5YUnmnSVtTg78dMwzC7pdTzZE+y0ulMZpYOGTTP
	ZdF6Droc1IPTjOzPOmA29CTZBw2YaKokzhLwW5GJDZpsNMro+iECpAHfwu2ek/bFNbuydKmHmVp
	MrNDewAAVSoW9Lxpemv0mrwTd/TMdUSDhz0S+wUKlN9UfVFXGKot8BX/X6Pqqvq+vZq+xc9GpOg
	tz6LPknat17G+PWYsNHUAWv0o3o9ppYQgxJArsRqLKfYW7Or1jODiEYVAr+8fd/o1Nku5DyDl/x
	TVRXsLJOpM4+syR9htOPRzAenVcSg35mBZS5A2
X-Received: by 2002:a05:7301:22a8:b0:2dd:6937:79c8 with SMTP id 5a478bee46e88-3039818a6bcmr1122007eec.5.1778808341283;
        Thu, 14 May 2026 18:25:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bcd0csm5291800eec.24.2026.05.14.18.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 18:25:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v3 1/2] hwmon: (lm90) Stop work before releasing hwmon device
Date: Thu, 14 May 2026 18:25:37 -0700
Message-ID: <20260515012538.1419732-1-linux@roeck-us.net>
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
the hwmon device is released. Add "shutdown" flag to indicate that device
shutdown is in progress to prevent workers from being re-armed.

Fixes: f6d0775119fb9 ("hwmon: (lm90) Rework alarm/status handling")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v3: Hold hwmon subsystem lock while setting ->shutdown flag
v2: Add 'shutdown' flag to prevent workers from being re-armed

 drivers/hwmon/lm90.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 3c10a5066b53..c4a9dafff81d 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -736,6 +736,7 @@ struct lm90_data {
 	struct hwmon_chip_info chip;
 	struct delayed_work alert_work;
 	struct work_struct report_work;
+	bool shutdown;		/* true if shutting down */
 	bool valid;		/* true if register values are valid */
 	bool alarms_valid;	/* true if status register values are valid */
 	unsigned long last_updated; /* in jiffies */
@@ -1154,6 +1155,9 @@ static void lm90_report_alarms(struct work_struct *work)
 
 static int lm90_update_alarms_locked(struct lm90_data *data, bool force)
 {
+	if (data->shutdown)
+		return 0;
+
 	if (force || !data->alarms_valid ||
 	    time_after(jiffies, data->alarms_updated + msecs_to_jiffies(data->update_interval))) {
 		struct i2c_client *client = data->client;
@@ -2584,15 +2588,23 @@ static void lm90_restore_conf(void *_data)
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
+	hwmon_lock(data->hwmon_dev);
+	data->shutdown = true;
+	hwmon_unlock(data->hwmon_dev);
+	cancel_delayed_work_sync(&data->alert_work);
+	cancel_work_sync(&data->report_work);
+}
+
 static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
 {
 	struct device_node *np = client->dev.of_node;
@@ -2902,6 +2914,10 @@ static int lm90_probe(struct i2c_client *client)
 
 	data->hwmon_dev = hwmon_dev;
 
+	err = devm_add_action_or_reset(&client->dev, lm90_stop_work, data);
+	if (err)
+		return err;
+
 	if (client->irq) {
 		dev_dbg(dev, "IRQ: %d\n", client->irq);
 		err = devm_request_threaded_irq(dev, client->irq,
@@ -2930,7 +2946,7 @@ static void lm90_alert(struct i2c_client *client, enum i2c_alert_protocol type,
 		 */
 		struct lm90_data *data = i2c_get_clientdata(client);
 
-		if ((data->flags & LM90_HAVE_BROKEN_ALERT) &&
+		if (!data->shutdown && (data->flags & LM90_HAVE_BROKEN_ALERT) &&
 		    (data->current_alarms & data->alert_alarms)) {
 			if (!(data->config & 0x80)) {
 				dev_dbg(&client->dev, "Disabling ALERT#\n");
-- 
2.45.2

