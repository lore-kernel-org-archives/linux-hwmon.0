Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047004;
	b=DMocsOKwb2tydsOLxIZNPdw6JVzqrYJZNRaSgcAuHweR6Dla7bVSfoc257/nFzqiazY0
	 EdREKZyob+1C0RgdrJwn4R1OtfpZMgFXpFnIj/7tTNvIGDHBkX2UOpDbrYfM8+vWBBqNf
	 1YpeYRc/WQg/DcemGO9MlW+gkBAFIwPdVgbh6o+A6U3iyKZFW6gueXl7EA7nt56c0JraV
	 gzn0go3p2MjBCXeoTkwLmpbCC0KFUfffCwTyysn2nTxQAE1vVK6xSik25tahs/Lr55fhj
	 fG4Jli9lFnWzCcdfMHqr8HhB5GLFr9JQ4l8NxJ8PQDS5L5jaG/4TlWq7xmbvH4U8IhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Cz6JhA4vgHQqGHllNtBlEMCpr/c5f2N6W+pIECb8wEI=;
	b=vGiPcaGKdz1C2CRvXqhgpyjxqRpQmET6yAS0ubIgUp2YDKTaV2EAa286DLT2ki6d6RMY
	 5OaGpTu1Os2c1pwD8XmgH0+w79/323qudvs9YyVMXwiOxz0HOS4ICggo91FUIyStWbCzw
	 EQAjHiM34xK4OXErGvYDuC8l8KLcvjwNJ518B0TSb0luFv9oiqqOORJEOkiu9vZtJuJj7
	 lD0524iEJRzmiszix1HR5B3ONNJ5+gTYjR191wpYi9VomA/E6qRZx4ZYINYzOOXMDXYj8
	 Ti1fTG5wvfIu3KG7S1d6SpG/q25a+uGZbyNIYIm/Oix5kCZI7Li8MzFyp7dSxhfuWkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T0HssYh2;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914D060A262F
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 00:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 914D060A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T0HssYh2
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b32daac9d7so2911567b3.0
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 16:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795047002; x=1795651802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cz6JhA4vgHQqGHllNtBlEMCpr/c5f2N6W+pIECb8wEI=;
        b=T0HssYh2SSHWHrSuOXQ97kVsD2vAdVHgdABDUZORdNsFg9hXotQCamW/b67k/LRdkY
         oPNq9O5RP9TDGOiVLO0O4j1HRnwaVJWs1ZlddnurfTtbfZWfOrPxrjc+0lQ2SoF655d9
         6fEcL8IpZcxhUdfl5+ehGszFQO2SrXLc2gJ4gl0k6GQM9/IfWfEYfCpwBLqteoTV2uAF
         VCNiWOSYS9GcYMZ1jrlPR9zXjMrrArSEPtNp/VLAo+ExjzvrVBguWhGL8qqxUVD84hC0
         vZCLwQuSg3afgF/hvvz8fm0zMZ4RLnDfYZfxMQojLt+S0F3GMlFk8iDbOEXEq7W50LZr
         pVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795047002; x=1795651802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cz6JhA4vgHQqGHllNtBlEMCpr/c5f2N6W+pIECb8wEI=;
        b=MG20yGybBGlBgqgjGI70kppioWuCLCMkYGHvdWgD2Avp56/7VRU22p1yszLe8jvLqN
         LNr8YtIAAdDsVnYywrUI96q374IvGZ0Rcx/aZX+gwCP192UV93Y3uaBREYvRdOfFERtK
         UBOLsJ6y3G5JZZfOPlpyjuR8u3Cd1eaNev+rt8b+J277l6HkBhg6DjeXjldsznGCr2ZN
         OrncwF52DApCyI9yFdg09KEfTDYlLueXthxhVwmxVLYeahAKB2eYszcQcrln+r/E2mJp
         sUq6ugA0R2HQB1w3OYPdqEmE5Hne0JS5dat+1NkN9Uk8MyfeJsDevc9VsGeLj+Hzc1Zk
         17qA==
X-Forwarded-Encrypted: i=1; AL+hErEabOyci2g/uxGPHH/dcwH/CuKyl9XV7BK6CtDFiDyNNsEGy3TXaO/MjSKbZ/4gS3Z70Z5vHwe/sUqudw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/lpLUlQf2iHKHjs528eGtBooHg9olTdZ8P/0rbkby+gIQ4O7t8
	K/Xab7Brxy0gi+Wo5PIwtLMoq7T8m+rIGfntqx+50L9XLNdWkiKF1ffUZ3bNEpo1
