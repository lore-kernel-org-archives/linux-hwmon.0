Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92662D8DC3
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Nov 2025 11:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762083690; cv=none; b=YYJ8iALOxeiRAWHbs0L+DUNpOKnJTFRMczm6tzwnVOQj+XB+0bTQtAvzfPivg5ry1sK6Y0sIcOeMmWCSrxcTFIAdD7sD9Ynwqad1E9otPMDUbt9zQ3SWrRvKQHgHk8HuJREilV6U1vxLXyKLAlhS8GPqfLslMKCpajHdqbFHgTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762083690; c=relaxed/simple;
	bh=VE04nYBxHQRsPdLjqT4ucuOmSxe8WDwlwIgyAhJMqM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GU0xcwHxLunmmsLybxmh8fvJXh7ykc3+nJTDKnRMkOyWxoVUufoKfG5VHgDjKnuPVpej7//hbYV6rMxsPnSlkkmprbmD4qFxqr7vkXPAchDKZDXk2XP2YnNuiDqtV+syFchenL8JV+Lz9Yen5wX5JYfioPN7ZzmmnrSA7fzTMXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhS6ZDlW; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhS6ZDlW"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-429b895458cso2208812f8f.1
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Nov 2025 03:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762083687; x=1762688487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CIsrhF8fKl6xpi4S7c5S0dmkUD1dE7woU6dFPC4oses=;
        b=KhS6ZDlWU/qRiK8YDzB7GGYfqqQ2nxJbtF2Un4k5j1bvqJCO+5/TPucUeQcp+93oTQ
         2iSc3K19HnolbTUL27bo04iMopQEQTMmleOgH3peFe9g8kZfzAaEqq/KgkOEp5qPJQ4y
         Dd9/EncN/epgCKPM6Dv2PQtKsmm/9Jmkyo0jAa4bWpCVvWhtKLkqCN+FLMNwlNscYJhU
         KLY+uprwHF6wUn+o8oQDc/BlCU7oz/gK6YbAOdtqBGpsN/ODRLwJWLc2Xbwo2bIwkboB
         TDm9cGxX8uZ/7QulpxCAR3cmQHEhE08tcLRENyNbtvR2uGBC/9c+08a/pM1JtC93i3HW
         y4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762083687; x=1762688487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIsrhF8fKl6xpi4S7c5S0dmkUD1dE7woU6dFPC4oses=;
        b=fZuiH0FI8/Wx7uaYNVIYtSn2cQaVjcUKWHM2t8bQ0hLEgH9F4ysTB41+OxCyaDwG9D
         2G7+p5FudipX6ULMbBl2G2Ipis8quGHtzOCSO5ATOHXjVmAiVPH48IeBfpkUDKnOGqwX
         5dYu76vBRuijaDHXF/wB2GzB6L33Ha5F59nJ8nHado6OitbWstH7Zj8I3ql3OW5hZUZd
         0gOpVlD3hZN+4w5Ol4SfI6rs6uW9ByLZv0AoTBuI/qVgFpnBy+MVK9Y3a4I8WOY7Zjvf
         FEtim3iaE82rkKJSpGy8m0wWBTVi8OgW6aQY+vJhX+sVzy9Xuj+g+G5tJA39R5t1hkhX
         l2qw==
X-Forwarded-Encrypted: i=1; AJvYcCV7TpaV8W52oqL03MQdZsIWYFBRHh9Fkjo66pvoGe9Gz0dewr1LWgnT2PCPjHu1WLs8zm7qo3APg6oJoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzURY4Q1FTxyhTXtwKCizA4y96W4sQe8UkI2GlomtWY1xi7eb0V
	kHtbB44GAFaV4yWW5JMS+YYFEG58cWw5NeYJe97R0q2J3mq3YMIZB+sGudSSmqKg
X-Gm-Gg: ASbGncsRv/RRMZVxTU0G1aaa5kQlZjzKm6KKi4HXJgDi3F5xTBIqm95P2gciseC/u/L
	12Eje0AQW5GfqGNAEr6wpFXHwUiQRaKJ7qWgOtQKxDqVbcjCjc1DWR0JHLqvO5ru/EybiXU05ax
	0P9Qb+KV1G7+AFB5P5uEmk4UmBPiOL6fJ5Hh+7L7kvGvp6ml7EA58GMD3bZ06lJczY+VfuWXOlu
	VK7JHrLsdwbFSaV5TgseXeGbQq0U3SBKMKA2sgjn7QP4FQlFhR76RAW8WdZUxcXl/RgqG70nqIH
	dMEuHLWshAq/3XVPOmy8jw4VQ96zi1jfxgUTFFj/kdkaN0PVUekN9F7w3ALscY2YOJRL6eG/ZbB
	69ZPykiKluw3LI4M5WLeJ963u9wa2pMGd84/A9rE4U8cUDknPdIyUU8hqf/f77ovTEA4EYoS6Iq
	kMdwYDgQvQNXPKL8elPQ==
X-Google-Smtp-Source: AGHT+IFAW1GPGUitxzTNuVNXNVuU2PyIJB0/vZWm1b5inLEgfI1x1Obc+/SLssdUjGZyc5c64jbrIg==
X-Received: by 2002:a05:6000:2489:b0:427:608:c660 with SMTP id ffacd0b85a97d-429bd6adc06mr8057538f8f.59.1762083686851;
        Sun, 02 Nov 2025 03:41:26 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13f4732sm14138925f8f.43.2025.11.02.03.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 03:41:25 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX X870-F GAMING WIFI
Date: Sun,  2 Nov 2025 12:40:28 +0100
Message-ID: <20251102114038.283396-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the ROG STRIX X870-F GAMING WIFI board.
Testing done by the board owner [1].

Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

[1] https://github.com/zeule/asus-ec-sensors/issues/83
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 2666ed3a8ea3..f0a92ce30a02 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -36,6 +36,7 @@ Supported boards:
  * ROG STRIX X570-I GAMING
  * ROG STRIX X670E-E GAMING WIFI
  * ROG STRIX X670E-I GAMING WIFI
+ * ROG STRIX X870-F GAMING WIFI
  * ROG STRIX X870-I GAMING WIFI
  * ROG STRIX X870E-E GAMING WIFI
  * ROG STRIX X870E-H GAMING WIFI7
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 7f35eade3a9b..8c5eadd8786d 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -645,6 +645,13 @@ static const struct ec_board_info board_info_strix_x670e_i_gaming_wifi = {
 	.family = family_amd_600_series,
 };
 
+static const struct ec_board_info board_info_strix_x870_f_gaming_wifi = {
+	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
+		SENSOR_TEMP_MB | SENSOR_TEMP_VRM | SENSOR_TEMP_T_SENSOR,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
+	.family = family_amd_800_series,
+};
+
 static const struct ec_board_info board_info_strix_x870_i_gaming_wifi = {
 	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
 		SENSOR_TEMP_MB | SENSOR_TEMP_VRM,
@@ -810,6 +817,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_x670e_e_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X670E-I GAMING WIFI",
 					&board_info_strix_x670e_i_gaming_wifi),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870-F GAMING WIFI",
+					&board_info_strix_x870_f_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870-I GAMING WIFI",
 					&board_info_strix_x870_i_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870E-E GAMING WIFI",
-- 
2.51.2

