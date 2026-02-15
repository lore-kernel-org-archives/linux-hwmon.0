Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCB3145A05
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Feb 2026 15:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771168684; cv=none; b=bZrJj8cH/XlLXcje9EL0A2omIfHO1eshX4xmU/MIs9Pgra26GTWxcRqN+46QczUws9g7o4XxpVpA3OFjqDVicatYNEhwLczP7F3roN0z7PcY55GUzvJVOGZ1QAu/4eQYjufkqw5m4FYdxp0inY43w6B5n9oXG0MmxqoTEd81QcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771168684; c=relaxed/simple;
	bh=ZE5wO03ByAP6iG7XU89PRA8P8X3DWw2l1wy8NJLHmwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qOH2HyiACaZJH3jSCYZSrv2vpcsbRi+2sbEoU/ww0baatTg6Nns26cIP0lzAGyg9uMBV3y72TqrIfWkPMA+KnqPizSYHximOB4DNouXRayebAeq/BvkDvuNQPL+rgMGAiL0BXcqQ0Ii7/jPHZnK1zHUDrIS0tR5auvWy7p7jceM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RytmHYpY; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RytmHYpY"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-482f454be5bso41314735e9.0
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Feb 2026 07:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771168680; x=1771773480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wLLlHCS4a38rbIEKVaC1wzdp96LtY8Dp8FKU6XhKumE=;
        b=RytmHYpY8zrb71cT/Rih4ewKpTyqSpIR8eXehd3/sSfLRU1CMDg0pefibTltFbmUFt
         BpqU7gm66D0DQJwZjSXzlB/N8Xg9IWdjGDAKC+EznYhTdx78RxlfL3+FYWZgsZfM7kdx
         8xHvhnYuSB+z0tLQZNw0W2jsGHepnzPr3hFJ7h55GSnigvlKCz3DLLE9Nh5J0QbnaSwd
         Q7r2EPABCLnCLi6nsfztYfAVrzKXOlOtIBKl/7VpzeSjvSPW4Tje+bnr+vKCw2df/cnm
         IbADcoHTBUnq2O1BtQyziQh2HSLu5Xjz3rnifHBYkZ9oZKWdKkUEFR45b2qHhGBsWEnn
         rwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771168680; x=1771773480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLLlHCS4a38rbIEKVaC1wzdp96LtY8Dp8FKU6XhKumE=;
        b=b1CU/916RbOKDszA8tYu2uWMypRref5KmXuoLJ3oq83Ifyx93Rpt4opKh3auLd5Utc
         iK2HFJP9b5zi8FzWqyoQURaEXjx3ZezkWxL/fZhccp2oOjX/Hs6kLwUU+t1mGxpOXBg5
         eGoFU8JgagO1woZZK6BBpr6I//lcLz8083aZJWkgO6Z0kb53Oceq+k/gix4je74l/O74
         CUC3N3foX/krhvqOrDf6DFYoGMC87UW/9IWQH+2e3DJUYujb1SrAQwDPCphjiJdJqQz5
         Co9oGxp5P+gii2+CXetM2FAz37z5Fx6HzcnuRw9MpdC802295j4AXiXghfXd+n48qGWk
         V0aA==
X-Forwarded-Encrypted: i=1; AJvYcCWBksWbJmelGz5HVtWjwE2kg2FRcrq07FQazL1eqxRJ38lE+twFM26MIdbLkqdFfHEUCwHTXU+5SuJFHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1p48jxsgjKieBNF/2hK9ExCdt92XPNzqDPjrd/2WgMvKLVUGY
	IsCfYR6zxgsow0EnO7FbSusg4dBKUlyCe3mRB/so9J7HAUvKwWJ1pvby
X-Gm-Gg: AZuq6aICRFbhtXhqrAJ9jgm9bbq9L4ZgEv8hIJ19up5WZSAaq+vQK1QVOnjGNuHxDny
	WhFOeL77J0i+fAwjAAnS+YXiMOJpd2uoMxc1ohv+7M6fz+Hn2Q2MWXr0cOCGZdI5iAiZh7Z+glN
	jTHCJCPCpYOH0AtMogqmwGbYgDbGjUfB7I7Taglf3SgQ+iE//GAi+044RIxhGr4SPvAkNt2LBKl
	QFUzDOkc8HOz8XsRCn4cLn0ZmiaRLk3KF2vnPkSgeWz70GqNAX4rV0GMSnH/+OiVhIcJ7f/Y6RY
	JWbmJkXLdNwAiLnH6bc5ZYnWrwsHsa7wG6nSkbaSw3gvk2cHF9iJEXCOmUcinYtERKOzhXpLeEn
	IQz3v9U9WvmeyqRJ7mmFREyD96aANQJtLJn+gsr3zidwyfAmbSKLds3Vrx86NGqQdabd++8urnn
	xnTjJl/OwT6u8NYap/cf59wzCG9EPQ4CUEobbIvpbAnw==
X-Received: by 2002:a05:600c:8183:b0:479:1348:c63e with SMTP id 5b1f17b1804b1-48378d9ccc7mr97627215e9.9.1771168679774;
        Sun, 15 Feb 2026 07:17:59 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a29c13sm63668925e9.16.2026.02.15.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 07:17:59 -0800 (PST)
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
Date: Sun, 15 Feb 2026 16:16:16 +0100
Message-ID: <20260215151743.20138-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.53.0
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
index d4af5fdd28b1..cd706a602dc9 100644
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

