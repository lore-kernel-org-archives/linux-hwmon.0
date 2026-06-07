Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51313A1A38
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Jun 2026 12:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780835928; cv=none; b=f3G2BHdcd0PCLzlvuWK9L1n0ibgNqmOlzOqqLfvgUQy96TBKEZx4cWSlIHdOExj5kU2grs+3zxqTV1ijVrZIfj1hIZnL99lukn+SHAeeA2PB9rkhK+J5ng94DNlAEj/ytmmRg2oMe9kq4+2Y0mk7c8dVXXBom29WyiecBS9U9iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780835928; c=relaxed/simple;
	bh=FjCBCQBvhI4rXGY6dvIpXGNM2bbD+NZ1EykLABFEHf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m8kkX7He8jBNinAhWcVn+2ixKgkjY2LV3xkVem52KXTJY8fGNGRTA9D2RZY4upx57otpWYkKHYlX2U8SMmhbkcM3+s1UgT2tZL4UiXDolbMmOmV4B1ojAFIX/VCBrlbrKDGuDVAZO5MZtB3n8bSR1sNYS+2w0mgsfWjY41BI0I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Idz9DF9T; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Idz9DF9T"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b64c8311so38502985e9.3
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 05:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780835924; x=1781440724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gLMHQNDlrf3MjGpXdmjqPlUzy/HY8aTD4m3wECplFhc=;
        b=Idz9DF9TQOzhOhj1Ng6PntYcrZHg8vU/BVX7kkf27SXIFyrJBmfxg3BKJ5d+yfN81N
         l2wN/zL05odfqtmz7pBVj8LxFHztYBoqbZBbkLhYUYL70SkgSSEjOAPuY1JF0TLrNj3f
         qY11kpYo84imhvsUHFqg+P8NV75cPTxpP87DwlSc2ov00EXNN/lRzHpdA+tvMEQWjDZ7
         cONKbdTsGzeKY8fkiS9ak/b5XIF5DUkuM4ZI6pqgPBZf4XuPLEos5R/vYgIxOZAME+Rs
         xk5C0yIDyCz1fuQmhzUSx2Gx5vDQRDDPDRlnBIxiHk4OkqN4B89VcPibq+XkPBXWkEGG
         ymAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780835924; x=1781440724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLMHQNDlrf3MjGpXdmjqPlUzy/HY8aTD4m3wECplFhc=;
        b=FfNTNQkjfRKe7Euh9ZehE1Fwb2mMWNl2WIW0DHXKwPQr6jVUb1KfSzsKCCMVEPhWIS
         SRzEmk44+IW0m0Xfd0upJ1/tGK5tpEAP2KBu0186ecIAJFqnH3jns+n7v/Nx8bOF85VI
         RRbvXOAzrtpBGndZb8b9nnc093j8Aa1l9C1k5Ye255EzuTtAgiw7DTyvhn7o5+FM8qds
         prqEWawgblPloDPgnbIwcZMTqcUlNy495mHOrOzopAqKyRFKUhL5JY8V/O8p2qi77B6A
         eIH7PMYXoK3cw0XwwC6wakxEmLRFDXAEniM1z830ssukypJxHUuiHQwaEQrP9ay9Zu3x
         hvwA==
X-Forwarded-Encrypted: i=1; AFNElJ9VC5TsiXZdTOCiH5NsRAXWomDpdxuy1z2M4AgJ2EDkm4M5fcPkcDbANuIFuWykWCloOkY8sghpwM5j8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUsO/gk4gQskPGvB6T5n2TFy6OQaGEsgI9htP613p72UKTuwZA
	ULp7NVBVujIRjphKQ6u7ElT+4igNIURpu8GQvW5PXIUBpsWbRjAcMxZc
X-Gm-Gg: Acq92OFkdur7+Q50ZNjJdD+6gOdGoenfbV2kYojRByofO2JKO54LkanwZRrRX3Bx1J+
	Aul6ITxUDJ75zbSQMAgPNiK2YZ04+ODZEEYaHc7w58alc9HtBYPCg/VYC9kldFGQN6sfUHMGiAE
	cBrz7/UpSygCTtZK0uT+CJ+Pd9e7Vt2xm0OItlf1guEV9WsIxmtoxiEeU6a/p6naZsRQiML7Fzm
	FCs4oN5xbN4yyFWO82l5JIuR3BlTNE3RsUJN8FPDio9DC7pHH9KkZK3AG5d1f86C3mJVBZebEUC
	4vPNdqERGePcBCrssjKrq4/A62fkL4jTvkgCLkLTDGlWTHnQG1pEbLQMGBWWDkxjLi0cG18aYDu
	SvCCjfq5IhfstaOpLMcyJS2Fb+9/0aKtG+2Z481WJgpE6Jz10VZR9gy2eXaZx2qO2pWzeYdtGR+
	eCsxAGT/rDRATms5GL91RU5Xxp7I4+0QZYjSE2yPUkAwolFrqWUJj5iics611xhQ==
X-Received: by 2002:a05:600c:c0d3:b0:490:53b0:9e53 with SMTP id 5b1f17b1804b1-490c265c107mr160929215e9.1.1780835924164;
        Sun, 07 Jun 2026 05:38:44 -0700 (PDT)
Received: from puma.museclub.art ([185.189.115.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d4891csm150256475e9.1.2026.06.07.05.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 05:38:43 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX B850-E GAMING WIFI
Date: Sun,  7 Jun 2026 14:36:16 +0200
Message-ID: <20260607123626.100630-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The board has a similar sensor configuration to the
ROG STRIX B850-I GAMING WIFI, but includes an additional
T-Sensor header. The patch was provided via GitHub [1].

Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

[1] https://github.com/zeule/asus-ec-sensors/pull/105
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 9ad3f0a57f55..9669e729bb8b 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -32,6 +32,7 @@ Supported boards:
  * ROG STRIX B550-E GAMING
  * ROG STRIX B550-I GAMING
  * ROG STRIX B650E-I GAMING WIFI
+ * ROG STRIX B850-E GAMING WIFI
  * ROG STRIX B850-I GAMING WIFI
  * ROG STRIX X470-F GAMING
  * ROG STRIX X470-I GAMING
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index b5d97a27f80d..27e39138011e 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -628,6 +628,14 @@ static const struct ec_board_info board_info_strix_b650e_i_gaming = {
 	.family = family_amd_600_series,
 };
 
+static const struct ec_board_info board_info_strix_b850_e_gaming_wifi = {
+	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
+		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
+		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CPU_OPT,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
+	.family = family_amd_800_series,
+};
+
 static const struct ec_board_info board_info_strix_b850_i_gaming_wifi = {
 	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
 		SENSOR_TEMP_MB | SENSOR_TEMP_VRM,
@@ -868,6 +876,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_b550_i_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B650E-I GAMING WIFI",
 					&board_info_strix_b650e_i_gaming),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B850-E GAMING WIFI",
+					&board_info_strix_b850_e_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B850-I GAMING WIFI",
 					&board_info_strix_b850_i_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X470-F GAMING",
-- 
2.54.0

