Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784B1217F35
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706155; cv=none; b=nUt51JKTmvUjjv5xmXZB2xnthZPGAmy9b6GJ5v618KptaBYv5lKmlwuo6RzaODXehF9pMrghwgJIb9mSGjsE/P830api30Pv5kumTXVTPxjwo2FK/ss2MZ4FmrpA9AAsgnVOp7drG3EjAcfyFk/g69/Z4Hor5zM9Vx34uqXx0hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706155; c=relaxed/simple;
	bh=QFeJSfbuyrkjC3bBGCMs90ggbpraQe+7TX5NC2fX4qc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Morndzrqs80zMrnwUdQGqqZJJdOB1WS466K1yxxr+5VctkcTdHJl3psjW+hmhyTaaWFpakt9qbrgzZJSxMVeLOzWAvW4t5jkRH7WQt5TZKqrc/5BgXVIkP3qIr1SysiJ+3zOTTzZ+oHsSVMtfChoSftL0AG7OvzrTCh1vnG77V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OiLfy4rh; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OiLfy4rh"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-78f3bfe3f69so1753035b3a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706153; x=1761310953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/R1QqAgximqbsLhA/PLYPPY52dXcN07652b69IglCio=;
        b=OiLfy4rhRiqJgM9c8wGHZSPF3sJv63/wetMxinKFSg32NucogBgjmKiqACkKbO2Kcw
         zgX0iuQTeE7zwHeifoNOVbYNaRn4HeIw51LadHElY8VDj/DEFjt27/Gz9xpYl2sP21Ya
         Q5q7uAekjinaeHs+KjIXndpqPicv2Ih0zA136g/lVPrHEG16sCsWPcTP+wX4Gt9slWpe
         NtgfN7BWM8jpo7iFDkzS3+UKwQldF74A0gf0dslvvk3jWGZY4+qq+XLsXKlqgwD6Oa6m
         EXK/hRgFGwyb4hywCmyb3Uddo0SptdWv4CS61rnqbwVrqNh3urGRwZEC+Dpo2WTc1Kru
         ftIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706153; x=1761310953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/R1QqAgximqbsLhA/PLYPPY52dXcN07652b69IglCio=;
        b=GeG5WQ/Omk1AEIP7yui7C51Y6wHI4k/fq6ocUT7lkQB1e57bpNCNFRhBvCva5OB5dC
         cKS4yZrzvJ0Acf3djaw0a+iNnDMHkrA+STbIe3dwMGeivtC3obNZIxAbySA5fSMjv8j6
         vAGIin8/vF09woqr+moH2bC7ccGN5Ww7/r17nvX8a5VYQE7RQbVuAoP8Z0S8HLGm7AzT
         mZjQjKNks+P/eFHpQIhkehxlgZLhbUYdopxt24hO7FkJinT3IQ2XeWN+Yk9iKm35C+u0
         EF7gxRWXMjSI1+j0zlvOA+xYnUI9ZiYcTEiyG6nmDNLLMZwEW7X9vrbo+eRASZDDif90
         Y+ag==
X-Gm-Message-State: AOJu0YziQm+f0giN47Ekh6eCW9aosFQURgHNJa9fA1G55ezogi18TcCs
	FQ8P1X7h3tG852bdiajVFl3pPhi5u6llMDVpdrtSpsfCEhQboRbyDL7CBxwQVg==
X-Gm-Gg: ASbGncvZXSiuWOS8FaRDujOANZWbgMsU/tObzKe9vCz9BmUmb/+E8rwMxEMrufr50SR
	ury1HXXaoUOo4sdo8bHVHSO8VTRULZDEbk0wCNL9Hu7KTUzYolB6e1nE9jBetOBSfGDl8v/NEUQ
	Qb0o6gRoZUH7AcjkTHyJIhK+8MtTGmModptucPmcOTRTe04d80HWPhma6miQhMLl6byfAp6d+R1
	G6GG1LLi8rDYmM6slKEa14TreByE1jKyVebB2Le0hRFPz6l9Ty4o6Xh8ZZ15PkEJ1z4eomPf2Fq
	hsfFcAgLf0cI8k1vks51fnl6TEsvXbqZa+f0pD1xSvbWnoqxgoV1lZDwtQoKbVzKqSnkK3CY0sQ
	/NXMGOcnMAPvjTP5Ch2LaxX8zgupY71CJRysa18nV1ErHiwLJ2x55WECzJ9SSJ1vlvQUpM1CUBL
	Ps72jSsupsfb4x
X-Google-Smtp-Source: AGHT+IFmnoTKFHVbmvtAOwY9nfMcRU+WAdqxn7Hz8u1ZW6k4YUGEbRzGxlNnUtxdIUdR0E7LMkd8tQ==
X-Received: by 2002:a05:6a20:3d8a:b0:24b:1a6d:298b with SMTP id adf61e73a8af0-334a85ef559mr4457620637.34.1760706152978;
        Fri, 17 Oct 2025 06:02:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb19d3csm25647783b3a.31.2025.10.17.06.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:02:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 02/29] hwmon: (lm95234) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:01:54 -0700
Message-ID: <20251017130221.1823453-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017130221.1823453-1-linux@roeck-us.net>
References: <20251017130221.1823453-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking in the driver code is no longer necessary. Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm95234.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/lm95234.c b/drivers/hwmon/lm95234.c
index 7da6c8f07332..387b3ba81dbf 100644
--- a/drivers/hwmon/lm95234.c
+++ b/drivers/hwmon/lm95234.c
@@ -14,7 +14,6 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/slab.h>
-#include <linux/mutex.h>
 #include <linux/regmap.h>
 #include <linux/util_macros.h>
 
@@ -54,7 +53,6 @@ static const unsigned short normal_i2c[] = {
 /* Client data (each client gets its own) */
 struct lm95234_data {
 	struct regmap *regmap;
-	struct mutex update_lock;
 	enum chips type;
 };
 
@@ -107,19 +105,14 @@ static ssize_t lm95234_hyst_set(struct lm95234_data *data, long val)
 	u32 tcrit;
 	int ret;
 
-	mutex_lock(&data->update_lock);
-
 	ret = regmap_read(data->regmap, LM95234_REG_TCRIT1(0), &tcrit);
 	if (ret)
-		goto unlock;
+		return ret;
 
 	val = DIV_ROUND_CLOSEST(clamp_val(val, -255000, 255000), 1000);
 	val = clamp_val((int)tcrit - val, 0, 31);
 
-	ret = regmap_write(data->regmap, LM95234_REG_TCRIT_HYST, val);
-unlock:
-	mutex_unlock(&data->update_lock);
-	return ret;
+	return regmap_write(data->regmap, LM95234_REG_TCRIT_HYST, val);
 }
 
 static int lm95234_crit_reg(int channel)
@@ -526,7 +519,6 @@ static int lm95234_probe(struct i2c_client *client)
 		return PTR_ERR(regmap);
 
 	data->regmap = regmap;
-	mutex_init(&data->update_lock);
 
 	/* Initialize the LM95234 chip */
 	err = lm95234_init_client(dev, regmap);
-- 
2.45.2

