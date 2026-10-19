Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792453447;
	b=JHH0aJFcw/zP+wKBpWTKzCWfKUOlAl085u/CECddf0Zmo+tVgCaxcE8lzzAlL5nUO670
	 kEF4Gbaag2L55j1kDhDylzrvjx8+R9rOr1RCxjdzdBX+4gbaObgDsC93o2uk0sM8MwQ/S
	 V6RXek20ah7wxJzWtD6Oxzr9+2odekGKNvhS9QrHgxE4GQ8TGmkjarfGG5Ggkmf9TTF25
	 ifZiZhbU48aNp2Uw62hoZw45h+O5NXUlazke5zBelFUC2vfvQaL0XQ2ESTlwhTuKsCO7b
	 lqexY5qMI2S0BbnBieeJfxgP/twvc7XNL7qZr0ib24SKfx9fVIF5Np1gGDJ49t+hMFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792453447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=E8//VKOKqUwtACIysG7fG7TZagG/n7IG4lGWpRQho/I=;
	b=kvhTn5QJnceHcNE6E6P5oHDL/eLfC5hyDjeymYqABkAvYSbYdTSPRtGDSf48l2oC84uj
	 BFbu29EiNt0qaZPomqONywPwNRKWTxnCfN1qCofrNy794uBaYJtMBhmhCKoOGhfWh1UlW
	 Ugyijr35m3aPNxJEFV6lM8v/JbksgElF74a5TBHZyv6yVKO3QaobNw+kRxbbDRmpSiLOR
	 NCF6mSggwMDN2ige3Mk3svA+7jmPWVOtJ9QU8srDJoXWhNljptVB2H8EVmYvTv+bC6avm
	 E7Wn62ZUEEtO7kWwnN/WbedIij0O9oVi6yBVGwolYpS/Tmj2o+wP61uDEgV13Eg13KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KLMbVLGp;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D9D606A319
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 23:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6D9D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KLMbVLGp
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91b89c6caffso21170906d6.2
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 16:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792453446; x=1793058246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E8//VKOKqUwtACIysG7fG7TZagG/n7IG4lGWpRQho/I=;
        b=KLMbVLGp79DW6EzDG8a0J0/b20rzyKRJGq930fvaCOdt4psjgGzwmjFCpd6rtxwZQD
         dTEy3lOSCZcZOqS/O5vMctISJC/gu7r/Bea7YRv8/rFQjh2Jy9Bjx2oUpdLoGhSvlCj7
         H/3iUc31+V5333uipexxtfLTrI0FAMIabAZhg6X20T9VJzYB4MHSv57xkmMU98kkEp8J
         YYYf5ZDhzaBzw5Cygtzn3T1YoP+4JqLV91z0iMq92Z4m2X7yI6UjE7r1CxBc5S+7KmjI
         s7YCTDcHWEUu5UMDkvCQCtI6cAZUXU9touUzUB8zolJvwSoKAw5p85FJSvLSSWNTXm1P
         h+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792453446; x=1793058246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8//VKOKqUwtACIysG7fG7TZagG/n7IG4lGWpRQho/I=;
        b=HF6uXFp5w9ywv8Vv8O/Vwn9HlBH+TUh+CBTlwgjHIxfX5ASb1lVK4Py6j/TjPUzKMw
         KA/2CVBTWE77l6/YCYmAj9Sei/6SqXBx9kUQmpz6FzACqpFeGDQoMKlrfFJprsAocUGc
         2XB2MlwnSWRbKWU3952c1SwIm/7TOHrhz6Ra48lRms3DiuG07czFE3sU5g9Ip6lowQLt
         g0nvBFDcscVMj9g0LB2fQychIWugYV34EWT2Mi1Zj3A2VGR7hNnEjvd/2A1L0eOyk3nm
         kd+jP44cLY9cQnv2Q4lOxIdqK4YjgJ2dE4fxWD+E2/CQ3NewizrV8JiIdW9sPEuDRm8R
         3FMQ==
X-Gm-Message-State: AFq9FYK+ncT6SAUZM+Hts9j6KM2yJxQed5Wj/VNg3X6AcTF+6MJjj68m
	OlfVIH6DR/dK+qLTIfcoUw4rbTqCCZAvTJ4mT973fLpHYROU1TpoXKw=
