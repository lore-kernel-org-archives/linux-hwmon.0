Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDF338D006
	for <linux-hwmon@vger.kernel.org>; Fri,  3 Apr 2026 10:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775211330; cv=none; b=chWOnpbi5wLx9cIwJtUk9L18QvkRYR0AaD2CyqYNZxj4sLWDXvgMwwX3bUs0R7kEf3Pyhfr+dbxwPTiF1MatGYo4DLyttKc6qqYdmbioouJ6EreeeQnvGOPiOhN0JJ5+33oKMkTRXg/PV3NElUFICda77v9P4OnZYrJiouV/aOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775211330; c=relaxed/simple;
	bh=7i8J/fbN7z0SDl2RldQ6zv/iIja95/EoYFcW92yxPco=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=tlVfLqgXcxBR9ipMjfRv94aHre/98LJthPlGmyPQ/uEei7ywVZX8tRU3UcfbhherC+MyIBfRl7iu1L5r2cY3qaf+zVYZRp4WxCkTvt7hxeMF3j6pnQNFSaM6/vhgkth4mfRBaFsOqpk0uhvv8luCtPD1pYuYezNjOQBbKDnXffg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qYcoeav5; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qYcoeav5"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2aae146b604so10523525ad.3
        for <linux-hwmon@vger.kernel.org>; Fri, 03 Apr 2026 03:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775211326; x=1775816126; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tordCEdMdCISPKuHP1P7HVkOG9Rk7horQHJTiIOMN44=;
        b=qYcoeav5Jgh6JG5CnQJLkcmYqjsY1PlCjfw8J+573oX6CfJph3zwhG055pv1/LhJD1
         AacYzkviEHxOrrrc7wh5uT+3ASADEXLGI0bq2p+1DaNh+LeiqTLaJ99TOa/jFaGdl7Vk
         w/zOgwi+PY/q+PTlZ2XxoV5iucti2ZGw2mczJDM5K7vlySDcRtE+a4q/DRcS9BGPTVxr
         p4XA3ix0b3MbctswZ2ewAmFFyug7bnVz/LhmT9ZZXw/MvSnbZXvJqwmG6fdr8M0tB0Ma
         H7ElKbClPSC8uUo7q6gFjNaTJDBJTcVCZMknN+bQAfoXhmuusJnRgCo5bQerzK0SllSm
         sVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775211326; x=1775816126;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tordCEdMdCISPKuHP1P7HVkOG9Rk7horQHJTiIOMN44=;
        b=TW+10LJ+TWtNdzptENquaY9BCSI5c+l+zga8ocwQiREReMUjl/WjYINX1S8mTky0Yt
         5C1uh+aAx/rspRBQA4Ct5WGtP8qfpTFc/+jJnsBnRRdXzrmJ/G/mGqBGHuceGpNrQJBs
         byw9bdSPP7TT+TbFED717an/1Cgx43H7cbkKzavZHwzJxL7DnDqCssTxCBKQSTWWNiYe
         mi4ds0fzrMtnyOycJSBnHdjv3UCA5ypfSNZjP9vW7qxgIn1DFOOPIg6TDTv7OV7zC3t5
         LP6eenXab4Sw4kKtmRrWdjvS1ubmU3fFP+7Ar4/5eJJo5Kb7T/yNenBVJwYnqAaSZejr
         VE+A==
X-Forwarded-Encrypted: i=1; AJvYcCVKg3c196H3G0/kyrv+k3IoRo0zXcaYSTvYCnxTgA/Uvu/tzqS4c3vb44QUg9Z4s/jENPJq2yVtw+E2Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJb6OBhcxbB7rCwO1XTE2Zp1Ng1XMhiXFp8sRoE3MqCLq3qnQe
	kbnyvH6unxtpvljxQGh2OZjFcWOUOKg5O9NuT3cHQrhwVT3L/cm0e8HD
X-Gm-Gg: AeBDietOEb+kd9QCbPCvL/nfHwB9gEFHqYxW75N0qk0+61qFS5MCX6jcE9cBNO0aG2H
	b/4PV5gJQfu7JPUhtUN+GD27PjMZolNi+7+J66vLSqdSso7oQSZt0iG1ag8HueDLPGt2RX/8JKr
	6VzoVcv8Ii7KwmYNpJxr39QCZ183v9BjT2MrwxgDGucQhiv+e07V3s/7XxBgrva7wiPLkHp8XDS
	PcTImcc701GU58fEP+XQr4vXTB9DE8aTGccvscbBBAGXuAgku/j7n7nN9UUBdQEe9+brlECrWrb
	B5q5cgtZIUmfo6uYTbHslsLjS4plVWJK59z5TExIvssid9WG1+6dzBsUs+r/rvobbp2fTbsW3nt
	ofApTET0j2sWTf5xaaSD29yaFfQ93PoXBMkvelxKGnO9nSqOpv+0Fd5X9Aq6LMlqFSpOikKJw0i
	Rf9yd6CA1Ho1pwYabBhx3TtksgQimoVYFRJN5JTMeS8Q0ItXcjxVKxFHVdFJqTDBo=
X-Received: by 2002:a17:903:388e:b0:2b2:6df1:1112 with SMTP id d9443c01a7336-2b281969a70mr25700175ad.40.1775211326126;
        Fri, 03 Apr 2026 03:15:26 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2747341a8sm54383675ad.3.2026.04.03.03.15.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Apr 2026 03:15:25 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v5 3/3] hwmon: (sht3x) Add support for GXCAS GXHT30 sensor
Date: Fri,  3 Apr 2026 18:14:56 +0800
Message-Id: <1775211296-63722-4-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1775211296-63722-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1775211296-63722-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The GXCAS GXHT30 is a humidity and temperature sensor that is software
compatible with the Sensirion SHT3x series.

Add the "gxht30" chip name to the i2c_device_id table to allow I2C core
matching. For Device Tree instantiation, this driver relies on the I2C
core fallback matching or DT compatible fallbacks (e.g., matching
"gxcas,gxht30" with "sensirion,sht30").

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 drivers/hwmon/sht3x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 08306ccb6d0b..abcc7b4abe5a 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -934,6 +934,7 @@ static const struct i2c_device_id sht3x_ids[] = {
 	{"sht3x", sht3x},
 	{"sts3x", sts3x},
 	{"sht85", sht3x},
+	{"gxht30", sht3x},
 	{}
 };
 
@@ -948,5 +949,6 @@ module_i2c_driver(sht3x_i2c_driver);
 
 MODULE_AUTHOR("David Frey <david.frey@sensirion.com>");
 MODULE_AUTHOR("Pascal Sachs <pascal.sachs@sensirion.com>");
+MODULE_AUTHOR("Zaixiang Xu <zaixiang.xu.dev@gmail.com>");
 MODULE_DESCRIPTION("Sensirion SHT3x humidity and temperature sensor driver");
 MODULE_LICENSE("GPL");
-- 
2.34.1

