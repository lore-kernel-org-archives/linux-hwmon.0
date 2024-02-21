Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083D97BB18
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Feb 2024 14:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708524831; cv=none; b=BVaEdtL6huLf2VYbht+d56UYDsTpZz5ZTXiZtF7xlAOvsFoDi4KjwdiwFzJZoaJ/M+1ps6R/2ce8T1NtIp4l/mQv8GgAOyQ+r2ws9QiHcJ9lVGEMufnHtdpjHIYeg8dECHcs87hyiGQeAUNxl24bfrluG0KEpvpCd2lvMf8mG1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708524831; c=relaxed/simple;
	bh=LIOKB/YJGtj8o6xyM7p5yjgt/v0kZLKlK1+qy11tDCc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HUh9wuDcPU+yRVpDuhWaosCv7LrfudMW0T4JZsAAcxz5MrzdUPt/+siodULTgO1p/7zmGti2mJK9oVaNgmdtm0ZzzZce/srkvbRWNj74IODnMIRrZ1CDRr+5Ia47TK+xV2XC+02o6DSX2yVFBuvILA5GqmPlEi3R4yZdLuCrTFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1ZKE/JZ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1ZKE/JZ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1dc139ed11fso14354005ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Feb 2024 06:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708524829; x=1709129629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mV0SUjUW8P38l0827k6CiSx1nzGj9qnrmPm+XADjmss=;
        b=G1ZKE/JZBAihsactiarRVfU9KrUmcJwQ39E+YOpKBFPD3AlcBHXPx1c+Hra1ZGgmm0
         hzxcKYt1mLb1A6d+BCnuU/scN9/f04B5GxVuUmtyUWLvO5C5gLlhC1IJPg0ew7d04uXN
         DKdei89u9IYKDGeEABudaxtWzkz/LKlhfJEyRXYe6t5McMvZnNknb43ahogcXDAP0i/Q
         Dk3DtXletrxqDPVwbrVNl70OPCh02gBaitrbjJ0ufYG2zsid/7E6DdMli6Gbd47SGUMT
         tAgbniYks29p/3e3jSIVLkQyzPujHpx1NbKnj1KPXDyMWBnoy6akbt8I3hw6yL/FK8gg
         XCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708524829; x=1709129629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mV0SUjUW8P38l0827k6CiSx1nzGj9qnrmPm+XADjmss=;
        b=tmLnrKIm/mCDwoqgVTXI/GV86GXqy+5DjTpZBxeOZxF2+EHEg+VmJCeOMhqyOCn9Qb
         DOL37f9xiyczfjiLAC/PtodWwHX6Zt5IQnDu0OPZ4cWh/KLiOSQ60Nd5YKNDAY5lq6sW
         64zt3leInE7UCNMS9CcMWqxFpFCgZ78fLJN2ojq9yWnEAvlW5dbRdl0WIYSuvHnWisLc
         HsRi1SN1kAsIaUDOkvqgqx40sUwhAnINcTcvyR6kqlz/9DkMBIkt2BMJCL6+IgfEJkB9
         RPaHm3YfpRrHbeD6AUEpz4UfhNJlhSrVqX68qHUm0/eW8YfBc+Y4bmrxCgwJpM3Gct41
         bDVg==
X-Gm-Message-State: AOJu0YzYskgG3gV0H5D3ikYLWUobOMNGkp3PEEdfXfMWNAjeRPExUK5r
	DnTgqFLyntiEeMsgT9qCwVl0VFef8ZdqdO/1hm50aaQ+pG4lLGZHlVyfTqQj
X-Google-Smtp-Source: AGHT+IHlx1ocSrSfQC6rBvgXoD6UTBtcfEZEJLFio4hh+rDxr6jnScr4zDB4c6GhAMdPZIIAhlTMfw==
X-Received: by 2002:a17:902:c952:b0:1db:edb8:35f6 with SMTP id i18-20020a170902c95200b001dbedb835f6mr14666807pla.5.1708524828796;
        Wed, 21 Feb 2024 06:13:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902e9c600b001d706e373a9sm8061836plk.292.2024.02.21.06.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 06:13:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Erhard Furtner <erhard_f@mailbox.org>,
	Ahmad Khalifa <ahmad@khalifa.ws>
Subject: [PATCH] nct6775: Fix access to temperature configuration registers
Date: Wed, 21 Feb 2024 06:13:45 -0800
Message-Id: <20240221141345.2231350-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The number of temperature configuration registers does
not always match the total number of temperature registers.
This can result in access errors reported if KASAN is enabled.

BUG: KASAN: global-out-of-bounds in nct6775_probe+0x5654/0x6fe9 nct6775_core

Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Closes: https://lore.kernel.org/linux-hwmon/d51181d1-d26b-42b2-b002-3f5a4037721f@roeck-us.net/
Fixes: 578ab5f0e4b1 ("hwmon: (nct6775) Add support for NCT6791D")
Fixes: b7f1f7b2523a ("hwmon: (nct6775) Additional TEMP registers for nct6799")
Cc: Ahmad Khalifa <ahmad@khalifa.ws>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
Erhard,

it would be great if you can test this patch on your system.

Thanks,
Guenter

 drivers/hwmon/nct6775-core.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 8d2ef3145bca..9fbab8f02334 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -3512,6 +3512,7 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 	const u16 *reg_temp_mon, *reg_temp_alternate, *reg_temp_crit;
 	const u16 *reg_temp_crit_l = NULL, *reg_temp_crit_h = NULL;
 	int num_reg_temp, num_reg_temp_mon, num_reg_tsi_temp;
