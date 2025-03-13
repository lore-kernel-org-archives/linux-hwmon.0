Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A4B1F416B
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Mar 2025 04:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741841288; cv=none; b=mKKGNumVM8b8uRxhMHsJ9Dm5x6u3r/WzadS5644pmtp2v3REOefu6ipKjalcCACmhAK0gqle7va+FE51Wm9PfqJc0M3FpkELEJXKgRKL3/d4ksG6E2tB7naE5J7adh+QsL6tw4p9LdvQfc2L/9w/r9xD+vC66/a6FS/mW/n6oX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741841288; c=relaxed/simple;
	bh=WgOaRD1/gBWqutG9Z8BbW44fhl6Jh8r0vqcFCFsRRH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jLM/3dyxnWNZ3tqgHBP1PXW/M2Q21x2wwlXpeJsRMF25PrDLETpDOgJALTzelRhbsmVvG7V+DXDqjLOXupM+C4KMoX6R59PGS+yfun1WFJMDIE0bVsF4n8vjoDtZhwqPbiKGRoc2I5iSah0q2RVHhSdB+I1xZwfByyWZUB5N7ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l8XLIkHa; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l8XLIkHa"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2fee4d9c2efso1023346a91.3
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Mar 2025 21:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741841286; x=1742446086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkgK5jX+FCEI8nouFKdll/aGvpUK/LQlAxZ+HobmESs=;
        b=l8XLIkHaRr+3rrGTL3T8k5pDti77vEL1zhTp590boh/NrsMqKTJRNAfygvgkLSAjXE
         oi9Q8+mPIGUCBIKJgZHq+f13mrRf6jGKW/z/OGyPm60IW2xWeGCvO+mi3GG0YLh0BD7b
         CcSLzbAnGe6mDQL6A0Jq0tabKimMsovEDFfJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741841286; x=1742446086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkgK5jX+FCEI8nouFKdll/aGvpUK/LQlAxZ+HobmESs=;
        b=a48vmJzxhByP310y7Mr0nAaMCtKVDnW2ht93Iarr1HXgEdwtPMrlc2oYqwTkgmdrxG
         P/zXJVca3lrrlfVw1IwKzKTPYCb7zJw4rOTv8ONP0RZ4BfCfOK4634b5LqPS0n55ggKf
         M0vt05Sy0Yji/otl3C8XatxBF3x1SQvnbBZVHdiCSIJRVuAE+yXf8yaWJtdAxqEZMFwz
         PBsjOxoMq7LRZGRpaPiasIt5GDex35SnufBPjiAyLPZuOoaqai/DxcqqluPYnhD0JYJw
         +y/WtIUctPPu6b5g2UaHQcDa1CldJ7N7IPmoqbDmRyK5I7x2ZfVYKrxm3yuM/MjOShT6
         vqzw==
X-Forwarded-Encrypted: i=1; AJvYcCVKMWXMifSk+llPlj9Afjr2SxcSXJGInZu8SfX+0wIwJO+1yjnBKSPLqRQdrMv0MW1v0MJ1O1zI1d/IkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM7d1ur76ZwVb0EuvCHJIgelSmumRk3AsXYO1He3djDzhdDDLw
	yW1EDx6aq8gqFWj4Al0dYVY/kIKA6wy1b2hCuFQdX0h1MqcTyusxWudcvD/IZA==
X-Gm-Gg: ASbGncsPfJev7bRoGbbV+cOBpNc8MD6Dbl1sloaxDwu72ij/LXNIhm33gEyQQQmhDom
	wGRUJUqDrv8FDh9OTvjATmuTWqD+4GOabh6wCSjOpPPsW2z1LyVh/JhF7DC1COvQPMvtLx7We/7
	bci29BmLQ2aWiycJ7HTiqrPUXxohYzyCecrrON73gkxTwtCuy32gGcDpQ8ApobRNTvQz2NC96k6
	w6kRPTsko2EPFcZN7cK2QaPHJ00P1kgoCCmL0iPmXqF0KBGGONKo3YmKBwXTKt02Wvao/DScYKO
	xVm9LNhRg+PkTuEoHj6S3KRxwQ96XWhKemYqs+gQvOb5/OG1qfX/0Cv5DCiWL6NspVo=
