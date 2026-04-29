Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86A63F1677
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777462190; cv=none; b=Hg3ifyutnlBLIhXThbHs43tLfOxXo5IzNGQ0aXTXMVKy+OuSud432WODeU0gJT/U65bk8rhRDmcTvkpULio3XiS5ytgFpTJYGaFMfg5QuqfvpjyHLre1VEyzDjq3nayepQJAu0YYFWA/zwGCnvD2IWaAdOZ4l1OVFkVpGdbYkqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777462190; c=relaxed/simple;
	bh=K41T3rcjgbgyPptj//cSWR3+F8YkJtn7jiqqKBE53C0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WiSq6MaxyNLl3tE5nGyGMe6hOL7JgG7GgoOt7t7RcPPg9gR8B6aBnkVv61c8ezYNX2hUXll9JEAmkzzf7Tl5cejzUBph02/+7hqDKsUt0EYQfdrEETkveke/OMjzpMUCvgZBf0sHiU/A0GQ2Xne2ifeXSrmPnnE421SrMZcuFD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=BIkjLLTI; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="BIkjLLTI"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35fbca04006so6257434a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 04:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1777462187; x=1778066987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5855hz31Y7sal0t7qD4FX3i6nclNMjvKAZM2P5Bg0s=;
        b=BIkjLLTIL0U2DJboWglRhtJNVZbdge0x/k+tjaCdqSlxG5Td7OHIY72er2B+sASgXr
         tgk4AWkPNeEwWIOA//TwIb9REjdHiA0kxi1wurY4J5HWkg9RC8qqu26oZx+mbM+hkiM5
         g9vCzTCpXU9Eguqs4P6ECqy7fDnv5OjHMiwdWnFMEYXKVmoWcYXxm9IrrxJCAnYaMw0l
         qKKMWxVn3Jp7iUQPdcO+EpIDwMQiUPdFaZdycTc42frmHFlMGpeExlVzu2IphCcQrYHG
         tYaqFeYLtyCccWSGLVCgLz+2RwUzIur+psqnYe75s9o/nLm2t9Ki9cpPtrHOz5IvX7Yx
         REig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777462187; x=1778066987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U5855hz31Y7sal0t7qD4FX3i6nclNMjvKAZM2P5Bg0s=;
        b=bxI7OvaCYDN2Z+rjznnQthqxNB0i5/+LC9QTbdPQc+LDnzeJtDspo17r+NqrjPMny2
         9/m94eV5MbCoEOG3KzmK8J4gFkWN11lNEVfqVzz9kCXkkg9yFNGdttfgI785r1eCtLxi
         tWNPidEExZI7P2EhYWzQ79JUtMmuhsO7CqOPCwMmoPF2Umass30xo03+cMBSwuhDIuhf
         pMCCZbosKAhy4d6do+jm5leIrfooFUgq07txujKzpA5XbPCkipHdE3A9lmRmW0JMYvTN
         CYt8rjdom/+PXPpQ/DLzUWQ4Zj6ee2CxTwu5wiOLOAKbxY/NAoQfAgacoGKDtnvN2sbS
         vNSw==
X-Forwarded-Encrypted: i=1; AFNElJ/vNiljdQ958RR5i+eOgbRs255MtZ4wt9EqUUC0nNidxDggaP/KPu8N14iu2h4MQlv7Uzyag9wca8FzhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQimHKyCNbMgYhAyKRGLpv+25xa5ECWygz4ngGw+Xajoor+xKe
	Nc7+t5zPKU1xkIMK2MIGGW5xSgN+fHefnE5FAXwHg/31rQP0qnZ8DV7BnXaaQQdZ1yg=
