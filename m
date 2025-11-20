Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DC03370EC
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Nov 2025 12:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763642313; cv=none; b=LdjQkwnuWNOiW+fbk9YOkTv11XTcelCmGHPf7RwCJkDXKPGVxZyEEs5lXa9QbfGkfyjxkB1EXrRUpaiblbdOJiS5PlWPLamKomfGPW++fTTmiTowgWGWPJPKZcARqF2rhhxtP/ae10PraK0lkoLCysE0IQaJZ+pPLT4PqfAE7r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763642313; c=relaxed/simple;
	bh=5FnXus9DP6Ee5jtp1JWX7sb3AJXHvXuYoxnbvfLk5Ak=;
	h=Date:Message-Id:Cc:To:Subject:From:Mime-Version:Content-Type; b=UBkxfzGOj77u+H6kCz8n3DQd3ShgZRTvcddciAkxSLRfmWJ9INcxsJkT6H6hVlQmC9D28HGPGOmoGRdKv6nR9LzfVhI1HjrSDH9zyLrZvA4vIdl+U4aQi4Pf8pO8iwgg0UmQxFrn4O12A9pKCFj67akWjY7ezCVrui7KGqWbV04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=OxMbxe3Z; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="OxMbxe3Z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:To:Cc
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=3DJtqVvLq7bEWHpZsp3XhAddPGsusOhOeFxfdymkM9Y=; b=O
	xMbxe3ZwROK79TLAad/1ljOLzwRCBNeZv2AKDVrltxBm/0Gn+ru/hrZFvEcb2gi53MtU77KulPS5O
	KbirpksF2VI4LiRtloIjS6OV/WQk65cQ6mp8Jyv30Ei6BEQ6YHUVMe7eE1+nB1H39r/l9hxBAfVWf
	5DYjE2jzX1mCyTWOGA7kHe6t9lzGcPgs2ptV/1QA71AID0/VXY9FqBPErykBrCjXp8HlejCthTw5C
	GwVEX4R2f2T/T+cmPCzzNAcMHnhaznOz8Dg2RAfmGNN1hEMcyXJg0pU/d+cZ85v4vg2YVTV9w6vKQ
	hxWIIz1d4G55lYRiTer1/zcY+8bAO57JA==;
Date: Thu, 20 Nov 2025 13:38:40 +0100 (CET)
Message-Id: <20251120.133840.269300445409439919.rene@exactco.de>
Cc: Eugene Shalygin <eugene.shalygin@gmail.com>, Guenter Roeck
 <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX X470-I GAMING
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
 drivers/hwmon/asus-ec-sensors.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

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
