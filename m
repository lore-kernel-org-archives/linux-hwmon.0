Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9134338F620
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Apr 2026 06:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777272151; cv=none; b=qW3/JKYn3KMunqXmq+Ii5CWKFMgqDsSeHptO89Lh92V8xHbze/6HCEnlmFMYUnRCXLXOIAgriovf9ryUcB3BVJvbV4h+KEUkJtr/TFd4bfpqIAF3IE+of/56ISEiTHM1LA5SMNtT8B/CU2ZMJ1o5MuL/WxRPEjWEWuUBZHQORK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777272151; c=relaxed/simple;
	bh=Ny6rp8VtXr10LNqRWUYK1VpFIJ0kxq24YYeGC5YBhAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YaXUuzLf2QUS19FJeLip2n5aUShlzcLugHigbZYIlNd4IiY9IUqPR8NZ0mw2zzR6kN10WNxE8slnzKS1ZnVZQLG+RakvP4uJe6EtekF7uCiT8BvUtb6mF0SGbRxcwKox15VxYd9+He/RO/D/yxBJPnByTu0m4knUvQo4IEUW3gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=Kjh56sxU; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="Kjh56sxU"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-83178c0f29cso2570882b3a.0
        for <linux-hwmon@vger.kernel.org>; Sun, 26 Apr 2026 23:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1777272149; x=1777876949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9x3Y2ZupitOhxEU0o8FW/3iRu0wU8R9ZhiH2l9hHnI0=;
        b=Kjh56sxUzFZQbOR42+UgjDpg5z1rBYOuxQw65Q5sEjDSfFUiLfzdHsA6Mti7mSTf8J
         A7eWo+qt7Cdb8vExWIiUCkRqeUgnz+gKIrhnfTj0T1c8gOHT4pa0C/Uo/X5XI8JsJCX9
         Yd0TrHwizJ8mGtZcefmfhHawDUtY6c5gfhWXSddPlCoNekRNjJy5gn02SGtPcPDl8reO
         Vxc4iSMCM9YdQbMpIHsLOFJJuM2HddGQG4jVK4w1964tWRn4j3CjJhMHhhulutOMXBnI
         xN5KVxNOm7xRbDGl8dpsG1SaiT3mH9ORfeYCXPB4+eEjxrD8x1hWnhSkJGEVG9505Spd
         LNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777272149; x=1777876949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9x3Y2ZupitOhxEU0o8FW/3iRu0wU8R9ZhiH2l9hHnI0=;
        b=bEKNl9kAF5oGv4YMwixVxN+7sIgviY29cgfCixETAIjOKWPw+s8sFMjffQun7MQ0XQ
         Gy3umijvO/zGH2wY/xfjV5cCCpfisEi7RB/xkJJLTXPX57xLKIzIh4dXn/IKEwT2ofku
         E5jjNTW3EOE3kI5DUL/1hPka4B5SPQ2EY5pop/t3B9/wCKvhKlm8QRRr8ezywsRNmGK4
         2SaKQ4ldvIwXs0XtmmvOzyzOmgrs7mmbUDaYeBvaoH7u7UO8DRt8eDx07VPM/vPSn1pp
         PVq7RhVy+rngCV3LdK4II5qCA5j9bj9idtG0GzuPtJeUMB6jUTCFVxjX+pJtGcycw3p3
         P/ug==
X-Forwarded-Encrypted: i=1; AFNElJ+5ELywmoF9F3FwLciQ6LRY4Ohyl/lOB2dfnpecVXseiOE54502uCc/HeqMQsZUplj34c3KXaUn9mAdHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI/nxjkSyN+8VxNY6EDYaBPRuxpJttTa/NZUmzwH7W/QJuNa42
	VmcUdrimjIcdsqRWGjOaTrAw44U6TaztlLPKKBQtM6mK/HXcdoNa3MXyW9LkWqdbkEs=
