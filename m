Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C323043DE
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 13:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532917; cv=none; b=F+JYjDvER2jDnPnKCho4xdsjhOEBl5EjqiIxYHPwTeCENlg9y/CdmlMOOGyBWfBIYcRWt125O4VUbPBye0PAXHs/wGYLjtNbuvSPQNeo+eYeEEik20keVG9aZavtQMeyiZ2IBi7cLFFda4erEW5uWfWjvmhsUE/Yj3j5MkP8BCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532917; c=relaxed/simple;
	bh=cR8AuliDwGMd7SkLiVsgXWd5m8KP6QBBfEHWMLQ5h5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eGFp53OMZUljnjUBCYjCUr0WrlzngoeVDIGSIY18/T7S4XFqBgnrR4qlzQ8W8kn+MlVekmviiP5fqqCwQPj1eWDkNrqx3yqDo093wOeKASJwQl8AUwhTMEZAdpX4nC7WUb2lqdM6R8Lbldh98h1xh9YpsL3ob+CY6gIXnkKvdZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=B+BoPyLz; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="B+BoPyLz"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c742bc88d87so446648a12.1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 06:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1774532915; x=1775137715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZ2qtiQKchOdrxNxTqVNhWG/CGjQa4vu3Qzgtzd8CDA=;
        b=B+BoPyLztH5YNa4VPNkLHeXtiG2Q8g/iBAtoR1euTDJczc6ND0JvUy5jY/ZNqfcGE6
         HVBBwYrnU9rzSAVy+zbiPlDFQhu2lZgR7TtteGQrLB93NTBX1oF7HoZEVhZZUcycXieH
         VEZo09KMi/8i2udBZDqleW9DIksVN9WZTxluOwMTsqYBR99SCHNMRNNnF4KNkJUEjd3P
         LMED58+OrVn+f9mUYmDwI/QMq0RoAygauRW2ESc3jvdjy3xQYtAvuPFcUoXMMKebXY+5
         6202NpP5CqhzBP3C8Qfgky5SSel1YlnwN5ggyTM/P9mHl/dDu4wc5A+ZuyELZ1DFdOfY
         VmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774532915; x=1775137715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DZ2qtiQKchOdrxNxTqVNhWG/CGjQa4vu3Qzgtzd8CDA=;
        b=RSSf/ce4+6gXCX8E/rgvkS7+XLnt/4PAF9WLsCf6Tw1C937VMivkiszwgsv5cJO18Z
         5hkApK4ZJjprLRFAGf0RUL1sWmWGLvUPSffwJRyuybjllZ0YRMpi0p4P47SqIHsO6SLj
         bT/RIGKgmiR5dVZN518qV1eud/Q1XKfRnyrovt/Nv5dMEraDM0Iwzz2Nz2LHEksPMq9E
         nl1hks/dKT+39HEmVL8HIRMJHHiZjwyZoRuf0EL9JOH7aXcd2iIMwAtKjSPqLNIJp3+H
         uZxTu77Kkk8B0AfizQlwxMq9VQbNMhxbsdvn77qAv1H4pjoquxI6gN48bHju2ihojNEm
         M5yg==
X-Forwarded-Encrypted: i=1; AJvYcCWmqGVtuZyk60XVfVJmpdHEspAip+O272JEmFtjbKyGyOe4kcdJ9wTNXvkR1mafJoKZcTANquYrR8x6Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaiUsLXbLxc9pMNYggFPy3kM0xNIgWJMZKVyeizq4ZVhjSqWrj
	JeIlhM6lYXvRrPATrUx1ZdeXd0Em4jyMbo3glK7ZHIOsL7e8FtRW9Xolv/IJMvEByLw=
X-Gm-Gg: ATEYQzyJ7yVeSff9eVjhiJSQtIDbcsuIzVCQ0RjKxdk3ymfarL5HyV0DnSu9lFFatDz
	xyS2JPVmpMzef42joK90Z1gYuyJAx1Ld/bwJklM6uvH7gG7S53GtvdN4vxhUZBhAVXtkiAyNRFK
	3UbUzkksTn+K3mHDQ9bGWaXImZT1qnyoQMyNPk/UJ5EsnM972fzzxcrrOOZN+UyXzjho5izjVRK
	/HqDV026gCqNEAYZnxXqJwn6Essk+VtVnMdxiTIoujHy8uhf+sTYv0srZkDB832NDVlxWX0A2TF
	qsT5HIBZ7V9JvXn3i/IMTtdg43bxNZtzzGPYy0cqw0ocxQGCns9yDJ5MUm4LykmBxudjFcU2arC
	A7kiwL9MqgR6oc9gfh7VGi1c1BiW/+gRZHdk5rSC5HaAOgosLrJFKg0xAAohrnkEmkHcd9EocEJ
	oGEb76SapakDeWcVRQxqU1O1orYln7AF1vCteIwK9+X1R3zAjKN093dDhO9p3MN84=
