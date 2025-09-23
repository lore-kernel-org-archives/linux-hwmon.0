Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F6A2BE058
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Sep 2025 19:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758655786; cv=none; b=fpaPL3e8ZQn7oAbDRiBqR7+U3YDhWIAdsgmE1XTLtE9ZF65MvDuLkjZmGnHUnyNNmzJafm9zbz7AxvysX4EuVDMOq49hq9g/dFoJCXnWnCVQaMVq1MZ5zZSZLvIXP7O4DHe6/g3KcdMh8styOjqPjPTF3KTww5Vcjb8ThMoin34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758655786; c=relaxed/simple;
	bh=bNPIQa1hzSUEp21UxvqcCD/DXZb5BW2TnmlqseXqEIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HRh8nCH/iFL8ak7VeyLexjNITyInxcPUE0OQSSxU2/T88eYGlmDHpFBz1joIgclx4c1s97l7DF/J2CTimlhogS2q5Z7rXluosbmqFu1v7gfL4jFiBOChTcMoHnLJMGaahEuC/3b/809QrLoB+rjIFsl38ZjZJOR355vzfRINjwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ctc9sJDq; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ctc9sJDq"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-62fce8b75a3so7765530a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Sep 2025 12:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758655783; x=1759260583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvvR3TD1/hZKig5BdYwMjCQxtKWaPvP8LVDupYgSUE4=;
        b=Ctc9sJDqwo8AQm2YQNJq3lrL3mgGpYCtgSAb6KnN6fjA7GCiCeUiGb4xJghtJUT8/P
         CteZmkXX+lwZgcYtFIbzyCb1MB77uaB1o9mtMMX8ZX15pOJ8ecQGE+D8ikbTxRI1eVDw
         VMMgmbzxQpGu9z4chiII8xj6bVouRypev0ePBoJN5DycEnqNoClHNoFcwIbN5tb6rpd2
         jS7BRpJXB8vc8P3yfNNaZ4iuE2j5h0JnWuWdxf3ZiZ9UHQvd6uQUmr+MSXxamMoAUJaC
         83wT7J2qVken2nrKdgUCpaYZoLnEfmqSz+k+5g2ZOFB0dvcQThAM2YPNuxD159DJA5wD
         YnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758655783; x=1759260583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvvR3TD1/hZKig5BdYwMjCQxtKWaPvP8LVDupYgSUE4=;
        b=rSnWgtNpHPemZknROZCQeel/2O+XRJfS1g5qW34Y07v8t3hPOT/O5YhnxDQ3JoButo
         VBAUGXGgp3u5zlWrZ4QCLeHHsWqeiQl2WUUnlgx2QUUUT9zdAdmbG65dsvvh5CGAijPC
         cXK1c9dkmpyn09yKq3WUFTxqQLyDI5Wgrw/ISsYB4r+sk6XWIKfH5X8ba6cWRlr6YyKX
         avpLV2CrAITQ5YeOydlowX2EO5KB9aKSjrsdnkVpLNp2tKlMhGZebCWzzho8Ge3uYrjV
         CkLPLOGs525FiTg56pjMEke1iehOQ+WRxb55Cyh/M8O1GpzKsAzbYZDgflZ7wkISn6NH
         pJOw==
X-Forwarded-Encrypted: i=1; AJvYcCWqIjt1EGIId+hRyFgLJG+os6wZQL50jcguAThsEkwcvAXcPZXiIYTD0yTEjJJ1j++RSuCV25ukM/z5kQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn/NqyuiW3mXA0C+VHscKhdKD9d7jwmNcSw3lh4w39nInsSP9q
	2GFNrg2f8p+SuDZCXxBDJLFElKVpiB3i7RTCpHiIKZp0D9t4EPs9ch+c
X-Gm-Gg: ASbGncuV9ksyqWS9VpccgSqEyMF+e57gydZ4C+0l3g60BbADYO2JR2IiEOqNYJD0a9n
	Dyagjqn09n4KmbipCWTpbpwn5SNQ3JZrWPiyswabkd+VSgWswQ6u1zYrWLTr0dAvINHRS3iKVbI
	UAUlB8tg5+wqWJJf/YOcbWSxonU9PPQKcoYMS8aySqNpab9q32ILGdbS5wQFO9JAdrkHShvgLaC
	a2mxG3Vnd/v43wos2PVmsp/t83ZWcLXftZvoft/VxAxu/rkCMdP45ngziDIh/FFN3Q/rgcdV1bB
	b5ObnoSr39t8qRFecf4RNNq45cgL3/xMJA6h76D0uYCZc/y97nQMl2+hQQykIgStbW3gkb4Bkjx
	XZ4Y8rauARkLFL5bAYYO0vNsaDj1Dcqx/wsZ1YLbf4C4=
X-Google-Smtp-Source: AGHT+IEI1qY18abvzA/F7kn9QvR+PwKMk7ak3Dt4UcaNlDekyOebnd5iqa0LFl9nA8m6jghAwB8cpA==
X-Received: by 2002:a17:907:7f8b:b0:b28:f64f:2fd3 with SMTP id a640c23a62f3a-b302a17b9e9mr306236866b.35.1758655782832;
        Tue, 23 Sep 2025 12:29:42 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b3ea:9c00:26e7:b56a:5a2d:1d72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd271f895sm1370710466b.97.2025.09.23.12.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:29:42 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Ben Copeland <ben.copeland@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (asus-ec-sensors) add ROG STRIX X870E-E GAMING WIFI
Date: Tue, 23 Sep 2025 21:26:55 +0200
Message-ID: <20250923192935.11339-2-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923192935.11339-1-eugene.shalygin@gmail.com>
References: <20250923192935.11339-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ben Copeland <ben.copeland@linaro.org>

Add support for ROG STRIX X870E-E GAMING WIFI

This board uses the same sensor configuration as the
ProArt X870E-CREATOR WIFI motherboard.

Signed-off-by: Ben Copeland <ben.copeland@linaro.org>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 4a99b65338bf..a5a58c00c322 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -36,6 +36,7 @@ Supported boards:
  * ROG STRIX X670E-E GAMING WIFI
  * ROG STRIX X670E-I GAMING WIFI
  * ROG STRIX X870-I GAMING WIFI
+ * ROG STRIX X870E-E GAMING WIFI
  * ROG STRIX Z390-F GAMING
  * ROG STRIX Z490-F GAMING
  * ROG STRIX Z690-A GAMING WIFI D4
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index dff13132847c..ce3ea0333fd9 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -635,6 +635,14 @@ static const struct ec_board_info board_info_strix_x870_i_gaming_wifi = {
 	.family = family_amd_800_series,
 };
 
+static const struct ec_board_info board_info_strix_x870e_e_gaming_wifi = {
+	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
+		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
+		SENSOR_FAN_CPU_OPT,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
+	.family = family_amd_800_series,
+};
+
 static const struct ec_board_info board_info_strix_z390_f_gaming = {
 	.sensors = SENSOR_TEMP_CHIPSET | SENSOR_TEMP_VRM |
 		SENSOR_TEMP_T_SENSOR |
@@ -777,6 +785,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_x670e_i_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870-I GAMING WIFI",
 					&board_info_strix_x870_i_gaming_wifi),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870E-E GAMING WIFI",
+					&board_info_strix_x870e_e_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z390-F GAMING",
 					&board_info_strix_z390_f_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z490-F GAMING",
-- 
2.51.0