X-Google-Smtp-Source: AGHT+IEPWtvXkbZGs7O7/HumRDnQlpIfoYAFZcrr04/lKSaRzbzOgD2nzpzxAWXqpA6A8LJHsLZDTA==
X-Received: by 2002:a17:90b:3884:b0:2ea:37b4:5373 with SMTP id 98e67ed59e1d1-2ff7ce6d7ffmr35825012a91.10.1741841286433;
        Wed, 12 Mar 2025 21:48:06 -0700 (PDT)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:1872:6051:5c24:509e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd5c03sm4188025ad.249.2025.03.12.21.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 21:48:06 -0700 (PDT)
From: Sung-Chi Li <lschyi@chromium.org>
Date: Thu, 13 Mar 2025 12:47:42 +0800
Subject: [PATCH 1/3] hwmon: (cros_ec) Add setting target fan RPM function
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-extend_ec_hwmon_fan-v1-1-5c566776f2c4@chromium.org>
References: <20250313-extend_ec_hwmon_fan-v1-0-5c566776f2c4@chromium.org>
In-Reply-To: <20250313-extend_ec_hwmon_fan-v1-0-5c566776f2c4@chromium.org>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sung-Chi Li <lschyi@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741841282; l=2304;
 i=lschyi@chromium.org; s=20241113; h=from:subject:message-id;
 bh=WgOaRD1/gBWqutG9Z8BbW44fhl6Jh8r0vqcFCFsRRH4=;
 b=YYMOG4nN0QlC1W81qjF0ONgWNPNT9Xzvf6BHYEGPaJQUnSOwDM6fb6gAJ00Myf30pvq2ikkCa
 ackrFedOqFOAay02Dxg0OYzR57cAdXfXkpD6f40bhyf9h11LpOeevBO
X-Developer-Key: i=lschyi@chromium.org; a=ed25519;
 pk=nE3PJlqSK35GdWfB4oVLOwi4njfaUZRhM66HGos9P6o=

Implement the functionality of setting the target fan RPM to ChromeOS
embedded controller under hwmon framework.

Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
---
 drivers/hwmon/cros_ec_hwmon.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 9991c3fa020ac859cbbff29dfb669e53248df885..b2fec0768301f116f49c57b8dbfb042b98a573e1 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -52,6 +52,26 @@ static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8
 	return 0;
 }
 
+static int cros_ec_hwmon_set_fan_rpm(struct cros_ec_device *cros_ec, u8 index, u16 val)
+{
+	struct ec_params_pwm_set_fan_target_rpm_v1 p_v1 = {
+		.rpm = val,
+		.fan_idx = index,
+	};
+
+	return cros_ec_cmd(cros_ec, 1, EC_CMD_PWM_SET_FAN_TARGET_RPM, &p_v1, sizeof(p_v1), NULL, 0);
+}
+
+static int cros_ec_hwmon_write_fan(struct cros_ec_device *cros_ec, u32 attr, int channel, long rpm)
+{
+	switch (attr) {
+	case hwmon_fan_target:
+		return cros_ec_hwmon_set_fan_rpm(cros_ec, channel, rpm);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static bool cros_ec_hwmon_is_error_fan(u16 speed)
 {
 	return speed == EC_FAN_SPEED_NOT_PRESENT || speed == EC_FAN_SPEED_STALLED;
@@ -140,6 +160,19 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
 	return 0;
 }
 
+static int cros_ec_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long val)
+{
+	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_fan:
+		return cros_ec_hwmon_write_fan(priv->cros_ec, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(fan,
@@ -179,6 +212,7 @@ static const struct hwmon_ops cros_ec_hwmon_ops = {
 	.read = cros_ec_hwmon_read,
 	.read_string = cros_ec_hwmon_read_string,
 	.is_visible = cros_ec_hwmon_is_visible,
+	.write = cros_ec_hwmon_write,
 };
 
 static const struct hwmon_chip_info cros_ec_hwmon_chip_info = {

-- 
2.49.0.rc0.332.g42c0ae87b1-goog

