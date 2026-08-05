Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC7635C1B2;
	Wed,  5 Aug 2026 04:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785903703; cv=none; b=YNjvy2d+4SZEobg2MAx6a9g5lDcDb0tVVfgEnbMHyni/XNNZk39vP0Zv98xesPWV2KrpEd0/LKsDG+yba5FAR3aZ4DzPtAdgCIsIniW4y8a+VdsSjqWkaiZqBsSG5dhJJlze2y+Cf9AIxbwaFIRmHBL2jTMKv3lpWa7UtZ8hdGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785903703; c=relaxed/simple;
	bh=uyWM9F2Ppzv3iqWbAKAZ3qbOulaTOy59EgLcnwbnDu4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=alugYeAfJaTCry2dWTF/zUKjWvhd0hQoJLxFXUk7PWgyNAmyFg4kyys+Ov1W74Db6aKy7bP6b2+LJDsIVh+9udsXIJ3q2SEk5xK6ZWjTxjQnj8HbPiNcVHABdoUKKMKUqaORtFXHi44aDAj84rdWdx6A911AJPJYlyB83AHDYaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=JEfRbQbe; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="JEfRbQbe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=26
	+BITxc8faSH64lvl90iAfZnnuBC+bdnjrcWAxUo7c=; b=JEfRbQbeRINrlijDLw
	ZRDQNl9pR9BSv3jOf/zQQqEv7/de959MZ4RDu06klDAHyj/Nz2LJ/lm51XSRqsgS
	WgLXA4S/DAvYUqbzfTXgGuAXeA1O92C6fL33mXIA/SRuVpXzcZaYafbB8DuWnC3L
	fMfmEMB2WetEBWnKb+RPLwCNc=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAHRiIuunJq+tMjKw--.10646S2;
	Wed, 05 Aug 2026 12:21:03 +0800 (CST)
From: Qingshuang Fu <fffsqian@163.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sam Povilus <kernel.development@povil.us>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>,
	Qingshuang Fu <fffsqian@163.com>
Subject: [PATCH v3] hwmon: (ads7828) Fix external VREF regulator handling
Date: Wed,  5 Aug 2026 12:21:01 +0800
Message-Id: <20260805042101.1177736-1-fffsqian@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgAHRiIuunJq+tMjKw--.10646S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFy8CrW3trWfCry3Gw4UJwb_yoW5XFykpr
	WkGFZrZr48AFyxurW8ZFWIq3WFqw18Jws5CFykKw1av3Z8JFyfXr90kFyYyF1xC3yku3W2
	vryqyay0ga9rJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRvdgdUUUUU=
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbC6g-wu2pyui-WewAA3O

From: Qingshuang Fu <fuqingshuang@kylinos.cn>

The driver currently has two issues with the external VREF regulator
handling in ads7828_probe():

1. All errors from devm_regulator_get_optional() are ignored, causing the
   driver to incorrectly fall back to internal VREF even for transient
   errors like -EPROBE_DEFER or genuine failures like -ENOMEM.

2. The external regulator is never enabled. The driver calls
   regulator_get_voltage() without first calling regulator_enable(),
   so the VREF pin may remain unpowered if the regulator is not
   configured as always-on.

Fix both issues by switching to devm_regulator_get_enable_read_voltage(),
which handles regulator get, enable, and voltage read in one call.
Only -ENODEV (no regulator specified in device tree) should trigger the
fallback to internal VREF. All other errors are propagated to the caller.

Fixes: a8ddfea09566 ("hwmon: (ads7828) Accept optional parameters from device tree")
Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
Changes in v3:
- Switch to devm_regulator_get_enable_read_voltage() to also enable the
  external regulator, as suggested by Guenter Roeck.
Changes in v2:
- Broaden the error check to handle all errors except -ENODEV, instead of
  only checking for -EPROBE_DEFER. This addresses the Sashiko AI review
  concern about masking genuine errors like -ENOMEM and -EINVAL.

 drivers/hwmon/ads7828.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
index 149cfcec78dc..172da6f6549d 100644
--- a/drivers/hwmon/ads7828.c
+++ b/drivers/hwmon/ads7828.c
@@ -106,12 +106,11 @@ static int ads7828_probe(struct i2c_client *client)
 	struct ads7828_data *data;
 	struct device *hwmon_dev;
 	unsigned int vref_mv = ADS7828_INT_VREF_MV;
-	unsigned int vref_uv;
+	int vref_uv;
 	bool diff_input = false;
 	bool ext_vref = false;
 	unsigned int regval;
 	enum ads7828_chips chip;
-	struct regulator *reg;
 
 	data = devm_kzalloc(dev, sizeof(struct ads7828_data), GFP_KERNEL);
 	if (!data)
@@ -125,14 +124,15 @@ static int ads7828_probe(struct i2c_client *client)
 	} else if (dev->of_node) {
 		diff_input = of_property_read_bool(dev->of_node,
 						   "ti,differential-input");
-		reg = devm_regulator_get_optional(dev, "vref");
-		if (!IS_ERR(reg)) {
-			vref_uv = regulator_get_voltage(reg);
+		vref_uv = devm_regulator_get_enable_read_voltage(dev, "vref");
+		if (vref_uv >= 0) {
 			vref_mv = DIV_ROUND_CLOSEST(vref_uv, 1000);
 			if (vref_mv < ADS7828_EXT_VREF_MV_MIN ||
 			    vref_mv > ADS7828_EXT_VREF_MV_MAX)
 				return -EINVAL;
 			ext_vref = true;
+		} else if (vref_uv != -ENODEV) {
+			return vref_uv;
 		}
 	}
 
-- 
2.25.1

