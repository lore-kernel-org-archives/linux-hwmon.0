Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBBE22541B
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 13:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298522; cv=none; b=N1ajO+4MuYLWfEJiNmGRElPBkC1XkPY6ASyglXnczyJxSbZnMUP5iOHfNJdRE+7vXlEuUAPNfTxQAtS1SmExtvijuY1c7W6YlH8KuA7bxaM3yenSUPCM0jtS9HWs7IPeztGG8AhADBAg3SfagbKidY//Cb+BkRbvbg0ptUpLjbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298522; c=relaxed/simple;
	bh=wpkimDav46YFJfJQ9r6mE6i3dTDYKK0zgDWwQx5eOtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RXUJ4E9az2jLYsGk7Ven4MRf1AoAjc73Nj9E/yfgAKP+gMeUa78B+8Z1LyQ50WubSP7/e9uEt1I3DDoP8YbXokrGhlLGG+A4QDg4aYEe0b6dnzMxBanniTUcMtG6rab+zLhDi/qYkgnioEWwqI8oVtJoLne1OYkhzOr7wu6LY10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1SbAmf1; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1SbAmf1"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a94450ae14so5427975ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 05:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770298522; x=1770903322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/NdfuXjST0+v0E9Ees6inVmdG7VSECbbJuJ0e1bFP4=;
        b=U1SbAmf11qBMa6ke3G8lzS8NNyMTwVCFJXgXH47tudzMeVKOQanG2a+q23X8qRR1hf
         TLdOrkl37PlwU3qhN0CYvceGBwm6Ga9gAJlV2iiSHTUl1h7dZQOwAGZ72e3kx8GsZt3E
         HXdxNvO269oMYkXD9K4IYeG3MnM6g5j/eOe61ZKdHRlizKn4lgF2UC8/xMTQPZuTdt9U
         0shd95q8sUXMBtSCmBHqGlA0OdBJADcxh6vvVVLLxy7aNbzifCfDuSn8PYbaPPVVL9P6
         G0RYiN6QD9amwy7a0tt6AkqRLUnSvuD55B0MKeCvRFfmJHvzzYzORkBjqpqV7doOWdoE
         WdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770298522; x=1770903322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g/NdfuXjST0+v0E9Ees6inVmdG7VSECbbJuJ0e1bFP4=;
        b=fgHRAo8Kav2ZQa7csDNq1QfIUUTR6i23AbWS8LLlbaZbnDJs8ISniVWhzxyF9aYygo
         pqMXw2/DxeFiMUSafWLUJEHw99waYU40uu/07t4nXau0rEMaf9uQcFAyD1874iEHfSLN
         0aXwCmeVTjAvGYXOPQ7jdvbuyXt5h+VkTRPMhJJZA2chibPGV2zEuNsAaD5k9MbQ9BAJ
         m6OZHjKVv4jfMEsjMKI5PkpTisdClynBaP0CX6USFa4OH7ReTQ5kExOWoa4p1y8a4ghB
         7j7aCE7i3HDYGiQ9FBMQnc9cUAM8bhWnYLyGXarRdb9betBdA1DYxtG9pktOH1snQTJc
         /LSg==
X-Gm-Message-State: AOJu0YwMsMAwSM/gjHaOc+Um49a4raJIoPzFRGB7GkiO7M10/scrx0aw
	1mnvsEtzdfDBVufX0fQOccls/qoBkDZKp2tsspMROjUZQBPQpktEUAZx
X-Gm-Gg: AZuq6aK3uzcnAgLlpxsJ6N1iknDwStbZUkeuBN7okaXpPyQ6h8DR8LOFmWgKjIvJnNy
	Y0WCi9e5e8yld2GIYX21vYujYC8k5ZXqWWTZkt5f814qMLps0wvgtf1TEyetDX0U7fhLC2vbFNb
	A1DVJNGUWLF3DWk76lNqE6SSx+liNH8ESyNgDlYAjz+KPb7XoYRNy1wwRGMQ5YTD60MWg5iE1Gd
	9HXxYoKheQKpk0BYr1yVsELKd2MgMH55p6veJaSNEa3C1FFBY72AyDK4s+/AzyI6KslqZat9/p8
	S/FEs6+kcvkt+VqkATw6ig0Td1McNnUBK1JHLlVjMW1JSaFbJNse7tCdJ7Mz2M0Q/RnNgWS8JQA
	nlicc4y798KMBtNiYuhnBTfov3DXeEMHFrceGq1A4j2nn8BlvxKT+uhUVMs2/eGbcynj+jZELZ8
	nw2QdLADc=
