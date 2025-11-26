Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9390335560;
	Wed, 26 Nov 2025 16:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764174427; cv=none; b=oowQoUHAReIkSHV2ysMuM1aFD9chaFjklZ4XObRuTqNw0ubr3JgLwbNbocGqe9Vq3FWkoiDQImiF1VZb769ZJbCodjNceN6bifRV3s51wmaa97tjnaiJf0gwaDSm80z+xD282w3NvT+pSHFxNyxr3VbkbEAWchH17krh41SJ/E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764174427; c=relaxed/simple;
	bh=nGLYQ3kUMNwDgQRwPQCElj04KGxj8E7Yml3DaPyzBGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gh7j4joIbSfYyNFUqWeVnKvwGoSu5hMacy0ElRF/rxqsfNHwC84rdQY85EKYI0uSEZ+tzmcOLqumVuPQXa/Aum0fRmc+JH4+CiUfOgg2WQoMXOXhr9Pc0ZwcrRQWyA0ddIbJfhd4yWQuzzArTG/oGE/lJ/IGIidNy31OfCOFHi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [114.245.38.183])
	by APP-03 (Coremail) with SMTP id rQCowAAHjtBKKidpcVksAg--.11578S2;
	Thu, 27 Nov 2025 00:26:58 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Guenter Roeck <linux@roeck-us.net>,
	Alistair Francis <alistair@alistair23.me>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH v2] hwmon: sy7636a: Fix regulator_enable resource leak on error path
Date: Thu, 27 Nov 2025 00:26:02 +0800
Message-ID: <20251126162602.2086-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20251126105445.1810-1-vulab@iscas.ac.cn>
References: <20251126105445.1810-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAHjtBKKidpcVksAg--.11578S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw15Zr17GrWDJF4kCF1DGFg_yoW8XFy5pw
	1rGFZ0yr40kryIgFWUArnaq3WYvw4Ut3yIkrykCwsav3Z8tFyIqrnYyry5ZFs5ArZ5Gr4Y
	yFWkAr48AFWUZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjuHq7UUUU
	U==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBg0SA2km0a-D2gACsw

In sy7636a_sensor_probe(), regulator_enable() is called but if
devm_hwmon_device_register_with_info() fails, the function returns
without calling regulator_disable(), leaving the regulator enabled
and leaking the reference count.

Switch to devm_regulator_get_enable() to automatically
manage the regulator resource.

Fixes: de34a4053250 ("hwmon: sy7636a: Add temperature driver for sy7636a")
Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
Changes in v2:
  -Use devm_regulator_get_enable() instead as suggested by Guenter
  Roeck.
---
 drivers/hwmon/sy7636a-hwmon.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
index ed110884786b..4cbca1e6e597 100644
--- a/drivers/hwmon/sy7636a-hwmon.c
+++ b/drivers/hwmon/sy7636a-hwmon.c
@@ -66,18 +66,13 @@ static const struct hwmon_chip_info sy7636a_chip_info = {
 static int sy7636a_sensor_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap = dev_get_regmap(pdev->dev.parent, NULL);
-	struct regulator *regulator;
 	struct device *hwmon_dev;
 	int err;
 
 	if (!regmap)
 		return -EPROBE_DEFER;
 
-	regulator = devm_regulator_get(&pdev->dev, "vcom");
-	if (IS_ERR(regulator))
-		return PTR_ERR(regulator);
-
-	err = regulator_enable(regulator);
+	err = devm_regulator_get_enable(&pdev->dev, "vcom");
 	if (err)
 		return err;
 
-- 
2.50.1.windows.1

