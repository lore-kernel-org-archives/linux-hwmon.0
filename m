Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A8B3F6C32
	for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 11:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497442; cv=none; b=ojZvjBMz0TWN7Gx8tJWzwHfIBMkoMCEt5tjhRdQaQbotQitEn8nUGAwb7Eeapz+RFSPMPec6y3tKeu8VYvU0IILTSxwkJ2W2/olHe57JAieVO8gImBw8wKFiHWmzzr7eOQUvMS/oKfLblImvTlE7uFCxqHUtzd5sBhzc0W9eii4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497442; c=relaxed/simple;
	bh=oQIlCSYbzFuJWn5utFRqj8+nwniiWc+T5MOM5nbizn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XBPiXcyKm72vgkzty7iKKokkzTSNXkKX/xvCY5g/JsMvjoaw7N2lPNadL4+eqrt0HSM8/7rdJGQc6VVmZRKqJVVRrLmH5wbyB5oTicT/3sjK5WEHtASL5sQcD5whDv1Ge8mxNR2nUI2oVKsmQlKDD5B4hYBCOWxMl1Rq3Ri3QV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0RzHYZr; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0RzHYZr"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-472326ca506so608483f8f.2
        for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 04:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497436; x=1786102236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e9ih1Dp51xXbcXFgDzJBaGz1U3HD+6rRl2YFWuxnzhs=;
        b=F0RzHYZryhxN0GsGnes+k+tvnTyEZk7np/w3qqrBDBB8xquFCMF3Rg3dymULlBl1Je
         AfRgSWbJ7MCI4sXYcIsD5EnEL5HEGOqfbmfdNLMM8J3TJCRkzDXTQv71NKRrEcxeJhQc
         wkEVqIlbv73wi5hnys9AGPOFb+PUQ7UnnkKkXofJYqb3E2B1tPsm0RuJRoosXK+rYyAI
         VlPjRHYHn3ldBrWy3qYiv7Hkoc0AEAcWv6SvoekYg04ufunl0SD/kWNoyKAPNxTJ5wbk
         86cGb8xg4KelD9cLUKatJf4Rl+eNjLXAfErSC0CQqqGN43p6YHqcM+C3ueKWmwWHMJ5j
         r0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497436; x=1786102236;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9ih1Dp51xXbcXFgDzJBaGz1U3HD+6rRl2YFWuxnzhs=;
        b=m3JByn8YfhPHnItDINnh4s85u+4bQZkBYCldM/CD75Ib09TW0Wx2UUnfaNAU2xvDgU
         MXdw2xfiIkzSmzOUGOvoaBTK7lt1vTbBdW4Kt92XpiUCj7/k/7CGdzo30jOx/upHr1dx
         mTsGVwTuLQuyxThFgxiokDetKFJPXEgJlAhaFhPQ9S33Bv6MwyZe71jqP6qoLXVzsNHK
         bu+fWVg9pzdfFmaC41RPCdjyAYcQF89eBH1a5CYfRUI0GBimSfoitp3Y0LBjK2DC/el4
         Xy+oxxXYEAySrkNU1GTP08l+mInMVm5s9GGxIIioCgqyBm3VO04cV639rklGDeJXG/yn
         fLzw==
X-Gm-Message-State: AOJu0YydzrVPAkdZX5jaiBq5oBNpccA6j2OmyaEr7NHXIXzOtILhd2Id
	KzZSKtvsGCgLUTNmBZiuvOliS8NRDkFS7zFLf92KtXyFp9TRlWDk/jqa
X-Gm-Gg: AR+sD108z1mVZV00QpRvpM8Oa2gtzLujAlJA65VL6IS8gDnLwHELr0BOxw6XX6oS5+T
	gnl1GuSA1kKY9zaqEyUYA+ZOKcCDwpSgPbB1BXjUwqckOGJtTcIE2H4VwMfg/LM7K32fM+aRVBd
	B5hynhdO7omwokXqc3mZdaLsM7d8GfB13zAlhmndGiktnxa2Qt2vyFpHoYkLapXEB6bXrEZ/1Re
	5AyMxBQcvqnc7tcDuL/FmYbAILXCbQ5hwUO6JGtEpHALz7OIvmrBKWHGa0VxOI8zLH1DZK+z00F
	/C2oG688WxmmxdM75WTE3F3Y19ACxNN0W5ZL6wxGj1w+FaMQsATa/rIxboEmG8ES8k7cQslVJ91
	52VkFPswrXge+CGmI9PNS7Np/GbYc47aVASIfG2ezXQdneC2AatipeABDdHFs83De3NAdlyJFNI
	jiOZiSGPLtMfZEKOalFwkQLnmjC18H5jUKaPBmp7a5RwahQTTt2EM1UDti5MAmknSddzg/WYa4d
	lKFaTfRIg==
X-Received: by 2002:a05:6000:18a8:b0:47d:fc23:abe8 with SMTP id ffacd0b85a97d-47fd2b2ee28mr4206060f8f.28.1785497435794;
        Fri, 31 Jul 2026 04:30:35 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6besm3823656f8f.22.2026.07.31.04.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:30:34 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] hwmon: (emc1403) Convert to use OF bindings
Date: Fri, 31 Jul 2026 14:30:06 +0300
Message-ID: <20260731113007.145322-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731113007.145322-1-clamor95@gmail.com>
References: <20260731113007.145322-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jonas Schwöbel <jonasschwoebel@yahoo.de>

Add OF match compatible table to be able to use this driver with Device
Trees.

Signed-off-by: Jonas Schwöbel <jonasschwoebel@yahoo.de>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/hwmon/emc1403.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index cd753b38709f2..8b3173da25973 100644
--- a/drivers/hwmon/emc1403.c
+++ b/drivers/hwmon/emc1403.c
@@ -659,14 +659,14 @@ static int emc1403_probe(struct i2c_client *client)
 {
 	struct thermal_data *data;
 	struct device *hwmon_dev;
-	const struct i2c_device_id *id = i2c_match_id(emc1403_idtable, client);
 
 	data = devm_kzalloc(&client->dev, sizeof(struct thermal_data),
 			    GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->chip = id->driver_data;
+	data->chip = (uintptr_t)i2c_get_match_data(client);
+
 	data->regmap = devm_regmap_init_i2c(client, &emc1403_regmap_config);
 	if (IS_ERR(data->regmap))
 		return PTR_ERR(data->regmap);
@@ -682,10 +682,20 @@ static const unsigned short emc1403_address_list[] = {
 	0x18, 0x1c, 0x29, 0x3c, 0x4c, 0x4d, 0x5c, I2C_CLIENT_END
 };
 
+static const struct of_device_id emc1403_of_match[] = {
+	{ .compatible = "smsc,emc1402", .data = (void *)emc1402 },
+	{ .compatible = "smsc,emc1403", .data = (void *)emc1403 },
+	{ .compatible = "smsc,emc1404", .data = (void *)emc1404 },
+	{ .compatible = "smsc,emc1428", .data = (void *)emc1428 },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, emc1403_of_match);
+
 static struct i2c_driver sensor_emc1403 = {
 	.class = I2C_CLASS_HWMON,
 	.driver = {
 		.name = "emc1403",
+		.of_match_table = emc1403_of_match,
 	},
 	.detect = emc1403_detect,
 	.probe = emc1403_probe,
-- 
2.53.0