X-Received: by 2002:a17:903:2449:b0:2a9:322e:2473 with SMTP id d9443c01a7336-2a93400297fmr68462355ad.48.1770298521729;
        Thu, 05 Feb 2026 05:35:21 -0800 (PST)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933850f41sm57760505ad.7.2026.02.05.05.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 05:35:21 -0800 (PST)
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 05 Feb 2026 21:34:35 +0800
Subject: [PATCH 1/3] hwmon: (pmbus) Add Delta Q54SN120A1 Q54SW120A7 driver
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-add-q54sn120a1-q54q54sw120a7-v1-1-09061ecacfc7@gmail.com>
References: <20260205-add-q54sn120a1-q54q54sw120a7-v1-0-09061ecacfc7@gmail.com>
In-Reply-To: <20260205-add-q54sn120a1-q54q54sw120a7-v1-0-09061ecacfc7@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Colin.Huang2@amd.com, 
 Carl.Lee@amd.com, Peter.Shen@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770298516; l=3440;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=wpkimDav46YFJfJQ9r6mE6i3dTDYKK0zgDWwQx5eOtI=;
 b=+lC/kRBdv5CB5cGPfsnlTqiRK3DOgwLTb3aC73wBPzJDIKXdvBf2a4qaqPE/mA81eYXGxSQQb
 IXdk9bUaCkGCcBq9DlcRCaOxfusrAeu4eT1nAaYwcItlTcLD2Ae292o
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=

Add the pmbus driver for DELTA Q54SN120A1, Q54SW120A7,
1/4 Brick DC/DC Regulated Power Module with PMBus support

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 drivers/hwmon/pmbus/q54sj108a2.c | 47 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
index 4d7086d83aa3..dca084c98fba 100644
--- a/drivers/hwmon/pmbus/q54sj108a2.c
+++ b/drivers/hwmon/pmbus/q54sj108a2.c
@@ -21,7 +21,9 @@
 #define PMBUS_FLASH_KEY_WRITE		0xEC
 
 enum chips {
-	q54sj108a2
+	q54sj108a2,
+	q54sn120a1,
+	q54sw120a7
 };
 
 enum {
@@ -62,6 +64,34 @@ static struct pmbus_driver_info q54sj108a2_info[] = {
 		.format[PSC_VOLTAGE_IN] = linear,
 		.format[PSC_CURRENT_OUT] = linear,
 
+		.func[0] = PMBUS_HAVE_VIN |
+		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
+		PMBUS_HAVE_STATUS_INPUT,
+	},
+	[q54sn120a1] = {
+		.pages = 1,
+
+		/* Source : Delta Q54SN120A1 */
+		.format[PSC_TEMPERATURE] = linear,
+		.format[PSC_VOLTAGE_IN] = linear,
+		.format[PSC_CURRENT_OUT] = linear,
+
+		.func[0] = PMBUS_HAVE_VIN |
+		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
+		PMBUS_HAVE_STATUS_INPUT,
+	},
+	[q54sw120a7] = {
+		.pages = 1,
+
+		/* Source : Delta Q54SW120A7 */
+		.format[PSC_TEMPERATURE] = linear,
+		.format[PSC_VOLTAGE_IN] = linear,
+		.format[PSC_CURRENT_OUT] = linear,
+
 		.func[0] = PMBUS_HAVE_VIN |
 		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
 		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
@@ -269,6 +299,8 @@ static const struct file_operations q54sj108a2_fops = {
 
 static const struct i2c_device_id q54sj108a2_id[] = {
 	{ "q54sj108a2", q54sj108a2 },
+	{ "q54sn120a1", q54sn120a1 },
+	{ "q54sw120a7", q54sw120a7 },
 	{ },
 };
 
@@ -278,6 +310,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
+	const struct i2c_device_id *mid;
 	enum chips chip_id;
 	int ret, i;
 	struct dentry *debugfs;
@@ -314,8 +347,12 @@ static int q54sj108a2_probe(struct i2c_client *client)
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
@@ -325,7 +362,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
 		dev_err(dev, "Failed to read Manufacturer Revision\n");
 		return ret;
 	}
-	if (ret != 4 || buf[0] != 'S') {
+	if (buf[0] != 'S') {
 		buf[ret] = '\0';
 		dev_err(dev, "Unsupported Manufacturer Revision '%s'\n", buf);
 		return -ENODEV;
@@ -402,6 +439,8 @@ static int q54sj108a2_probe(struct i2c_client *client)
 
 static const struct of_device_id q54sj108a2_of_match[] = {
 	{ .compatible = "delta,q54sj108a2", .data = (void *)q54sj108a2 },
+	{ .compatible = "delta,q54sn120a1", .data = (void *)q54sn120a1 },
+	{ .compatible = "delta,q54sw120a7", .data = (void *)q54sw120a7 },
 	{ },
 };
 

-- 
2.34.1