X-Gm-Gg: AeBDieuGcDOsvKdB0fmFjiNq63mLKOxLX8cMUPsExJXddD6uGU1mwmuOEkeoXP4Sgp2
	vCMEsFdszRP+9GgyNtSgACKx7ie8PZJ7kJ1BDWSUL2oxMpIhuLd5QL610moXL5PCUZ38cuhawt+
	Yc6uzkALp91StOnfhYtXd4vrUSpypKCbK2KC/T+hBOBonDHh7BHfA8hAqsxZzOIQ08Ng+rhaHks
	88vLSWOqj/cH4zMgvmBr8LsKizislIyeI2TIkBuFxpFfP2KhRNTnXEL2ZMNwqX/P64Jzh2D/lal
	U1Y7vnJLTrTCpNY/BS08l0KC6FfoCsBpRiraJnSmntpNi7rK8ebUvbGQ4YvxxQPYk6A1x227zhd
	6UxVEWCDp1nD3xbFU1h+f0sZ4IoiuCRQYtzptcZ24uALPOVjAJKfMncs6gc13S3gCeuqdIcqksB
	aKC8QYYq15gFMNRNSj4U0D1QuwsDtywXEelLpwJagwkqcPcIF3jBss/Sn3CCs7EiAP+0TcS8mAV
	6eO
X-Received: by 2002:a05:6a00:2ea8:b0:82f:807:ed7f with SMTP id d2e1a72fcca58-82f8c8c239cmr44293726b3a.24.1777272149077;
        Sun, 26 Apr 2026 23:42:29 -0700 (PDT)