X-Received: by 2002:a05:6a21:6d88:b0:398:7137:272a with SMTP id adf61e73a8af0-39c4ad62945mr7685205637.32.1774532914929;
        Thu, 26 Mar 2026 06:48:34 -0700 (PDT)
Received: from [127.0.1.1] (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76737f28d6sm2706683a12.6.2026.03.26.06.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 06:48:34 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Date: Thu, 26 Mar 2026 13:48:06 +0000
Subject: [PATCH v2 2/2] hwmon: (pmbus/q54sj108a2) Add support for
 q50sn12072 and q54sn120a1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-add-support-for-q50sn12072-and-q54sn120a1-v2-2-77bc77eedc76@inventec.com>
References: <20260326-add-support-for-q50sn12072-and-q54sn120a1-v2-0-77bc77eedc76@inventec.com>
In-Reply-To: <20260326-add-support-for-q50sn12072-and-q54sn120a1-v2-0-77bc77eedc76@inventec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Brian Chiang <chiang.brian@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774532898; l=8151;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=91SYENlkxjgb2yRLOz3F7wtT3gaDUEKatWNsA79N0sQ=;
 b=wUioQLtnRcHNuvbU6fad4V+4R+2IcmvnoUQrqux5maoE53EnMvhVCSIdRkpQJP96izPfr9zMS
 sLBRcuucUWDA7ACTdSxOixR8LQEs5bkOzj7n1147yeBgtDbv+tRdVRg
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
 drivers/hwmon/pmbus/q54sj108a2.c | 97 ++++++++++++++++++++++++++++------------
 1 file changed, 68 insertions(+), 29 deletions(-)

diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
index d5d60a9af8c5..cc2b32ad935c 100644
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
@@ -270,7 +300,9 @@ static const struct file_operations q54sj108a2_fops = {
 };
 
 static const struct i2c_device_id q54sj108a2_id[] = {
+	{ "q50sn12072", q50sn12072 },
 	{ "q54sj108a2", q54sj108a2 },
+	{ "q54sn120a1", q54sn120a1 },
 	{ },
 };
 
@@ -280,6 +312,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
+	const struct i2c_device_id *mid;
 	enum chips chip_id;
 	int ret, i;
 	struct dentry *debugfs;
@@ -292,14 +325,9 @@ static int q54sj108a2_probe(struct i2c_client *client)
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
@@ -308,19 +336,25 @@ static int q54sj108a2_probe(struct i2c_client *client)
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
+	for (mid = q54sj108a2_id; mid->name[0]; mid++) {
+		if (ret == strlen(mid->name) && !strncasecmp(mid->name, buf, ret))
+			break;
+	}
+	if (!mid->name[0]) {
 		buf[ret] = '\0';
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
@@ -341,6 +375,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
 	if (!psu)
 		return 0;
 
+	psu->chip = chip_id;
 	psu->client = client;
 
 	debugfs = pmbus_get_debugfs_dir(client);
@@ -359,9 +394,6 @@ static int q54sj108a2_probe(struct i2c_client *client)
 	debugfs_create_file("write_protect", 0444, q54sj108a2_dir,
 			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_WRITEPROTECT],
 			    &q54sj108a2_fops);
-	debugfs_create_file("store_default", 0200, q54sj108a2_dir,
-			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_STOREDEFAULT],
-			    &q54sj108a2_fops);
 	debugfs_create_file("vo_ov_response", 0644, q54sj108a2_dir,
 			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_VOOV_RESPONSE],
 			    &q54sj108a2_fops);
@@ -383,27 +415,34 @@ static int q54sj108a2_probe(struct i2c_client *client)
 	debugfs_create_file("mfr_location", 0444, q54sj108a2_dir,
 			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_MFR_LOCATION],
 			    &q54sj108a2_fops);
-	debugfs_create_file("blackbox_erase", 0200, q54sj108a2_dir,
-			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_ERASE],
-			    &q54sj108a2_fops);
 	debugfs_create_file("blackbox_read_offset", 0444, q54sj108a2_dir,
 			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_READ_OFFSET],
 			    &q54sj108a2_fops);
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
+		debugfs_create_file("blackbox_set_offset", 0200, q54sj108a2_dir,
+				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_SET_OFFSET],
+				    &q54sj108a2_fops);
+		debugfs_create_file("blackbox_read", 0444, q54sj108a2_dir,
+				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_READ],
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
 
@@ -421,6 +460,6 @@ static struct i2c_driver q54sj108a2_driver = {
 module_i2c_driver(q54sj108a2_driver);
 
 MODULE_AUTHOR("Xiao.Ma <xiao.mx.ma@deltaww.com>");
-MODULE_DESCRIPTION("PMBus driver for Delta Q54SJ108A2 series modules");
+MODULE_DESCRIPTION("PMBus driver for Delta Q54SJ108A2 and compatibles");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("PMBUS");

-- 
2.43.0

