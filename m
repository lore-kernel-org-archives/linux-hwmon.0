Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3657368D45
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 23:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778802992; cv=none; b=bdCBPicvAuXvU/kqwINK0e5QvYzjvD6tdRz+GBLyH2fXPFfErzOtItGtA1arK2TiTcIiGG65k82Rw//6+XKSwsG2syt1T070ZwNOBy1o3EGsmapgVH1XNa533gDiLp+CdzYSUJg5JVnMTofoiUsLshxV/YMc0wfx5J2aUNLX5us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778802992; c=relaxed/simple;
	bh=En9b785lHQeIUWqAQhg541DxX+7wu+B2P+nPwmMNhbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZaQOPcUWRXyC5eQIot6kNYr3MPrd7HAmcu7Oig9S9HToeDKSjjs6qpw/Ta0usfc0t1dmh4OhI3mD6WZUhwd5hHzyQ7M2F7FBiXuGBjIsj7r1NYZgujAvJyz7RQGj3CqRwoz0tl2bS45QVmnBQZp2JWAHkl05oBfVtFoVDNGq3rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZdc0lR8; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZdc0lR8"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso9815943eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 16:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778802990; x=1779407790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BDiKJnyFdMQ6PMlfmGVe50nZnn+wM5tM2Z+D38k1wGQ=;
        b=jZdc0lR8ZuS5Cn1UtjwGbHSfwkeL0DykNmgtH53yH2I/uUdnHYaacA2OyOAO0DYeL7
         htNMbKoL188lvzdp1Yy8vIblfup6+7dLHB+XdhiQC9tDslCy6qKVhjPiQN6H/4T0H9wF
         Yb6/XqeCMVNAYSwpWsc2TMlsiuFOjkDZPBlfHfASbLmjPjYd7VousFkfOyfxkmFR8iQ7
         lidQ14HDxttbqMcIGeOvPpY0x+f0pL0Cpp87gSe9v+gfwFwEpuS5k+0JYi9UnJbIDS9R
         Tt6phN+HYAkPkAq4m7X+iLX0oQS2CEFsbknq92ogdUP88g3faTq+VgmsYDp5Kgyp4lTM
         znTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778802990; x=1779407790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDiKJnyFdMQ6PMlfmGVe50nZnn+wM5tM2Z+D38k1wGQ=;
        b=rq4HwwpT5qX3Z8r59lplQC7kOxyCd544ZPwzA83kw3TCKLO0Dw/59gJvBy/smAbgKo
         yeOhA+agsqB7UFCH2Yi0Wo5rdCdmBikwtsfT3SLwkOdF0HBf0+sv5UVVY1ps8ppxNDpH
         BgGA9eUTWvhl3d/J43PtqgT2e1pZ52CwMT7YlgNmqyygkuhO1heTtEz1DG8I+jRBRzXw
         tnlxguX08a11grgXqFFy+KEz8uMqpPja6JRy+oh4pkYHyAEgjwjJ49Aa8sPFGkJwFEoz
         Nx5xoqHEmUA4ewFArgq68lLQyIaBZHUEO4pgeJVwpGXDV5fj0/24RQsQ5NAVKmRzpb/4
         k5yg==
X-Gm-Message-State: AOJu0YwgvfTvnPupRoiW8m4tELqi3v0VAdNi8oRaVt0uzbi79s/Oji7Q
	Nf/dH/HAT1vEmNOKey9xtQ82yBPXReQ1QsL9GXgYDbXg9fVWrbugv9Wy/aBYGg==
X-Gm-Gg: Acq92OHUrVye01ageq1MnpizfYUbPjCxpbi8kYQpf+PkPYB4M8SoVxVf3YT6yBmuLX2
	XmIwoSyID8pbP5nQMnxY8RbWrKQBC1t42jT4CwGjR47I19pU/tbauBn314PXzb5ylBayk8VcpuJ
	tJ/5edhTFLdOAu9o2PXvt7o2wyRAK4N76fv2tzjLE+jYme9tGslpPnUgfHG4tWgqU2w4XGyTudc
	aeGbxRSW64Jd2Kt/tcny3w0IL1ueRUN8UEG+cIvVmiA5oIJyPlJopgWkbpqX35uNI6y8x9f9HvS
	hZIw5fTe7G8juAcnmwZ1ywLqiXGmKm+OgkQckv7sbOeXXTJKboObBANGpCwToYlXWxaQt8XOpKP
	NMMLZYm95gx70HIhNl798nXBDECp/T/07aBHAdbks8LTP20B/fdQpSG7aULzNcb9iGnRmv85qV/
	VHCd7pklPET1wM0TcHRfTrFUz/ElPDwihqoNHB
X-Received: by 2002:a05:7300:f187:b0:2da:1874:f3bb with SMTP id 5a478bee46e88-30398699534mr856591eec.23.1778802989417;
        Thu, 14 May 2026 16:56:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bbd50sm4867337eec.20.2026.05.14.16.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 16:56:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 1/2] hwmon: (lm90) Stop work before releasing hwmon device
Date: Thu, 14 May 2026 16:56:25 -0700
Message-ID: <20260514235626.1403695-1-linux@roeck-us.net>
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
v2: Add 'shutdown' flag to prevent workers from being re-armed

 drivers/hwmon/lm90.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 3c10a5066b53..08a568f7b56f 100644
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
@@ -2584,15 +2588,21 @@ static void lm90_restore_conf(void *_data)
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
+	data->shutdown = true;
+	cancel_delayed_work_sync(&data->alert_work);
+	cancel_work_sync(&data->report_work);
+}
+
 static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
 {
 	struct device_node *np = client->dev.of_node;
@@ -2902,6 +2912,10 @@ static int lm90_probe(struct i2c_client *client)
 
 	data->hwmon_dev = hwmon_dev;
 
+	err = devm_add_action_or_reset(&client->dev, lm90_stop_work, data);
+	if (err)
+		return err;
+
 	if (client->irq) {
 		dev_dbg(dev, "IRQ: %d\n", client->irq);
 		err = devm_request_threaded_irq(dev, client->irq,
@@ -2930,7 +2944,7 @@ static void lm90_alert(struct i2c_client *client, enum i2c_alert_protocol type,
 		 */
 		struct lm90_data *data = i2c_get_clientdata(client);
 
-		if ((data->flags & LM90_HAVE_BROKEN_ALERT) &&
+		if (!data->shutdown && (data->flags & LM90_HAVE_BROKEN_ALERT) &&
 		    (data->current_alarms & data->alert_alarms)) {
 			if (!(data->config & 0x80)) {
 				dev_dbg(&client->dev, "Disabling ALERT#\n");
-- 
2.45.2

