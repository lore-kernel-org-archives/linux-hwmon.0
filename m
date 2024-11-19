Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155C21C32FD
	for <linux-hwmon@vger.kernel.org>; Tue, 19 Nov 2024 10:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732011616; cv=none; b=htsRmNRWD3bV4vlttZ90UXqUo4jfEN5Ej6DE/PqPoB9jBNh/6vMvSWwGHl5fx1F31dnV7A6miaw4GZr3F5ThtYAYsB8Dn0q2r3aotLtu9i9CLwaTrPqLFI9Gi5R2E/sru1bijI6OQ//0Jwov/HpVaWdWkOU73Y3pBnHs6Xm7Xeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732011616; c=relaxed/simple;
	bh=VddMon7KGsoAO+8uNG9DoNYGSEVrl+SvzfCAy5RVITw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KbwE2fAOf/ftVXDjD7ZsaTVRR1AN6Hm3VPy68obC2ZxYjWdnAcTQHv0Yuzi6ZAQfu/bSZX2u+r9CrJdUDXeoh2Aefgp4Mef2cnt1UakcDbyzLo6uRQVAvbXu+zMAsMy03neRc5OjaW88mqBl0eU8vy1NP1oWK4MzzEb+8bndZRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=YWolq7yx; arc=none smtp.client-ip=220.197.31.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="YWolq7yx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=cHi0m
	zq8NWBijK4Ly2A3LsdTUocLcPH7MQG+4r3jEMc=; b=YWolq7yxnqTIwgPNhIPA3
	t5fgsU1j28lr9EL93Cw5kOEKpvZk3nhOS5kJTvf1iMNRpquQuUZ3S/BvWWyKoCW4
	RgPt2TuBd9tXdLIeuPMNbBbD55+WOlWM4J3XHGNaemqAbeUpKN2GvZyzjpw504hl
	ExYaKFWpHEhjYmObinu3zs=
Received: from localhost.localdomain (unknown [122.225.16.198])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD334BFZjxnBiVXBQ--.51824S2;
	Tue, 19 Nov 2024 18:20:01 +0800 (CST)
From: JuenKit Yip <hunterteaegg@126.com>
To: linux-hwmon@vger.kernel.org
Cc: JuenKit Yip <hunterteaegg@126.com>
Subject: [PATCH 1/2] hwmon: (sht3x) add devicetree support
Date: Tue, 19 Nov 2024 05:04:43 -0500
Message-Id: <20241119100443.74393-1-hunterteaegg@126.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD334BFZjxnBiVXBQ--.51824S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFy8Xw1rurW5Ar17CF4kWFg_yoW8Gw48p3
	Wrur9aqF15WF4fX39Iqay09Fy5Cwn3A3yIkr9rGas09FWDJ34jqa1ftFyDA3Z8Zry5Xr12
	gFykt34fGF48AFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi1xRxUUUUU=
X-CM-SenderInfo: xkxq3v5uwhtvljj6ij2wof0z/1tbifg2c7Gc8WpmkUAAAsv

add "compatible" property for supporting devicetree

Signed-off-by: JuenKit Yip <hunterteaegg@126.com>
---
 drivers/hwmon/sht3x.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 650b0bcc2359..2ac1537b3e3e 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -954,6 +954,19 @@ static int sht3x_probe(struct i2c_client *client)
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
+/* devicetree ID table */
+static const struct of_device_id sht3x_of_match[] = {
+	{ .compatible = "sensirion,sht30", .data = (void *)sht3x },
+	{ .compatible = "sensirion,sht31", .data = (void *)sht3x },
+	{ .compatible = "sensirion,sht35", .data = (void *)sht3x },
+	{ .compatible = "sensirion,sts30", .data = (void *)sts3x },
+	{ .compatible = "sensirion,sts31", .data = (void *)sts3x },
+	{ .compatible = "sensirion,sts35", .data = (void *)sts3x },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, sht3x_of_match);
+
 /* device ID table */
 static const struct i2c_device_id sht3x_ids[] = {
 	{"sht3x", sht3x},
@@ -964,7 +977,10 @@ static const struct i2c_device_id sht3x_ids[] = {
 MODULE_DEVICE_TABLE(i2c, sht3x_ids);
 
 static struct i2c_driver sht3x_i2c_driver = {
-	.driver.name = "sht3x",
+	.driver = {
+		.name = "sht3x",
+		.of_match_table = sht3x_of_match,
+	},
 	.probe       = sht3x_probe,
 	.id_table    = sht3x_ids,
 };
-- 
2.39.5