X-Gm-Gg: AYBFou23trdXgm1CkD4ixUDXsTC81H0E55L6S1F2uQ8R3CQ0jCty8KPNwL70NacOrJL
	SLAUsFCUXzYvSsBVgNJ8nfNAO8rIMWjlUUaf8kCNE5KDtIuLR+xkAkWYjdAFict8t0HZD7yEtzD
	U7lIhU6Qimcjq7NS8J0EVt7tSlwwL6nKZeE8WrOOHoDXXpX6HfeTAIpoOun1R+4k5j3QjI5y7Z1
	R4Yyx3ZxiffIFT52k8w5QA3U3o7m/zWaUIflV/36RNuA9Jn2SHjOEB+4iUngR6LeawpFFaCxD5u
	/s/x9uz+wXu+vZtC6f4hoS0qqjvnFvPmkF2J78t3W+OoRxKV17SB21M7bIUHeHv/vq/khDG3BVC
	i2c+OeUNUGaZc32fjnjix6Rjz+G2T2Y2LMZ+iiBPlu+egSsJuY+XS2iUgOnTyxkNEeR8Q5FvZaS
	3e16KqbSth0gJpAxnUoDAoLK23Q9dSdrZy0d2xr+KSf9JvBO6ZuFYzWWtfwtMuEeKOQLrbLE0/g
	5qIQBWQtg//tHHL0EL1Nl8i/3YgwDfNFVVHTYw/YfxQ6F1+Oi1FdamMkCdXL1ex3r98fw3LrxYD
	6Wah0jsh6PmvooGPJyOdvvp0hsxe
X-Received: by 2002:a05:6214:27e6:b0:91b:8b44:d4be with SMTP id 6a1803df08f44-91bdf130304mr162456196d6.28.1792453445586;
        Mon, 19 Oct 2026 16:44:05 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c0408c4c2sm9620256d6.20.2026.10.19.16.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:44:04 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] hwmon: (sht15) Stop deferred work before releasing its resources
Date: Mon, 19 Oct 2026 19:44:02 -0400
Message-ID: <20261019234402.805759-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IRQ handler can queue read_work, which accesses GPIOs and may re-enable
that same IRQ.  A measurement can return while read_work is still pending
or running.  The regulator notifier can also queue update_supply_work,
which accesses the regulator.  Neither work item was drained on removal
or on all probe failure paths before the managed resources were released.

Use request_irq() and free_irq() since the IRQ must be released at an
explicit point in the teardown sequence.  Disable and drain read_work
before freeing the IRQ.  Unregister the regulator notifier before draining
update_supply_work and disabling the regulator.

Use IRQF_NO_AUTOEN to ensure that the IRQ stays disabled until the first
measurement, rather than enabling it briefly between request_irq() and
disable_irq_nosync().  Cache the IRQ number and check errors from
gpiod_to_irq().

