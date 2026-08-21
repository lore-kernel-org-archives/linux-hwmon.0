Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A42346EC70
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 09:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787304192; cv=none; b=sqYZZYs3OxHNRMK4I9MsdVa7d/vrKThmPbbBwM8314zM9K6QW8Hs7TLmDo1mUN0ip8+qqNnUs1eWRR5nC65YbZ1breF1kh5C9CW9YZi4wMpLyCwdGSh01E2/4OKiUVlfb7+iQ0ezfhOzGPOvpUSsci1pLqbzCT13fHMUMfTz6NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787304192; c=relaxed/simple;
	bh=hQO8OzIVbst3gIhi1BPiKl2+n+sX9ZozFDZUJ3vY23Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iy+ayWGwZyH6X9BYs0TsOOi12Ow4zvJawgeaDo1Ud0em59SkOcOtb6rb6p2wsX5RFoFx/V8/iI8U83IRed1RZd+7JcrySnU8JjmPGA9uUHbZ8MAXdrgZxMk1Bd2KT385x8fJirT7lrbZBwqDVth1eearrDnYekS9A2Ei0QW3How=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H05LaDIo; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H05LaDIo"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c169ae1cb26so386380166b.1
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 02:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787304182; x=1787908982; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j7hSy5Nj3BqLZ1Scok/M+zpbpluheWEAaRTYJge3A/4=;
        b=H05LaDIoFQX5KjsQqfRCMPBz/A/jtPBdT5ByeMJqWW1HjN0oP55pEdbuCO5tnZ5/KE
         deA66oKZJnw1rZtKSavlH2RWLONshsffE7qhNX3tF/NaiHqBR+V/ubSeuN96Pa5/BF2a
         bkwdMGzm2ymOo//DFN9ecu9fZAbA+s500xTAVyi8vkd9EFjYRRyuBuDXV6M03sR+vbjC
         ElSNQByROTcSJDPScD5WR9aVjGLnjI5v5w+3MbLli6AVniXLrHLsTQ+kWsu9nRL1Oifq
         ZapnF5xX9LETH18/NaYtOckioe9mpg9HTyRhb5kFtlLEgSyVzEf+zNUbb2kxa4Z6Bgxe
         cBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787304182; x=1787908982;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j7hSy5Nj3BqLZ1Scok/M+zpbpluheWEAaRTYJge3A/4=;
        b=kVTwU5HxZcburp3blasR6l4A16gEj7qEYJ9PAc+SjrMNxbimkRw+oqQ6jZSZNn2Ffe
         epq0r7fWiMztA/2vBwRos60AYQkQ7KHmijVZ/GUh7jdTnHkPsj019KlAxl/3v0cim544
         9P0fGxB3ubPBo/1kFjHMdy4JpO21Znsqbm2Jkum7eHvfy7+7kPfFr5qrc4Q0i2OOkh3W
         hYHKbcht1jqgjSVRMwH74l4nXfNLtfVq0F1nJkirWDAgSwOQU4qqUAamm6kSeBzPNS7p
         +YVRhFkUGVLEA8YjeXf73VUaxE9ZCjX3V8vwQUt9mYDUFfVyq2o0ZeNU+LbjN8ZFyCAX
         woMg==
X-Gm-Message-State: AFuF++kDI2Ki7BjeSRmW1gAXH87BmM9dXyRmMhur3dv3xwZxfRJzeL7S
	zAySE3Yn1mFa0/oc1V4FB+WzKE7VdgqvFPlB7GexVPRIdKOhmBnNBcF+MlEE3A==
X-Gm-Gg: AR+sD11V1p5kiZEe+/hVMFdfBm2Dv0mqxYMtRqc9K+JTiZUHm81XEDpFfJ04jbIrfhC
	LU1ycjGF9Gny/xoFlXsAz5EyGADmcz0X5YUZulTF1xFcOTR5KLQ5u9+lbuijPbXVqQ9MmIceYn+
	rhjKKEfD0XlsImAblYcXyQboXrzztTCu8LZWKU/ITs/PkTong+wGL1PuZy5n+GPTuCKhfknsnf0
	hbeVPvGYtto5OXVH3RbUraDutUzF40nSKTd9rqekZyBkaumsIyo6nXovXF8IvJRli74GtRGnuVF
	tvnqeqgESJofOGU8JnlQHrv1WGUFrVjAXjIz6hzO6LhV9WR9/rP2OI9xuaOGZozl3yziDSm3231
	Nw+VnxxBXjr/g4RyKzXKLA+1hjCeZgooeEjEu0SF3YqQ8cYLvAeftFxd4vw/cAKnR2afPxKWHH0
	j4bXEU4bCV4dhjCU2D4JCF09hwATPgy80t1MuffD0UY2SvVuE5t+t6tiWEpYMG+A6ADpZLg4XTl
	7vNRtlF8/k=
X-Received: by 2002:a17:907:8d8e:b0:c20:61e0:e3ab with SMTP id a640c23a62f3a-c244d45a6b4mr1004196066b.3.1787304181932;
        Fri, 21 Aug 2026 02:23:01 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:104:2029:f763:df3e:9cca:dd59])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b648f9sm364054766b.28.2026.08.21.02.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:23:01 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 21 Aug 2026 11:22:58 +0200
