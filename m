Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A4E2580EE;
	Tue, 18 Nov 2025 12:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763470431; cv=none; b=QOhGQpLUT2q41+mgxZ3vHmlpRusaN3YXgnf/ReOSWa0D556xo4UILe3z/WfCe3e8inf5U95noixcF4nKBcmG63VWK76mhwUQhtjlsfyrpcAlgms2jcRHhv11F/MKFJOAjPwkmKptubwcoI/tIEEk6X4Ay+a0y3xiyDxjHWZ95Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763470431; c=relaxed/simple;
	bh=yyRpSRt2XpliHBt1AW/V4VfYQBqCxqaKqY7JEeIWjjs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=FvhrPpV1cE2OhjTkDDV8G1AEuUEaNxPtibNCDccv9l+/yd8/7s74GSvKXIQIaU8C8LYW2YorP0REjoONwqKdmAV1s0H/tEOmFQw6tA7UmO1A45SwCHTZszsp1K/QiDiiqTZ0Fu1Uy0M7ZKbgGV/FF13J4SZ2bRnfCQi71ry0y9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cJrgzy20; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cJrgzy20"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=IFaa8TjMQuUxKfS
	ecCtgY0np35W5UehqzhG+E4SNZcU=; b=cJrgzy20z3yFNfdliorTsYLkVWPce2v
	FMv8ElYxRcHsB+oceJRLp/6UYz7TSWY7WUaEAE2LEuAGg5fga8bkFWDGbYHyF2mb
	e85XD01kFKqKNvpl3TEC4cWl0NtjYMYWrlGNBKOfBOQCNFlT/ErGMK/aqyB0wjzb
	ZTQr7pZKXd8g=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3E8H1axxpyxYsBA--.3548S4;
	Tue, 18 Nov 2025 20:52:11 +0800 (CST)
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
Subject: [PATCH v2 2/8] hwmon: (ina3221) Add support for SQ52210
Date: Tue, 18 Nov 2025 07:51:42 -0500
Message-Id: <20251118125148.95603-3-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251118125148.95603-1-wenliang202407@163.com>
References: <20251118125148.95603-1-wenliang202407@163.com>
X-CM-TRANSID:_____wD3E8H1axxpyxYsBA--.3548S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFW8Xr1UJFWDXrW3AF1kXwb_yoW5Zw4rpa
	n5Aa4rtr45Xr4Ig3yfKFs5tF15tr4xG3yIvrnrK3yIva1DAry0gF1rKw4qyF98ZFyfZF47
	X34Iy3y8uwnrJr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRbzV8UUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbCvxt6Tmkca-uGnQAA3u
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

SQ52210 is compatible with INA3221, but also includes current registers,
power registers, and registers related to alerts.

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

