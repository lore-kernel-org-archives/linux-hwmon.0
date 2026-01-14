Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F562D0C62
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Jan 2026 22:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768428749; cv=none; b=Yk9NMB0cGHVE/031RT9FNrCbmlwNa/bRbrYEyTbjshMu2Yv716DO6qNRF03fhBiqUlJeJRSZB4WJUWt+zWi5tIc9hnr/rlEnDuUJCGYBDEwK1LbTSJjZqlZxHEdlxC7G5MCDvmb2Hf9tvMlhJIZDvHmVMWWIe1t6It0A65ptAOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768428749; c=relaxed/simple;
	bh=AqQ7D7MZG5dCwk0+FI4LPwFjNnbWzQHDbkY9jbK4f6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uoUkn2eS577gQMy7CZm8Q2ZikjU/j4bUqa78hC46lAYy5D+HmOuqex9anMcCDrEv7kSGn91ye6/7zwvsmCONkHx97ub2O5vAEZv21/Ka4lloG6tQb20vMkbEANG+/3nO9kjkgIlj6jxaeesYrDX6O/SWt4pnNWJcj4JY5s+DB+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=Jv6dA1Q/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="Jv6dA1Q/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so1949925e9.0
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jan 2026 14:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1768428737; x=1769033537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEwZJiV03fJ628aCuxgNtJ0Js2UxACV5+XtPBkCCvVM=;
        b=Jv6dA1Q/hdZge3jWWBPueAxiXQ57z4IkxAOcHwLHAax7UImoRVPKoDw4PdF7or/BEL
         tej1t2vHhKUjuBEBiU5D6Hm46nD8B7ybeyVavhyNiboR+m36UQ+Dra2LN7P28rOXyryx
         LcR1yAz7I+T+wliVw1Lh53Cu9bMGd0fjtOY1ZIjQROoAnHW7HwHQpyfHLQOwaPyCEnNR
         KIVxR0sS040IasR11+3jBsCk9p7Qwm8+fQivNsssLU4U5pNRIfGba2XAhmInrLebNxK0
         732MN3yXf81aRMtdoFY/1WcCKvw6iNiAd1g0WkjyeD3m4oWmD1tg3goLI6yun8QyOSi7
         zmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768428737; x=1769033537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TEwZJiV03fJ628aCuxgNtJ0Js2UxACV5+XtPBkCCvVM=;
        b=EHnTga8JtyOluD2PmGPuzmhAqlIya5iPF/w67LEn4Pnid0JxG5y/qQljmjQoKEdmvO
         JQiegxkk9uxH4wHzYh11UAx0+Sqcx0fP64HvRqXWh62AHA1iSqQ1ZgC79jeMMow0Gwyn
         yMIcqVpuG0YVpqV7iSMCUO05UOyYfP77HUw+xcAWQIF+V56TTYBvZwO86TrA+47wrqel
         IT9CWttsZcYw1qzb8axEdgW/TDqaI66MC1La7hfHinjT4gIEbR8NVESMaAxVHSd5yJQ6
         8F7Ob3gwbHdLOSae2r8PsYH/m+9IoEiAMdpfpR0Uy82bfuensUzJ0XfxQS03m0RY3xrp
         WRZg==
X-Gm-Message-State: AOJu0YzBquyt6SScTp19qp3RUmb99FMdXb2qrto2qFzIPybb5eYMEp0G
	HiyyhYXhuca9M8pUtoDyHwC1oA4TkDO2MRBLbpNeH93DLclMBIYbBHlHMei+SPvuGQ==
X-Gm-Gg: AY/fxX7RwCIR5Esw/mH3tqmk6iQAA35BH0u88Czrb24MB8G+8Oqd7MkpPkPYwfU1gJ0
	IOFstJP4zyqhnFdwSNKd8FhYLIRG4Se4Dj7sTTTEyiImbPLry1CwLtpLCDL64kekd+z4l3aedu2
	xjRMN5G8oMD0R4EL+Wz58xQ9DFpdO1NEWWEkORJDzzQWnxo1+bRQRyCjeGbyyYBD6VvPWwQe6/K
	c4FIAJ3MZenhtHjepOO2/kIFMM7WWOqvA9a2n5RyCI0o1uNDMu1FBEbQvHf1aCl3GHvJXIF5kdE
	mUtBbHjysfSzfv1UANe4jD1hva2M/5Jsty/wEppkwJqYHGGJcmNsiNLyvKBbvHoYMLyyPf0TToG
	XQ3rf5EkPnqygPQCyvcPA0ax2fQV4e2OtfDnLCslBAv77MWGKU2WSM4xCOAaBvbepp/X5iVluxk
	bXzc1Urcdd4TnCHsAogHifzeJnKi7tVO7vZJ+GGxhEFZrsnXUNGS7g7cPfW1s21naesuL4sL4d1
	hxEKXGXS9gOiyXz1g==
