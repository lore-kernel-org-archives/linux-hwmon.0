Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFB233031A
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706196; cv=none; b=bX6kSDGn6jGh2dTdcogP8NWjMsW/pR2ECVANM5nSVQVakYLq/xjRhaR/6gQW16m2vM0bochFNg5bVkOXxiQm1bfBYKq/AQWXuxvMb2s+poU6JuURhbxaDpN26cPKVSkExyvviZdwqcj7KPktuczmgopXQ8FlWuJac3Pyup2mC5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706196; c=relaxed/simple;
	bh=n3EW14uaBvwvTzVDchAnA2904QxIanTg6fLE2B7oGhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y35g3vnEk6BfgKehLk4l5HzuH8WvVZFXjx2eD0yNtEW/yLzpmTZTQB9OCW+RXhrTJfDeqnohpSu0215uEqSOqsJD0NOAHAm4E8SZwtl3QwBYmQCBmnnTMLtzRrXhKzI0sjNPRmJC+/PEDrYHrot7/8hl2arWdomyosaceQeEU7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAG8q6mi; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAG8q6mi"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7a1603a098eso1303650b3a.1
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706194; x=1761310994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVHOURD4J8Wfn5GOqgT4Q3Pfi94wXHyPtIDotUaN2Cs=;
        b=UAG8q6miSdYFGPbhBb6gaXIL7FuDfCZ0ok9eCZjHf7e4PtLIg2UeausZh0DnjWUgZM
         26kYHf6PHi6A42MMjj4PaGi1YcskQ73Ai7xNPPjFTcp8X4ogUHacw6bwDBZE/6QExxro
         xFhN/XI0Y50FqOGHbi6fc0yNkV0WhUS2t5PbrGWfAq+SQ1NX+RWvLtQgv3SRZ9U9/X9i
         /LMy2xcIqXW5XJTbGYAHXezorDN89De0tiewTP3fTC04pQSosNFofWZ2V1nejbgdobUt
         Tq6icpAcvT0SkubDv+4RceDpZphKq1GR1+dyxWxp166ndi8qLNlP/uho659MRAniiscQ
         jbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706194; x=1761310994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jVHOURD4J8Wfn5GOqgT4Q3Pfi94wXHyPtIDotUaN2Cs=;
        b=bsoiFp16eQkTVAKJ7uefdEX1n330ZlgFvyDJQScpw1zgzkpcJRp+ZYCu69RTR/DDPE
         JpabWRKs5rVzIOd1LM1qxNISQa+t2rfjtGHS95IF3tVpVjtDK6r0UFFudZ22eXvW2U/S
         agyyhkNkPhnSLV9cvxOAsSHIWKv4HHHmx6MzjuUcV5MnXVu83iccg5hV9GT0UYLIvnvi
         MMXCPKEbHidOmtIfdkEvp4sJn5MjwN4Lax/AnPe/UHnVNTwxLG9Yjn44/WrB6kB/Uy1p
         XQB3FoBSmzES041Y3ck1n402gVDo2tohbpokj/gI7JH3LQ4rY9ytvxQX4ScXmdZfmeYs
         Rj+g==
X-Gm-Message-State: AOJu0YxAuflRtU9bd0dOCDL08I9kzGkpOdTUaf/1jb/Dv9Uyw4Zosn+z
	zmbIczCCDGctj46iPsUY0PVB+fSqJospdM/VugbTb8DLmYnOe2lpdFDXb5I8QQ==
X-Gm-Gg: ASbGncsR//6+wNthXczGXB2zIDz17ujZceXhlMPNKgudFbRVnu9lDtB9mQnQRGbOksk
	m4K1zTfUIpJf37vnTtVMfrh/HoN9UMKbkADjo/KVrg4j6MxZ6qErmuXYvuc18dGnHeGwmRo+jnt
	pYh9wITctnLfQzbrUl4cbv/ryn83YZIfmzuUTQEnify6cx8XHkb8aTgj4aLlzTyl284xJ2aU8BM
	7rVIvWp/SNa+fVjdTbDevLwXl+fglg38n+JEEkhLbfxcXA7EB7MR5qvtMs6byNSDeVbDZytLO5b
	b2jn/v2K+13R76dI0UiXopLlk1ZbqayN4hcy3AB21E/7OtW9UPEKKIXrDfSHt8vRir3++fQ8thI
	u96JVK67KoRXisGkbMM0R6Vr/VjvcCXjEy8sQlS9+SJ/gOqC0tnUyuFplDiBwiCM49lXszrSSOk
	cyrQqyZ5g6RZM4ydCpGD1vPY4=
