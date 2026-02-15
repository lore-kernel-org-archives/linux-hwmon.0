Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC6C23ABBF
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Feb 2026 15:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771168685; cv=none; b=FMX5oLf/kVjcZwY2VIVNcHTSqKA6GqU5+lDup6dqiWbUdSuYHZ4aaJHp7RFNpvyEDKs+qQcw9gxhUUfWFmjv2VY2AbjMKsHhu1ABrzvovCcNuloK9RphY3PUjW91T5lKlf/IOY9IwtocFhPrUqLQz0EWO3cYqKYamr3DYSMrJpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771168685; c=relaxed/simple;
	bh=LRYqZNpTFVMl2hVGatHMpwm4ag75quu37E9Xmwr9nfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tVF64AFB8Bmk5yru4q14WCHKQ28pURjH/wMWH02MPLGhKUmXLezA38970+rQHTjrhJHLRlh0bbnfCu9EwHfWpci1mGKGc0LXMbHwISZaFJWqPNCVEHWmvWGU8YBS4/Haqca9/6N+NwbnPdPTv1Ty4olpSz4eNiprG8BFfPQoGEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nhs/zB+l; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nhs/zB+l"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48379a42f76so10751265e9.0
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Feb 2026 07:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771168682; x=1771773482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onE4x45lq0T0QEKBaoA448DSP5vQxIMuhDTKkki9WBY=;
        b=Nhs/zB+lq4cVrUyPT12r8gnv4/2Eg/iAicn6JrC7iWE7eEMtbYlFTY7W2LFlVMVzmx
         WcZYiT0KCfrbrrHT2AHXv8+MgwAJF2x15MOiCiP8yr6+vc1y/9IVVdWm2WRClVfYrnZB
         91e8zN3iFu8L7Ihjn6qslidwAelykRotp+JsKMQbnRvDM1JxIUiJg15YDpprOPt9N8En
         AecTgGxBo75g6F8yB16Yd//FYYc7dubCzYqIbSXyW8B9F9rDqWfMOknUP/1qTURLhmzy
         MucOR0m/3tM8ev9HMmHKYIe2ialCJyGr6yREVVt2JMCq9FB/ZzFc0htOandUekv1+rAU
         s8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771168682; x=1771773482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=onE4x45lq0T0QEKBaoA448DSP5vQxIMuhDTKkki9WBY=;
        b=FFVTQSeCkqYd9znzz0Gf/CQCrbpLhip9diECMy5h7kK5qwotoNbCETKKv3DPF7MKP5
         +kj0Gbn/0Mg+dFDX1pO1yYYKrc2GHhFsAfIRUKH/uGBUCggJf83jm4+txTk5Eg54unqH
         sH2ggYUzPqW6yroLw0fdrDjlCT+el1NRyxkBs3wDmcOF2txFUwCqeOXxQLzavCuOAjsp
         MjlbFcxiuyyIg/KyVw21lGKvJ6Ipfew+EatoY2+PEti4BydV48/Z/7mzf3vXm6RJa8Me
         +aK5w3wBD60hBti4RbBnAaEwjf8WQG0WEM769SeaB/RfEnFrMVb+yblgXtPtn+Rt0qCM
         oQ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUW/PmFtRi49geDqW6WEKC0PV7Gg8rHcEgdUXG4sMCSMVLfLUVTxydWtFR8SEY7WMSmYoyRY6+hy0/U6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHLSZ4FHPkSuwMyogQ0642zysqYI0K5zSRgfd8tqQwmgMmaIHD
	iTPDiFAfP8pksnXwfigQlpRVR3c5Aap7oqo4hepmi7fUrEwhCwoWuBGc
X-Gm-Gg: AZuq6aKRsUxnDywF2/6N4e17tCrKhxbrt4bi2mI/JRO7ihDmIB6bP0aV7ZhCic/YQTP
	I06IbDR+gGctVY1KbA4nE9ghgmc+z4dwU3cwc0BgLKClDJR+fl0yBPJ+XvnMCWI78LTBnE55E7P
	hAj9MSnOqU7uGlmr+IyE44VXtVD7qxNfxerL9pSLJ+og0Eb4z1wfLtnAO7k3WEIiLPx6tKQptEI
	pSNA5kHAbeVF/VJHpXXIZzQdc5mBLrmEZk1b7JDGelvJJzao1iHwStIQoCwGtG99P+wGHuLEjKp
	wg3pqZiMGBai43GfwslgqLf3W1uek+p8lV4AZMFrl/9zYulK53Y6U97N8/RHtStgyeDtbvP+OGo
	UYFoWrix176V6SX418LWhl8Ypw1NlPFybPvC0xFTBmasQLi9SICY7otU6SLZuyowRYSpRwTxcna
	IxXaPRbOo2122Dsry+YnLXly/nkOcmXe+E+N9jfNVAeQ==
X-Received: by 2002:a05:600c:1c07:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-48379bac86bmr105580595e9.5.1771168681982;
        Sun, 15 Feb 2026 07:18:01 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a29c13sm63668925e9.16.2026.02.15.07.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 07:18:01 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: "Timothy C. Sweeney-Fanelli" <tim@zerobytellc.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (asus-ec-sensors )add ROG CROSSHAIR X670E EXTREME
Date: Sun, 15 Feb 2026 16:16:18 +0100
Message-ID: <20260215151743.20138-3-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260215151743.20138-1-eugene.shalygin@gmail.com>
References: <20260215151743.20138-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Timothy C. Sweeney-Fanelli" <tim@zerobytellc.com>

Adding support for ROG CROSSHAIR X670E EXTREME

Signed-off-by: Timothy C. Sweeney-Fanelli <tim@zerobytellc.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 58986546c723..8a080a786abd 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -22,6 +22,7 @@ Supported boards:
  * ROG CROSSHAIR VIII FORMULA
  * ROG CROSSHAIR VIII HERO
  * ROG CROSSHAIR VIII IMPACT
+ * ROG CROSSHAIR X670E EXTREME
  * ROG CROSSHAIR X670E HERO
  * ROG CROSSHAIR X670E GENE
  * ROG MAXIMUS X HERO
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 86f444498650..976dc04a6aaa 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -451,6 +451,15 @@ static const struct ec_board_info board_info_crosshair_viii_impact = {
 	.family = family_amd_500_series,
 };
 
+static const struct ec_board_info board_info_crosshair_x670e_extreme = {
+	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
+		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
+		SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_WATER_IN |
+		SENSOR_TEMP_WATER_OUT,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
+	.family = family_amd_600_series,
+};
+
 static const struct ec_board_info board_info_crosshair_x670e_gene = {
 	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
 		SENSOR_TEMP_T_SENSOR |
@@ -820,6 +829,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_crosshair_viii_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR VIII IMPACT",
 					&board_info_crosshair_viii_impact),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR X670E EXTREME",
+					&board_info_crosshair_x670e_extreme),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR X670E GENE",
 					&board_info_crosshair_x670e_gene),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR X670E HERO",
-- 
2.53.0