X-Received: by 2002:a05:600c:1f92:b0:47a:94fc:d057 with SMTP id 5b1f17b1804b1-47ee332fa41mr38400435e9.2.1768428736813;
        Wed, 14 Jan 2026 14:12:16 -0800 (PST)
Received: from localhost.localdomain (217-128-226-200.ftth.fr.orangecustomers.net. [217.128.226.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f941a670dsm3098195e9.5.2026.01.14.14.12.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Jan 2026 14:12:16 -0800 (PST)
From: "benoit.masson" <yahoo@perenite.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	"benoit.masson" <yahoo@perenite.com>
Subject: [PATCH v4 3/5] hwmon: it87: expose additional temperature limits
Date: Wed, 14 Jan 2026 23:12:08 +0100
Message-ID: <20260114221210.98071-4-yahoo@perenite.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260114221210.98071-1-yahoo@perenite.com>
References: <20260114221210.98071-1-yahoo@perenite.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose extra temp min/max/offset/type/alarm attributes when a chip
reports more than three temperature resources.

Signed-off-by: benoit.masson <yahoo@perenite.com>
---
 drivers/hwmon/it87.c | 58 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 2d4264d05bc2..368ae68ace15 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -1334,8 +1334,26 @@ static SENSOR_DEVICE_ATTR_2(temp3_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
 static SENSOR_DEVICE_ATTR_2(temp3_offset, S_IRUGO | S_IWUSR, show_temp,
 			    set_temp, 2, 3);
 static SENSOR_DEVICE_ATTR_2(temp4_input, S_IRUGO, show_temp, NULL, 3, 0);
+static SENSOR_DEVICE_ATTR_2(temp4_min, S_IRUGO | S_IWUSR, show_temp, set_temp,
+			    3, 1);
+static SENSOR_DEVICE_ATTR_2(temp4_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
+			    3, 2);
+static SENSOR_DEVICE_ATTR_2(temp4_offset, S_IRUGO | S_IWUSR, show_temp,
+			    set_temp, 3, 3);
 static SENSOR_DEVICE_ATTR_2(temp5_input, S_IRUGO, show_temp, NULL, 4, 0);
+static SENSOR_DEVICE_ATTR_2(temp5_min, S_IRUGO | S_IWUSR, show_temp, set_temp,
+			    4, 1);
+static SENSOR_DEVICE_ATTR_2(temp5_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
+			    4, 2);
+static SENSOR_DEVICE_ATTR_2(temp5_offset, S_IRUGO | S_IWUSR, show_temp,
+			    set_temp, 4, 3);
 static SENSOR_DEVICE_ATTR_2(temp6_input, S_IRUGO, show_temp, NULL, 5, 0);
+static SENSOR_DEVICE_ATTR_2(temp6_min, S_IRUGO | S_IWUSR, show_temp, set_temp,
+			    5, 1);
+static SENSOR_DEVICE_ATTR_2(temp6_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
+			    5, 2);
+static SENSOR_DEVICE_ATTR_2(temp6_offset, S_IRUGO | S_IWUSR, show_temp,
+			    set_temp, 5, 3);
 
 static int get_temp_type(struct it87_data *data, int index)
 {
@@ -1461,6 +1479,12 @@ static SENSOR_DEVICE_ATTR(temp2_type, S_IRUGO | S_IWUSR, show_temp_type,
 			  set_temp_type, 1);
 static SENSOR_DEVICE_ATTR(temp3_type, S_IRUGO | S_IWUSR, show_temp_type,
 			  set_temp_type, 2);
+static SENSOR_DEVICE_ATTR(temp4_type, S_IRUGO | S_IWUSR, show_temp_type,
+			  set_temp_type, 3);
+static SENSOR_DEVICE_ATTR(temp5_type, S_IRUGO | S_IWUSR, show_temp_type,
+			  set_temp_type, 4);
+static SENSOR_DEVICE_ATTR(temp6_type, S_IRUGO | S_IWUSR, show_temp_type,
+			  set_temp_type, 5);
 
 /* 6 Fans */
 
@@ -2290,6 +2314,9 @@ static SENSOR_DEVICE_ATTR(fan6_alarm, S_IRUGO, show_alarm, NULL, 7);
 static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 16);
 static SENSOR_DEVICE_ATTR(temp2_alarm, S_IRUGO, show_alarm, NULL, 17);
 static SENSOR_DEVICE_ATTR(temp3_alarm, S_IRUGO, show_alarm, NULL, 18);
+static SENSOR_DEVICE_ATTR(temp4_alarm, S_IRUGO, show_alarm, NULL, 19);
+static SENSOR_DEVICE_ATTR(temp5_alarm, S_IRUGO, show_alarm, NULL, 20);
+static SENSOR_DEVICE_ATTR(temp6_alarm, S_IRUGO, show_alarm, NULL, 21);
 static SENSOR_DEVICE_ATTR(intrusion0_alarm, S_IRUGO | S_IWUSR,
 			  show_alarm, clear_intrusion, 4);
 
@@ -2350,6 +2377,9 @@ static SENSOR_DEVICE_ATTR(temp1_beep, S_IRUGO | S_IWUSR,
 			  show_beep, set_beep, 2);
 static SENSOR_DEVICE_ATTR(temp2_beep, S_IRUGO, show_beep, NULL, 2);
 static SENSOR_DEVICE_ATTR(temp3_beep, S_IRUGO, show_beep, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp4_beep, S_IRUGO, show_beep, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp5_beep, S_IRUGO, show_beep, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp6_beep, S_IRUGO, show_beep, NULL, 2);
 
 static ssize_t vrm_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
@@ -2512,14 +2542,12 @@ static umode_t it87_temp_is_visible(struct kobject *kobj,
 	int i = index / 7;	/* temperature index */
 	int a = index % 7;	/* attribute index */
 
-	if (index >= 21) {
-		i = index - 21 + 3;
-		a = 0;
-	}
-
 	if (!(data->has_temp & BIT(i)))
 		return 0;
 
+	if (a && i >= data->num_temp_limit)
+		return 0;
+
 	if (a == 3) {
 		if (get_temp_type(data, i) == 0)
 			return 0;
@@ -2561,8 +2589,28 @@ static struct attribute *it87_attributes_temp[] = {
 	&sensor_dev_attr_temp3_beep.dev_attr.attr,
 
 	&sensor_dev_attr_temp4_input.dev_attr.attr,	/* 21 */
+	&sensor_dev_attr_temp4_max.dev_attr.attr,
+	&sensor_dev_attr_temp4_min.dev_attr.attr,
+	&sensor_dev_attr_temp4_type.dev_attr.attr,
+	&sensor_dev_attr_temp4_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp4_offset.dev_attr.attr,
+	&sensor_dev_attr_temp4_beep.dev_attr.attr,
+
 	&sensor_dev_attr_temp5_input.dev_attr.attr,
+	&sensor_dev_attr_temp5_max.dev_attr.attr,
+	&sensor_dev_attr_temp5_min.dev_attr.attr,
+	&sensor_dev_attr_temp5_type.dev_attr.attr,
+	&sensor_dev_attr_temp5_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp5_offset.dev_attr.attr,
+	&sensor_dev_attr_temp5_beep.dev_attr.attr,
+
 	&sensor_dev_attr_temp6_input.dev_attr.attr,
+	&sensor_dev_attr_temp6_max.dev_attr.attr,
+	&sensor_dev_attr_temp6_min.dev_attr.attr,
+	&sensor_dev_attr_temp6_type.dev_attr.attr,
+	&sensor_dev_attr_temp6_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp6_offset.dev_attr.attr,
+	&sensor_dev_attr_temp6_beep.dev_attr.attr,
 	NULL
 };
 
-- 
2.50.1 (Apple Git-155)

