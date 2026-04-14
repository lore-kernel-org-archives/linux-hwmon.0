Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB499302756
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Apr 2026 06:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776149936; cv=none; b=IDEG7BxzN6ecRtVIbYdYTAQbcYZIcPZyE2hhAU3LM1jjcb+Tsr0cg87YVyW184NdLe3o96p54ENGU/+RCQLtj/NAKcIBPiqbyLWxK8zcDGMOBtRV2s5bLocHkIBXmbXK6HwctFAYALU26OY2FDvRAyPeRJ+8XqQ0hmaSjDRao0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776149936; c=relaxed/simple;
	bh=2fDvceWZH0uVoiXI+idreB4J3EIIZl8vYZyKQA+B/1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gyzPcjFdG58Vy+6q/s5fhOHGnJMNiMT+r/LcSTnj6fulA7rt6Az3eO3+WL8FsWp+Gibm7SlogWaIzYNuBeqc6Jr75QcRCANosyM0X8+cvNWL7xDNV/obbYAwuiU8sfmvre1Fd9YP3xXqHCpWcz8+w/QekXkVoLDVklQjVT8g8sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=JYRCK/cr; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="JYRCK/cr"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35fc0d7c310so698809a91.1
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Apr 2026 23:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1776149934; x=1776754734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnhWm4BJIe1qz1PKqfhPExcXSRC6Iyeb59/CaItSdTg=;
        b=JYRCK/crSaCIwqYKRjU6rPKwKB2IKTkei8gPyjIVc8n8De612cB8sRu9NUR9GvzQHg
         A1Vzf9XR9NGfLgqP2O4v5ZZnJBSQ6qFFh3O1bD2JvvYjL/9n5eA4my+ZcUPAhhDnj99X
         0Bw7pZpMMNACmfLtCE1RoG62n0X+J7MmG3czc0/m+1tBo0uz+O0m/GpYNipX1eDSEZBt
         /+uWIq5RmhP9d9LYpVlV8nmKJGhfbI10UyZGM74P/ZHQJNSWVhmvK9BKumge5DXtpLBd
         mbrGAADN8T/EkhsapueEtOnPPF3f0L5FupiQ3GwauNvgzcDnS5ViXXbAhnZICP2LoJjk
         hAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776149934; x=1776754734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qnhWm4BJIe1qz1PKqfhPExcXSRC6Iyeb59/CaItSdTg=;
        b=MKK/z/CXWMArb+NoaX2J8+vMEhfyc4UyNP4VKm8rgC6xazZ4In5v3R9F457feRA8gV
         RSHr5o7N8Uy1ldB95BDQ8OrlDmAtjMWDDR/f7sdTMq60QehmVuvzFn1w/Zdd8wfPDded
         ux3EJxK4iBtVAbm89fayTFL+APRDXEJvlded+tsLqetkVw3N99BhL1gX3l6fPT8Z43iN
         aBgR1rBk16b4+BUj72hQORHxlOWPbadvKnWWZHhl/ep/1+OjIwDtfuworDXrGOZHICRB
         RkVS2R440Dbn1cD5JQtsN6n/W/CMU1L7CzP2jUE6Ue2yQETyo9s246UyH0MOLzUnNkyB
         Pi8A==
X-Forwarded-Encrypted: i=1; AFNElJ+N2nHyjdIe0n7bkGLDGFOJCYYG8bakQY8l8k4ID2qVNN3ypkOb03p+96Vo26trAwIjBOV0Ux3a9RtYKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQAfSrMrnaorR7X7tNJidKzUP/EQ+/er6TFVt3bf+3AtMYB3Vy
	Vz7iMS8ml2ntbyt7uhDESvXTsPdRKlEoZXq8LHuELX8iiYk3zDGqz2v27PMa/KcBSOM=
X-Gm-Gg: AeBDievNwaew1kNQ7trKJoNMiy5XEDyrOLFWr6ZyAvocQb89LYA4gcQk4M5KWykEw5V
	8i3MixjWG/KFpfr1GRboHlmmP3Vh6vK71eH3qaWY04PHszH51lpmftPhtb8RWpJXIdbLJrSWZRC
	CEGTENd7Wh6dSEv2hLO5X/sRlIrbNvWHWIeVCnWhB8QrzFDF7DiLrvbCF2l2nAG7V/UwDvU04jW
	/ZWVk+Z2Qe4x8LNrdJ3drzP0nytvwsTDrcTBSlpBWLdLgDSxUO0RZFeax5NWV5Gat4PUjMoVexS
	XFHcyDZes5ujX6vzG1u4m3/ni8sF4PUvXb3YBYRyjjLtKRLkDRAeKSdqx2NhA4U+cdN3xmuqjDp
	bqorfAvK/blA7s41Nj+/KErhKbGHsAJKWCTjeYovga/wVmL5r++Lk6PM8iXQFoiOuq2UAaZOYz9
	CaHoWjcJ0h0wsinHQrk4/LkmHUe6PeExmNJC8iAd0fHNzcjYDlP9+OuY4t4QNbvgQLr4+ieMT36
	2ge
X-Received: by 2002:a17:90b:5283:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-35e428452e1mr15952554a91.22.1776149934062;
        Mon, 13 Apr 2026 23:58:54 -0700 (PDT)
Received: from [127.0.1.1] (59-120-179-172.hinet-ip.hinet.net. [59.120.179.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fc6eac8ddsm1019714a91.8.2026.04.13.23.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:58:53 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Date: Tue, 14 Apr 2026 06:58:43 +0000
Subject: [PATCH v4 2/2] hwmon: (pmbus/q54sj108a2) Add support for
 q50sn12072 and q54sn120a1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-add-support-for-q50sn12072-and-q54sn120a1-v4-2-b81eaea49df1@inventec.com>
References: <20260414-add-support-for-q50sn12072-and-q54sn120a1-v4-0-b81eaea49df1@inventec.com>
In-Reply-To: <20260414-add-support-for-q50sn12072-and-q54sn120a1-v4-0-b81eaea49df1@inventec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Brian Chiang <chiang.brian@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776149925; l=8330;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=CLMn8jlvGzD+hXMNiwD6qUJpGNbcZMKkkvxVny1Uuqo=;
 b=wqlAd22qpqoEMowq3X4jg6ii3ooaBiQmurQNUzp2cGPctbmFIp+YasN294AO7N9FkkbrSst4l
 rteASS80srcBJBrfJQnUjYgrdqr2LBHbR2Zl9Rqb8J1VxXozllBgMPT
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
 drivers/hwmon/pmbus/q54sj108a2.c | 105 +++++++++++++++++++++++++++------------
 1 file changed, 72 insertions(+), 33 deletions(-)

diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
index d5d60a9af8c5..0fd7dc37e328 100644
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
 
@@ -421,6 +460,6 @@ static struct i2c_driver q54sj108a2_driver = {
 module_i2c_driver(q54sj108a2_driver);
 
 MODULE_AUTHOR("Xiao.Ma <xiao.mx.ma@deltaww.com>");
-MODULE_DESCRIPTION("PMBus driver for Delta Q54SJ108A2 series modules");
+MODULE_DESCRIPTION("PMBus driver for Delta Q54SJ108A2 and compatibles");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("PMBUS");

-- 
2.43.0

