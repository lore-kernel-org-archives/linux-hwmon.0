Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7749F43BDA9;
	Tue,  4 Aug 2026 09:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785835078; cv=none; b=pqidimz4OpRUwVNJNbe2YkHDWmXhF+vnZbqg/IOOTU/Qph5WDT9CED7f/WuKlw9PKxMhN+WAClqT4UAc5i9SjldFUA7+ZxdqbJ4cPUTD6x3rXgZMFgh9mCY9Fi/1M9UOsPzuWRAyiTxVhYRj1dYWhFl54BwC4jq4jHuJgfZQlKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785835078; c=relaxed/simple;
	bh=/AP2hdMdjkQpReP5//eA8o700oqw1WW4/OvJcJgL4AA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U5fFTwGO0fo6/lYFXYCkzkSG3moE95E+NN2b3kDpPCc7x0HDpAXX2GMdcBunZ3NllZr/Ug7AUt/k3ThETd8X/WjZ/qa1kAEXaq0HLCE2pg/HquUqWd/9UgBlBMAOSO9S6ofA9jhRQuehq9DulqnNEmiwIRek3azimavE6ZYhYQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=PfppToo5; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="PfppToo5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=0A
	BLD3E82oC1y1B4fyH42EWeiwSQcDU4wnIMQtsBUiQ=; b=PfppToo5MOstea2+hj
	Nldi1b0nHXbxU60AsED+591Rrv0VIdjehqUjoQIAfEvm4pqebYdFyq+M5sx+LOQI
	jBtccHucPpeybQVpByw8jVJXldgpsm56O6hUBHsz0FG1Si8vQDJVsduZsnhUQxtE
	2KGT4mT6hfTKcQSh3uX+wCZ+Y=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wAnZG4irnFqRO__Mg--.23049S2;
	Tue, 04 Aug 2026 17:17:23 +0800 (CST)
From: Qingshuang Fu <fffsqian@163.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Akshay Bhat <akshay.bhat@timesys.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>,
	Qingshuang Fu <fffsqian@163.com>
Subject: [PATCH] hwmon: (ads7828) Check return value of regmap_read() in probe
Date: Tue,  4 Aug 2026 17:17:19 +0800
Message-Id: <20260804091719.651479-1-fffsqian@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAnZG4irnFqRO__Mg--.23049S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4xXF4DtF47Aw4xAw4xZwb_yoW8Cr4UpF
	WrGFZ0kry5Jr4Iq3y7tF1jva4Fgw4xt3W3Ca4UGw1Fv3Z8trZIgry5KFy0vF9IkFyFgw1U
	Xa1Dtayj9a9rJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0picAw7UUUUU=
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbC6gOqdWpxriMDZAAA3H

From: Qingshuang Fu <fuqingshuang@kylinos.cn>

ads7828_probe() issues a dummy regmap_read() to enable the internal
reference voltage when ext_vref is false. The original code ignores the
return value of regmap_read().

If the I2C read fails, the internal reference voltage will not be enabled,
and subsequent ADC readings return incorrect values without any error
indication.

Check the return value of regmap_read(), log an error message, and abort
probe on failure. This prevents registering a non-functional hwmon device.

Fixes: 7a18afe80977 ("hwmon: (ads7828) Enable internal reference")
Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
 drivers/hwmon/ads7828.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
index 149cfcec78dc..91ef0c4a08c4 100644
--- a/drivers/hwmon/ads7828.c
+++ b/drivers/hwmon/ads7828.c
@@ -112,6 +112,7 @@ static int ads7828_probe(struct i2c_client *client)
 	unsigned int regval;
 	enum ads7828_chips chip;
 	struct regulator *reg;
+	int ret;
 
 	data = devm_kzalloc(dev, sizeof(struct ads7828_data), GFP_KERNEL);
 	if (!data)
@@ -166,8 +167,13 @@ static int ads7828_probe(struct i2c_client *client)
 	 * voltage needs to settle before getting valid ADC data. So perform a
 	 * dummy read to enable the internal reference voltage.
 	 */
-	if (!ext_vref)
-		regmap_read(data->regmap, data->cmd_byte, &regval);
+	if (!ext_vref) {
+		ret = regmap_read(data->regmap, data->cmd_byte, &regval);
+		if (ret) {
+			dev_err(dev, "dummy read failed to enable internal VREF: %d\n", ret);
+			return ret;
+		}
+	}
 
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
 							   data,

base-commit: 848acc8ffe1b7cd5f1bf427b93069becfebc2c9d
-- 
2.25.1

