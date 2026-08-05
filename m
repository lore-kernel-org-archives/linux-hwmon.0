Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A494830594E;
	Wed,  5 Aug 2026 06:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785910669; cv=none; b=QoSqSmAkqeQpS0HDg0F6PS+f29BxCZjiGOsnmii+FF2TVaEL+iyaQ7nbbVZj9/MbpfU6ucqwFNhq8G15VlZmUJO+1DAm0gTUA1XKnpuC+2KKHCUgbGZ076oYah0YrFC5WyMCC7uRe0AkGq8+mJod3M92xmWsKi7I8WfDM4rOZb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785910669; c=relaxed/simple;
	bh=lhzLqsrndnNJhWgkqKmgG6tcM3mBtatoSFldp/c8Vhw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gZMJGSwcpxOqSYukfN1GaXS5YDGiQsN1farDwCWuxUAGrH4f0QFnC6bB4g2vd1wdLuDiD4g9xVhlqp4EdVTC8CR35iua9A3zUkB6Vv+NTu364wSXU9yYFfC3+EenJkpbs2whBUWaP3+zdkIHAEMZpQ5E68cAOtyCgz9/e3kNPhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=aH3fWfc+; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="aH3fWfc+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=S8
	Y7wmETonOkBVlAyxxvjrp4BxFFLhG4WbKKcCtgQ1s=; b=aH3fWfc+10NLjd3gUJ
	BXBh56rKPPW/j0013S3pqBnKsd2CRjU5KaLgFvvHh50Ah061xcUjdgct6jqGhhsk
	+C08v20gqAQIGHVEhgqk0m+p4NlYNR32RewYTl5eI+6mlR87FkUNDhWvxjR+1HQc
	QHK5wGRFBtDf0e/acDzvtSzKs=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3f3VQ1XJq+86dNQ--.40182S2;
	Wed, 05 Aug 2026 14:16:49 +0800 (CST)
From: Qingshuang Fu <fffsqian@163.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sam Povilus <kernel.development@povil.us>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>,
	Qingshuang Fu <fffsqian@163.com>
Subject: [PATCH v4] hwmon: (ads7828) Fix external VREF regulator handling
Date: Wed,  5 Aug 2026 14:16:45 +0800
Message-Id: <20260805061645.1331652-1-fffsqian@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3f3VQ1XJq+86dNQ--.40182S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFy8CrW3trWfCry3Gw4UJwb_yoW5WF13pr
	WkGF9rZr48AFy8WrWxAFW2q3WFq3W8Jws5CFykGw4av3Z8JFyfWr9IkFyYyF17C3yku3W2
	vryqyay8Ka9rJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRHvV_UUUUU=
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbCwRHAi2py1VHa8AAA3t

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
Changes in v4:
- Invert the control flow to check errors first (if (vref_uv < 0) { ... }
  else { ... }), as requested by Guenter Roeck.
Changes in v3:
- Switch to devm_regulator_get_enable_read_voltage() to also enable the
  external regulator, as suggested by Guenter Roeck.
Changes in v2:
- Broaden the error check to handle all errors except -ENODEV, instead of
  only checking for -EPROBE_DEFER. This addresses the Sashiko AI review
  concern about masking genuine errors like -ENOMEM and -EINVAL.

 drivers/hwmon/ads7828.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
index 149cfcec78dc..f8f2f621dfea 100644
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
@@ -125,9 +124,11 @@ static int ads7828_probe(struct i2c_client *client)
 	} else if (dev->of_node) {
 		diff_input = of_property_read_bool(dev->of_node,
 						   "ti,differential-input");
-		reg = devm_regulator_get_optional(dev, "vref");
-		if (!IS_ERR(reg)) {
-			vref_uv = regulator_get_voltage(reg);
+		vref_uv = devm_regulator_get_enable_read_voltage(dev, "vref");
+		if (vref_uv < 0) {
+			if (vref_uv != -ENODEV)
+				return vref_uv;
+		} else {
 			vref_mv = DIV_ROUND_CLOSEST(vref_uv, 1000);
 			if (vref_mv < ADS7828_EXT_VREF_MV_MIN ||
 			    vref_mv > ADS7828_EXT_VREF_MV_MAX)
-- 
2.25.1