X-Gm-Gg: AZFdTZdJkeNwm3EiwHteNnxq77ZxDt15BfK4OLZwchuwxr0w/rU35dBzlubxb0PHKR6
	h6yG2d0aZnr9v3RrQzUh9tfs+tUBQIkZL1KFNup9i8RSxJYz6vO2W76Avl0SLkkuqAZajic2W4O
	VjtzDPpUyJmcIZvXwduYGHtL6y+HAFTses+d9Jpp+mDlgus0oXfiZ7NvlaT9glgQym0TvWhcpI6
	uenfAC3PBvs5TTo6CS2qMX7GbJHqwCRmHNBqncic+jN+ukVZNQOEYOg6kBYadGIUlor3djDuS2e
	JiDW4dQXyye4cHnaklCll2aFwv2A9gJhnjiBuLCXeOyTJb38t5V/L8L1emI2UE3suxfrxavSbsK
	ZCMV5aMOzaMLj5aY2GAhd2W2Drk4FyXRXv769QMeEsSwOgI0uqHJZwKKuEwCg9Q2uauSlrOtCAZ
	N7Osa0rHRdzmNMhY6RqKfQ1BREJhDo5Jwz2HNgHOAMvuq3nUC36zWu6LhD30tNJV+1BIrc//S4M
	jh3OTCzcPxvjKZsBu1yHip6W/vOCtahA3Ri7UDgmL56sGh67YeV80dmUj+knXnV2c4+a0T9wc0c
	tR6z/lJ8AHMkTxzY8vMBBdUgjt5QVzEC3SIxxuZy1W+CSp0ykHWG8KyQ14jqPDCj3XP4hWTgPDo
	DtEUQ6vYvPmQnjIg0v5k6ruAE0o32d5LdW8VIKITL4KF9DuyWiFd4MTYxoUQGctxrb2gBAHCJ7G
	e5dEyo5i2GMxPskocwUg==
X-Received: by 2002:a05:690c:4990:b0:8b5:2a0:606e with SMTP id 00721157ae682-8b513d44ceemr1089987b3.18.1795047002245;
        Wed, 18 Nov 2026 16:10:02 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe0eb8d2sm25158667b3.36.2026.11.18.16.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:10:01 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 18 Nov 2026 19:09:52 -0500
Subject: [PATCH v4 7/7] hwmon: (marvel-env) Notify userspace of
 environmental events
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-marvel-env-v4-7-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
In-Reply-To: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6655; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=qZd97RW9IxalQgdmkxJLFmDFqrpkV05FcdnVxnLWCBQ=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+2XlJfX753nl10dmpc/37opgy38RU8HLwzZXRzH0o5
 7um7sTbjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnmqjQjwzXlfz//+G
 2/+rxfSsn6Z13/ZyXf+qtn9s7I1vfYqv3lxDlGhitpGw5KN/FuDT4dXvhbJfDZri2+WzMu+h198
 euZ6X6FajYA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The firmware reports each change of a sensor's state as a system event
machine check. On one, reread every node from a workqueue and notify
userspace of each alarm attribute whose value changed. The notifier runs
in machine check context, so it only queues an irq_work, which queues
the work. The work takes the hwmon device lock to serialize the refresh
with the sysfs callbacks.

Signed-off-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 Documentation/hwmon/marvel-env.rst |  4 ++
 drivers/hwmon/Kconfig              |  1 +
 drivers/hwmon/marvel-env.c         | 89 ++++++++++++++++++++++++++++++++++++--
 3 files changed, 90 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/marvel-env.rst b/Documentation/hwmon/marvel-env.rst
index 02d5241749bc..4123c44fd2c1 100644
--- a/Documentation/hwmon/marvel-env.rst
+++ b/Documentation/hwmon/marvel-env.rst
@@ -26,6 +26,10 @@ cabinet and drawer numbers.
 A refresh keeps the boot CPU in the console with interrupts disabled for up
 to 300 ms per unit, so a unit is refreshed at most once every 10 seconds.
 
+The firmware also reports every change of state as a system event machine
+check. When one arrives, the driver refreshes all units and notifies
+userspace through the alarm attributes.
+
 Sysfs entries
 -------------
 
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index c0ce5591c82d..99c5d84c8752 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1258,6 +1258,7 @@ config SENSORS_MACSMC_HWMON
 config SENSORS_MARVEL_ENV
 	tristate "Marvel (EV7) AlphaServer environmental sensors"
 	depends on ALPHA_MARVEL || (ALPHA_GENERIC && !ALPHA_LEGACY_START_ADDRESS)
