Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B591B3E3168
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 16:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782403518; cv=none; b=K0oL85UCsfkSU7Nux+2nR3DL7fCC11ofpw9LFtW46McKPGLMsmnwJ68dtIux3+INd85+6BERjNyigY4fqCdHesIvETcVNnOOGQ+bWf95ulg+YcpoQRvI/CvpTigvAJBiLnMZEJI0O0e50Igaj9z2w4SlznCKJ5n8zJt48edHr7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782403518; c=relaxed/simple;
	bh=P3Fmu2M7yicfX8YegW+8uTR/Xoo2VqnCcOOBa6qBxYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kMVU9vyzI2+yhZuhOOaYoWriEo4OiVoh4F2DEYpDiz307xAarrQZuKU117oMyljRhaA8sVJ/+p19cWJJ5vq00PfOb845PrShwik/CsyFRUCRCTk7VGMFmRR9kd70Va2uKQ+rH2aLewyGT4Nlm4vD7IntwFFhDHO7o8lUhG+CBBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qDOZDhT2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qDOZDhT2"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so259295e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 09:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782403513; x=1783008313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWN54lw7/VCj9KUx153JrqSzq8vKsCI/ogPA08qnUmE=;
        b=qDOZDhT2z7s2cP2F/Ki17zjN8ywlqzv7zqql5VMvdG8Huf+9syzT1zLhMyqGk+3+fN
         UeBNpalNlkiR4O47kcjxdYmssT5kpuD+owGX4mRjhOsoiXqt7c3PfGpxgojJHTXcVvkH
         rd6/STA45x/gcN9bsUYze9tI7+eTlqC7CgPZshxIdh2Fcow0DfsPaqDQdgaaN3oUSh7f
         /VoomYd/VLbOom65KYn9YgHmWga4DQNohX/Bci4TLi0oV8l/qWyia6PHA+5NbKY/Lo6X
         5AScUahZpoV3bxoU88rGp+LI4Mrtj3OoYnF+a8bqPlZy/zF/7x9G7qg7NZwFkguYDpBJ
         5HkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782403513; x=1783008313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JWN54lw7/VCj9KUx153JrqSzq8vKsCI/ogPA08qnUmE=;
        b=n0+I755aiCBuYGWymqbxDIN343ZUldeOHcGPeRdyG1Zgiy2y20jLAB4GyuDUgHoKL0
         h9X3WTyZZ3vSm+A7TIhoqcMiUD5wPrLRKstStHZTp1QiVtaO8orb+5M516oD0gNktd44
         raXSiWRjv8724WS1rxBQ/9omAeHmi4UdWMGlfuLxiHzky8Y508D9YYwEVx6HPkl1XHsm
         trLdaTRiiSWVUV9kAY8+elxcypVESPP14QJ3GJtyREqVA8OcYJxYQGSECat2TTvnC13g
         TyIdC+r4VskzuJiv+P9op/1ViYuCVWU751ZBsN46kH0qiSOz4Jd12ah8JV5FkS5NQ7xH
         rw3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/rekPwZJE0cxA56iGaAN7R8uD+7Gc2Z7SVbx73lrS5EzHvJ59DszuznUSXeo/u/4grt0NFCzCsTUzfBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxevzf4hdUkqOfUUIIDDrL0X/mQMd4vcVgf4m0HbT9BFBauTi1Y
	aOeQG0zWn4JmQROsv8zNeWQuS784+SqrH5udFSo2KriFn5drS4j5b9an
X-Gm-Gg: AfdE7cmd9WYPKtTDMZvK84ED9kdlFJ4d/E+fG5goAYBaDePn3fSG9W4B5jZxppYsD+u
	gN9KM11NBn++PxxHoKlfRoajrbyB4+XL8LA1ieVQkOOY2et1SglGzkNLoubIeLyp8mQbLJEuGHv
	ySLJ7QubftEYuzZWZzxnHRFRxM9+EgVKe1HAVWMOtrxAN7ZrlyBUILmtnlYXVuhTO+KUeZfAseD
	1/Aql96kmUdXhTuNmrrp2+QurGWeBtc3qqLXsrwy4CzFlHUs2ZAsacVAzaDoJEieSxdibLZ+uGh
	V7RPIquhiqW+jMv1HGyLsMXOq0wHk4w4w+C6pVWTWANCcpoltOUaGmUY5+RUc7x2lRbJ2Wtj2jK
	1xTLY1HTvpmV2vQXPxKxPvcS0sZWfhOezgXZeEG18hUcMOTBkBxEGklZU7ymJ/lFyL965p66hJJ
	CmmF3Jb6oglqHcvYP7+lgqZYVycfmZHTU39TwqRarKiyGNOlpIii3D40tip3cYig==