Subject: [PATCH] hwmon: chipcap2: serialize access to low/high_alarm
 indicators
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-chipcap2_locks-v1-1-1d8ccabfc1b2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPEYiGoC/x3MQQqAMAwAwa9IzhbSKCJ+RURKjBqUtrQggvh3i
 8c57D6QJalkGKoHklyaNfgCW1fAu/ObGF2KgZA67AkN7xrZRZrPwEc2jBZt46h1yFCimGTV+x+
 O0/t+AsOkw2AAAAA=
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787304180; l=3705;
 i=javier.carrasco.cruz@gmail.com; s=20260111; h=from:subject:message-id;
 bh=hQO8OzIVbst3gIhi1BPiKl2+n+sX9ZozFDZUJ3vY23Q=;
 b=gn6eIx5NH+nYnnoXMg3uiFNVQ7ZcHyk3qw7tztgrwlY7P2AfXUb254l2Bzvi9xA0g9HLZp2r1
 VexGu29P6rNAn9ZCNX0580w6Qt7JXhaCUdw7V0VrLnAEq4lq8H40V9t
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=Lge8w8xidNSf/INy7JAIbAW+Hezkp3nsBh2OjKL7lLU=

Access to low_alarm and high_alarm from the threaded interrupt handlers
and sysfs is not protected by any locking mechanism at the moment, which
can lead to missed events.

Add a per-interrupt mutex as the two alarm indicators are completely
independent.

Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
Cc: stable@vger.kernel.org
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
This issue was found by Sashiko[1] when an unrelated patch affected
chipcap2.c. The issue is real as the access to the variables is not
protected by any locking mechanism although 2 different sources
(threaded interrupts and sysfs) could modify them.

The fix has been validated on real hardware with an Amphenol
ChipCap 2 CC2D23S sensor.

Link: [1] https://lore.kernel.org/linux-hwmon/20260625162114.417EA1F000E9@smtp.kernel.org/
---
 drivers/hwmon/chipcap2.c | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index 086571d556b7..1bb4ec96514e 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -73,7 +73,11 @@
 
 struct cc2_rh_alarm_info {
 	bool low_alarm;
+	/* Serialize accesses to low_alarm from threaded IRQ and sysfs */
+	struct mutex low_alarm_lock;
 	bool high_alarm;
+	/* Serialize accesses to high_alarm from threaded IRQ and sysfs */
+	struct mutex high_alarm_lock;
 	bool low_alarm_visible;
 	bool high_alarm_visible;
 };
@@ -500,6 +504,7 @@ static irqreturn_t cc2_low_interrupt(int irq, void *data)
 	if (cc2->process_irqs) {
 		hwmon_notify_event(cc2->hwmon, hwmon_humidity,
 				   hwmon_humidity_min_alarm, CC2_CHAN_HUMIDITY);
+		guard(mutex)(&cc2->rh_alarm.low_alarm_lock);
 		cc2->rh_alarm.low_alarm = true;
 	}
 
@@ -513,6 +518,7 @@ static irqreturn_t cc2_high_interrupt(int irq, void *data)
 	if (cc2->process_irqs) {
 		hwmon_notify_event(cc2->hwmon, hwmon_humidity,
 				   hwmon_humidity_max_alarm, CC2_CHAN_HUMIDITY);
+		guard(mutex)(&cc2->rh_alarm.high_alarm_lock);
 		cc2->rh_alarm.high_alarm = true;
 	}
 
@@ -529,11 +535,13 @@ static int cc2_humidity_min_alarm_status(struct cc2_data *data, long *val)
 	if (ret < 0)
 		return ret;
 
-	if (data->rh_alarm.low_alarm) {
-		*val = (measurement < min_hyst) ? 1 : 0;
-		data->rh_alarm.low_alarm = *val;
-	} else {
-		*val = 0;
+	scoped_guard(mutex, &data->rh_alarm.low_alarm_lock) {
+		if (data->rh_alarm.low_alarm) {
+			*val = (measurement < min_hyst) ? 1 : 0;
+			data->rh_alarm.low_alarm = *val;
+		} else {
+			*val = 0;
+		}
 	}
 
 	return 0;
@@ -549,11 +557,13 @@ static int cc2_humidity_max_alarm_status(struct cc2_data *data, long *val)
 	if (ret < 0)
 		return ret;
 
-	if (data->rh_alarm.high_alarm) {
-		*val = (measurement > max_hyst) ? 1 : 0;
-		data->rh_alarm.high_alarm = *val;
-	} else {
-		*val = 0;
+	scoped_guard(mutex, &data->rh_alarm.high_alarm_lock) {
+		if (data->rh_alarm.high_alarm) {
+			*val = (measurement > max_hyst) ? 1 : 0;
+			data->rh_alarm.high_alarm = *val;
+		} else {
+			*val = 0;
+		}
 	}
 
 	return 0;
@@ -720,6 +730,14 @@ static int cc2_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
+	ret = devm_mutex_init(dev, &data->rh_alarm.low_alarm_lock);
+	if (ret)
+		return ret;
+
+	ret = devm_mutex_init(dev, &data->rh_alarm.high_alarm_lock);
+	if (ret)
+		return ret;
+
 	i2c_set_clientdata(client, data);
 
 	data->client = client;

---
base-commit: 818bebeb63dd6bf5f4e07e145f6cdbace520a34c
change-id: 20260820-chipcap2_locks-c01013a24a0c

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

