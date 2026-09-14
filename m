Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECCE443A81
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 11:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386897; cv=none; b=cu6p4jOsKYeepyKiy/rC847hAqKNWdVj43ZoDMrLkAlCGEy7WXFEjLvJmJohOhCwXwQLOfwUEsTl22bod8nRVaM5Rb7X+NKECwtO+Sftlowpg3G7VteKQBKBTzsKL8ZdWBe+8gk5W/bZuVph9ClMEVwwElWrPL6eUwMYjd0xvQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386897; c=relaxed/simple;
	bh=3uWLS0zXi8hbzN1pQ7fg4WKf5YdWAavl/C0SrqFsdwc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kptwLV3Qv1QSjwkjn+BVXazol17dbtdF2smtr6AQpj+vs4c5ewFdUNpLxstzf1ueCmhaAdWGBmfuzRRfydl72mVV8Il3Hehc2xeHC0Z9WaFJcOPowYDM4iej9ddXdcK9Gs+2bGSCCDOvhPx4W2NM4gXdl0EbQ/gG4xo4eM1pVYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtDFJXqA; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtDFJXqA"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469a3490bso1710580b3a.3
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 04:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789386895; x=1789991695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xz1oPaQal4obx4wv+mUPfBXv881JUQVzx0KD6p2In74=;
        b=RtDFJXqAAFrXir1v0Kh8V4WaZraUQrGnH6QvzOu1plXMa255tGCbcQBeaEqygkj91I
         Kbmsj8iEiHvZZVaqgT8s+mNbaD2EX+PPeKrIvMl8brEsx87dLOr+xLboLM4sR3htvn7i
         mzQq88e45+yyZ1NXFEnNmHqASQNvrAQfajCuxyThvL0FbIMWa6QmDJSSJOzi7q+vrk4/
         BdG/uudI1FV+tzAD+lIjjpD6MCX9qCkovW72wcm8Y/iZCIhFYd6dgOoTnIoGWHv8xZJv
         7B4li6XahmlKxmC5i8rtm8SciXIma8PdB0mOcXZutGiZTKu1TXVjYCccCTBOgojOVBgB
         0DAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789386895; x=1789991695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xz1oPaQal4obx4wv+mUPfBXv881JUQVzx0KD6p2In74=;
        b=ZI9QYe1aaj/ho06Mq+FdevtaDuohp5zsatj4lRetQ7TCRgRJA70UiIccgpIS1h871Y
         Ik0+V1ry1pv1/CA9PvRKw1JLl4HYXqGSgwzFrKt1SBC2xn8VXNqzg9i8jEcfoiEptqTC
         hnFBH7b2PiUTQoSlIYWdULJ4XwX+F6jHNgPO4/Qy+K9i29KZmXPg7D4XLJvxY4C48bef
         w42c0zj2uPTesHF4PiQkoKaz3OWWeezF8VlTygHD/jZsh66/5SnPqFFjpKmjV6NKZCiw
         N5Mh6zn+mbZ+YaAe2rhFILlGE7P1hWPAsOSN5T8KNRPjJPjAKgPn4VWmPXHNybMW039i
         PKyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxR0aY9z7bbm9aPxKQVHrs7rc37TpIhZHGggUXTJPwmzOU9QjmvAKVYFSYb2RQI5q5Z3YQghYwWvlguw==@vger.kernel.org
X-Gm-Message-State: AFuF++m+MFPjYVBk2JpDkQL3yu6vXTH88rU+oDuo7UWV89KN2Sytuyjq
	5Vyj6UfH6VrypDOsuIiK0NfdqLJNkhjcfl2pjO4XPWbtJCBoB5VRFWwg
X-Gm-Gg: AYBFou08Fsx+fgYUuO3G7VcQcsL6eScBMHamSiIude5Qv/lwRUFqpyMVcWy32wO1vlr
	57STZ7/fnoOh/uz8hqbgURaqk0JclWFHsjiHPkpviLAqEa1E4CKideg2WSWPibR/1WS8mC9lDHD
	pgdmADMVX2iRdwKjGerT3Ix0XMnbhhYoCqivIfqWSjLnarv1y+qdAq6nhX2msdMGGrNKzAL3bZ/
	e7XCfmaWZ8RY+GALF9v8aPQi5NgRmLk36h5YdKQssL4jLvr+JsNQNXgQajRclpgfBWH8xSlxujj
	sE2io9mHH30tOM1ZPy0e78t+4e2H38QqmT/bUvHp/bjGVtq/lxtE8/kPekVC/U6XZ9PHSem0TxF
	n5LKGtZhS/Wa+dIfG/+1Euj9lEsUkUjBwE0Rztr6uOECpUZOBH6vWpXBmkPpYGrKdGfE/osKyze
	QukS/6Ql8zwBhMkIj1lb/8hat5sbxA16sGcV/2WziFwG/Dp3k11LyvWWmSlhNif21I7UFbpBNgh
	+e61R21DbN/wkm0rA==
X-Received: by 2002:a05:6a00:2444:b0:857:7337:5dba with SMTP id d2e1a72fcca58-86f862c48a6mr4632403b3a.24.1789386894733;
        Mon, 14 Sep 2026 04:54:54 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29bb9ff4sm4565342b3a.44.2026.09.14.04.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:54:54 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Simon Guinot <sguinot@lacie.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (gpio-fan) fix use-after-free of alarm_work on unbind
Date: Mon, 14 Sep 2026 18:54:48 +0700
Message-Id: <20260914115448.2039438-1-congnt264@gmail.com>
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

Fixes: d6fe1360f42e ("hwmon: add generic GPIO fan driver")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260830152150.27F5F1F000E9@smtp.kernel.org
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/hwmon/gpio-fan.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 084828e1e281..b1b57bb63a33 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -81,9 +81,16 @@ static ssize_t fan1_alarm_show(struct device *dev,
 
 static DEVICE_ATTR_RO(fan1_alarm);
 
+static void gpio_fan_cancel_alarm_work(void *data)
+{
+	struct gpio_fan_data *fan_data = data;
+
+	cancel_work_sync(&fan_data->alarm_work);
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