X-Gm-Gg: AeBDietLks2RA/uvJgi/ICXvYyGxQoyvop7786iTMhF8+cGRKJRJb7pzob8iGaUIgdn
	0J0qqblJReBXaDUpIqRnMIilfwt3kSM5vsCC8qbEQL3EOmstBKBGah60a7RePw3bosJA+0Om2Go
	w3GPcDT6jysv7JfSIC0YItb5r+XiBGQgXuflb7+ryW69fIUIGEJJOTX1H+pGhJoxlpi3zhUv+vs
	+Q5BxrEKdp5b/mLxUbWmjLdP1QwdctbOu3znkeapBUfzwTtLyCsrI1CQ8uouZutCm+jSx/Qi193
	Ues4UU0M3IqVuKRrkq9ZuPsogX0TaAid98hnTSx06vzw9nrloi1/35qQDDAFQNsn+aChdr3KPEE
	z8lhSLQno08hb1pmOtTHOre2wcLs7EjFoMl8eYXCmc5UEzJOBFQRl3AvEH/JY3vq7qfLjMkkcgW
	5hRNigaOa2o09LWW0J/9NlpUMKR0x0kMB3ffVOK2BD
X-Received: by 2002:a17:90a:fc4d:b0:35b:e690:c5ad with SMTP id 98e67ed59e1d1-36492064122mr7627259a91.25.1777462187031;
        Wed, 29 Apr 2026 04:29:47 -0700 (PDT)
Received: from [127.0.1.1] ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a41520dbsm1923048a91.3.2026.04.29.04.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 04:29:46 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Date: Wed, 29 Apr 2026 11:29:37 +0000
Subject: [PATCH v7 2/2] hwmon: (pmbus/q54sj108a2) Add support for
 q50sn12072 and q54sn120a1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-add-support-for-q50sn12072-and-q54sn120a1-v7-2-f1f83d2039f7@inventec.com>
References: <20260429-add-support-for-q50sn12072-and-q54sn120a1-v7-0-f1f83d2039f7@inventec.com>
In-Reply-To: <20260429-add-support-for-q50sn12072-and-q54sn120a1-v7-0-f1f83d2039f7@inventec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Brian Chiang <chiang.brian@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777462179; l=15274;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=JlU4Y0cdkIZt0xD+yV2GO3lVXzOlCW9/wsCINaC8wQI=;
 b=g3es5GRaOAv9fipQyaMlripoHsjUuedTi15kmv9rj1JaTm8+z6ejXJ5BN0hQAptYeq5kzqDQn
 v/34Q9n59RbCeM2LuP7e9n8lXrdC6NoWWgL3DIbCOPQzLcVPR+VhooZ
X-Developer-Key: i=chiang.brian@inventec.com; a=ed25519;
 pk=q+NqJYuJbGpA9KS9941D7f+8PVVW+k7DvaGgFykBiUc=

From: Jack Cheng <cheng.jackhy@inventec.com>

The Q50SN12072 and Q54SN120A1 are high-efficiency, high-density DC-DC power
module from Delta Power Modules.

The Q50SN12072, quarter brick, single output 12V. This product provides up
to 1200 watts of output power at 38~60V. The Q50SN12072 offers peak
efficiency up to 98.3%@54Vin.

The Q54SN120A1, quarter brick, single output 12V. This product provides up
to 1300 watts of output power at 40~60V. The Q54SN120A1 offers peak
efficiency up to 98.1%@54Vin.

Add support for them to q54sj108a2 driver.

Signed-off-by: Jack Cheng <cheng.jackhy@inventec.com>
Co-developed-by: Brian Chiang <chiang.brian@inventec.com>
Signed-off-by: Brian Chiang <chiang.brian@inventec.com>
---
 drivers/hwmon/pmbus/q54sj108a2.c | 238 ++++++++++++++++++++++++---------------
 1 file changed, 147 insertions(+), 91 deletions(-)

diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
index d5d60a9af8c5..50539555a74e 100644
--- a/drivers/hwmon/pmbus/q54sj108a2.c
+++ b/drivers/hwmon/pmbus/q54sj108a2.c
@@ -22,7 +22,9 @@
 #define PMBUS_FLASH_KEY_WRITE		0xEC
 
 enum chips {
-	q54sj108a2
+	q50sn12072,
+	q54sj108a2,
+	q54sn120a1
 };
 
 enum {
@@ -55,10 +57,24 @@ struct q54sj108a2_data {
 #define to_psu(x, y) container_of((x), struct q54sj108a2_data, debugfs_entries[(y)])
 
 static struct pmbus_driver_info q54sj108a2_info[] = {
-	[q54sj108a2] = {
+	[q50sn12072] = {
 		.pages = 1,
+		/* Source : Delta Q50SN12072 */
+		.format[PSC_VOLTAGE_OUT] = linear,
+		.format[PSC_TEMPERATURE] = linear,
+		.format[PSC_VOLTAGE_IN] = linear,
+		.format[PSC_CURRENT_OUT] = linear,
 
+		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
+		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
+		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_POUT,
+	},
+	[q54sj108a2] = {
+		.pages = 1,
 		/* Source : Delta Q54SJ108A2 */
+		.format[PSC_VOLTAGE_OUT] = linear,
 		.format[PSC_TEMPERATURE] = linear,
 		.format[PSC_VOLTAGE_IN] = linear,
 		.format[PSC_CURRENT_OUT] = linear,
@@ -69,6 +85,20 @@ static struct pmbus_driver_info q54sj108a2_info[] = {
 		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
 		PMBUS_HAVE_STATUS_INPUT,
 	},
+	[q54sn120a1] = {
+		.pages = 1,
+		/* Source : Delta Q54SN120A1 */
+		.format[PSC_VOLTAGE_OUT] = linear,
+		.format[PSC_TEMPERATURE] = linear,
+		.format[PSC_VOLTAGE_IN] = linear,
+		.format[PSC_CURRENT_OUT] = linear,
+
+		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
+		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
+		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_POUT,
+	},
 };
 
 static ssize_t q54sj108a2_debugfs_read(struct file *file, char __user *buf,
@@ -83,73 +113,77 @@ static ssize_t q54sj108a2_debugfs_read(struct file *file, char __user *buf,
 	char *out = data;
 	char *res;
 
+	rc = pmbus_lock_interruptible(psu->client);
+	if (rc)
+		return rc;
+
 	switch (idx) {
 	case Q54SJ108A2_DEBUGFS_OPERATION:
 		rc = i2c_smbus_read_byte_data(psu->client, PMBUS_OPERATION);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 
 		rc = snprintf(data, 3, "%02x", rc);
 		break;
 	case Q54SJ108A2_DEBUGFS_WRITEPROTECT:
 		rc = i2c_smbus_read_byte_data(psu->client, PMBUS_WRITE_PROTECT);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 
 		rc = snprintf(data, 3, "%02x", rc);
 		break;
 	case Q54SJ108A2_DEBUGFS_VOOV_RESPONSE:
 		rc = i2c_smbus_read_byte_data(psu->client, PMBUS_VOUT_OV_FAULT_RESPONSE);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 
 		rc = snprintf(data, 3, "%02x", rc);
 		break;
 	case Q54SJ108A2_DEBUGFS_IOOC_RESPONSE:
 		rc = i2c_smbus_read_byte_data(psu->client, PMBUS_IOUT_OC_FAULT_RESPONSE);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 
 		rc = snprintf(data, 3, "%02x", rc);
 		break;
 	case Q54SJ108A2_DEBUGFS_PMBUS_VERSION:
 		rc = i2c_smbus_read_byte_data(psu->client, PMBUS_REVISION);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 
 		rc = snprintf(data, 3, "%02x", rc);
 		break;
 	case Q54SJ108A2_DEBUGFS_MFR_ID:
 		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_ID, data);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 		break;
 	case Q54SJ108A2_DEBUGFS_MFR_MODEL:
 		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_MODEL, data);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 		break;
 	case Q54SJ108A2_DEBUGFS_MFR_REVISION:
 		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_REVISION, data);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 		break;
 	case Q54SJ108A2_DEBUGFS_MFR_LOCATION:
 		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_LOCATION, data);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 		break;
 	case Q54SJ108A2_DEBUGFS_BLACKBOX_READ_OFFSET:
 		rc = i2c_smbus_read_byte_data(psu->client, READ_HISTORY_EVENT_NUMBER);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 
 		rc = snprintf(data, 3, "%02x", rc);
 		break;
 	case Q54SJ108A2_DEBUGFS_BLACKBOX_READ:
 		rc = i2c_smbus_read_block_data(psu->client, READ_HISTORY_EVENTS, data);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 
 		res = bin2hex(data_char, data, rc);
 		rc = res - data_char;
@@ -158,16 +192,22 @@ static ssize_t q54sj108a2_debugfs_read(struct file *file, char __user *buf,
 	case Q54SJ108A2_DEBUGFS_FLASH_KEY:
 		rc = i2c_smbus_read_block_data(psu->client, PMBUS_FLASH_KEY_WRITE, data);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 
 		res = bin2hex(data_char, data, rc);
 		rc = res - data_char;
 		out = data_char;
 		break;
 	default:
-		return -EINVAL;
+		rc = -EINVAL;
+		goto unlock;
 	}
 
+unlock:
+	pmbus_unlock(psu->client);
+	if (rc < 0)
+		return rc;
+
 	out[rc] = '\n';
 	rc += 2;
 
@@ -183,27 +223,51 @@ static ssize_t q54sj108a2_debugfs_write(struct file *file, const char __user *bu
 	int *idxp = file->private_data;
 	int idx = *idxp;
 	struct q54sj108a2_data *psu = to_psu(idxp, idx);
+	int original_wp;
+	int rc_restore;
 
-	rc = i2c_smbus_write_byte_data(psu->client, PMBUS_WRITE_PROTECT, 0);
-	if (rc)
-		return rc;
-
+	/*
+	 * Parse user input before acquiring the PMBus lock. Since calling
+	 * kstrtou8_from_user() while holding pmbus_lock_interruptible()
+	 * may introduce a denial of service risk.
+	 */
 	switch (idx) {
 	case Q54SJ108A2_DEBUGFS_OPERATION:
+	case Q54SJ108A2_DEBUGFS_VOOV_RESPONSE:
+	case Q54SJ108A2_DEBUGFS_IOOC_RESPONSE:
+	case Q54SJ108A2_DEBUGFS_BLACKBOX_SET_OFFSET:
 		rc = kstrtou8_from_user(buf, count, 0, &dst_data);
 		if (rc < 0)
 			return rc;
+		break;
+	case Q54SJ108A2_DEBUGFS_CLEARFAULT:
+	case Q54SJ108A2_DEBUGFS_STOREDEFAULT:
+	case Q54SJ108A2_DEBUGFS_BLACKBOX_ERASE:
+		break;
+	default:
+		return -EINVAL;
+	}
 
-		rc = i2c_smbus_write_byte_data(psu->client, PMBUS_OPERATION, dst_data);
-		if (rc < 0)
-			return rc;
+	rc = pmbus_lock_interruptible(psu->client);
+	if (rc)
+		return rc;
+
+	original_wp = i2c_smbus_read_byte_data(psu->client, PMBUS_WRITE_PROTECT);
+	if (original_wp < 0) {
+		rc = original_wp;
+		goto unlock;
+	}
+
+	rc = i2c_smbus_write_byte_data(psu->client, PMBUS_WRITE_PROTECT, 0);
+	if (rc < 0)
+		goto unlock;
 
+	switch (idx) {
+	case Q54SJ108A2_DEBUGFS_OPERATION:
+		rc = i2c_smbus_write_byte_data(psu->client, PMBUS_OPERATION, dst_data);
 		break;
 	case Q54SJ108A2_DEBUGFS_CLEARFAULT:
 		rc = i2c_smbus_write_byte(psu->client, PMBUS_CLEAR_FAULTS);
-		if (rc < 0)
-			return rc;
-
 		break;
 	case Q54SJ108A2_DEBUGFS_STOREDEFAULT:
 		flash_key[0] = 0x7E;
@@ -212,52 +276,35 @@ static ssize_t q54sj108a2_debugfs_write(struct file *file, const char __user *bu
 		flash_key[3] = 0x42;
 		rc = i2c_smbus_write_block_data(psu->client, PMBUS_FLASH_KEY_WRITE, 4, flash_key);
 		if (rc < 0)
-			return rc;
-
+			break;
 		rc = i2c_smbus_write_byte(psu->client, STORE_DEFAULT_ALL);
-		if (rc < 0)
-			return rc;
-
 		break;
 	case Q54SJ108A2_DEBUGFS_VOOV_RESPONSE:
-		rc = kstrtou8_from_user(buf, count, 0, &dst_data);
-		if (rc < 0)
-			return rc;
-
 		rc = i2c_smbus_write_byte_data(psu->client, PMBUS_VOUT_OV_FAULT_RESPONSE, dst_data);
-		if (rc < 0)
-			return rc;
-
 		break;
 	case Q54SJ108A2_DEBUGFS_IOOC_RESPONSE:
-		rc = kstrtou8_from_user(buf, count, 0, &dst_data);
-		if (rc < 0)
-			return rc;
-
 		rc = i2c_smbus_write_byte_data(psu->client, PMBUS_IOUT_OC_FAULT_RESPONSE, dst_data);
-		if (rc < 0)
-			return rc;
-
 		break;
 	case Q54SJ108A2_DEBUGFS_BLACKBOX_ERASE:
 		rc = i2c_smbus_write_byte(psu->client, ERASE_BLACKBOX_DATA);
-		if (rc < 0)
-			return rc;
-
 		break;
 	case Q54SJ108A2_DEBUGFS_BLACKBOX_SET_OFFSET:
-		rc = kstrtou8_from_user(buf, count, 0, &dst_data);
-		if (rc < 0)
-			return rc;
-
 		rc = i2c_smbus_write_byte_data(psu->client, SET_HISTORY_EVENT_OFFSET, dst_data);
-		if (rc < 0)
-			return rc;
-
 		break;
-	default:
-		return -EINVAL;
 	}
+	/*
+	 * Always restore WRITE_PROTECT and preserve the original error in
+	 * rc; only surface the restore failure if the operation itself was
+	 * successful.
+	 */
+	rc_restore = i2c_smbus_write_byte_data(psu->client, PMBUS_WRITE_PROTECT, original_wp);
+	if (rc_restore < 0 && rc >= 0)
+		rc = rc_restore;
+
+unlock:
+	pmbus_unlock(psu->client);
+	if (rc < 0)
+		return rc;
 
 	return count;
 }
@@ -270,7 +317,9 @@ static const struct file_operations q54sj108a2_fops = {
 };
 
 static const struct i2c_device_id q54sj108a2_id[] = {
+	{ "q50sn12072", q50sn12072 },
 	{ "q54sj108a2", q54sj108a2 },
+	{ "q54sn120a1", q54sn120a1 },
 	{ },
 };
 
@@ -280,6 +329,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
+	const struct i2c_device_id *mid;
 	enum chips chip_id;
 	int ret, i;
 	struct dentry *debugfs;
@@ -292,14 +342,9 @@ static int q54sj108a2_probe(struct i2c_client *client)
 				     I2C_FUNC_SMBUS_BLOCK_DATA))
 		return -ENODEV;
 
-	if (client->dev.of_node)
-		chip_id = (enum chips)(unsigned long)of_device_get_match_data(dev);
-	else
-		chip_id = i2c_match_id(q54sj108a2_id, client)->driver_data;
-
 	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
 	if (ret < 0) {
-		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
+		dev_err(dev, "Failed to read Manufacturer ID\n");
 		return ret;
 	}
 	if (ret != 6 || strncmp(buf, "DELTA", 5)) {
@@ -308,19 +353,25 @@ static int q54sj108a2_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	/*
-	 * The chips support reading PMBUS_MFR_MODEL.
-	 */
 	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
 	if (ret < 0) {
 		dev_err(dev, "Failed to read Manufacturer Model\n");
 		return ret;
 	}
-	if (ret != 14 || strncmp(buf, "Q54SJ108A2", 10)) {
-		buf[ret] = '\0';
+	buf[ret] = '\0';
+	for (mid = q54sj108a2_id; mid->name[0]; mid++) {
+		if (!strncasecmp(mid->name, buf, strlen(mid->name)))
+			break;
+	}
+	if (!mid->name[0]) {
 		dev_err(dev, "Unsupported Manufacturer Model '%s'\n", buf);
 		return -ENODEV;
 	}
+	chip_id = mid->driver_data;
+
+	if (strcmp(client->name, mid->name) != 0)
+		dev_notice(dev, "Device mismatch: Configured %s, detected %s\n",
+			   client->name, mid->name);
 
 	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_REVISION, buf);
 	if (ret < 0) {
@@ -333,16 +384,17 @@ static int q54sj108a2_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	ret = pmbus_do_probe(client, &q54sj108a2_info[chip_id]);
-	if (ret)
-		return ret;
-
 	psu = devm_kzalloc(&client->dev, sizeof(*psu), GFP_KERNEL);
 	if (!psu)
 		return 0;
 
+	psu->chip = chip_id;
 	psu->client = client;
 
+	ret = pmbus_do_probe(client, &q54sj108a2_info[chip_id]);
+	if (ret)
+		return ret;
+
 	debugfs = pmbus_get_debugfs_dir(client);
 
 	q54sj108a2_dir = debugfs_create_dir(client->name, debugfs);
@@ -359,9 +411,6 @@ static int q54sj108a2_probe(struct i2c_client *client)
 	debugfs_create_file("write_protect", 0444, q54sj108a2_dir,
 			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_WRITEPROTECT],
 			    &q54sj108a2_fops);
-	debugfs_create_file("store_default", 0200, q54sj108a2_dir,
-			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_STOREDEFAULT],
-			    &q54sj108a2_fops);
 	debugfs_create_file("vo_ov_response", 0644, q54sj108a2_dir,
 			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_VOOV_RESPONSE],
 			    &q54sj108a2_fops);
@@ -383,27 +432,34 @@ static int q54sj108a2_probe(struct i2c_client *client)
 	debugfs_create_file("mfr_location", 0444, q54sj108a2_dir,
 			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_MFR_LOCATION],
 			    &q54sj108a2_fops);