+	int num_reg_temp_config;
 	struct device *hwmon_dev;
 	struct sensor_template_group tsi_temp_tg;
 
@@ -3594,6 +3595,7 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 		reg_temp_over = NCT6106_REG_TEMP_OVER;
 		reg_temp_hyst = NCT6106_REG_TEMP_HYST;
 		reg_temp_config = NCT6106_REG_TEMP_CONFIG;
+		num_reg_temp_config = ARRAY_SIZE(NCT6106_REG_TEMP_CONFIG);
 		reg_temp_alternate = NCT6106_REG_TEMP_ALTERNATE;
 		reg_temp_crit = NCT6106_REG_TEMP_CRIT;
 		reg_temp_crit_l = NCT6106_REG_TEMP_CRIT_L;
@@ -3669,6 +3671,7 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 		reg_temp_over = NCT6106_REG_TEMP_OVER;
 		reg_temp_hyst = NCT6106_REG_TEMP_HYST;
 		reg_temp_config = NCT6106_REG_TEMP_CONFIG;
+		num_reg_temp_config = ARRAY_SIZE(NCT6106_REG_TEMP_CONFIG);
 		reg_temp_alternate = NCT6106_REG_TEMP_ALTERNATE;
 		reg_temp_crit = NCT6106_REG_TEMP_CRIT;
 		reg_temp_crit_l = NCT6106_REG_TEMP_CRIT_L;
@@ -3746,6 +3749,7 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 		reg_temp_over = NCT6775_REG_TEMP_OVER;
 		reg_temp_hyst = NCT6775_REG_TEMP_HYST;
 		reg_temp_config = NCT6775_REG_TEMP_CONFIG;
+		num_reg_temp_config = ARRAY_SIZE(NCT6775_REG_TEMP_CONFIG);
 		reg_temp_alternate = NCT6775_REG_TEMP_ALTERNATE;
 		reg_temp_crit = NCT6775_REG_TEMP_CRIT;
 
@@ -3821,6 +3825,7 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 		reg_temp_over = NCT6775_REG_TEMP_OVER;
 		reg_temp_hyst = NCT6775_REG_TEMP_HYST;
 		reg_temp_config = NCT6776_REG_TEMP_CONFIG;
+		num_reg_temp_config = ARRAY_SIZE(NCT6776_REG_TEMP_CONFIG);
 		reg_temp_alternate = NCT6776_REG_TEMP_ALTERNATE;
 		reg_temp_crit = NCT6776_REG_TEMP_CRIT;
 
@@ -3900,6 +3905,7 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 		reg_temp_over = NCT6779_REG_TEMP_OVER;
 		reg_temp_hyst = NCT6779_REG_TEMP_HYST;
 		reg_temp_config = NCT6779_REG_TEMP_CONFIG;
+		num_reg_temp_config = ARRAY_SIZE(NCT6779_REG_TEMP_CONFIG);
 		reg_temp_alternate = NCT6779_REG_TEMP_ALTERNATE;
 		reg_temp_crit = NCT6779_REG_TEMP_CRIT;
 
@@ -4034,6 +4040,7 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 		reg_temp_over = NCT6779_REG_TEMP_OVER;
 		reg_temp_hyst = NCT6779_REG_TEMP_HYST;
 		reg_temp_config = NCT6779_REG_TEMP_CONFIG;
+		num_reg_temp_config = ARRAY_SIZE(NCT6779_REG_TEMP_CONFIG);
 		reg_temp_alternate = NCT6779_REG_TEMP_ALTERNATE;
 		reg_temp_crit = NCT6779_REG_TEMP_CRIT;
 
@@ -4123,6 +4130,7 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 		reg_temp_over = NCT6798_REG_TEMP_OVER;
 		reg_temp_hyst = NCT6798_REG_TEMP_HYST;
 		reg_temp_config = NCT6779_REG_TEMP_CONFIG;
+		num_reg_temp_config = ARRAY_SIZE(NCT6779_REG_TEMP_CONFIG);
 		reg_temp_alternate = NCT6798_REG_TEMP_ALTERNATE;
 		reg_temp_crit = NCT6798_REG_TEMP_CRIT;
 
@@ -4204,7 +4212,8 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 				  = reg_temp_crit[src - 1];
 			if (reg_temp_crit_l && reg_temp_crit_l[i])
 				data->reg_temp[4][src - 1] = reg_temp_crit_l[i];
-			data->reg_temp_config[src - 1] = reg_temp_config[i];
+			if (i < num_reg_temp_config)
+				data->reg_temp_config[src - 1] = reg_temp_config[i];
 			data->temp_src[src - 1] = src;
 			continue;
 		}
@@ -4217,7 +4226,8 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 		data->reg_temp[0][s] = reg_temp[i];
 		data->reg_temp[1][s] = reg_temp_over[i];
 		data->reg_temp[2][s] = reg_temp_hyst[i];
-		data->reg_temp_config[s] = reg_temp_config[i];
+		if (i < num_reg_temp_config)
+			data->reg_temp_config[s] = reg_temp_config[i];
 		if (reg_temp_crit_h && reg_temp_crit_h[i])
 			data->reg_temp[3][s] = reg_temp_crit_h[i];
 		else if (reg_temp_crit[src - 1])
-- 
2.39.2

