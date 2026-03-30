Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF241325704
	for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 21:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774905681; cv=none; b=CNf9x1o2hX+HPRNXeVlGGRVifTV1MKSf0xum4e07W0vATZbv/rlaRVjVx5ZkFSqcBecIt9fuZLuMUGmR5UcCTN7ceEHWLX+aQgdUvjoEV+panuGj3BnKoBLWvL3vtCbhmF+wt2iqoqfGxQ81vAsu0H9aEXU9bCgQMvQPisWwA+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774905681; c=relaxed/simple;
	bh=dpG4ga9LyneDfweXVUfTOOtmWCL6CT5DCJi1f9rPv2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eQocxuRfYnmilPJ7PwoABlavvWuLDEwee/lQnhdru7EYz2cF368OH8JgdB7fDdT31H0uprZCejfidkGum4mPR0kxn7xQVrhPfoUnLdv7RX6C1iY1YRBZ6JmVHG1IBxWYxVGrf7ygsAtHV3A2A9aSfjrGhLHJep7evQRDIp+Sz7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHZRIw+v; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHZRIw+v"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12732165d1eso6889809c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 14:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774905678; x=1775510478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4YlIylKjOMEsyujFLZd/J019KGBgTesRt/3EzAmCU7c=;
        b=UHZRIw+vYzIGP/5E61ia0GIfKFVkTqflu9HPfatjPp0OpdZJgLqF+C9RrDuJEwnlAg
         yBj/DDC+eXprhq54Eacb/hgUMtcP5cFh9bpoKYN7kpvAj+/cfcIK/caz1RstKZMKnVDT
         spA1GFlUuvBYxAexpLuYPoN9G/8quD+6gGkg8RnGNyVqTsZ6Qccmzd+Ijsk65YtvUBA7
         OYi+NEmS6xL+mIP2B8SCL/nV1dBa6UddbnhMefq2xInQgvzAJlgppzWXELKF/urEzj7U
         zuPkmECqR2ju90MIGDwwycdPnz8gjJmADOUW9AEFloh5MwxUgXsTT4tJjfZbe9COkMAr
         KsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774905678; x=1775510478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YlIylKjOMEsyujFLZd/J019KGBgTesRt/3EzAmCU7c=;
        b=AQB8UzRe59yrxWQUihVQN1yOHJlY3u/ikjitBmw9E1vtAPxq7xhEXQzMxQPUkm3tv2
         6BJMIW2xk4qPBGfmGEpHIEonjZSBJPbwgy8qf/xvKcOW4KyK4I7arA0d3+rgtNKd3MCn
         UprBPAr22VPQ1rrXpSEeNJ2ebup8XlwdHzMh8jOkKMzf7YJ7mxRUNAaJihY0url6jcsV
         8icPY2nhQ1ReZ3PlaQsgJWTX6ZjRMkRvtaHKQQPI1TFqQbmiPUQeIxc4eb+PpI6tQE9o
         LD2zINuYipOGBnKD+eMS1MP2ky2WsnIV+J8MXLO32hc/Ia4hQCqsj7jxm3+yIYw70SPd
         vSEQ==
X-Gm-Message-State: AOJu0Yz1JJDTbIH8FmJPr4+J4nMjdQBTaUxzgcxAnLVMm/8esJzJVqwh
	sdcep7xbUsxu8WJyO3GtYKIHlzdNvTxEJ+vsombbxcLTzLn72/Cm+DEUonsC+g==
X-Gm-Gg: ATEYQzxCvyDryycjJuWuZd+p/armHXk84d+4EsU96VskQQ0SPaW+SyqHfYDTYubuRe/
	KC2NlOm+6GtnKT0KsmK7aVU92mhGFjCMJGsgcIrFUf8tfAyJoFA2CRSUdjMgroWaQImS4NDdzn2
	erzXnX7fPHgBZo3wi7Tf6eoY5ZnemBx/tbfCN2fvXxw+O4XNBEl1f7rv2wiQBsr2szUTp9f8atN
	Uv0K6SgsHB7aJQrRzEFICMVc7EYd6tZxXLrto4/YNd7/Tn21ohsSjjvoUeJ6lNHVd/3lY1pWTen
	UC8zhiH/IZHGTTVEGmTfWHUqVCJToZDc8/6Kvwrn/mObM/YNg0vwr6+kRL3BqgnzQyuVW2N+tA4
	/pByvCNRQWjrq0cYGKOQKVjWB5OznsxnVQNLCk0kghZGjYRHlwLDDcb6AoCz3oq7CXPYa6MRKE6
	IqUqYm3LCUXkRKQDtC5DaYuSJHT7bDcIXHoGDcN4DXUqscJ+yKVnWIx/iGPsu20eOE9g==
X-Received: by 2002:a05:7022:ec1:b0:128:d4be:7418 with SMTP id a92af1059eb24-12ab28f4e7emr6012727c88.35.1774905678364;
        Mon, 30 Mar 2026 14:21:18 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97cb08csm13485104c88.3.2026.03.30.14.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:21:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] hwmon: (pmbus) simplify allocation slightly
Date: Mon, 30 Mar 2026 14:21:00 -0700
Message-ID: <20260330212100.15436-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to combine kzalloc and kcalloc.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index e8fdd799c71c..c55ca3095975 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -106,7 +106,6 @@ struct pmbus_data {
 	int max_attributes;
 	int num_attributes;
 	struct attribute_group group;
-	const struct attribute_group **groups;
 
 	struct pmbus_sensor *sensors;
 
@@ -127,6 +126,8 @@ struct pmbus_data {
 	int vout_high[PMBUS_PAGES];	/* voltage high margin */
 
 	ktime_t next_access_backoff;	/* Wait until at least this time */
+
+	const struct attribute_group *groups[];
 };
 
 struct pmbus_debugfs_entry {
@@ -3726,17 +3727,12 @@ int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info)
 				     | I2C_FUNC_SMBUS_WORD_DATA))
 		return -ENODEV;
 
-	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
 	if (info->groups)
 		while (info->groups[groups_num])
 			groups_num++;
 
-	data->groups = devm_kcalloc(dev, groups_num + 2, sizeof(void *),
-				    GFP_KERNEL);
-	if (!data->groups)
+	data = devm_kzalloc(dev, struct_size(data, groups, groups_num + 2), GFP_KERNEL);
+	if (!data)
 		return -ENOMEM;
 
 	i2c_set_clientdata(client, data);
-- 
2.53.0

