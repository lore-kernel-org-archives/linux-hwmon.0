Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BBB19049B;
	Sun, 30 Aug 2026 13:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788095037; cv=none; b=Ww3kcxV72zzOPK0sEy+PB5mlrOnZcfNVN+kyX9kDeOxI83ZUBq0dEIaUQ/E9kMKbWOA45NtxbIlxDIyzlI2DhR/73QNCw3bO6Ugo7M3mt6gIiv2JDHFrv16Iy4IorlALp/W1B5McZKFgeP77/etrqPGyIcPg/Nal6dxAF0OaRlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788095037; c=relaxed/simple;
	bh=xer063788hE5m5PgAM9CWmFS9V0IwWEt9lEXscINOPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=e+IX/VmNe7PEKEz9yNpiSi+h2aBZ4l12SNbm57wuqxZ7tc5HcdAcsDXjcddUrKjSCczM/toghsm/yby3w5s54zQshH1PeLz/2fCwv6Qi06rghM/G0GBb4sUxkhbBBgV+m296ngJXmL/ycPqiyt3VBdAh0mLUUZV4XpUSwEOhws4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sXiORsp/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sXiORsp/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74413C2BCC7;
	Sun, 30 Aug 2026 13:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788095036;
	bh=xer063788hE5m5PgAM9CWmFS9V0IwWEt9lEXscINOPA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=sXiORsp/niPbxM+oj5BCc3Ofa1/pwX+2MPDbxGi3JBAsq58CnhSiFeA9io9tTxZ9e
	 tqVRbz0r6WUrHN4ShIYsJR8JOkJJ0YIlmeP+Qn3pvO5oMo3e4boqVfVQVMTjXS5nwn
	 6Qp0MpGl6/6IUxfSdcAH5qhLOMMjgQzRMk+UwfdgaSAklm23lKznlSuXthL9gP6gFN
	 GCrKHgRadYnJoiSDXcc7Hl/YL4zBNSXe1CEWIb99f/s8BixFo6bWAOsNemyOZWcOBn
	 t8L3T7psjoVdIs2FuHl52hIbesY8E8zHdBCvWMda7EFCJ+LiignuQxB+DVVb8/tQ/7
	 eSO31BnbD/rww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 505C6C61DDE;
	Sun, 30 Aug 2026 13:03:56 +0000 (UTC)
From: Asai Neko via B4 Relay <devnull+sugar.sne.moe@kernel.org>
Date: Sun, 30 Aug 2026 21:03:51 +0800
Subject: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX X670E-A GAMING WIFI
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-asus-x670e-a-hwmon-fix-v1-1-cf0a680ccbe2@sne.moe>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QqCQBCF4VeRuW5g3GyNXiW62OyoE7TGjpYgv
 rtbXn4Hzr+QISmMLsVCCR81HWJGeSio6UPswPrIJifOy/koHGwynn0t4MD99zVEbnXm4E+Vh6C
 sakf5/E7I8z98ve226f5EM/5qtK4byROxT3oAAAA=
X-Change-ID: 20260830-asus-x670e-a-hwmon-fix-a6546e0e1472
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Asai Neko <sugar@sne.moe>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3374; i=sugar@sne.moe;
 h=from:subject:message-id;
 bh=woM7oFfMNv790yC/zom6LKZaK43bcPQBp2AM1p8C9nY=;
 b=owJ4nJvAy8zAJfZHZ3FlRAEbJ+NptSSGrCla1i3/ds3PuJk0ubRE9G2FqN6lI5aM6jk8KSq+Q
 YuP1LcHenSUsjCIcTHIiimydB7pKnzyet6HAy66fDBzWJlAhjBwcQrARBy3MzI0hB26us5ViW0S
 U+OUn0Gfm94+eKzl8bDhnOjhvXOrJ6RdY2Rompn3MDCV72dUDdPOf6suLC+UUfjCc25Sl4XsrZD
 jb36zAgClsEhf
X-Developer-Key: i=sugar@sne.moe; a=openpgp;
 fpr=89C48A71E4EB9EF0C0442D0EFC2CA37958700609
X-Endpoint-Received: by B4 Relay for sugar@sne.moe/default with auth_id=990
X-Original-From: Asai Neko <sugar@sne.moe>
Reply-To: sugar@sne.moe

From: Asai Neko <sugar@sne.moe>

The ROG STRIX X670E-A GAMING WIFI is missing from the driver's DMI
table. Consequently, the board lookup fails with -ENODEV,
asus_ec_sensors does not load, and no asusec hwmon device or EC
temperature readings are available.

Add a board definition using the AMD 600-series register layout and the
ACPI mutex used by the board firmware. Expose CPU, CPU package,
motherboard, and VRM temperatures, and add the board to the supported
hardware documentation.

Before the change, there was no asusec device under /sys/class/hwmon and
there were no EC readings. After the change, the driver registered four
sensors with representative readings of 57-61 C for CPU, 68-71 C for
CPU package, 43-44 C for motherboard, and 49-52 C for VRM.

The readings correlated with nct6775 and k10temp. Repeated polling with
both hwmon drivers loaded produced no EC access, bank-switch, concurrent
access, or locking errors.

Tested on an ASUS ROG STRIX X670E-A GAMING WIFI with BIOS 2704.

Signed-off-by: Asai Neko <sugar@sne.moe>
---
Add asus-ec-sensors support for the ASUS ROG STRIX X670E-A GAMING WIFI.
Testing details and the rationale are included in the patch commit
message.

Background:
https://github.com/lm-sensors/lm-sensors/issues/474
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 2c68a343a2ed..ebed9f8d2adb 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -45,6 +45,7 @@ Supported boards:
  * ROG STRIX X570-E GAMING WIFI II
  * ROG STRIX X570-F GAMING
  * ROG STRIX X570-I GAMING
+ * ROG STRIX X670E-A GAMING WIFI
  * ROG STRIX X670E-E GAMING WIFI
  * ROG STRIX X670E-I GAMING WIFI
  * ROG STRIX X870-F GAMING WIFI
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index e43645e884fd..850c8e297397 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -752,6 +752,13 @@ static const struct ec_board_info board_info_strix_x570_i_gaming = {
 	.family = family_amd_500_series,
 };
 
+static const struct ec_board_info board_info_strix_x670e_a_gaming_wifi = {
+	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
+		SENSOR_TEMP_MB | SENSOR_TEMP_VRM,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
+	.family = family_amd_600_series,
+};
+
 static const struct ec_board_info board_info_strix_x670e_e_gaming_wifi = {
 	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
 		SENSOR_TEMP_MB  | SENSOR_TEMP_VRM,
@@ -962,6 +969,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_x570_f_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X570-I GAMING",
 					&board_info_strix_x570_i_gaming),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X670E-A GAMING WIFI",
+					&board_info_strix_x670e_a_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X670E-E GAMING WIFI",
 					&board_info_strix_x670e_e_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X670E-I GAMING WIFI",

---
base-commit: 75f2c0b3690702c90863c2e138cb5520670845ea
change-id: 20260830-asus-x670e-a-hwmon-fix-a6546e0e1472

Best regards,
--  
Asai Neko <sugar@sne.moe>


