Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9912D3EDF;
	Fri,  5 Sep 2025 20:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757104942; cv=none; b=UA8HGSsvf9M/hA5eMvwUpWnDttZmhlNtt5AR8/KICFVYBXtp5sjpezYf+RalPlq09T3KYM1bys4mnQWZ95VEXWarUiB7Y6prgjhxYIhQjaSkNQsn1QKMh/Ryz/gKGWaZYxbGuL3W9wINzzfNWdS3iWrq8mZOUl0VbhtNsPqF5HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757104942; c=relaxed/simple;
	bh=187nibOMOMmr6VkpH9e0kZPFxVCxGj8Y3XBTIF6/IHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FACl6h5Hayy752hPFJqycr+Yot/p5b/lFuQhjWUkhuHO8T2mHeUBDqLezcp2QhHBsuSql0eFySDMcjuwLsfpv4OSs+sIylsTmf9NyMnwwwqV+7+0GP+cyPy+KKSVF/4ov2WNX8AF3zOo03DBcEKM0BdVDevnNd5lH9JPDZiiBrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TngL6b3o; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TngL6b3o"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b4e84a61055so1822266a12.0;
        Fri, 05 Sep 2025 13:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757104941; x=1757709741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycgeLNEzGB22q1OMI0k7y+KImzui552Tv45JCWAqhqw=;
        b=TngL6b3owF4HbfmMHCNRFXQj9k456vHhk80WQftlxibVd83go8m+d2af/v0hur/RUu
         cLl+wzUaqczz73auoVJ7snJgZOByXTLU21hJFzptFt4OYungjEsdjFy167N/q37aO3NL
         S8eXUSK+qcyKLrfL5fMiIcaVmqExtIHKIbKN8paKRTpIyKUmz4yJnA7iyAjoDlAPLsjR
         qnlFuqGH7pa/UtX2fg72rHSHAi1SGjBMU2bR7M07fL99f9MGZFYjgMZI1IQG965iF7hR
         nm8/wzp53g3TMX4yyCYXG0H7fqIqjh39iE7MkOUURQjsi9y1uc5wB8ZYYdZZETl48VDn
         L53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757104941; x=1757709741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ycgeLNEzGB22q1OMI0k7y+KImzui552Tv45JCWAqhqw=;
        b=s/4bwGNOvTLDW/zVIhhGHOtVCzxe5clwiVd/HmHmbagAlsCYAh5TS5W6Lzr+FevdI6
         6sZbnOQQWaiKyYeTj2Bo7bV9ULUaPqaR6/KnCb5zcx9N6Fw20i6vHqSORFYNfhr544U4
         iNO6/uFy62Ai4nWxMndYqNZ8YAkdG3lLCi/xhtj1km5yQq5XOJ82qqUzOxar8QsEiS/o
         9/BOZNRNSjSEt7Vtrndqzfhr3+gY2jLROG2Mp/aeV2gbYFmnji8RRiRUgqE0ZpVK9u3f
         PyyhZJ1aPZPNlFjvths8NhpoJ7wBnK06lNdJost5wgeMF32zmVajc9EdwD3AemlCNfko
         LQvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5JKB4e2XNKbZOgXroszlRv8PqIQPzmwXLl649gPwyaVWt/R7xjafNbk+zJ+ZdU9gdk/3G9rlRlDbG@vger.kernel.org
X-Gm-Message-State: AOJu0YyssWYIrA+BvdLJt9Tw7EMkztRhb6ChE7ScdERee7eWiwH42ppf
	mGCTiUm8DIkZNALsUiFBwssVJsOm9KcJT66WotcpiQQMBI4EpQuZHZ+Qbg0Ezoa7
X-Gm-Gg: ASbGncu8ThrnzDtUOBwRFUg12ThXqIoNmoBlmWVioALyT2hTEUd+sHPb7Pl9cubj2xo
	oJwol3JV+thNMXs31fSNvnXJV/u5IlSFO2RYAfDCS4QesIU/gw/u410UMpVpToGFGnbQpn5cjRy
	EYuvOs2ANVXuE2wQZXpnPJQPDBnvSgIjatg09Wol02403YCGtKtJ9KIkZEUHM47SEdw7vJo4ghI
	HStUoMO0CsFblTzti9rRn6A3AMPObndgYvCwWL00SeHy8YuSqgbbqpM48Ysw20n/VXBQ1hRvc8I
	HoyBCDaPc8FlubmPgG6YLU/Q1Mct3fYVX8FOnYINyDkhrgUCcPdMF6/TKRkXx4XOpbDmXkQUrwX
	9K02L1Lv4Bgxc4Iq7IurHGFW5JhdPg/TpUKxF5VnSWuqb3A==
X-Google-Smtp-Source: AGHT+IFtbcB6WmdN2hgFJWfBqUIzftboxZyKsqENn8IPE8c8u6CQCmh3MMTDCv96OAFpX37BBGlnVA==
X-Received: by 2002:a17:903:284:b0:251:3606:755b with SMTP id d9443c01a7336-2516dbf1d20mr567985ad.12.1757104940646;
        Fri, 05 Sep 2025 13:42:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7724284fa02sm18705011b3a.102.2025.09.05.13.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 13:42:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Christian Kahr <christian.kahr@sie.at>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 13/17] hwmon: (ina238) Support active-high alert polarity
Date: Fri,  5 Sep 2025 13:41:55 -0700
Message-ID: <20250905204159.2618403-14-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250905204159.2618403-1-linux@roeck-us.net>
References: <20250905204159.2618403-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All chips supported by this driver support configurable active-high
alert priority. This is already documented in the devicetree description.
Add support for it to the driver.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina238.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 4d5b383b2521..24e396c69ae2 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -60,6 +60,7 @@
 #define INA238_ADC_CONFIG_DEFAULT	0xfb6a
 /* Configure alerts to be based on averaged value (SLOWALERT) */
 #define INA238_DIAG_ALERT_DEFAULT	0x2000
+#define INA238_DIAG_ALERT_APOL		BIT(12)
 /*
  * This driver uses a fixed calibration value in order to scale current/power
  * based on a fixed shunt resistor value. This allows for conversion within the
@@ -793,8 +794,11 @@ static int ina238_probe(struct i2c_client *client)
 	}
 
 	/* Setup alert/alarm configuration */
-	ret = regmap_write(data->regmap, INA238_DIAG_ALERT,
-			   INA238_DIAG_ALERT_DEFAULT);
+	config = INA238_DIAG_ALERT_DEFAULT;
+	if (device_property_read_bool(dev, "ti,alert-polarity-active-high"))
+		config |= INA238_DIAG_ALERT_APOL;
+
+	ret = regmap_write(data->regmap, INA238_DIAG_ALERT, config);
 	if (ret < 0) {
 		dev_err(dev, "error configuring the device: %d\n", ret);
 		return -ENODEV;
-- 
2.45.2

