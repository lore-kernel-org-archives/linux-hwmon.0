Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D6F2DD60F
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Nov 2025 12:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763643601; cv=none; b=nMN3lu8L+iZQnaSIcKVEI9QDr0BYECBVznma5APmAoXOO5TfXTRrWy85GXPitBF4Q1+cCK2a8cF69ASE7RU4W6b6KpoI1FrnFbNsTZIW7qns5XTMPDxyqYf/HaJfyW/0X40q0wDgAJROoq8fh8jQ918mO1shk0VGP8GylQFpOKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763643601; c=relaxed/simple;
	bh=mgWYNzxZp+rWOFhYdBwuB53fDmvOE4zQLS04N/dRgto=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=nzt6/EpPOXgepClffF/U1pT8elkb4e+LbFYy80UsRQYxsqz+l1NPGGgFcMEfQp1s2+iWxlN0nkJzTIX9gGGBRF2cOHQ9TmJyb70TVbBwNwN6RsdXtjxtG1eYGHONpzzbAzVQSzx0b3cgr1uXJo6tCQ64FQzJ4iRxwA4VxQjsH9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=puvmtTco; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="puvmtTco"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=xsJrWn+72Z9pRluhex5mdXX5NYebp37olcZ4RATmNP4=; b=p
	uvmtTcoaKfxFfEkqxAIgHIqWNg/LihTE0c49wGxKtkDlSQIBycROD0/nDKyGD4K6oyQ/DmKD4ZaGc
	wp799VCxbSOVVz63OqA+1Dt9ejZWgZAk9OD+N5jAddb1lO1DSQ5BieZFpcLqoC+l3DSBTsmjfvE7Q
	PGjpr5dDLtf1HT4YiSFRCnxohRgqtw3bm23LKy/JHuItyw05T3lp5cWMESKyaoYqCB/ES39wZUsVr
	fOlS0zJdNs3OZahvrRfn7+FW+1xFUHVPteBHS3paPzLtqQ32zKruJwNzkqWDvhfUG4+8krShhTfc1
	MEiOfeS83Ct5Xn44zlFtpLqosdx3mA4iQ==;
Date: Thu, 20 Nov 2025 14:00:09 +0100 (CET)
Message-Id: <20251120.140009.210830394703243387.rene@exactco.de>
To: linux-hwmon@vger.kernel.org
Cc: Eugene Shalygin <eugene.shalygin@gmail.com>, Guenter Roeck
 <linux@roeck-us.net>
Subject: [PATCH V2] hwmon: (asus-ec-sensors) add ROG STRIX X470-I GAMING
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Add support for ROG STRIX X470-I GAMING

Signed-off-by: René Rebe <rene@exactco.de>
---
V2: Documentation/hwmon/asus_ec_sensors.rst
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index a5a58c00c322..91fbfd5877de 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -29,6 +29,7 @@ Supported boards:
  * ROG STRIX B550-I GAMING
  * ROG STRIX B650E-I GAMING WIFI
  * ROG STRIX B850-I GAMING WIFI
+ * ROG STRIX X470-I GAMING
  * ROG STRIX X570-E GAMING
  * ROG STRIX X570-E GAMING WIFI II
  * ROG STRIX X570-F GAMING
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 34a8f6b834c9..10b45446e22d 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -581,6 +581,14 @@ static const struct ec_board_info board_info_strix_b850_i_gaming_wifi = {
 	.family = family_amd_800_series,
 };
 
+static const struct ec_board_info board_info_strix_x470_i_gaming = {
+	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
+		SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
+		SENSOR_CURR_CPU | SENSOR_IN_CPU_CORE,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_ASMX,
+	.family = family_amd_400_series,
+};
+
 static const struct ec_board_info board_info_strix_x570_e_gaming = {
 	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
 		SENSOR_TEMP_T_SENSOR |
@@ -771,6 +779,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_b650e_i_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B850-I GAMING WIFI",
 					&board_info_strix_b850_i_gaming_wifi),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X470-I GAMING",
+					&board_info_strix_x470_i_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X570-E GAMING",
 					&board_info_strix_x570_e_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X570-E GAMING WIFI II",
-- 
2.46.0

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe
