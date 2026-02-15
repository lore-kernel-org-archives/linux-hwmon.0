Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45322D4801
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Feb 2026 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771168687; cv=none; b=m5nNVZkAJm85nkcqTRuM+QIqT+wiLRMmV62xoxmIdmkah12+THcEG30vtHAOmy055vh8e28EkXUpRAN/8ndQ02CY3U3pTSWbTE/pLaZLS1U9xC1/0eTqlaZzeGeEfQDhMIIPMlizKCfAfFZMRvRGTHqw87vwIJ9g+M86TRWH0dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771168687; c=relaxed/simple;
	bh=7Xou6BeoDUg062t3v4WbguwvOhTj1X5FEnFoGhfJxFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uklaw0KYlEHUGqJgglFZt0h6xeaJ3m6Her42I8arxXamnBD/buHkxiPYFrHAHRt5mojuMcN3APAsH2+SY28c2QK9UHIjRqXGK3lECq+yAaUk/hWqAmO0S9cGFcjSw9oAnLfQ7P5Wq/ycSBjgTfTvWktL+ORvZyflhT/igd5qFAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HG95zMW7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HG95zMW7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso18393675e9.1
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Feb 2026 07:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771168683; x=1771773483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aq6iApMut+rGGhxYyAWXWyRP0DMksZQ7585oGqUom+I=;
        b=HG95zMW7tV7KbTAW578NRbm7821mEzN3rPGKD6GGHSip8b7zATFBha7lcsC8jzh3T5
         SAzFj+/nrNE10XTPPAQqIK5WFGcYW9gVFiy2HD9uKw3Bml+N4S+IxBY6O8EtC7OX8GmX
         9ouiROJ2VJfjSOh+7ELp4OtTU3xP3sM+SOLzSbNG62wkfgDF8RV1Ih2I/ctKyVFZbMSk
         NnZANFoqEiD2Xq1QNLMGanm5VJK+356UYSOzWShhwc0aJBE+IZsZ40dPBoo4VuCQgdTY
         VMVf9pftQQJLPzZyKdj7szASeAISOpV/d1mgP9b/N9tRwj18QyCN5pOsdLSVzjMPl5tX
         rRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771168683; x=1771773483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Aq6iApMut+rGGhxYyAWXWyRP0DMksZQ7585oGqUom+I=;
        b=FPhawrPUoKdHp+/bKmqHqNuI2fjFzL8tUKZ1Jpqtoput29zEEUG0MFuAiUciNuHsLc
         oQSICAVa3+N42LlCIFaJnOEzTRuLfaNBYQXFXDRA4+w2tDvQWxyMKmV2YdB5gtlJmqh4
         G2IXzkgbTAYbayBG4orIORdGjBYwoGCfSVBOE2/J+wB3ppWLKYwZjBHejl1eHVIWb9RJ
         POJFnpAWSy6KDRuAFOmkfz/m1eu0Hq46lEuZ2bhdEImI1FFJlivIMHWKj+7Zs9OcQfq2
         DWYcNJvdRoTaWzpTvaJm8Mn+EU/nBtTM4PtFtpMp46Fr0R6ss1eslkPAk4jgR2uA2ifQ
         +sHA==
X-Forwarded-Encrypted: i=1; AJvYcCXtqGaUoQfRxiMuItgaJHp/qgX4a7tBqd0sv6N3Tg+BrpsGwE3oovsTsi7wDYnhYwqXDzn0VXnw6f6CDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1EIPKd3e1yxiPHC2YhKdAVs4iJdZlK+HtmGh4XPYvH1BF231w
	tI7G20PPRJ/gwkNKW2nS5ShJ/4Km6a7orQ0rerqEVwTHsyaMFBCHPnLb
X-Gm-Gg: AZuq6aJltFv3H1FpeIS9MNwe8xXaR+Zg+k0/Cl5XPRtlX5RweV+zcp81WlV957JTl/v
	0bUxuZEa5tPuwoHLbHts6Y5lKnosg2SYue98dZ/P80pdBkqbRr+utqPsFraeSzjPNXnmfZ/6usT
	coty8nUcqGxu5GGCS1PUawmOIENtS29qwz0E2SY5R3ARPVYdVhfICikOkMm/8LB5W8/qijGyDdh
	KqNuJmMTv9JwTw2Q0YjXFIgqBtVE6vLWGPcwueqvD4AVQGhMUNAG6t2t84yJ5vO3sRDt731TAPe
	FjHfNSK79xIujhD4HzHogNiqynJvZxRQLmZ/zQp9j2Cw2bd1oVr2ZGi6TDgJzPFCZPcJQP7fS4d
	EOlkeIjSHYrdBkSEVdQ8R9NAhKvRCHNt4aDA9qgLozgTqWMn98+pv2VUEAmiAWG9iDXvI1z5MDW
	qSdQZj7C7lhQ+RuJCtkZj9hKdCnTP4gzEDAdb8DCbsjg==
X-Received: by 2002:a05:600c:8486:b0:47e:e076:c7a5 with SMTP id 5b1f17b1804b1-48373a1c41emr118665725e9.11.1771168683219;
        Sun, 15 Feb 2026 07:18:03 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a29c13sm63668925e9.16.2026.02.15.07.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 07:18:02 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Varasina Farmadani <sina@sinanonym.my.id>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (asus-ec-sensors) add ROG STRIX X470-F GAMING
Date: Sun, 15 Feb 2026 16:16:19 +0100
Message-ID: <20260215151743.20138-4-eugene.shalygin@gmail.com>
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

From: Varasina Farmadani <sina@sinanonym.my.id>

Add support for ROG STRIX X470-F GAMING

Signed-off-by: Varasina Farmadani <sina@sinanonym.my.id>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 8a080a786abd..84b92093771e 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -33,6 +33,7 @@ Supported boards:
  * ROG STRIX B550-I GAMING
  * ROG STRIX B650E-I GAMING WIFI
  * ROG STRIX B850-I GAMING WIFI
+ * ROG STRIX X470-F GAMING
  * ROG STRIX X470-I GAMING
  * ROG STRIX X570-E GAMING
  * ROG STRIX X570-E GAMING WIFI II
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 976dc04a6aaa..ba1db62ad646 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -630,6 +630,14 @@ static const struct ec_board_info board_info_strix_b850_i_gaming_wifi = {
 	.family = family_amd_800_series,
 };
 
+static const struct ec_board_info board_info_strix_x470_f_gaming = {
+	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
+		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CPU_OPT |
+		SENSOR_CURR_CPU | SENSOR_IN_CPU_CORE,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_ASMX,
+	.family = family_amd_400_series,
+};
+
 static const struct ec_board_info board_info_strix_x470_i_gaming = {
 	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
 		SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
@@ -851,6 +859,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_b650e_i_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B850-I GAMING WIFI",
 					&board_info_strix_b850_i_gaming_wifi),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X470-F GAMING",
+					&board_info_strix_x470_f_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X470-I GAMING",
 					&board_info_strix_x470_i_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X570-E GAMING",
-- 
2.53.0