Fixes: 251eb40f5ccd ("hwmon: sht15 humidity sensor driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested (W=1). No runtime testing.

Changes in v2:
- Replace managed IRQ request/free with request_irq()/free_irq().
- Use IRQF_NO_AUTOEN and cache the data GPIO IRQ.
- Preserve asynchronous work drain ordering on probe failure and remove.

 drivers/hwmon/sht15.c | 47 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
index 7bb2105d1ae223e7131ba4cc0523e4e074e01302..c95acec7ae2f8f57a10bd72f65a2905e64c3c58c 100644
--- a/drivers/hwmon/sht15.c
+++ b/drivers/hwmon/sht15.c
@@ -31,6 +31,7 @@
 #include <linux/bitrev.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of.h>
+#include <linux/workqueue.h>
 
 /* Commands */
 #define SHT15_MEASURE_TEMP		0x03
@@ -120,6 +121,7 @@ static const u8 sht15_crc8_table[] = {
  * struct sht15_data - device instance specific data
  * @sck:		clock GPIO line
  * @data:		data GPIO line
+ * @irq:		interrupt number for the data GPIO line.
  * @read_work:		bh of interrupt handler.
  * @wait_queue:		wait queue for getting values from device.
  * @val_temp:		last temperature value read from device.
@@ -149,6 +151,7 @@ static const u8 sht15_crc8_table[] = {
 struct sht15_data {
 	struct gpio_desc		*sck;
 	struct gpio_desc		*data;
+	int				irq;
 	struct work_struct		read_work;
 	wait_queue_head_t		wait_queue;
 	uint16_t			val_temp;
@@ -532,9 +535,9 @@ static int sht15_measurement(struct sht15_data *data,
 		return ret;
 	atomic_set(&data->interrupt_handled, 0);
 
-	enable_irq(gpiod_to_irq(data->data));
+	enable_irq(data->irq);
 	if (gpiod_get_value(data->data) == 0) {
-		disable_irq_nosync(gpiod_to_irq(data->data));
+		disable_irq_nosync(data->irq);
 		/* Only relevant if the interrupt hasn't occurred. */
 		if (!atomic_read(&data->interrupt_handled))
 			schedule_work(&data->read_work);
@@ -546,7 +549,7 @@ static int sht15_measurement(struct sht15_data *data,
 		data->state = SHT15_READING_NOTHING;
 		return -EIO;
 	} else if (ret == 0) { /* timeout occurred */
-		disable_irq_nosync(gpiod_to_irq(data->data));
+		disable_irq_nosync(data->irq);
 		ret = sht15_connection_reset(data);
 		if (ret)
 			return ret;
@@ -825,7 +828,7 @@ static void sht15_bh_read_data(struct work_struct *work_s)
 		 * have gone low in meantime so verify it hasn't!
 		 */
 		atomic_set(&data->interrupt_handled, 0);
-		enable_irq(gpiod_to_irq(data->data));
+		enable_irq(data->irq);
 		/* If still not occurred or another handler was scheduled */
 		if (gpiod_get_value(data->data)
 		    || atomic_read(&data->interrupt_handled))
@@ -976,25 +979,31 @@ static int sht15_probe(struct platform_device *pdev)
 		goto err_release_reg;
 	}
 
-	ret = devm_request_irq(&pdev->dev, gpiod_to_irq(data->data),
-			       sht15_interrupt_fired,
-			       IRQF_TRIGGER_FALLING,
-			       "sht15 data",
-			       data);
-	if (ret)
+	data->irq = gpiod_to_irq(data->data);
+	if (data->irq < 0) {
+		ret = data->irq;
+		goto err_release_reg;
+	}
+
+	ret = request_irq(data->irq, sht15_interrupt_fired,
+			  IRQF_TRIGGER_FALLING | IRQF_NO_AUTOEN,
+			  "sht15 data", data);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to get irq for data line\n");
 		goto err_release_reg;
-	disable_irq_nosync(gpiod_to_irq(data->data));
+	}
+	/* IRQ remains disabled until a measurement starts. */
 	ret = sht15_connection_reset(data);
 	if (ret)
-		goto err_release_reg;
+		goto err_free_irq;
 	ret = sht15_soft_reset(data);
 	if (ret)
-		goto err_release_reg;
+		goto err_free_irq;
 
 	ret = sysfs_create_group(&pdev->dev.kobj, &sht15_attr_group);
 	if (ret) {
 		dev_err(&pdev->dev, "sysfs create failed\n");
-		goto err_release_reg;
+		goto err_free_irq;
 	}
 
 	data->hwmon_dev = hwmon_device_register(data->dev);
@@ -1007,9 +1016,14 @@ static int sht15_probe(struct platform_device *pdev)
 
 err_release_sysfs_group:
 	sysfs_remove_group(&pdev->dev.kobj, &sht15_attr_group);
+err_free_irq:
+	/* The read worker can re-enable the IRQ, so drain it first. */
+	disable_work_sync(&data->read_work);
+	free_irq(data->irq, data);
 err_release_reg:
 	if (!IS_ERR(data->reg)) {
 		regulator_unregister_notifier(data->reg, &data->nb);
+		cancel_work_sync(&data->update_supply_work);
 		regulator_disable(data->reg);
 	}
 	return ret;
@@ -1023,12 +1037,17 @@ static void sht15_remove(struct platform_device *pdev)
 	hwmon_device_unregister(data->hwmon_dev);
 	sysfs_remove_group(&pdev->dev.kobj, &sht15_attr_group);
 
+	/* The worker can re-enable the IRQ, so stop it before free_irq(). */
+	disable_work_sync(&data->read_work);
+	free_irq(data->irq, data);
+
 	ret = sht15_soft_reset(data);
 	if (ret)
 		dev_err(&pdev->dev, "Failed to reset device (%pe)\n", ERR_PTR(ret));
 
 	if (!IS_ERR(data->reg)) {
 		regulator_unregister_notifier(data->reg, &data->nb);
+		cancel_work_sync(&data->update_supply_work);
 		regulator_disable(data->reg);
 	}
 }
-- 
2.47.3
