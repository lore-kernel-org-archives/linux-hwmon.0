Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB5FEACD
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 01:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724979984; cv=none; b=IXNGky9HH3S1UBP6BkWJnFbupNgcjXMoNbw3wc/PeD6bpkvLkfUqghzTbgDlCDpmZnWhqcpGbEwSe6G7+aOHd3lDMoCk8SgUAyy54ZSaeNUrAfFHqucMDmaErkL4hboQwM5O8Bj7diUkSna9wPBOUvdGLGjJd/JkV3DPk93lCNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724979984; c=relaxed/simple;
	bh=DQ8IrRvC18+qbPGoSQyksidnzS9Fu7EIXduD5k6lqhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X19mZSSzyQTN3WEzuKfoVKOVPaUYsnCRx9hjSGuVr+KY/JnslbPFmqyN5qYo3GIK5IZoqz2KySKGRKIpbrajRYdl1Uyow0x9JoYef1OYE62RRFEjLKqsoO8HqkfOnevrxqo7l7b5FPpAPSUKUOzh8qMrAt++7TEZVvZt1oG3l4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMk17tzb; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMk17tzb"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-6bce380eb96so727106a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 18:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724979982; x=1725584782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKoMTmIMa24CF5rXgpxgytBpmS0Vzby+YrYsIsE0EfI=;
        b=TMk17tzbk+z7ca+EGrlKGYEmZ5cI4Oiq4BSIvOtk0ApX8gqkrieXWRGBZn8SJPw0Km
         eYx0n33SrH+4miRbuVhHaAkssMzgSV5oTHtarlH0YHhTAVLo9l+lYsgzL0+enfuQifVY
         KRV0w+4AaKMYZRlPomVWLHZ1bG+18M2H1ZEJfzQZ/1I+rhs9ArXzywLICNYsyXHhjRkb
         2/jyJZFz9+24naf9rqEPjBD6TE+MN7tez9hIdZXq0KyVUizeV4XVrP31AfgRMC6XQ4v2
         aG4nrXv2vR8ggJy3g4RSztP2RuUqBqTdgsUSLKSesVm43t1sxryMqWj+XoLtuZwgg6nT
         bFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724979982; x=1725584782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eKoMTmIMa24CF5rXgpxgytBpmS0Vzby+YrYsIsE0EfI=;
        b=Oe5mjvLBYa07lXF2kA7GZTjSRG4GXArFW0ELpAVFu7rbAAZyowImUeqUfodShOAJ9G
         OwR/t7101a1ARi87BDs6BzV/8QNpaNelZaugZDgGmL4EnCjw53lX1yZIXOGXeNfmmMFD
         +Y8cgGA4STm6Qoc7FAQ64ov/BfxyHlkNjG0YRykZES9Qy/M0Y7rNGng0EH11U3aPIo3j
         2ZaRZrgG0Y8jOtX36XxqECrmt8oWN94KhMYvJwVbOPT2fGMEsLz+MOm08SPckM87O0iL
         RJkIx+xA6rk64PcNLGY95lDqhhejP9bBLHAdXhUKqS5r0Zicqk2th7zjbwfag0YylOcG
         YsqQ==
X-Gm-Message-State: AOJu0YwAvqTi0ujQqJpb6OdoGVpoMirEL4+PiLPhV8WpKyXYqFCSpf9i
	vnbeGlveKbpy+4VPCZnpMGGFPb73BupgVqE+7PCJR4QaWv3+aa/8mXoQzw==
X-Google-Smtp-Source: AGHT+IHWNM6V7JOQIUn1q7fD5usI6Nvtl+tQiZ4F5kSA86Dsok8AYRknx/R1JHpjkvKsMDTB6t9SMQ==
X-Received: by 2002:a17:90a:7802:b0:2cb:4c25:f941 with SMTP id 98e67ed59e1d1-2d8561a7107mr4629322a91.17.1724979981981;
        Thu, 29 Aug 2024 18:06:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d85b39d03asm2379129a91.43.2024.08.29.18.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:06:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 14/14] hwmon: (ina2xx) Use shunt voltage to calculate current
Date: Thu, 29 Aug 2024 18:05:54 -0700
Message-ID: <20240830010554.1462861-15-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830010554.1462861-1-linux@roeck-us.net>
References: <20240830010554.1462861-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the shunt voltage and the current register report the same values
when the chip is calibrated, we can calculate the current directly
from the shunt voltage without relying on chip calibration.

With this change, the current register is no longer accessed. Its
register address is only used to indicate if reading or writing
current or shunt voltage is desired when accessing registers.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: New patch

 drivers/hwmon/ina2xx.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 10c8c475c634..f0fa6d073627 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -480,6 +480,8 @@ static int ina2xx_curr_read(struct device *dev, u32 attr, long *val)
 {
 	struct ina2xx_data *data = dev_get_drvdata(dev);
 	struct regmap *regmap = data->regmap;
+	unsigned int regval;
+	int ret;
 
 	/*
 	 * While the chips supported by this driver do not directly support
@@ -492,7 +494,17 @@ static int ina2xx_curr_read(struct device *dev, u32 attr, long *val)
 	 */
 	switch (attr) {
 	case hwmon_curr_input:
-		return ina2xx_read_init(dev, INA2XX_CURRENT, val);
+		/*
+		 * Since the shunt voltage and the current register report the
+		 * same values when the chip is calibrated, we can calculate
+		 * the current directly from the shunt voltage without relying
+		 * on chip calibration.
+		 */
+		ret = regmap_read(regmap, INA2XX_SHUNT_VOLTAGE, &regval);
+		if (ret)
+			return ret;
+		*val = ina2xx_get_value(data, INA2XX_CURRENT, regval);
+		return 0;
 	case hwmon_curr_lcrit:
 		return ina226_alert_limit_read(data, INA226_SHUNT_UNDER_VOLTAGE_MASK,
 					       INA2XX_CURRENT, val);
-- 
2.45.2

