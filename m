Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CB914831D;
	Sun,  5 Jan 2025 19:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736106953; cv=none; b=VJWsc2CRdvwUEU5lcONn7OxJPqHTh7EBdHIt2emD5vYW/mefQDHpBzRsZ/n/c+l/liEBkJ5pPLTV7BXloCJFPAZiteDBUu+bkRlqaCHAx9HZiqKxYazAZfKDBWeiFKVEUz43y1g0UivKWO6FCeHzafxer1fnWyfv2iKWEu4I/ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736106953; c=relaxed/simple;
	bh=7Ol2pRNt9+3pQPpxaSX1Myjl7/Ti0PEgICf1yyULTSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=idhdJbDTpgDjCwCaX+9YS6iG2S38uKxN8Rq36Fof17T/61mFg8bpvxlN/kbmEc/BRUwE6zpepC2LbSy2wpr8oSRRfKc8vA8fgycacEhodS4KRu5PMtmPZsBg6CI06y1zWhXkLYo5EfcIWqA0CHEjEaaT1iHbEPgDlQhCnOkSCwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQqTVAik; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQqTVAik"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso90857935e9.3;
        Sun, 05 Jan 2025 11:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736106950; x=1736711750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gOWi7h9tUZPMFdNQ1GwytrlRFpP7O/AOIctsS3Vm04=;
        b=KQqTVAikWeSivZdZUORQ5qPen82J9f17dZ+j2SbpL2gfFJtByD/Tl0j0q5tsffWlyT
         WPascgmHYYPf7aXix9fsh2xZWHeniJuoTXg2+D19MFS7aRuifjghQUIJMzE5gQ+s3BJL
         vsOwq9yO2mX24n9NimSTZPh+AD2R+exwARlhicCh56caiWbNMf1BJreNSB6V8/oAlenN
         SJ+j2DGlAOPG8Hm+bKCrFnIPyF9GNvdYnRizYREZXoxDRIZySPRkk86EEy6QNIySFezG
         o6p5upRSC5nYCdY8PZaKll/kazApOSzQp/suv6lDqQfME6EFaF7cE/e2Mav8Z4ukwtYb
         2N9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736106950; x=1736711750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gOWi7h9tUZPMFdNQ1GwytrlRFpP7O/AOIctsS3Vm04=;
        b=o0Z2emc9EmgSxK7jydEtUNCRwMbBX5qsJIl97kYJp7/CB8XW4cHGe/wdunEKM61uXP
         rkQZAEPrmpIRkw/s6NOpZSRe01pcHBKw241z8IG0qPPB6ODJmDKtI2AOm3kPj4dm9x7R
         Nu3GeOZLQqRsZrbOWZZ37EJfQQ7vs8bxlpjWzfzfMrrn0Qs+310GIv/3SPmjWz6a1Xir
         VLZEUhFGmEmGIWsb5mmqobeV3Xj22h7m/7IXIOGoVAcC7n+OoKbrMaTiLlxHxzBZSDfc
         iIBQmjiCXG9dYYqftUGFrqOc2jdjuA0f4Dwzj2PdNdxJo+5IlbalfT1Sm2JD8QalmjBq
         1TDg==
X-Forwarded-Encrypted: i=1; AJvYcCV+zgfEURV1Zw8MKLeccRvCyE0e+uPQYtA4mZERmX+GYgxrdPqPMJcIVs71JEr7ebAMWdshDWFtxhBSqpwv@vger.kernel.org, AJvYcCW4wNHiwL2s8L6nKYt2lpKpFuQIQgkd1GuJdyLe1tVSVYkBHHyPXX8iur3nVw8bWQ6FA+npvDVIU+5UcA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj6hYy53U8S6chh1YmlPWB7GffTqKp6l0z0BDzcUeh2fu/gsqW
	My2I7bKXkquDityvknRJ81nM+j0GJ0tAEF7YX6/MJ+ADRjyxF6gy
X-Gm-Gg: ASbGncsarPjRRaeN2oTlOb/rf8BBC2TFNWuoQ0hI5tuetaehhHe44iJJaR7rbGI8ZoH
	f5QR0MckuMoB27/Y9THCqqrTzOEuILaUF7LVr5GIze5mn1tzv80iryLa/XxFcmyq3DcdcbmZzbm
	KJIaXEZbyJFldMlmEIMFSKQuszVcsG4rWYSfDHFfFy+IWwN2cdsm2zOsdeAajTzj8EGNh2bSJWF
	wYombx/LQkvu4vItoYFaHqGLy7TKAg7s+kw+shz/5r0rZ1HnUbGoA6f5yK5
X-Google-Smtp-Source: AGHT+IHhDVUxLtA19a5w4wScWlUpW6iWRBcRLJCut64FMVj+d4hyhBxrXdtg8vaMxZekiKRB+bhDQw==
X-Received: by 2002:a05:600c:3505:b0:434:fafe:edb with SMTP id 5b1f17b1804b1-43668b5f326mr431605275e9.24.1736106949524;
        Sun, 05 Jan 2025 11:55:49 -0800 (PST)
Received: from dell-f2yjyx3.. ([185.32.209.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b1143dsm577778975e9.18.2025.01.05.11.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:55:49 -0800 (PST)
From: Adrian DC <radian.dc@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian DC <radian.dc@gmail.com>
Subject: [PATCH 1/3] hwmon/adt7470: allow 'fan*_{min,max}' to be reset to '0'
Date: Sun,  5 Jan 2025 20:55:14 +0100
Message-ID: <20250105195521.3263193-2-radian.dc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105195521.3263193-1-radian.dc@gmail.com>
References: <20250105195521.3263193-1-radian.dc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested with the following script and values
---

{
  # Access hwmon
  cd /sys/class/hwmon/hwmon1/

  # Set to 1 => 82
  echo -n ' [TEST] Set to 1 : '
  echo '1' >./fan1_max
  cat ./fan1_max

  # Set to 1234 => 1234
  echo -n ' [TEST] Set to 1234 : '
  echo '1234' >./fan1_max
  cat ./fan1_max

  # Reset to 0 => 0
  echo -n ' [TEST] Set to 0 : '
  echo '0' >./fan1_max
  cat ./fan1_max
}
---

Signed-off-by: Adrian DC <radian.dc@gmail.com>
---
 drivers/hwmon/adt7470.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index dbee6926fa05..712bc41b4a0d 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -662,11 +662,15 @@ static int adt7470_fan_write(struct device *dev, u32 attr, int channel, long val
 	struct adt7470_data *data = dev_get_drvdata(dev);
 	int err;
 
-	if (val <= 0)
+	if (val < 0)
 		return -EINVAL;
 
-	val = FAN_RPM_TO_PERIOD(val);
-	val = clamp_val(val, 1, 65534);
+	if (val) {
+		val = FAN_RPM_TO_PERIOD(val);
+		val = clamp_val(val, 1, 65534);
+	} else {
+		val = FAN_PERIOD_INVALID;
+	}
 
 	switch (attr) {
 	case hwmon_fan_min:
-- 
2.43.0