X-Google-Smtp-Source: AGHT+IFL1BiqyrdQaWQAyh0JxBwo7Yb7uO7IKRLCEmsMtZPCBC3B2/fNgAMNHfFDstmKJcFTNlob7w==
X-Received: by 2002:a05:6a00:21c4:b0:780:f6db:b1af with SMTP id d2e1a72fcca58-7a220acb6a1mr4564238b3a.16.1760706193783;
        Fri, 17 Oct 2025 06:03:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e275csm25727527b3a.61.2025.10.17.06.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:03:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 23/29] hwmon: (aquacomputer_d5next) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:02:15 -0700
Message-ID: <20251017130221.1823453-24-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017130221.1823453-1-linux@roeck-us.net>
References: <20251017130221.1823453-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking in the driver code is no longer necessary. Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/aquacomputer_d5next.c | 37 +++++------------------------
 1 file changed, 6 insertions(+), 31 deletions(-)

diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index 0dcb8a3a691d..1ca70e726298 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -20,7 +20,6 @@
 #include <linux/jiffies.h>
 #include <linux/ktime.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/seq_file.h>
 #include <linux/unaligned.h>
 
@@ -551,7 +550,6 @@ struct aqc_data {
 	struct hid_device *hdev;
 	struct device *hwmon_dev;
 	struct dentry *debugfs;
-	struct mutex mutex;	/* Used for locking access when reading and writing PWM values */
 	enum kinds kind;
 	const char *name;
 
@@ -662,7 +660,6 @@ static void aqc_delay_ctrl_report(struct aqc_data *priv)
 	}
 }
 
-/* Expects the mutex to be locked */
 static int aqc_get_ctrl_data(struct aqc_data *priv)
 {
 	int ret;
@@ -680,7 +677,6 @@ static int aqc_get_ctrl_data(struct aqc_data *priv)
 	return ret;
 }
 
-/* Expects the mutex to be locked */
 static int aqc_send_ctrl_data(struct aqc_data *priv)
 {
 	int ret;
@@ -721,11 +717,9 @@ static int aqc_get_ctrl_val(struct aqc_data *priv, int offset, long *val, int ty
 {
 	int ret;
 
-	mutex_lock(&priv->mutex);
-
 	ret = aqc_get_ctrl_data(priv);
 	if (ret < 0)
-		goto unlock_and_return;
+		return ret;
 
 	switch (type) {
 	case AQC_BE16:
@@ -737,9 +731,6 @@ static int aqc_get_ctrl_val(struct aqc_data *priv, int offset, long *val, int ty
 	default:
 		ret = -EINVAL;
 	}
-
-unlock_and_return:
-	mutex_unlock(&priv->mutex);
 	return ret;
 }
 
@@ -747,11 +738,9 @@ static int aqc_set_ctrl_vals(struct aqc_data *priv, int *offsets, long *vals, in
 {
 	int ret, i;
 
-	mutex_lock(&priv->mutex);
-
 	ret = aqc_get_ctrl_data(priv);
 	if (ret < 0)
-		goto unlock_and_return;
+		return ret;
 
 	for (i = 0; i < len; i++) {
 		switch (types[i]) {
@@ -762,18 +751,11 @@ static int aqc_set_ctrl_vals(struct aqc_data *priv, int *offsets, long *vals, in
 			priv->buffer[offsets[i]] = (u8)vals[i];
 			break;
 		default:
-			ret = -EINVAL;
+			return -EINVAL;
 		}
 	}
 
-	if (ret < 0)
-		goto unlock_and_return;
-
-	ret = aqc_send_ctrl_data(priv);
-
-unlock_and_return:
-	mutex_unlock(&priv->mutex);
-	return ret;
+	return aqc_send_ctrl_data(priv);
 }
 
 static int aqc_set_ctrl_val(struct aqc_data *priv, int offset, long val, int type)
@@ -953,13 +935,11 @@ static int aqc_legacy_read(struct aqc_data *priv)
 {
 	int ret, i, sensor_value;
 
-	mutex_lock(&priv->mutex);
-
 	memset(priv->buffer, 0x00, priv->buffer_size);
 	ret = hid_hw_raw_request(priv->hdev, priv->status_report_id, priv->buffer,
 				 priv->buffer_size, HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
 	if (ret < 0)
-		goto unlock_and_return;
+		return ret;
 
 	/* Temperature sensor readings */
 	for (i = 0; i < priv->num_temp_sensors; i++) {
@@ -1020,10 +1000,7 @@ static int aqc_legacy_read(struct aqc_data *priv)
 	}
 
 	priv->updated = jiffies;
-
-unlock_and_return:
-	mutex_unlock(&priv->mutex);
-	return ret;
+	return 0;
 }
 
 static int aqc_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
@@ -1870,8 +1847,6 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		goto fail_and_close;
 	}
 
-	mutex_init(&priv->mutex);
-
 	priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, priv->name, priv,
 							  &aqc_chip_info, NULL);
 
-- 
2.45.2