Received: from [127.0.1.1] (59-120-179-172.hinet-ip.hinet.net. [59.120.179.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm32209315b3a.56.2026.04.26.23.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:42:28 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Date: Mon, 27 Apr 2026 06:42:19 +0000
Subject: [PATCH v6 2/2] hwmon: (pmbus/q54sj108a2) Add support for
 q50sn12072 and q54sn120a1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-add-support-for-q50sn12072-and-q54sn120a1-v6-2-ffa77bfa65e7@inventec.com>
References: <20260427-add-support-for-q50sn12072-and-q54sn120a1-v6-0-ffa77bfa65e7@inventec.com>
In-Reply-To: <20260427-add-support-for-q50sn12072-and-q54sn120a1-v6-0-ffa77bfa65e7@inventec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Brian Chiang <chiang.brian@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777272142; l=13936;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=zL9IAMgfrDjYm69CQT4Hu56m1ws5BQxSRoSUIUNzHas=;
 b=kukLX2TI/I2GcnEoVPJV50WJ2QAfDkOfUTVaRKeC/UILE4jsQRtZ9Pd4IjQ0y5/8mtrLKyQ9C
 4DTrfWCRf0bC+xda+cBPMyFHDRwDMiLsIB6HzCJoPwHB4tetrPO6Bgk
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
 drivers/hwmon/pmbus/q54sj108a2.c | 179 ++++++++++++++++++++++++++-------------
 1 file changed, 119 insertions(+), 60 deletions(-)

diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
index d5d60a9af8c5..b59cfee861f2 100644
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
 
@@ -184,25 +224,29 @@ static ssize_t q54sj108a2_debugfs_write(struct file *file, const char __user *bu
 	int idx = *idxp;
 	struct q54sj108a2_data *psu = to_psu(idxp, idx);
 
-	rc = i2c_smbus_write_byte_data(psu->client, PMBUS_WRITE_PROTECT, 0);
+	rc = pmbus_lock_interruptible(psu->client);
 	if (rc)
 		return rc;
 
+	rc = i2c_smbus_write_byte_data(psu->client, PMBUS_WRITE_PROTECT, 0);
+	if (rc)
+		goto unlock;
+
 	switch (idx) {
 	case Q54SJ108A2_DEBUGFS_OPERATION:
 		rc = kstrtou8_from_user(buf, count, 0, &dst_data);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 
 		rc = i2c_smbus_write_byte_data(psu->client, PMBUS_OPERATION, dst_data);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 
 		break;
 	case Q54SJ108A2_DEBUGFS_CLEARFAULT:
 		rc = i2c_smbus_write_byte(psu->client, PMBUS_CLEAR_FAULTS);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 
 		break;
 	case Q54SJ108A2_DEBUGFS_STOREDEFAULT:
@@ -212,53 +256,59 @@ static ssize_t q54sj108a2_debugfs_write(struct file *file, const char __user *bu
 		flash_key[3] = 0x42;
 		rc = i2c_smbus_write_block_data(psu->client, PMBUS_FLASH_KEY_WRITE, 4, flash_key);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 
 		rc = i2c_smbus_write_byte(psu->client, STORE_DEFAULT_ALL);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 
 		break;
 	case Q54SJ108A2_DEBUGFS_VOOV_RESPONSE:
 		rc = kstrtou8_from_user(buf, count, 0, &dst_data);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 
 		rc = i2c_smbus_write_byte_data(psu->client, PMBUS_VOUT_OV_FAULT_RESPONSE, dst_data);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 
 		break;
 	case Q54SJ108A2_DEBUGFS_IOOC_RESPONSE:
 		rc = kstrtou8_from_user(buf, count, 0, &dst_data);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 
 		rc = i2c_smbus_write_byte_data(psu->client, PMBUS_IOUT_OC_FAULT_RESPONSE, dst_data);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 
 		break;
 	case Q54SJ108A2_DEBUGFS_BLACKBOX_ERASE:
 		rc = i2c_smbus_write_byte(psu->client, ERASE_BLACKBOX_DATA);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 
 		break;
 	case Q54SJ108A2_DEBUGFS_BLACKBOX_SET_OFFSET:
 		rc = kstrtou8_from_user(buf, count, 0, &dst_data);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 
 		rc = i2c_smbus_write_byte_data(psu->client, SET_HISTORY_EVENT_OFFSET, dst_data);
 		if (rc < 0)
-			return rc;
+			goto unlock;
 
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
 	return count;
 }
 
@@ -270,7 +320,9 @@ static const struct file_operations q54sj108a2_fops = {
 };
 
 static const struct i2c_device_id q54sj108a2_id[] = {
+	{ "q50sn12072", q50sn12072 },
 	{ "q54sj108a2", q54sj108a2 },
+	{ "q54sn120a1", q54sn120a1 },
 	{ },
 };
 
@@ -280,6 +332,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
+	const struct i2c_device_id *mid;
 	enum chips chip_id;
 	int ret, i;
 	struct dentry *debugfs;
@@ -292,14 +345,9 @@ static int q54sj108a2_probe(struct i2c_client *client)
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
@@ -308,19 +356,25 @@ static int q54sj108a2_probe(struct i2c_client *client)
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
@@ -341,6 +395,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
 	if (!psu)
 		return 0;
 
+	psu->chip = chip_id;
 	psu->client = client;
 
 	debugfs = pmbus_get_debugfs_dir(client);
@@ -359,9 +414,6 @@ static int q54sj108a2_probe(struct i2c_client *client)
 	debugfs_create_file("write_protect", 0444, q54sj108a2_dir,
 			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_WRITEPROTECT],
 			    &q54sj108a2_fops);
-	debugfs_create_file("store_default", 0200, q54sj108a2_dir,
-			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_STOREDEFAULT],
-			    &q54sj108a2_fops);
 	debugfs_create_file("vo_ov_response", 0644, q54sj108a2_dir,
 			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_VOOV_RESPONSE],
 			    &q54sj108a2_fops);
@@ -383,27 +435,34 @@ static int q54sj108a2_probe(struct i2c_client *client)
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
 
@@ -421,6 +480,6 @@ static struct i2c_driver q54sj108a2_driver = {
 module_i2c_driver(q54sj108a2_driver);
 
 MODULE_AUTHOR("Xiao.Ma <xiao.mx.ma@deltaww.com>");
-MODULE_DESCRIPTION("PMBus driver for Delta Q54SJ108A2 series modules");
+MODULE_DESCRIPTION("PMBus driver for Delta Q54SJ108A2 and compatibles");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("PMBUS");

-- 
2.43.0