-	debugfs_create_file("blackbox_erase", 0200, q54sj108a2_dir,
-			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_ERASE],
-			    &q54sj108a2_fops);
-	debugfs_create_file("blackbox_read_offset", 0444, q54sj108a2_dir,
-			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_READ_OFFSET],
-			    &q54sj108a2_fops);
-	debugfs_create_file("blackbox_set_offset", 0200, q54sj108a2_dir,
-			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_SET_OFFSET],
-			    &q54sj108a2_fops);
-	debugfs_create_file("blackbox_read", 0444, q54sj108a2_dir,
-			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_READ],
-			    &q54sj108a2_fops);
-	debugfs_create_file("flash_key", 0444, q54sj108a2_dir,
-			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_FLASH_KEY],
-			    &q54sj108a2_fops);
+	if (psu->chip == q54sj108a2) {
+		debugfs_create_file("store_default", 0200, q54sj108a2_dir,
+				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_STOREDEFAULT],
+				    &q54sj108a2_fops);
+		debugfs_create_file("blackbox_erase", 0200, q54sj108a2_dir,
+				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_ERASE],
+				    &q54sj108a2_fops);
+		debugfs_create_file("blackbox_read_offset", 0444, q54sj108a2_dir,
+				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_READ_OFFSET],
+				    &q54sj108a2_fops);
+		debugfs_create_file("blackbox_read", 0444, q54sj108a2_dir,
+				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_READ],
+				    &q54sj108a2_fops);
+		debugfs_create_file("blackbox_set_offset", 0200, q54sj108a2_dir,
+				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_SET_OFFSET],
+				    &q54sj108a2_fops);
+		debugfs_create_file("flash_key", 0444, q54sj108a2_dir,
+				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_FLASH_KEY],
+				    &q54sj108a2_fops);
+	}
 
 	return 0;
 }
 
 static const struct of_device_id q54sj108a2_of_match[] = {
-	{ .compatible = "delta,q54sj108a2", .data = (void *)q54sj108a2 },
+	{ .compatible = "delta,q50sn12072" },
+	{ .compatible = "delta,q54sj108a2" },
+	{ .compatible = "delta,q54sn120a1" },
 	{ },
 };
 
@@ -421,6 +477,6 @@ static struct i2c_driver q54sj108a2_driver = {
 module_i2c_driver(q54sj108a2_driver);
 
 MODULE_AUTHOR("Xiao.Ma <xiao.mx.ma@deltaww.com>");
-MODULE_DESCRIPTION("PMBus driver for Delta Q54SJ108A2 series modules");
+MODULE_DESCRIPTION("PMBus driver for Delta Q54SJ108A2 and compatibles");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("PMBUS");

-- 
2.43.0