+	select IRQ_WORK
 	help
 	  If you say yes here you get support for the temperature, fan,
 	  voltage and power supply sensors of Marvel AlphaServers (the
diff --git a/drivers/hwmon/marvel-env.c b/drivers/hwmon/marvel-env.c
index 8ec3dd7c0b23..effa70b3b35b 100644
--- a/drivers/hwmon/marvel-env.c
+++ b/drivers/hwmon/marvel-env.c
@@ -17,12 +17,15 @@
  */
 
 #include <linux/hwmon.h>
+#include <linux/irq_work.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/notifier.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/workqueue.h>
 
 #include <asm/gct.h>
 #include <asm/marvel_env.h>
@@ -97,16 +100,21 @@ struct marvel_env_chan {
 	unsigned int pkt;		/* packet offset in the node */
 	bool ps;			/* power supply, as an in channel */
 	bool present;			/* known when the driver loaded */
+	u32 alarms;			/* alarm attributes last reported */
 	char label[32];
 };
 
 struct marvel_env_data {
 	struct device *dev;
+	struct device *hwmon;
 	struct marvel_env_node *nodes;
 	unsigned int nr_nodes, max_nodes;
 	struct marvel_env_chan *chans[hwmon_max];
 	unsigned int nr_chans[hwmon_max], max_chans[hwmon_max];
 	bool multi_drawer;		/* label with cabinet and drawer */
+	struct irq_work irq_work;
+	struct work_struct work;
+	struct notifier_block nb;
 };
 
 static const char * const pe_names[] = {
@@ -293,6 +301,7 @@ static void marvel_env_add_chan(struct marvel_env_data *data,
 	c->ps = ps;
 	status = marvel_env_status(type, c);
 	c->present = env_status_valid(status);
+	c->alarms = marvel_env_alarms(type, c, status);
 
 	if (data->multi_drawer)
 		len = scnprintf(c->label, sizeof(c->label), "Cab%u Dra%u ",
@@ -498,6 +507,72 @@ static u32 marvel_env_config(enum hwmon_sensor_types type,
 	}
 }
 
+/* Reread everything after a system event and report changed alarms. */
+static void marvel_env_event_work(struct work_struct *work)
+{
+	struct marvel_env_data *data =
+		container_of(work, struct marvel_env_data, work);
+	unsigned int i, k;
+
+	guard(hwmon_lock)(data->hwmon);
+
+	for (i = 0; i < data->nr_nodes; i++) {
+		data->nodes[i].valid = false;
+		marvel_env_refresh(data, &data->nodes[i]);
+	}
+
+	for (k = 0; k < ARRAY_SIZE(marvel_env_types); k++) {
+		enum hwmon_sensor_types type = marvel_env_types[k];
+
+		for (i = 0; i < data->nr_chans[type]; i++) {
+			struct marvel_env_chan *c = &data->chans[type][i];
+			unsigned long changed;
+			unsigned int attr;
+			u8 status;
+			u32 alarms;
+
+			if (!c->present)
+				continue;
+			status = marvel_env_status(type, c);
+			if (!env_status_valid(status))
+				continue;
+			alarms = marvel_env_alarms(type, c, status);
+			changed = alarms ^ c->alarms;
+			c->alarms = alarms;
+			for_each_set_bit(attr, &changed, 32)
+				hwmon_notify_event(data->hwmon, type, attr, i);
+		}
+	}
+}
+
+static void marvel_env_irq_work(struct irq_work *irq_work)
+{
+	struct marvel_env_data *data =
+		container_of(irq_work, struct marvel_env_data, irq_work);
+
+	schedule_work(&data->work);
+}
+
+/* Runs in machine check context, so only queue the irq_work. */
+static int marvel_env_event(struct notifier_block *nb, unsigned long action,
+			    void *unused)
+{
+	struct marvel_env_data *data =
+		container_of(nb, struct marvel_env_data, nb);
+
+	irq_work_queue(&data->irq_work);
+	return NOTIFY_OK;
+}
+
+static void marvel_env_unregister(void *arg)
+{
+	struct marvel_env_data *data = arg;
+
+	atomic_notifier_chain_unregister(&marvel_env_notifier, &data->nb);
+	irq_work_sync(&data->irq_work);
+	cancel_work_sync(&data->work);
+}
+
 static int marvel_env_probe(struct platform_device *pdev)
 {
 	u32 *config[hwmon_max] = { };
@@ -505,7 +580,6 @@ static int marvel_env_probe(struct platform_device *pdev)
 	const struct hwmon_channel_info **info;
 	struct marvel_env_data *data;
 	struct hwmon_chip_info *chip;
-	struct device *hwmon;
 	unsigned int i, k, nr_info = 0;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
@@ -579,9 +653,16 @@ static int marvel_env_probe(struct platform_device *pdev)
 	chip->ops = &marvel_env_ops;
 	chip->info = info;
 
-	hwmon = devm_hwmon_device_register_with_info(dev, DRVNAME, data, chip,
-						     NULL);
-	return PTR_ERR_OR_ZERO(hwmon);
+	data->hwmon = devm_hwmon_device_register_with_info(dev, DRVNAME, data,
+							   chip, NULL);
+	if (IS_ERR(data->hwmon))
+		return PTR_ERR(data->hwmon);
+
+	init_irq_work(&data->irq_work, marvel_env_irq_work);
+	INIT_WORK(&data->work, marvel_env_event_work);
+	data->nb.notifier_call = marvel_env_event;
+	atomic_notifier_chain_register(&marvel_env_notifier, &data->nb);
+	return devm_add_action_or_reset(dev, marvel_env_unregister, data);
 }
 
 static struct platform_driver marvel_env_driver = {

-- 
2.56.1

