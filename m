Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F0B2FFDEE
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455536; cv=none; b=nqDHJVwDO5rD6VLbR9Tey7pWasAI93ORHTZmmPJ4NGAuFX2jOufsYsCKI+8JwFDkIp86qy4AqeUYTbHVOUZUt5HADr9xQ5nX9WIfO4O6xCDDE2UOdLnHSN/V84km+2m2bMR3frCo/EnDs9fgzSVV9dHMZH+saSln592de4RrIms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455536; c=relaxed/simple;
	bh=Eh5IRvTnswmnOK9wRdCKiUd/QAE7htqibCmieigRDYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JN+x81L/CU0cZgY4TXWcHCONRv5yrLTXFAqmK9uj6vUWLOEMsleHjFfK3ubSxJxMSWo3BhaQPkq5W4jN0AV9ZGNQqsE28hXt4YV/iMov7ZqiCAt4hcvS6aXwIQi6nEFVuUjAoR0tncLxW/gsOtb0Fqewjd5+Kyh5A4IrIJw45pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lN/Neitw; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lN/Neitw"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-780fc3b181aso3259866b3a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455534; x=1761060334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeuZiGrgq5AqoxKy6iVMBB6IVGVRlwGBajyMeUkfniQ=;
        b=lN/NeitwvOU9nLumML2cgSNngs6gt4QLNxkx8PDZkuJoOJsQFs77wCGKhhRbuvw9U8
         yXa0Sa1zWnd2mLXywAcvoNHPSGMy81O8+bt3Ogjb4YHVux9yuFoBW590JsJ/kWSOUFZ/
         yS/vZ5y3a6XYNphzyae/nCz9708KrlKbvleETz1HRXflFrMvf3YA7Tug5Ixr87T6m/c/
         rScno7BsDquX59GsPAU6Z0b+aPfzrksTuaBYyU5GdBh3QsxcUK4os44FbmxSccKoMDyB
         TNLV+PBFZzKrXiQr7HqxunQmQREpag51utWTyfVY672X+gjaPzFOh88S94XRZKx3uGGo
         t9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455534; x=1761060334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BeuZiGrgq5AqoxKy6iVMBB6IVGVRlwGBajyMeUkfniQ=;
        b=sw35asnYrjV+LcWTvCX04Uhk1gQw+m6heYWzMDkbmYNSS7EST+MmeR+rETTkmW0vHj
         qzVwsNAscRwqXbuIYe9xNGAnp/6ZePuayxSLvxoJm0sIIQcDZBrd++XcCNVlMX02qCmq
         YKj1KDquOi+FkRsNDcaPy8VZBDugWCdVmDt9nScF2FAlJ7vs7O/pHWz23ZnfiMBOrD7Q
         WAcnNYb8wELgVNcbsBURscd4/VNSLFegxeYS71jPnTndOwxhKlGdC66sKZn46sK0khH9
         hjwuaDhQJPRuDQRvSYvD8di1X0X9djtDiA6opC6EjCf0HbLIs+fZxAJUPJiaTrT1dy7e
         lQLw==
X-Gm-Message-State: AOJu0Yw0CkNDXx/reFXxJD63wwYk6luRnGwB1mewZrg2M5hp4M/lpVUf
	pW2f1C0qZ9V8dnyN58IH4Qy7/KTy7hg1nFoq9sJs86b3hp2+VFgUF4YoEwvGPw==
X-Gm-Gg: ASbGncuYhaQnBl3odZpvL8igW26sWz1zFkH9ZqbvhOsjJrDthFMRIOX97mYgYvPfyRJ
	UsHMcDxQNb2Fr7fuxplkXQfoVFSS3l087MPVMtKRfItwZhZL6uMvn9HXHwOlf1nKcRR58dRhs42
	2n59Aik4xZ/bGk4dAEqTMmLKHSRuxRRgrVMP+tw7LAWu0kjhjzhRSvi3XbPh+2fPq2QOIy846ou
	f492wd5SrUCkGt9S4wRGy0GdtuqzirRKGkIv8lMcOyZaUaNS2FfSjViL9dN10Ejz9aQPZqJvp1u
	s/s78n4VHC49XhEiLjAzgIOGsgVVPGLYWNiChafYQWFV0aDbwYRexJTx6eDRr1YmsdmI2KMT9Bx
	qBq9mz08irk3sCDxWf9EOjdMfE3Hxju0pPXGlUCphyIEu1zdtTRLCtw==
X-Google-Smtp-Source: AGHT+IEpmkrPJeuqZJ6y6X+n4dpXUSth3hfOZTccbCMuWJlIgFOmHkSj50dz0uhEPW0TPxAk3wqeDg==
X-Received: by 2002:a17:90b:1e0a:b0:32b:aee1:18d5 with SMTP id 98e67ed59e1d1-33b5138e670mr30080872a91.29.1760455533714;
        Tue, 14 Oct 2025 08:25:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626403desm16132145a91.7.2025.10.14.08.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:25:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 10/20] hwmon: (max6697) Rely on subsystem locking
Date: Tue, 14 Oct 2025 08:25:05 -0700
Message-ID: <20251014152515.785203-11-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251014152515.785203-1-linux@roeck-us.net>
References: <20251014152515.785203-1-linux@roeck-us.net>
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
 drivers/hwmon/max6697.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index 0735a1d2c20f..6b4a52838818 100644
--- a/drivers/hwmon/max6697.c
+++ b/drivers/hwmon/max6697.c
@@ -13,7 +13,6 @@
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -91,8 +90,6 @@ struct max6697_data {
 
 	int temp_offset;	/* in degrees C */
 
-	struct mutex update_lock;
-
 #define MAX6697_TEMP_INPUT	0
 #define MAX6697_TEMP_EXT	1
 #define MAX6697_TEMP_MAX	2
@@ -302,7 +299,6 @@ static int max6697_write(struct device *dev, enum hwmon_sensor_types type,
 		val = clamp_val(val, 0, 255);
 		return regmap_write(regmap, MAX6697_REG_MIN, val);
 	case hwmon_temp_offset:
-		mutex_lock(&data->update_lock);
 		val = clamp_val(val, MAX6581_OFFSET_MIN, MAX6581_OFFSET_MAX);
 		val = DIV_ROUND_CLOSEST(val, 250);
 		if (!val) {	/* disable this (and only this) channel */
@@ -313,11 +309,9 @@ static int max6697_write(struct device *dev, enum hwmon_sensor_types type,
 			ret = regmap_set_bits(regmap, MAX6581_REG_OFFSET_SELECT,
 					      BIT(channel - 1));
 			if (ret)
-				goto unlock;
+				return ret;
 			ret = regmap_write(regmap, MAX6581_REG_OFFSET, val);
 		}
-unlock:
-		mutex_unlock(&data->update_lock);
 		return ret;
 	default:
 		return -EOPNOTSUPP;
@@ -559,7 +553,6 @@ static int max6697_probe(struct i2c_client *client)
 	data->regmap = regmap;
 	data->type = (uintptr_t)i2c_get_match_data(client);
 	data->chip = &max6697_chip_data[data->type];
-	mutex_init(&data->update_lock);
 
 	err = max6697_init_chip(client->dev.of_node, data);
 	if (err)
-- 
2.45.2

