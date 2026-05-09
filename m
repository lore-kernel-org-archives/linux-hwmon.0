Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8C830EF9A
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 11:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778325865; cv=none; b=cKRv1QIt1dL5g6LrBF2FEFcRq8OsWOm24nE8PGE/LoAVDnzLEK8gbOQkF5nm06YWdpi+VmaAWj3L1rfgDl5abxHsPCf+786AwLohLOpHMItMS3Ked0r777wh6b2qXlpOaL5viVQ2iooiDwKt1QLiyiGEje8RsmDqCV8P93Ydz6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778325865; c=relaxed/simple;
	bh=xFgzggUcwTQhYrztMktpZ4J0+1wDQhjy4GgYdiA5J74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jpyXofsX92L6O38cWi5sGdUFjo+zgscnftw+3QEJscw7dEsywgzGwP3aKKRNT0Ie8lsjxYI2tuDEj5nxpJYU+DwbsgE90JB1fAnkTRmuHQZ8y70EMgnEha+Q2mQrxo2C3Qim6KHioTDKmlsJKULex9/yKv21MhpFGZBuTk5lBd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ivhr0HDR; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ivhr0HDR"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d7645adbdso1569406f8f.1
        for <linux-hwmon@vger.kernel.org>; Sat, 09 May 2026 04:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778325862; x=1778930662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SsRNO1k/pPTGGEjXO+I0arbWvPAyg9Kvj9fHEjeDPnM=;
        b=Ivhr0HDRD9QLoBR/qmNgR57JEyq+AIeOnoeUhvBZ8BxE+7SYzk3Ir2ava/U6vUF8BX
         zQH5SsNnOcmIqdBhvsq7OrD+kd9mhYY4A7d426d3S6NGuea97VLVuRu8+Musc+pXVrd4
         xDJqkijCaBMSK0x0Nhx8y6MiaDpXzO8sKmq32F370LqoJZmGKvam1lA3BSb6noOVC4SP
         ZEFLmAslifMQ33vFtULRaOyvgfelWJs44GBv2QJVnu1ruNhFNBGT56PI7Tt4tgBiMJMq
         5Mze8y/rSCMgoCmpn7+TFz73SyFLh9axigu9js1coqlYKsbKjEHC+RGeA8VGAkaYZRdS
         b7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778325862; x=1778930662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsRNO1k/pPTGGEjXO+I0arbWvPAyg9Kvj9fHEjeDPnM=;
        b=lc/FU9dLB0OP9rBFHCBlWKKZRE5OPVHiYFs7DeqzspmH4lJhXuwevXNZkBN8IpWeuM
         91dlY6ysMUDb+BOgRBJ3dpdp32sAylULgMMn0DFbUlJH50M5QlmXSOipN+gxVhgKIKOD
         y1SCC7SxJi63d+GgFGTVN8DL7qsqgjYSKcX/fczUSgORcO01cTB7fbbW1z3K858euisC
         RhJrPvts4BgNL/I1wXHz4r9cG3TJHMo6FaufOva9ZvmrE1YLAMWvEC5698wc7M00e+uO
         4GDTg5NP68fFjlk/H6zQWaUvHIL3/fRNy0Rp4AWn7gEITc4MX9DXwjkvVVsVER1ffH+a
         F+dA==
X-Forwarded-Encrypted: i=1; AFNElJ/f4cNTxMPcH1r9dV1MuUeIFWV7AikD43qAd4/Ls6O/IQyKa4vp9CwqSGfghlEpbNUoqLXAIkklcu1cWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVGpwQXHDUgfVtEoGBPNzL5BaJK5ux3A8QgkeIFbpH4pBpEm3M
	xx096R3p29vE5wimU3DHXNi/k0GiVgzgs5KqZt0+1LcvfW0WpzuDsk4AJCnFHefa
X-Gm-Gg: Acq92OFG6cCLxxi8zMss6HJmR9cmGetK5LfcADmBnMTG+UpLCfucWpoSi6d2t3X/9wY
	146ZEnNrp6oYVBJ44vCy96u8i5SzpHwiNjPyW76VQqvkI2RJ0U/FjLEJKOXDf9TNMSH55pp1Kjc
	isWAV6mFPLXZ/YzYRaLk+Q72KokrXNcnf9LrXZDG5mEgGFvE+TWrTrTs5omg6kvcYd+QY6rISfN
	P5QcJaNEbavkrkZuAWu1rIN8SJPx7BeaGvWSgb65bZ0HbMU28NNsrLfiGPNGvvpUe3GMcu6rXmM
	ig4Uq9lS8rU4vj57ku65dFVV25DrtFTgFAXjB4Y0Zc/QsTRPBzVuCJGnERAr+EfI9RdZHw/H2Cp
	mxpclrILBvNob4snJbEJcsqK9vkRLM3WMJ++dyn778kbNxFsgBvfqtmsrAaYTvmjQrlTXnGM0R7
	jBKCWXeuqAQRF7kFrKqEfppCNgLmZiEvP66a7ZX5yzr5NoHrGtXoJuVG+huW+AoUXE9Kx5FS6E0
	Hpo
X-Received: by 2002:a05:6000:18a6:b0:455:cff5:9178 with SMTP id ffacd0b85a97d-455cff591b5mr4738540f8f.9.1778325861662;
        Sat, 09 May 2026 04:24:21 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.249.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45492271510sm14095710f8f.37.2026.05.09.04.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 04:24:21 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (tmp102) Change mode to read label property
Date: Sat,  9 May 2026 14:24:17 +0300
Message-ID: <20260509112417.51164-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace of_property_read_string() with the preferred
device_property_read_string() in the probe function to
read the device label property, improving the driver
compatibility since this method is not limited to
Device Tree only.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 drivers/hwmon/tmp102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 3aa1a3fbeaa9..a89cc49798f5 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -313,7 +313,7 @@ static int tmp102_probe(struct i2c_client *client)
 	if (!tmp102)
 		return -ENOMEM;
 
-	of_property_read_string(dev->of_node, "label", &tmp102->label);
+	device_property_read_string(dev, "label", &tmp102->label);
 
 	i2c_set_clientdata(client, tmp102);
 
-- 
2.43.0

