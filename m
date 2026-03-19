Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF66A38F249
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 11:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773920353; cv=none; b=Wf4tns9X8IwbC+yS3gBHfr4GJ6QkptKNuOfX9JoiyPRP+Cm8reK5hWkhV1gM4rhY6nCse2zgHz8zMAuC5VgkfXJFZE811rgOsPz96ZGQhsL/vQGf6HKcgdjWEU82ANfiKr/hroWMM9tooPKdBteuBigJ32VKs7zDPKcAvdO554M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773920353; c=relaxed/simple;
	bh=zt337e4gTE9xXxNQMH3ePobVgbsbexBH0pn/bLfRr+I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ACw566UXaXl2j0kz03AauBveZAwzS5Hv5tn7OyrukRfq+q7gH1xVPCPyax/6I653JC7kLuG3FLhS6oB1l7sFkTYWHJRCeTXBr/aMmnOU0vEVwxifxBXxcvRCKRJvZ+JZ0sz2Z0SdrEx6HCKlJYhdUsHcBDVka8x5cjvXkvuEIaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpbluQ7i; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpbluQ7i"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c2af7d09533so479955a12.1
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 04:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773920349; x=1774525149; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QlMf/4RiPeA+AQtQ02sHnl1xehVwZOmS485+huZWyf4=;
        b=NpbluQ7itxUFdZXq23w+CnloX2SqOAckAjzutOa7R1rAK78DD03JZ5JkOYZHYjXIbC
         A/VYQEoVt0YaecvqKjjX520UyA71inXv1p5ou18p/hxqDcgOgHtHeeC2khRXtu9utqG/
         ++O1MC3fZIZReKTzSnCzlp/g8C7Cab/Ox3Om7Mj4Mj7ZIiKr9aYa89fXRIrSZ4+KyppG
         kYlAM7qN/QrZ+QvtnoGW1PrtLPohuSJCOrMgEL9b7C+EEhXN6sJcy8oDCfWq8KM9JIhD
         FwobhcDgtiEafSR6/d2BWosydhEsmv6ymz7+OHh1QULJIpB8SbPRDWQS6HyJd3h0FHIW
         k6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773920349; x=1774525149;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QlMf/4RiPeA+AQtQ02sHnl1xehVwZOmS485+huZWyf4=;
        b=O+GifyEtBEHeunj+H6CVF3PLVxPcZobp556f86FEyowcCsVqfIfiCsMIVfEqPWeOJS
         j2B11mB7AFpaYZ+tCtkChcTJMxnf3QwE8QdlsOXUv6thZ2Ad05phtYmq39g2YU446tHh
         dDfhhiiqMyopmcRzHrT5LIBT00aVK8v0SuuL8yKh+xz/Izf8ihmwGdvqzMkTmQ80zpnB
         VZv2hJMmvdWYkhs0UFyeKE84CwXk7Ov6mMJB5Qqq03MozcHufRKEsgenvuI97HlTv/HB
         U1XeP5GffLjarlRNwncDcN32GpUZaB08onaUnNu63R4HxIbcTo2BtSkrHjSrL6UWT6hY
         k+dw==
X-Forwarded-Encrypted: i=1; AJvYcCUIKoFYRjzDw4bpY2jPAkRD8iDrq2HmKLVnmmMCw9cDcB4VtVtk6oeII58A++9YAczReH6DTmFttrT4HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YziaHtM0Q8jMCoKL7d+U286vROzRQ9hKW+52TZwaxR1I3nR2Wb4
	oLPjE6Ot4edhZY+g+0Rrs10mukH8tw9ULo0niIhmTxROMwEZkewZbSr+
X-Gm-Gg: ATEYQzwQroiqOZTwQNYqZOQTj4E1iwTQ8vh9Z0F5joOmPt+iuJWnsEMdpwbFbfVWHqn
	jqAc8xQi24UE/zO0I+pLZlmDT2/SDyULOKKsJKG3wRzWC9Gb+OK3XbzF+YkL7FNVlKiVlU6q5nQ
	GPUNq/+ACMBJa2uP5wsentTYbISDABKlanLwm7+F0eaDmLKJ8AP0IswuXxhY8i/BAdSke8EFJnQ
	i5eUI8iZMlkTD5gyc3iFgsBpe5o3PsrK3sgP3X29OidA6/hbZQtssIHbdYtTQLMxIYpgfd6Icu8
	/AygSzXR/xFFyTrMLqEpMiCjgKMGpbn8GVbsNVX3/MVkKR0SHK0hod8duQLeBWjxVyar7RPfCgL
	SoP+q1qhlHS5x7kBm7kMOu1o+1NwSchXi9ok/yVrKGOFEWsfsocnbUbgrieL3OG1T3OlR25tYH7
	1AGeh1VycPZlbCbWv2VOYivfvCYkN0Tw+6NWTcLUZYJHRxTXfiZI1s
X-Received: by 2002:a05:6a20:2d27:b0:398:8766:4d0a with SMTP id adf61e73a8af0-39b99d6c765mr6443580637.19.1773920348953;
        Thu, 19 Mar 2026 04:39:08 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e545d38sm4985706a12.19.2026.03.19.04.39.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Mar 2026 04:39:08 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v2 3/3] hwmon: (sht3x) Add support for GXCAS GXHT30
Date: Thu, 19 Mar 2026 19:38:34 +0800
Message-Id: <1773920314-17755-4-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1773920314-17755-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1773920314-17755-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Add support for GXCAS GXHT30 sensor to the sht3x driver. The GXHT30 is software compatible with the Sensirion SHT3x series.

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 drivers/hwmon/sht3x.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 08306ccb6d0b..4384c18115e9 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -934,13 +934,26 @@ static const struct i2c_device_id sht3x_ids[] = {
 	{"sht3x", sht3x},
 	{"sts3x", sts3x},
 	{"sht85", sht3x},
+	{"gxht30", sht3x},
 	{}
 };
 
 MODULE_DEVICE_TABLE(i2c, sht3x_ids);
 
+static const struct of_device_id sht3x_of_match[] = {
+	{ .compatible = "sensirion,sht3x" },
+	{ .compatible = "sensirion,sts3x" },
+	{ .compatible = "sensirion,sht85" },
+	{ .compatible = "gxcas,gxht30" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sht3x_of_match);
+
 static struct i2c_driver sht3x_i2c_driver = {
-	.driver.name = "sht3x",
+	.driver = {
+		.name = "sht3x",
+		.of_match_table = sht3x_of_match,
+	},
 	.probe       = sht3x_probe,
 	.id_table    = sht3x_ids,
 };
@@ -948,5 +961,6 @@ module_i2c_driver(sht3x_i2c_driver);
 
 MODULE_AUTHOR("David Frey <david.frey@sensirion.com>");
 MODULE_AUTHOR("Pascal Sachs <pascal.sachs@sensirion.com>");
+MODULE_AUTHOR("Zaixiang Xu <zaixiang.xu.dev@gmail.com>");
 MODULE_DESCRIPTION("Sensirion SHT3x humidity and temperature sensor driver");
 MODULE_LICENSE("GPL");
-- 
2.34.1