X-Received: by 2002:a05:600c:6b70:b0:490:b06a:649e with SMTP id 5b1f17b1804b1-49266893253mr29913545e9.25.1782403512695;
        Thu, 25 Jun 2026 09:05:12 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.86.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926543be74sm52220975e9.1.2026.06.25.09.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 09:05:12 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 2/2] hwmon: (chipcap2) Add support for label
Date: Thu, 25 Jun 2026 19:04:23 +0300
Message-ID: <20260625160423.17882-2-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625160423.17882-1-flaviu.nistor@gmail.com>
References: <20260625160423.17882-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for label sysfs attribute similar to other hwmon devices.
This is particularly useful for systems with multiple sensors on the
same board, where identifying individual sensors is much easier since
labels can be defined via device tree.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
Changes in v2:
- No change for this patch in the patch series. 
- Link to v1: https://lore.kernel.org/all/20260622122200.14245-1-flaviu.nistor@gmail.com/

 Documentation/hwmon/chipcap2.rst |  2 ++
 drivers/hwmon/chipcap2.c         | 25 +++++++++++++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/chipcap2.rst b/Documentation/hwmon/chipcap2.rst
index dc165becc64c..c38d87b91b69 100644
--- a/Documentation/hwmon/chipcap2.rst
+++ b/Documentation/hwmon/chipcap2.rst
@@ -70,4 +70,6 @@ humidity1_min_hyst:             RW      humidity low hystersis
 humidity1_max_hyst:             RW      humidity high hystersis
 humidity1_min_alarm:            RO      humidity low alarm indicator
 humidity1_max_alarm:            RO      humidity high alarm indicator
+humidity1_label:                RO      descriptive name for the sensor
+temp1_label:                    RO      descriptive name for the sensor
 =============================== ======= ========================================
diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index 4aecf463180f..086571d556b7 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -22,6 +22,8 @@
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/property.h>
 
 #define CC2_START_CM			0xA0
 #define CC2_START_NOM			0x80
@@ -83,6 +85,7 @@ struct cc2_data {
 	struct i2c_client *client;
 	struct regulator *regulator;
 	const char *name;
+	const char *label;
 	int irq_ready;
 	int irq_low;
 	int irq_high;
@@ -449,6 +452,8 @@ static umode_t cc2_is_visible(const void *data, enum hwmon_sensor_types type,
 		switch (attr) {
 		case hwmon_humidity_input:
 			return 0444;
+		case hwmon_humidity_label:
+			return cc2->label ? 0444 : 0;
 		case hwmon_humidity_min_alarm:
 			return cc2->rh_alarm.low_alarm_visible ? 0444 : 0;
 		case hwmon_humidity_max_alarm:
@@ -466,6 +471,8 @@ static umode_t cc2_is_visible(const void *data, enum hwmon_sensor_types type,
 		switch (attr) {
 		case hwmon_temp_input:
 			return 0444;
+		case hwmon_temp_label:
+			return cc2->label ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -552,6 +559,16 @@ static int cc2_humidity_max_alarm_status(struct cc2_data *data, long *val)
 	return 0;
 }
 
+static int cc2_read_string(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, const char **str)
+{
+	struct cc2_data *data = dev_get_drvdata(dev);
+
+	*str = data->label;
+
+	return 0;
+}
+
 static int cc2_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		    int channel, long *val)
 {
@@ -670,8 +687,9 @@ static int cc2_request_alarm_irqs(struct cc2_data *data, struct device *dev)
 }
 
 static const struct hwmon_channel_info *cc2_info[] = {
-	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
-	HWMON_CHANNEL_INFO(humidity, HWMON_H_INPUT | HWMON_H_MIN | HWMON_H_MAX |
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(humidity, HWMON_H_INPUT | HWMON_H_LABEL |
+			   HWMON_H_MIN | HWMON_H_MAX |
 			   HWMON_H_MIN_HYST | HWMON_H_MAX_HYST |
 			   HWMON_H_MIN_ALARM | HWMON_H_MAX_ALARM),
 	NULL
@@ -680,6 +698,7 @@ static const struct hwmon_channel_info *cc2_info[] = {
 static const struct hwmon_ops cc2_hwmon_ops = {
 	.is_visible = cc2_is_visible,
 	.read = cc2_read,
+	.read_string = cc2_read_string,
 	.write = cc2_write,
 };
 
@@ -710,6 +729,8 @@ static int cc2_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(data->regulator),
 				     "Failed to get regulator\n");
 
+	device_property_read_string(dev, "label", &data->label);
+
 	ret = cc2_request_ready_irq(data, dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to request ready irq\n");
-- 
2.34.1

