Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792806050;
	b=wPKMM4TOxkIu64WzZOt5tQF5vFF/XIpwJycAkoY+JdWPm5FY5fNINSUzGmXEQpfxsXqq
	 IYxwlirneiUQjJxS8N97Nd7V0Kp1d4zAKYghBED0q0X1Ven8ThnX9hdhvgnsGnTC7LJgA
	 5pn5NC9tg7JZldf0pSFNBLs9LIWcPwIxCzGF/kepya/A8z3Dbr2QfISyEkj8DKHz5XB6+
	 GQNMImb86PnNRp78Cyz6H+mPi0h2y8YNsv8FVpAi5bfPAFtBWei7VwJssmQ0N639CLrnf
	 OYSAKEiXIBt8PTM0VKi8u34OloYe6DLsHhEUIqMLH4Zp61TPJnpg9CgKpPB/922bfQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792806050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Z79+tdgxsQW9kZqIwRO1EwdUxztE35H4zfyldg/VVYo=;
	b=qdu2tZh0XKHuMRA+IhDqR5eZbTflw1rOUcQT64OMtpV1cRQiQiFTqx2EQqATcw4z2WO8
	 fIRa1mOSW6vgxN4M++hhcY1VI0IKP5dHDFBQlRv8SV90BViHzzfoE19yYSN4EbRa8scY9
	 pGDsyMIcg663t5dfijRtzdvnazykDwhbDlxRenVxC9eTV3eD6j65j4UkOcAivVO60qBCw
	 eLWfHCDSnzRBXNyai+oovbWQ6CeoVsg38zn/Q8ifzg2WbWrjS87BZ9GZfy6h37c87P6O4
	 YtIFPjFj7JfUDE7AUwPA0dvkBhQNZtGqPyRsIlMeFdsCQpOldlFX9zm2AA9qKhswvbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CaQK0YD2;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7428606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 01:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7428606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CaQK0YD2
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-535f9de49fcso8334181cf.0
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Oct 2026 18:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792806049; x=1793410849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z79+tdgxsQW9kZqIwRO1EwdUxztE35H4zfyldg/VVYo=;
        b=CaQK0YD2bwOqn25gU5jW2f3KNG1ORMq9m3qYgnHelR85J9Sl7/IBIZbyaPNiUwsLz/
         qtcpQecvi+H9mIt6UiUBkhPaOK02KVQK4Xk16l/1HwaypmR9XFUXsGl9NHA8pNJJkTwg
         jY9x3UZh7MbPIPiQJz1vyL2hQGzBJtTvF1+zJkwru8K+eaJ6UVbtvHjFfvlmXvvydjJ9
         /E4HOxNYFNj6PvXwh94mfQL2f/uu9EPBhLMhnE3UqRHouZIEG7eiKwC+3yelwAJbt1cK
         FXLHUXEX4L1wJJk/gXW8U4+9NWyyOPjT39dkuFKyid84WXXZtp03v0N39B+B6zJmIUN3
         nWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792806049; x=1793410849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z79+tdgxsQW9kZqIwRO1EwdUxztE35H4zfyldg/VVYo=;
        b=WUU0eG8n4KymA5tcZ38pwLXQjG4SD0i0fiTtR3qwIa3YTD9VbTyiCFcdr6zhiKAgUS
         Spl2D8hPB9hvzbPGb0cnoNu0E4qUG8I6NVoQ0i0FZnQb9YN+Oe87MVEFCXVmjPhxENLh
         qUTr40BHu4rZH/Pb7hml4ZT7VxhSXBfepqR7oGxCZz43O69dZ3nQ2kZWUe5qBJ2I1LqP
         nVlYmRv+a9mBLJ8rwpdJkg/Z5etHfGDVK/rj2Bul5U638tCi7tsybXUwLN+UWJ6Nq/lC
         zw77x3hPsx9wp3PihDASDp9TCplTAuh1FUqQ3UFRMnq0InIuufp6oxP4Z8Uy/uyEh4Wp
         CRdA==
X-Gm-Message-State: AFq9FYI1HyjuPhDLzn04hTGaSq4kUYKN+7841LR+oDLRd1WQYxqAcEOc
	MQAfF3I5Drmna//0rJCmNiHHcp3mqiSyAazx9FfjJ0aJxC8mBsnAcKfhb6Me7BzOQA==
