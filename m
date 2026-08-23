Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423A5368D71
	for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 17:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787507955; cv=none; b=Tu7VmiO2p2RSJU9lM5QFZs8/dyFN1UdClWhTUaz+rXiayHIP3Zq0/C9V8z5q6vfYurL+wGgPVlzEu1mEpMBE3rNESuzSamn/jEGmNbSr1jIWNALhncrMJ2o4j1pKcNtrHCqo02/oTIJKVmyGyfUqSicD84Un95WjxEi+p49Kbzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787507955; c=relaxed/simple;
	bh=NDfDF//cYaOMQlKuyN0eF+WouZ/qTNtQvy32KQUCa/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nbaJ83TqP0wwkaq2VS0C/PcBKpiveJzTvpGNXxpOjQebuLhPm4Ifigd0hmVHfBcHzEuwS2cFqUzSObvWSoYwe4cUgJTMbEoLhhEZtYXGGvMxdXyN+1AIlxh6NsiZZrAXCoNf+UEnhbcUk55aB6UFRQnro7hbVaU9TUVMPOpes9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RiV36WvO; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RiV36WvO"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a3819e8be8so5766503a12.0
        for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 10:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787507950; x=1788112750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vgFoHaAGCDAcXCaglR6rN0UVDpopjrCPNpzvvDuKgdo=;
        b=RiV36WvOz995tLol0ZfUU+Iqmqte8eQqnhvRrvm5l61FVle0XlN5BEnWVxxYjZkW8L
         H0vs1WzR/XTvgEoCJyNHfDiVKnMoe7Cm8L8MWg8MNVN4DZoB/BzVlEO2WAHsbvfp0+FB
         rB2q/01tq/ytE05DdD/dR3mB3UxOHxM51P3cdLgSu9EYNW/RcKqURcXEJ1pTm2lVtuWX
         WJ99VoghSqOwbmcS8wPXVx6jwFxRN6ZDx3wkAaiPu6tz9IhgJQEbuZNXx6rcr1NZDJZB
         bQ+VZohTQmJVYO52yRk19xmyNgeHZQUclZWhnazxouMTUfYSHfls/5n5gyEpPOM0W8wp
         +GIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787507950; x=1788112750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vgFoHaAGCDAcXCaglR6rN0UVDpopjrCPNpzvvDuKgdo=;
        b=c/9rbXG+qUFB5BwYWDpsHNgqm3k11VTkDxLcz7KHxH72itcGGaOcA5LMpu5RtQUXoc
         rFYV29kHRykxPmJ98bjHKCtLS87cO1zbWapK5fzAU8vpCazQb/jdyRI473NRO8PCfvNY
         nDN2Xb735AWnZeUOxN3Ddd1K60qyCvXZPZ8ddD/oT+eMvC4QQQ/GG5P8pCSly9qv1QbY
         zvPDi9/4IxnT9LUkG0SPYGZs37NIdp+RPolVT1GOyR+IrYP6CYUg/bNbZRu0ra14dbgn
         sbYLPqYb5py6arHPyBV1giGTKoL9/S9GIjIYO0w462wprEGfkTBNg8zLNRYSKxloD8ie
         +B1A==
X-Gm-Message-State: AFuF++nfRQPc3ruBk4b9wCJ2vDCIy0wqbUr4BjrBSjIGwdmCTxugMxpY
	iOd1xODAA+Hh0e1+Lumv77B8y1l4F56eelJwlfelhYU86xDuvzXPAPCt
X-Gm-Gg: AR+sD10zyohISI/j7BNN5g3kyoNFxF7MI2zRHYDKOZd1ehTfAeJ294SuwYnyaYPQ+Sk
	veCEyZNF9479tcqeaORryI4hANQIaP908dv7EusGHA6uZymN2o5g7S+8DXysPDh3DlXvKRwel1Q
	9nkj0Ba6Y/oUrgYjj1hgDp8U5ksqeU+bF7LjstYWlJdUas+qBDoMXYPEcpEULzTldzA5Whj0kPU
	UYCjaRbjtI5wb7Ak9yWSJhZhpR48FpCMbwEx89EzEeRahHaZavF3sZbTgScNXB2nc7NMpkUJYsH
	Q4p0Ov1Sx5UXFGoVxvehWzXaWLOBlmM5KzYN/W5l4d4Wj1nnwjvlMrLPZM9hbqgDBiVOTwz4XGD
	UmkiWRpKcefSjnDSZ+CFBsJ0FVmE9wYbHPGtdckVq/gDDhKYTOd3F7hWLMutGFt0bK0jg/8Q39S
	edHg3i8utUltTR07dRUZiZ5M0P+YAqqw+WZuK5C3uMDY86R27+BLqGDN1UcDH8U74kPxsZXy76I
	zxWcQ==
X-Received: by 2002:a05:6402:380f:b0:698:a9fe:2eb3 with SMTP id 4fb4d7f45d1cf-6a41145a43bmr26058292a12.9.1787507949986;
        Sun, 23 Aug 2026 10:59:09 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:148:9afb:38d7:b606:f380:289e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e199cb8sm4153933a12.16.2026.08.23.10.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 10:59:09 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sun, 23 Aug 2026 19:59:02 +0200
