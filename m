Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318EB22173D
	for <linux-hwmon@vger.kernel.org>; Sat, 10 Jan 2026 01:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768008383; cv=none; b=K3ZNl9iErel3EvAaviXUYY08u1s128pYuKUZNiDjWEi7jNormMUa97S4emWqlaCKKN0P61IqaonKB/pbmoK0CWE8sP4g5KN02TdRN+RxiMqwASZOoF1ujjPglZE3Y/MOZVxtRQk8OY+0X/FhRwTqsSe+iQd1+FSdxXAkHHjwhH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768008383; c=relaxed/simple;
	bh=iVsgVxLI6I/9ZTlTWmFplWmWlyfeX/jDoBkCd+nkhDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RGVogdRJkWsZ7Hi76VkoojnbBfzBkQeYUv+0lbeS5d+FkZ4Au/0xIGZK5HdzYJok1tM2a3PpbYq/vOdi+78eFYAqwnDEOPrptzycWReIqYT039tWz/A/3b5DoBE4FK2MB2NSbJ6jUG/qxzh4KBsBXg8R2PhypW6xd+4jLgkfk64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=bkSuLdOH; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="bkSuLdOH"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-432d256c2e6so1700772f8f.3
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Jan 2026 17:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1768008377; x=1768613177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/0a52ze8ZOTMxC366uco1F4iY4yHWTRg5cfVneeIzw=;
        b=bkSuLdOHabgN81avy7CibkxQUhf4UI6mj8acKB1uIxLLv4VIXvZsdTZEsizMn6bHzg
         iji1RL5kd3xMu7YbCfWuEzvmvF/qvI4PL8o60IBnkpc0UH45q110wMaiL725ICZRXMNJ
         EwH2FCmtWLPVU/uNDPvqND8jVGPV9/7XNakHaft3t0CIOhp7xAkI0wzcnODMJ0ovdNxK
         R8kSSybxhoHVczSScIF++2o+HMWy6Z5c6QhbBYml++gLONTsQhqsRyQDdm1/RpkRH35h
         ngxoFVbUl5+6RSIXwqnqUk6P4g/BWKnemPG0KTfM3M0ZCBXZKxKy8yCF1r7NPVGv8Rv4
         H4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768008377; x=1768613177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v/0a52ze8ZOTMxC366uco1F4iY4yHWTRg5cfVneeIzw=;
        b=ploky7SwC0xwremH92zKla3qKOcPl6jX3RO+Dw2YNxFNMIKcnneI0D4hZ/NEjA9s4Y
         3l0y+7GovKD3NXKA6NyCDv/LhfBCfAWv823YDRJmOz57eOJ9KRS0q/zR6ge30Sqhx73o
         2IHZyRWOE3EF3F1ERVHR90gLTY5L6hFH17wI2nLYvdyMhCI9BGgzEW0cFx8ocqhN1l0L
         EwMssHYrT8eavl1gHt444xEq6y+9wKFVeUQluIwhmgUxXB1SpWB3L5887ohaPnI2kGe+
         Nv/4t/g91CnkQqQVaF5yQXUN0eEqN5++SoE09B3DzDO4JvicEs0WP7oJdu7oRXXGNrj7
         ToYA==
X-Forwarded-Encrypted: i=1; AJvYcCXNDbdFzuCyJJc+vc5z/QQEQKw4sq9+jJOisQt4LEIcuR7nVcEBPfGRVOszm7YzTEqHAN/sC3MAZxwRsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxnX5khBDiplceLN4Q+pPmgAuSIHZH+0xjIcNI08RZojlb6tEX
	YSGic9Hw5ueVT9ufOq8WQaHkiOviXSDg2llEn+vaDONsHG+6UGb53Hnv9Y1vJs3Hbw==
