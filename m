Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A561C283C82
	for <linux-hwmon@vger.kernel.org>; Sun,  5 Jul 2026 11:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783251190; cv=none; b=kWSbiOmp8lSNHlxURqvvxGd2kCzo6v/2nvNGK6LyMaKeQlVTOsXm3aQB08NE9kj8L1BHPJHqRorY/Z+/2OT8HSuN/L8eHUYzaDhX0DLLAxtNXMOEkf34FVqj+umIE2stcfq3QlPmWgrhfvlfkbVwGjcG9UwpwZMB+4IKCAhgndo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783251190; c=relaxed/simple;
	bh=8P0QNjJlcHI6HgxOlg6IUhN5+Kup9IuekanC4zCHlFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MmKF32q+vjzpD4wWFel3EM5bnWvmOUlGLHA60Vx40MiLTAhRUvk35uyWsnH8mw9e7EQWmg0wb+aJf5pVBkbWN0WyIWAeaM/XpCUw7bzsOXeSCKBlZ8OjeDYOHxug2oSr2fl2wzxtCVxpxL8d5ElOOdVMkFUPH5i6y5BMYa5wnfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpzKUKJr; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpzKUKJr"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso1201022f8f.2
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Jul 2026 04:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783251186; x=1783855986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1GKZD8suZHUX72iEyA8RIZIB5/2RWsYR7LLY9AUUTX8=;
        b=SpzKUKJruAOg2GVpiB237sKO4JuTh1iRi/Lye8ltFtX2rQtgHKXsOZsOb82EdIHAYH
         yDgc4vlDhP9gF/xodzQoBlwCIh5TqODVskp9GaOgl50/h2bsajvTBXvZcPJmLTiLxdW3
         Pn4m1Rx/dNuSZbk5esj/5XMi1B0MNToMNEF7TzQAc7qlYfSJQxhM8nBfO9lnFP+ZTezm
         5KtpoHv7loVAbbEGx8JGlLnb4PZcwPuW90BkPXHZdcsMRFVabwCLMRY0H/6xcUHu6ER6
         jWLZpt0dfv89fqukFjvOzsNUqCJsEzFNCxgMWxChhdAuLU8Lxr9yoifxR9gIw7aewG2X
         k4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783251186; x=1783855986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GKZD8suZHUX72iEyA8RIZIB5/2RWsYR7LLY9AUUTX8=;
        b=oCUVVMSkyCquN4O3uYxAKfXovKfyKivwcHCfukd8xJ0W/KhPow0Cn5X8dGL4fQVdgv
         T6QsCzEWDiukFXBhRRn6M0XtvxL1Q5fxxyX52V9QZss3Wpo3vvx7Pvs1fXm6AFSBxS1g
         3/vgHyF9mxPa2RVawnR1uzx+OvPOHAtBqDBN89XDofYR+5jN6U+RR0o4mQIKTTmcJITd
         eV/luGpSHxscbXinwNxvsPL1B/ijWTOvl1I3bb60rZgbvS9qT1tXsDDaOam9CoDEqewc
         FAuc9pvzpBtokwll9f0brzmgLPhhHD8609MfN+qEgTTZMsDFK0/YbK3bvhtiCpJodkCQ
         Ea+g==
X-Forwarded-Encrypted: i=1; AHgh+RoVNhLlMt/ZcQdxut0uLBwS4Oh0HR+sPo64IZvr3jSIPuSIZNhkWNZppqcizu6BpTcGYICXkffyvKH8rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqmL7HvydVwNM5OVyAL6fULkILBk8RCQryCZBANfVFPeRAtHhY
	FO0ZoMFGmrWiWD3M5kIno5VD7aj72tljkD+lPqr8GEgc3KCcxeLcTEl9HJpyPale
X-Gm-Gg: AfdE7clAXylg6PMHoz95XYq6nuM9yMmYd2Gu7k0LwfkljaC4pjO8TrBADlmqz8DmO0N
	TFnS5Qf3o/szLp4BbisqOlMiVS76gqk/piW41NUgbdYXZ9YU4M22h+5J1TXUgnWfFl9afGBLXNq
	i9XEZh6+DuX2QUl9RjBoT2VfyaqDDyMaEv82URNCAIgY4mJxkn6Rd3Xs9ttnsY89+WV9mjGfxNp
	5DPq5lD6tLB/Y3WzHZV6kzUW0zivA4+sT8cmeErelG+nt/oYREz5oe+EKNmru7MgnUBw1gFxFQF
	YIGCfS9DYI8Hwspl16r2j+HCFhi4RfOB8pMCNeZD/qbVrxjhkEaMJ16NW33OJ7ln+KtC6Hrz4In
	48qtwnNi34K9Y/2FYD35gx9eGLWV4A0TnsTlF9lIondw1ObMC/IOBePP1aMOR8mTzozY82gtlQr
	PlFEgjD3twv3fY1koumH4glcikmwMKfhc=
X-Received: by 2002:adf:e391:0:b0:475:f0c2:5b07 with SMTP id ffacd0b85a97d-47aad8304d0mr5378708f8f.61.1783251185783;
        Sun, 05 Jul 2026 04:33:05 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d7801sm15860984f8f.16.2026.07.05.04.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 04:33:05 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: =?UTF-8?q?Miska=20H=C3=A4m=C3=A4l=C3=A4inen?= <miska.hamalainen@hotmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] hwmon: (asus-ec-sensors) add ROG CROSSHAIR X870E HERO
Date: Sun,  5 Jul 2026 13:32:36 +0200
Message-ID: <20260705113246.812500-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Miska Hämäläinen <miska.hamalainen@hotmail.com>

Add support for ROG CROSSHAIR X870E HERO

Signed-off-by: Miska Hämäläinen <miska.hamalainen@hotmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index ccf43fd1fa9f..84c9160efdd2 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -25,6 +25,7 @@ Supported boards:
  * ROG CROSSHAIR X670E EXTREME
  * ROG CROSSHAIR X670E HERO
  * ROG CROSSHAIR X670E GENE
+ * ROG CROSSHAIR X870E HERO
  * ROG MAXIMUS X HERO
  * ROG MAXIMUS XI HERO
  * ROG MAXIMUS XI HERO (WI-FI)
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 4ec2028f7dfe..381c399963e8 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -487,6 +487,14 @@ static const struct ec_board_info board_info_crosshair_x670e_hero = {
 	.family = family_amd_600_series,
 };
 
+static const struct ec_board_info board_info_crosshair_x870e_hero = {
+	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
+		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
+		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CPU_OPT,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
+	.family = family_amd_800_series,
+};
+
 static const struct ec_board_info board_info_maximus_vi_hero = {
 	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
 		SENSOR_TEMP_T_SENSOR |
@@ -891,6 +899,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_crosshair_x670e_gene),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR X670E HERO",
 					&board_info_crosshair_x670e_hero),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR X870E HERO",
+					&board_info_crosshair_x870e_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS XI HERO",
 					&board_info_maximus_xi_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS XI HERO (WI-FI)",
-- 
2.55.0

