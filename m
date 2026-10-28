Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175337;
	b=SxRExsYeYo5QrMtLbgFOqZPrYcVOSC09v6NDTk1Dg69wINPgyBCL5O3LMuxwAHMIYzCX
	 ZUebGrxdBIg9zepCCwi/9PKiZQHPcWTk5l/hrw2Fg+1H++F7eeLsXTDlTIEVecA+NZid7
	 1yX+78sBkVu7Syy+5kJhrr9rgjujlm7Y2aJLP27pjZPaVqMuXvtskIAM9DD35x1X6HplZ
	 8C4OfGnqq3PDEZ3yiVtSAKWwEJwlzXY4Dwcq8vK2cEc3HbzIZzZPnhhZUCNuXtGAVrsC/
	 bNu6t3BP2droAZyziZdro/JsmFYH2AZTBXOfA8JWKhVHSwMt1IQBudsrzmg+QIzcElQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=lCx4BcrORJni91sIsjKBnbCAJ5Ch1lEXBg8pjpqe8IE=;
	b=JilbQZ/bxlkN3JIbiw5W0lo6WA+HRaD8s3324UCqqFEZ8Itefw6mWOWowinGlo6oCcIQ
	 x1i4vfg7QBKlELRc+psvEOUzmJ0y0gIF++yp4evTy/Y5cr6jq51+FKfS3FiZCMjZO8OE7
	 7hCgB6NI3NLWURet4W0GI+SRMrjAbwUhCe+JpM38GoVNMchfk0pWJnLWcPf0hYvD77TZt
	 rgKucGbSNU1UayvQH5KzIdwUwzddNIpdIrf2cTamS798M/4RNvAO/zy9cwEv0vaKk2znN
	 W/vewm3c1CXjyfYZnrkFxNJ0x9UjBKXUH4P4X7gT/I50/bqLhJUhz/2jwUI03qyI7YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8bF8AXt;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E756606A31D
	for <linux-hwmon@vger.kernel.org>; Wed, 28 Oct 2026 08:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E756606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8bF8AXt
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a3c08d6928so945102c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Oct 2026 01:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793175336; x=1793780136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lCx4BcrORJni91sIsjKBnbCAJ5Ch1lEXBg8pjpqe8IE=;
        b=x8bF8AXtwUYKMukSmmSlSOvy0FTCaMALw0lrAjREYQETLatMg6hPsmE1M4qjmSlw9+
         Val04sjHUXiuSmd/+LmB0J8zh7EsFEREu0Uq2Kpk3WzT81vsQamsq3EJa5cZ7O2Q+huL
         RV2FXdtizGR6+zS5CgJOV/7yZBLgH7DLfh+T/yi6JR05khWEvRSYmVBsoYsTd3sihYKR
         vvIlC9FMVwoKgVR0fgToaKMB3eDmBWyU44NxVzSJeULOqUDBPLLMEihKqno1ntlcOooB
         lTckuohrQPh1TNuJy4ZPqDjBGjfhfTxRXZ1K23ywKVntr+AD+PgqxJHhqGxBmh54HuP6
         V7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793175336; x=1793780136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCx4BcrORJni91sIsjKBnbCAJ5Ch1lEXBg8pjpqe8IE=;
        b=hvHVCcFaNvebJCgBhReJ8nkYq6g0AxveR8gFD4NPZ5Vlta8eqFQI4Uxz32gU5PwJUd
         UkO8kV1cpITbGjXFgJ31ATLI2AUt0xP7EylZiqQLO05rO2Oo8wQ7hZahRRhax2qRVcfW
         1XyBmsffllTBUOdtXhOwnuAwIfa5zm5AO4DcIP9O83sizqugzFt4v3BKL9RcwS1/rKrr
         hStxjNHWkgKRARw5CnLdfTZ8Xy3xqTtFJK971qtFfNyNGHo6mIycRssFiW6asw+YI3Xq
         u4abSiqcY0AeS1V4MR/lE9PhyaDnEfTu88bTGDGBqkIRc/QuKiggbI3ICGdD1MD7O+Je
         1Flw==
X-Gm-Message-State: AFq9FYLiVt8MSgo2EfJWBseID/QIvcnGfwt7n0xIB5wSVuYvkN2A4+Gy
	Gv/EhHaCs6wrXGmO9OhIBGOP+BE4Ns3u+0185Qa0jsoiGLFSWXf2RK2/
X-Gm-Gg: AYBFou17KUOqBf29FlTey65kkOlDgitvssoVgaUDXIK7OoIud6VOB49ad9Z6G/RgeZd
	IpZTP4PPVyZ58W6iQN3xvqENodNGYtRZncqGJIIXjtx9dDfw8jA5+Fv8IaUFaeO15Sg0r9M0p+z
	vwc2SAMgSAOvu0ms5odhXg6DQqrt7LjVbS1nAjkZ/+sTQx3pHlrZchgP/eJDDyjiduIhKFopqJx
	cBqiNKPlYgBHg0sCiFKGRnyuNyXudjfcr87UEwjcu7N0eIKM7HkdCYZK82pvfi8yHxsBJuoFAb4
	lNIOjvtELp/Aenx2kZ9IirtrMfI52+ktg1TEQTGih3B7uhE70dRrFjnhGznaVgs/MT6y+hJzwaI
	7AIcqcz4Axxifu2G9rTJmHT/8WX/6LIJQLP8Xh4g6emh377epn2AMVvj5HPRrZ3nGRzkZOF+B/q
	XLtbbHe/VOi8NDOzw1epCcsZIWyDbgkGuS6uU+jymciY6MjrEiBPxrm3gFeqZQDHKUd7kfbwBOr
	F7EG1b8t6s1z+MOxHcRx6A0MNjSjIgctWr+Eed+t+nQ6svMfPK9lPoR2NtLPz4kP3Nr+f+JBoMG
	rJaiPBef6A467YlfjmgMLHYkEJcdxPfZU3O9X55dubXW0ieB
