Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D53288C2F
	for <linux-hwmon@vger.kernel.org>; Sat, 10 Jan 2026 17:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768065616; cv=none; b=ELCWeaIm+kGpE5FdJNVsYWW/IGJJJG3vaYhFMBtjjzrb0+BEisXd7cN0c3Li0vinCctl2lTmdZ/Q2D84V5pbNcjHdlVEYMI66fV8Jv203DIFWXOS576RWN7t0llLzSA2/aiIsi8+4vScOt5RPXJdTzheS6vRV/NDrE+gcZ0stUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768065616; c=relaxed/simple;
	bh=2bAiv/5YAlJAjOjTYMREsGQppSmx4UBo84HeK4JsLb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e/h89NxnbZJQQMWiD7VCthYz6DVDGIoIQRnNthc87LwgSpWHrqEtRnZ78UoirC6WwZu84vqAdjyiSnGbU9e8UeseKjlJPWHyrCGaOTPqGDDdIvbdlOcqGxqHwUJbAmwLI8WE9xi7kFjHvIOiCgv7sc550/5GWB/4QNW6F7IFUxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAHPavN8; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAHPavN8"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b736ffc531fso975227766b.1
        for <linux-hwmon@vger.kernel.org>; Sat, 10 Jan 2026 09:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768065613; x=1768670413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KmFOWWgl3KJPWdRDBHkBRWnKJPuWOmbU5jqk1OBpTG8=;
        b=PAHPavN8XYGcwlW0jacOBFRDuCHlRQhrb3l6L8SuzGxhavw6vlywOCkYvKKK3UMqRV
         vH1Pk2QHJLV7Bsl2bR3W2j9K8sdXgWgsn541bUOFz2uth6fFt0Mp+ZssepdPWC4QUrBn
         Coxx1BkjkqJJBPQFSzEmQ9XjA1GOEf261B/9l4fZB5aFwGpV5rfQNWOKE1SrPkYNcEFc
         Oiq7kfuErE7YEzqtrtmJx7rrMiaSOBu/ymIstpxJ/HFsvXgK5tW+igW3vZb4CJdwy3QJ
         ZNOskDdW3HCv2ixnlUjeY7/SDEaViyHUeeH8j9eEtzSMKI1GbXBLVo/f4giueqoydr2n
         v5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768065613; x=1768670413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmFOWWgl3KJPWdRDBHkBRWnKJPuWOmbU5jqk1OBpTG8=;
        b=wrgivlz0ZvDi/3z5Es5CjB4WU0djxplU2p6kiaMTpZTU8tEM3ra4axRc66lFYLdq9r
         YdqwHrpCm+n2NBftN6dvlzl8YUO/vo/9+7xGFZaXBw4JbzthbFXVODULL9vS67hRaxgc
         FERnvrQq3GVlnqZlc2BgxKVtwPFy16D4Z2PvnlZ4wuBYCpXMP+DmsJRmkHmgVvPcPaJg
         UsjRZuP/xByHIWfQqN4e35BmvBnmG6yIZZLzfWLRc6aud1s11Mg5LUSdxt3tJOcQMczY
         Zzlw34OULz+qP/VaQv7Ry+ZNnRZbfOFmLlmJi126YaKQSrbcE5Q9GhlMbh0dO5Ff1u/1
         kvVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHstdiLjSNu0YoPUepsJDfooWCQcvURrOTjnh3Sc1uxaMxXyHTz3acsL+/z3xwAgguc3fhtwOX+KLC8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxvRODPtJ6cj5pFlSfpCTenEQY/6GekCO+uk0HDSg+e21kehan
	E01CNWfMHFkSH4z6/Us+kHEA60tIhCo/J/RMIS1+ovP6pkaIjktROVLJ
X-Gm-Gg: AY/fxX47tYCLdhZZge04kMq1AKKlHp0jycVpUk5a2ORHHqEOQFL/vZ9jYN6DEGzYadv
	lZ/ThhGLxcbcwmHxTJIep33qIxSjzw9kYXg5X8SgrzFQonz5sGyGQBBKYympZBaLsxYIvmwBsZ5
	eE9hSlDrKYl1uQPa6DuE7mK5g0M+mowr4VOeyFDxLF8JuMKG2l/Wi+2RsTnQSqWtze9aa00GrlM
	USki8KG6IEBMHZX0B8RVpuasxITKfgsdmeCc1+0ZBO6mcWCLV9r+IebLCvdmvuMWNnayDFNEUoF
	lP6CV9wGh3R4aoyexHpAp6iur36ernxMkiZXDx00krnaiLlhvmkuEZxa/o78xi7M3YxoKtZR59t
	gliVU4HBJHOpdjSrw1u+RJetdqaK+auGkPN3xhIUfkihOVEEySU9H1x3rn/A9JaMFoNRs81zV2t
	E/RkiAbv2EKQsFv3L4d5cyro+gN4nAocxqeLkU
X-Google-Smtp-Source: AGHT+IHgvJO0Ew2ngAX20Gx8RCKc7ZS/VfXlyzvFe9+/SU7ECWa6LT/3ADbmIL6m9IvYEygrulhyVw==
X-Received: by 2002:a17:907:3e18:b0:b7d:3728:7d11 with SMTP id a640c23a62f3a-b84453d8cfcmr1311272766b.50.1768065612463;
        Sat, 10 Jan 2026 09:20:12 -0800 (PST)
Received: from localhost.localdomain ([196.188.252.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86f88f90a4sm173367866b.37.2026.01.10.09.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 09:20:11 -0800 (PST)
From: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
To: linux@roeck-us.net
Cc: Tinsae Tadesse <tinsaetadesse2015@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C errors
Date: Sat, 10 Jan 2026 20:19:23 +0300
Message-ID: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SPD5118 DDR5 temperature sensors may be temporarily unavailable
during s2idle resume. Ignore temporary -ENXIO and -EIO errors during resume and allow
register synchronization to be retried later.

Signed-off-by: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
---
 drivers/hwmon/spd5118.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 5da44571b6a0..ec9f14f6e0df 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -512,9 +512,15 @@ static int spd5118_resume(struct device *dev)
 {
 	struct spd5118_data *data = dev_get_drvdata(dev);
 	struct regmap *regmap = data->regmap;
+	int ret;
 
 	regcache_cache_only(regmap, false);
-	return regcache_sync(regmap);
+	ret = regcache_sync(regmap);
+	if(ret == -ENXIO || ret == -EIO) {
+		dev_warn(dev, "SPD hub not responding on resume (%d), deferring init\n", ret);
+		return 0;
+	}
+	return ret;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(spd5118_pm_ops, spd5118_suspend, spd5118_resume);
-- 
2.47.3