Subject: [PATCH v2 2/4] hwmon: chipcap2: fix IRQ teardown ordering
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-chipcap2_locks-v2-2-6a26c8e9e2fc@gmail.com>
References: <20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com>
In-Reply-To: <20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787507945; l=4560;
 i=javier.carrasco.cruz@gmail.com; s=20260111; h=from:subject:message-id;
 bh=NDfDF//cYaOMQlKuyN0eF+WouZ/qTNtQvy32KQUCa/I=;
 b=r6no+mQoz1iJ5MY7rtmCfcAP0SDldZgM+T8J8TvEGIN6rE6UoDmq0txzvhLIC6Z0wvHzDBB8C
 azoZDHF22wGBf4pmF5CWoItbrVVcBgAV/0qoQ7Rz0h/bdL4Ylv39LiM
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=Lge8w8xidNSf/INy7JAIbAW+Hezkp3nsBh2OjKL7lLU=

The threaded IRQs are currently requested before the hwmon device is
registered. Since devres releases resources in reverse order, the hwmon
device is unregistered before the IRQs are freed during driver teardown.

An IRQ may therefore still run after the hwmon device has been released
and access the stale data->hwmon pointer.

Separate IRQ discovery from IRQ registration so that the IRQ numbers and
alarm visibility flags are initialized before registering the hwmon
device, while the IRQ handlers are requested afterwards. This ensures
that the IRQs are released before the hwmon device during devres cleanup.

Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
Cc: stable@vger.kernel.org
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/hwmon/chipcap2.c | 55 ++++++++++++++++++++++++------------------------
 1 file changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index 9bef767b589e..15630d1dd90a 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -631,28 +631,37 @@ static int cc2_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	}
 }
 
-static int cc2_request_ready_irq(struct cc2_data *data, struct device *dev)
+static void cc2_get_irqs(struct cc2_data *data, struct device *dev)
 {
-	int ret = 0;
 
 	data->irq_ready = fwnode_irq_get_byname(dev_fwnode(dev), "ready");
-	if (data->irq_ready > 0) {
+	if (data->irq_ready > 0)
 		init_completion(&data->complete);
+
+	data->irq_low = fwnode_irq_get_byname(dev_fwnode(dev), "low");
+	if (data->irq_low > 0)
+		data->rh_alarm.low_alarm_visible = true;
+
+	data->irq_high = fwnode_irq_get_byname(dev_fwnode(dev), "high");
+	if (data->irq_high > 0)
+		data->rh_alarm.high_alarm_visible = true;
+}
+
+static int cc2_request_irqs(struct cc2_data *data, struct device *dev)
+{
+	int ret;
+
+	if (data->irq_ready > 0) {
 		ret = devm_request_threaded_irq(dev, data->irq_ready, NULL,
 						cc2_ready_interrupt,
 						IRQF_ONESHOT |
 						IRQF_TRIGGER_RISING,
 						dev_name(dev), data);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to request ready irq\n");
 	}
 
-	return ret;
-}
-
-static int cc2_request_alarm_irqs(struct cc2_data *data, struct device *dev)
-{
-	int ret = 0;
-
-	data->irq_low = fwnode_irq_get_byname(dev_fwnode(dev), "low");
 	if (data->irq_low > 0) {
 		ret = devm_request_threaded_irq(dev, data->irq_low, NULL,
 						cc2_low_interrupt,
@@ -660,12 +669,10 @@ static int cc2_request_alarm_irqs(struct cc2_data *data, struct device *dev)
 						IRQF_TRIGGER_RISING,
 						dev_name(dev), data);
 		if (ret)
-			return ret;
-
-		data->rh_alarm.low_alarm_visible = true;
+			return dev_err_probe(dev, ret,
+					     "Failed to request low alarm irq\n");
 	}
 
-	data->irq_high = fwnode_irq_get_byname(dev_fwnode(dev), "high");
 	if (data->irq_high > 0) {
 		ret = devm_request_threaded_irq(dev, data->irq_high, NULL,
 						cc2_high_interrupt,
@@ -673,12 +680,11 @@ static int cc2_request_alarm_irqs(struct cc2_data *data, struct device *dev)
 						IRQF_TRIGGER_RISING,
 						dev_name(dev), data);
 		if (ret)
-			return ret;
-
-		data->rh_alarm.high_alarm_visible = true;
+			return dev_err_probe(dev, ret,
+					     "Failed to request high alarm irq\n");
 	}
 
-	return ret;
+	return 0;
 }
 
 static const struct hwmon_channel_info *cc2_info[] = {
@@ -706,7 +712,6 @@ static int cc2_probe(struct i2c_client *client)
 {
 	struct cc2_data *data;
 	struct device *dev = &client->dev;
-	int ret;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -EOPNOTSUPP;
@@ -726,13 +731,7 @@ static int cc2_probe(struct i2c_client *client)
 
 	device_property_read_string(dev, "label", &data->label);
 
-	ret = cc2_request_ready_irq(data, dev);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to request ready irq\n");
-
-	ret = cc2_request_alarm_irqs(data, dev);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to request alarm irqs\n");
+	cc2_get_irqs(data, dev);
 
 	data->hwmon = devm_hwmon_device_register_with_info(dev, client->name,
 							   data, &cc2_chip_info,
@@ -741,7 +740,7 @@ static int cc2_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(data->hwmon),
 				     "Failed to register hwmon device\n");
 
-	return 0;
+	return cc2_request_irqs(data, dev);
 }
 
 static void cc2_remove(struct i2c_client *client)

-- 
2.43.0