X-Received: by 2002:a05:7022:1703:b0:166:3e26:c4b5 with SMTP id a92af1059eb24-1a6ce4ea2bfmr2235088c88.18.1793175336081;
        Wed, 28 Oct 2026 01:15:36 -0700 (PDT)
Received: from himanshubakshi ([2401:4900:1c2d:4ec6:6994:85c7:638d:44c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a7549528ebsm3355296c88.0.2026.10.28.01.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:15:34 -0700 (PDT)
From: himanshu bakshi <himanshu.bakshi478@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Subject: [PATCH] hwmon: Fix minor style issues
Date: Wed, 28 Oct 2026 13:45:04 +0530
Message-ID: <20261028081504.127535-1-himanshu.bakshi478@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>

Add newline between variable declarations and executable statements
to address the checkpatch warnings.

Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
---
 drivers/hwmon/adm1031.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/hwmon/adm1031.c b/drivers/hwmon/adm1031.c
index 24d0d4146c87..45d75a6383f5 100644
--- a/drivers/hwmon/adm1031.c
+++ b/drivers/hwmon/adm1031.c
@@ -212,6 +212,7 @@ static struct adm1031_data *adm1031_update_device(struct device *dev)
 static int FAN_TO_REG(int reg, int div)
 {
 	int tmp;
+
 	tmp = FAN_FROM_REG(clamp_val(reg, 0, 65535), div);
 	return tmp > 255 ? 255 : tmp;
 }
@@ -322,6 +323,7 @@ static ssize_t fan_auto_channel_show(struct device *dev,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n", GET_FAN_AUTO_BITFIELD(data, nr));
 }
 
@@ -387,6 +389,7 @@ static ssize_t auto_temp_off_show(struct device *dev,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n",
 		       AUTO_TEMP_OFF_FROM_REG(data->auto_temp[nr]));
 }
@@ -395,6 +398,7 @@ static ssize_t auto_temp_min_show(struct device *dev,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n",
 		       AUTO_TEMP_MIN_FROM_REG(data->auto_temp[nr]));
 }
@@ -425,6 +429,7 @@ static ssize_t auto_temp_max_show(struct device *dev,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n",
 		       AUTO_TEMP_MAX_FROM_REG(data->auto_temp[nr]));
 }
@@ -468,6 +473,7 @@ static ssize_t pwm_show(struct device *dev, struct device_attribute *attr,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n", PWM_FROM_REG(data->pwm[nr]));
 }
 static ssize_t pwm_store(struct device *dev, struct device_attribute *attr,
@@ -569,6 +575,7 @@ static ssize_t fan_div_show(struct device *dev, struct device_attribute *attr,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n", FAN_DIV_FROM_REG(data->fan_div[nr]));
 }
 static ssize_t fan_min_show(struct device *dev, struct device_attribute *attr,
@@ -576,6 +583,7 @@ static ssize_t fan_min_show(struct device *dev, struct device_attribute *attr,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n",
 		       FAN_FROM_REG(data->fan_min[nr],
 				    FAN_DIV_FROM_REG(data->fan_div[nr])));
@@ -668,6 +676,7 @@ static ssize_t temp_show(struct device *dev, struct device_attribute *attr,
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
 	int ext;
+
 	ext = nr == 0 ?
 	    ((data->ext_temp[nr] >> 6) & 0x3) * 2 :
 	    (((data->ext_temp[nr] >> ((nr - 1) * 3)) & 7));
@@ -678,6 +687,7 @@ static ssize_t temp_offset_show(struct device *dev,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n",
 		       TEMP_OFFSET_FROM_REG(data->temp_offset[nr]));
 }
@@ -686,6 +696,7 @@ static ssize_t temp_min_show(struct device *dev,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_min[nr]));
 }
 static ssize_t temp_max_show(struct device *dev,
@@ -693,6 +704,7 @@ static ssize_t temp_max_show(struct device *dev,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_max[nr]));
 }
 static ssize_t temp_crit_show(struct device *dev,
@@ -700,6 +712,7 @@ static ssize_t temp_crit_show(struct device *dev,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_crit[nr]));
 }
 static ssize_t temp_offset_store(struct device *dev,
@@ -812,6 +825,7 @@ static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n", data->alarm);
 }
 
@@ -822,6 +836,7 @@ static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
 {
 	int bitnr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n", (data->alarm >> bitnr) & 1);
 }
 
-- 
2.56.0