X-Gm-Gg: AYBFou1SgAdg2IgnV5Wa659mKJxyNQI58As76qBGDMZjYwzKghVtIRWsS8m5jz6yQ7j
	aBbA7okACaUWvYamJzPU3XbVozxiDhzMSK7+wg9vpSGYX/cgDvYFn+ep7Y10oiQlXfiSiAyhUF8
	nWfCo3c+iyxAslRjW2uF6KAzWyL+LOojR3Mfv4q/pF8WzlWikq2aLjxtmM+XLhcqrVp8CUgZyNd
	iyL/VXDvdXEwZLuGYyHxhqmRDjeKyWBj2vE1NuaNUDTC23f3ZUZjKczTMKBticLzqRa3WMgwpMO
	6IZy19jHIUPWDu2iLrgXoSeSc8IAWwNHVViemPcecGQnYQjgHiOiYKt8JP5c3oubCv2Q2YRrYD+
	O0jBMgs1jIGbeGQhIq/2cfRdQdYzvUbsWOeFCRU7LnHbbhymhVczi4opGRongHdYGU+QxlHPm9U
	Ae81yOcAU+b9p9spkQhxKPuxRI7bXTuqfPbnt6M1VuQAblg+uzKLf6sVBEhx178XEBhvLFJEKQa
	NMLTjCWbfFWWCPX4nkHD2Y5KMD9fmDQGEE6xQ2RH3MfevJlOiM52Z2eHWcRcEq/qmeVdPIA5H0f
	fhkMofoChmhEPfHClqwIqmRoHoZuQrVExGlltgXMV7X235QfrN70uviGuiijqd4lA4LDtbtlD3X
	MpBNnST//sg==
X-Received: by 2002:a05:622a:1aa2:b0:536:8bb4:2a9c with SMTP id d75a77b69052e-5383b4cac1dmr8960551cf.21.1792806048703;
        Fri, 23 Oct 2026 18:40:48 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c1af0csm9261606d6.19.2026.10.23.18.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 18:40:47 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v3] hwmon: (sht15) Stop deferred work before releasing its resources
Date: Fri, 23 Oct 2026 21:40:44 -0400
Message-ID: <20261024014044.27853-1-mhun512@gmail.com>
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

The IRQ handler and regulator notifier can leave work pending after a
measurement or notification completes. Neither work item is drained before
its resources are released on removal or probe failure.

Disable read_work before freeing the IRQ, since the worker can re-enable
it. Use request_irq()/free_irq() for explicit teardown. Unregister the
regulator notifier before cancelling update_supply_work and disabling the
regulator. Apply the same ordering to probe failures.

Fixes: 251eb40f5ccd ("hwmon: sht15 humidity sensor driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC 15.2.0, W=1 (x86_64). No runtime testing.

Changes in v3:
- Drop IRQF_NO_AUTOEN and IRQ caching; preserve the original initialization.
- Keep request_irq()/free_irq() and work synchronization.

Changes in v2:
- Switch to request_irq()/free_irq().
- Add IRQF_NO_AUTOEN and IRQ caching.

 drivers/hwmon/sht15.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
index 7bb2105d1ae223e7131ba4cc0523e4e074e01302..48d93c61345c1d4a00b0edd2fc452161ac90db9e 100644
--- a/drivers/hwmon/sht15.c
+++ b/drivers/hwmon/sht15.c
@@ -31,6 +31,7 @@
 #include <linux/bitrev.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of.h>
+#include <linux/workqueue.h>
 
 /* Commands */
 #define SHT15_MEASURE_TEMP		0x03
@@ -976,25 +977,22 @@ static int sht15_probe(struct platform_device *pdev)
 		goto err_release_reg;
 	}
 
-	ret = devm_request_irq(&pdev->dev, gpiod_to_irq(data->data),
-			       sht15_interrupt_fired,
-			       IRQF_TRIGGER_FALLING,
-			       "sht15 data",
-			       data);
+	ret = request_irq(gpiod_to_irq(data->data), sht15_interrupt_fired,
+			  IRQF_TRIGGER_FALLING, "sht15 data", data);
 	if (ret)
 		goto err_release_reg;
 	disable_irq_nosync(gpiod_to_irq(data->data));
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
@@ -1007,9 +1005,13 @@ static int sht15_probe(struct platform_device *pdev)
 
 err_release_sysfs_group:
 	sysfs_remove_group(&pdev->dev.kobj, &sht15_attr_group);
+err_free_irq:
+	disable_work_sync(&data->read_work);
+	free_irq(gpiod_to_irq(data->data), data);
 err_release_reg:
 	if (!IS_ERR(data->reg)) {
 		regulator_unregister_notifier(data->reg, &data->nb);
+		cancel_work_sync(&data->update_supply_work);
 		regulator_disable(data->reg);
 	}
 	return ret;
@@ -1023,12 +1025,16 @@ static void sht15_remove(struct platform_device *pdev)
 	hwmon_device_unregister(data->hwmon_dev);
 	sysfs_remove_group(&pdev->dev.kobj, &sht15_attr_group);
 
+	disable_work_sync(&data->read_work);
+	free_irq(gpiod_to_irq(data->data), data);
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
2.53.0
