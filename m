Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2B125A354;
	Thu, 18 Dec 2025 09:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766048882; cv=none; b=MGJnGtzjArWfo771rzZyiJNYRtl6GNmMSo1XeUozX0eYhvgz5OBhMHEHvZltuX0HmKigue9e6ZDggrHjK3Ii5NSqX/QQMYzkIJ2dHKZKxAyVlAkDXzIDu0dQ2+XQrykf296lZ85nWLitCv2TycaaY0vGQ3k9kcplBZtVi+9rahQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766048882; c=relaxed/simple;
	bh=H/w+6on8fYV8qpYT0kb7Mj2iA2mlwXEn1PrOId/TyGo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Ap/LALXuekcYXZCoOrBWavo/c+HeiOEigq41toZnV5ps4wXi6an8G1oRcKr3EkdSaAHgKayMHea50+irgbw4CZ4q9+M8sOWRdsyqdpVVzOrODY9taUp/GlpfW4RH6lYGGvGqLLpoY38uNMZ8uLqkhiM/JZUthf96SMqSp33XYeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=iv14HhVX; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="iv14HhVX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=oQP23GsQvFrcqDF
	p4tVk7ny6xZlM2KY/EMMUq56/WtE=; b=iv14HhVXVRegEu0nNRsHBABTTiltImd
	bdzpEGVr9plZlLwen9njwVzo7Hjv37fgrawSorN8Ah/Fxeh/xMdVHDmPz8H9IjF5
	3vyV/sZP5AxUxTOTakGdSwacGO86GZ0TZTuf5AnUUUoc7heAGL7kvEAyvPYw6f/8
	+b1uUOd9SQHo=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wBXPaw5xENpP8BcBA--.40S4;
	Thu, 18 Dec 2025 17:07:11 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net,
	Jean Delvare <jdelvare@suse.com>
Cc: Wenliang Yan <wenliang202407@163.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/8] hwmon: (ina3221) Add support for SQ52210
Date: Thu, 18 Dec 2025 04:06:53 -0500
Message-Id: <20251218090659.66991-3-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251218090659.66991-1-wenliang202407@163.com>
References: <20251218090659.66991-1-wenliang202407@163.com>
X-CM-TRANSID:_____wBXPaw5xENpP8BcBA--.40S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFW8Xr1UJFWDXrW3AF1kXwb_yoW5ur1fpa
	1rAa4rtr45Xr4Ig3yfKFs5tF15tr4xW3yIvrnrK3yIvF4DAry0gF1rGw4vyF98ZFyfZFsr
	X34Iy3y8uwnrJr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi_Ma5UUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbCvx9rP2lDxD9YlQAA3o
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Add Compatible for SQ52210.

Compared to the INA3221, the SQ52210 also has current registers,
power registers, and limit-related registers.

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---
 drivers/hwmon/ina3221.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 5ecc68dcf169..47ef4fe694ea 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -34,6 +34,17 @@
 #define INA3221_SHUNT_SUM		0x0d
 #define INA3221_CRIT_SUM		0x0e
 #define INA3221_MASK_ENABLE		0x0f
+#define SQ52210_ALERT_CONFIG	0x12
+#define SQ52210_CALIBRATION		0x14
+#define SQ52210_CURRENT1		0x15
+#define SQ52210_CURRENT2		0x16
+#define SQ52210_CURRENT3		0x17
+#define SQ52210_POWER1			0x18
+#define SQ52210_POWER2			0x19
+#define SQ52210_POWER3			0x1A
+#define SQ52210_ALERT_LIMIT1	0x1B
+#define SQ52210_ALERT_LIMIT2	0x1C
+#define SQ52210_ALERT_LIMIT3	0x1D
 
 #define INA3221_CONFIG_MODE_MASK	GENMASK(2, 0)
 #define INA3221_CONFIG_MODE_POWERDOWN	0
@@ -108,8 +119,11 @@ struct ina3221_input {
 	bool summation_disable;
 };
 
+enum ina3221_ids { ina3221, sq52210 };
+
 /**
  * struct ina3221_data - device specific information
+ * @chip: Chip type identifier
  * @pm_dev: Device pointer for pm runtime
  * @regmap: Register map of the device
  * @fields: Register fields of the device
@@ -120,6 +134,8 @@ struct ina3221_input {
  * @single_shot: running in single-shot operating mode
  */
 struct ina3221_data {
+	enum ina3221_ids chip;
+
 	struct device *pm_dev;
 	struct regmap *regmap;
 	struct regmap_field *fields[F_MAX_FIELDS];
@@ -734,6 +750,7 @@ static const struct regmap_range ina3221_yes_ranges[] = {
 	regmap_reg_range(INA3221_CONFIG, INA3221_BUS3),
 	regmap_reg_range(INA3221_SHUNT_SUM, INA3221_SHUNT_SUM),
 	regmap_reg_range(INA3221_MASK_ENABLE, INA3221_MASK_ENABLE),
+	regmap_reg_range(SQ52210_ALERT_CONFIG, SQ52210_POWER3),
 };
 
 static const struct regmap_access_table ina3221_volatile_table = {
@@ -818,13 +835,18 @@ static int ina3221_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct ina3221_data *ina;
 	struct device *hwmon_dev;
+	enum ina3221_ids chip;
 	char name[32];
 	int i, ret;
 
+	chip = (uintptr_t)i2c_get_match_data(client);
+
 	ina = devm_kzalloc(dev, sizeof(*ina), GFP_KERNEL);
 	if (!ina)
 		return -ENOMEM;
 
+	ina->chip = chip;
+
 	ina->regmap = devm_regmap_init_i2c(client, &ina3221_regmap_config);
 	if (IS_ERR(ina->regmap)) {
 		dev_err(dev, "Unable to allocate register map\n");
@@ -996,13 +1018,21 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ina3221_pm, ina3221_suspend, ina3221_resume,
 				 NULL);
 
 static const struct of_device_id ina3221_of_match_table[] = {
-	{ .compatible = "ti,ina3221", },
+	{
+		.compatible = "silergy,sq52210",
+		.data = (void *)sq52210
+	},
+	{
+		.compatible = "ti,ina3221",
+		.data = (void *)ina3221
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ina3221_of_match_table);
 
 static const struct i2c_device_id ina3221_ids[] = {
-	{ "ina3221" },
+	{ "ina3221", ina3221 },
+	{ "sq52210", sq52210 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, ina3221_ids);
-- 
2.17.1