X-Gm-Gg: AY/fxX7Zc88kXTBmAEu7e8DvsBjv6/BuIvgR8UmzWHhW44fFXfoyXHcfqFFy1Ihb4iQ
	anaFiz672prZgAOSb2dxbTA04mIXq53Z9BLXb/gcqQVc6fnGyVJXRUwm3V3QXV41/h0ohGEPHfV
	rg2aIftrqeI3/konYCH1Sq/5/kzGPJtzfX3AfKRtlxa6Jfi9myfgO4Hjc9B8lPvSVrE2FKBaQYk
	ZGHn3fa91B+4jgTUzFA28RgVWV9sKe+b9bsFVjXaQv3p76hkOQ+KJv45EbmOIbYePYTENRwR4/5
	6FGkrfi+RT9GkVoIJAbJ9hFyMH8lu6h84NSYo8LaXBKk6GZPQFQmVW5jS1vDzsyEl/1nckxgIKm
	E3Oz8UgT71l7YC/3YzGcrSDIKWZmdIAMD0XrXO7KtzoiDWXtjeF4piEk+l9I5hXD0rtS9n8JwW1
	ihp8C1b2UyKWF0LdgkbD1IP3uzBo7K
X-Google-Smtp-Source: AGHT+IGLPUnRkpruevByMVex+ArbD9LeJ1foyACN9GtKOdhYWbeC1JMQnAdw0QatdI1wfN5VEh3dwA==
X-Received: by 2002:a05:6000:2584:b0:432:5bf9:cf22 with SMTP id ffacd0b85a97d-432c3760f0amr13003628f8f.3.1768008375918;
        Fri, 09 Jan 2026 17:26:15 -0800 (PST)
Received: from mac.net ([2001:861:8b92:2c50:6cf2:f0aa:7bc6:15fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e1adbsm25859761f8f.17.2026.01.09.17.26.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 09 Jan 2026 17:26:15 -0800 (PST)
From: "benoit.masson" <yahoo@perenite.com>
To: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"benoit.masson" <yahoo@perenite.com>
Subject: [PATCH v3 3/5] hwmon: it87: expose additional temperature limits
Date: Sat, 10 Jan 2026 02:26:11 +0100
Message-ID: <20260110012613.48150-3-yahoo@perenite.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260110012613.48150-1-yahoo@perenite.com>
References: <20260110012613.48150-1-yahoo@perenite.com>
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
 drivers/hwmon/it87.c | 60 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 54 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index dfd1e896c1ab..90230e693152 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -1258,8 +1258,26 @@ static SENSOR_DEVICE_ATTR_2(temp3_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
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
@@ -1385,6 +1403,12 @@ static SENSOR_DEVICE_ATTR(temp2_type, S_IRUGO | S_IWUSR, show_temp_type,
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
 
@@ -2214,6 +2238,9 @@ static SENSOR_DEVICE_ATTR(fan6_alarm, S_IRUGO, show_alarm, NULL, 7);
 static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 16);
 static SENSOR_DEVICE_ATTR(temp2_alarm, S_IRUGO, show_alarm, NULL, 17);
 static SENSOR_DEVICE_ATTR(temp3_alarm, S_IRUGO, show_alarm, NULL, 18);
+static SENSOR_DEVICE_ATTR(temp4_alarm, S_IRUGO, show_alarm, NULL, 19);
+static SENSOR_DEVICE_ATTR(temp5_alarm, S_IRUGO, show_alarm, NULL, 20);
+static SENSOR_DEVICE_ATTR(temp6_alarm, S_IRUGO, show_alarm, NULL, 21);
 static SENSOR_DEVICE_ATTR(intrusion0_alarm, S_IRUGO | S_IWUSR,
 			  show_alarm, clear_intrusion, 4);
 
@@ -2274,6 +2301,9 @@ static SENSOR_DEVICE_ATTR(temp1_beep, S_IRUGO | S_IWUSR,
 			  show_beep, set_beep, 2);
 static SENSOR_DEVICE_ATTR(temp2_beep, S_IRUGO, show_beep, NULL, 2);
 static SENSOR_DEVICE_ATTR(temp3_beep, S_IRUGO, show_beep, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp4_beep, S_IRUGO, show_beep, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp5_beep, S_IRUGO, show_beep, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp6_beep, S_IRUGO, show_beep, NULL, 2);
 
 static ssize_t vrm_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
@@ -2436,21 +2466,19 @@ static umode_t it87_temp_is_visible(struct kobject *kobj,
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
 		return attr->mode;
 	}
 
-	if (a == 5 && !has_temp_offset(data))
+	if (a == 5 && i >= data->num_temp_offset)
 		return 0;
 
 	if (a == 6 && !data->has_beep)
@@ -2485,8 +2513,28 @@ static struct attribute *it87_attributes_temp[] = {
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

