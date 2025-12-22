Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F751E2606;
	Mon, 22 Dec 2025 10:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766400701; cv=none; b=Rj4WqcMuelq4pQcpeiD4ItdeBWH7u/4SqPLAyYlaKxNbw83P6sf7SOQqVQFRj6Oxu/4LKaQHXMvWTNLcwbNuY2Rv4t0UGwrK+slS5pwbPcFRDl/6gFhFdwSRXRBQtojh6ILDXCmYc6THPXaRVx8bEtbke/+Lg4wCXFhQY6eZmwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766400701; c=relaxed/simple;
	bh=ZhODpW1Vef8fiznT5wKMwY5ksVbGZFsaL/oU3wYQppc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CZrkB1zgdR7tfrfaYbpSUIBr0iuVDNcPtIfvyhBkoUXPMWZiMoatl0E5T3Fu0UaeWrruz9zQxqvVSgeeFY29doBxeXwi6miubMD9AqN09GH7iNPQ7PLjXjmei1plSwTvxbuDP2w4EKZZUujuZaFqh+lem8CzSYrgKoJ7NECd9cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkIqyOq1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkIqyOq1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24C51C4CEF1;
	Mon, 22 Dec 2025 10:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766400701;
	bh=ZhODpW1Vef8fiznT5wKMwY5ksVbGZFsaL/oU3wYQppc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=KkIqyOq1HwU2ELL9MAdM2TI/oj8TzZRtz4r53Zb8E0Ed2NQBziVYRvz9a4nN66zUH
	 6fx8dwPeeqDOYXhxHT7lvF7Gb90BjxlQ+8QS7/hU5tY4AsbCN9H8ss/CQCIdmAlI13
	 +iB5cRh9FYX00PziVPjEdbDAF8bWz7x/JOwfuE3ApRAkrMTABns5rOqKkW0NrFALZH
	 7c0QhMV69rnDZ++YlPaU0lT80ta0L/sox+5wZ9T3fTJSbzj+1Z1flMmnDKmrOPmEVv
	 87ZcDeEevEbgDSCqhHP7sWIK04T5imXU6a0ZCVqZgUAjpzvkMNZqx32YzRsxB5mbfX
	 5a/PvAUveVz0w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065BDE67482;
	Mon, 22 Dec 2025 10:51:41 +0000 (UTC)
From: Cryolitia PukNgae via B4 Relay <devnull+cryolitia.uniontech.com@kernel.org>
Date: Mon, 22 Dec 2025 18:51:39 +0800
Subject: [PATCH] hwmon: (gpd-fan) add support for Micro PC 2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-mpc2-v1-1-695d8d351cc1@uniontech.com>
X-B4-Tracking: v=1; b=H4sIALoiSWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMj3dyCZCNdo8QkwyTjJANzM0tjJaDSgqLUtMwKsDHRsbW1AFEuo6Z
 WAAAA
X-Change-ID: 20251222-mpc2-2ab1b3b07693
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, zhanjun@uniontech.com, 
 niecheng1@uniontech.com, kylon <3252255+kylon@users.noreply.github.com>, 
 Cryolitia PukNgae <cryolitia@uniontech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766400699; l=3503;
 i=cryolitia@uniontech.com; s=20250730; h=from:subject:message-id;
 bh=nv5ngPCWNWl1pWZK/Jsrxlg5PBarThSYyvwaOoZoOns=;
 b=dUI8ap2n210H2jIH6foW8oZ8uJ0m1WIRoV4sc9uvFbUH1MM5LrSnpO+cZQidzg1s43cz3S81w
 S6PVn0xqJK9ALMUa+O+/ZQtVEPiCjcxyI86VlYb1VYxXvRH57QDbs0E
X-Developer-Key: i=cryolitia@uniontech.com; a=ed25519;
 pk=tZ+U+kQkT45GRGewbMSB4VPmvpD+KkHC/Wv3rMOn/PU=
X-Endpoint-Received: by B4 Relay for cryolitia@uniontech.com/20250730 with
 auth_id=474
X-Original-From: Cryolitia PukNgae <cryolitia@uniontech.com>
Reply-To: cryolitia@uniontech.com

From: Cryolitia PukNgae <cryolitia@uniontech.com>

GPD Micro PC 2 is a mobile productivity device with 7-inch screen and
abundant ports.[1]

Link: https://www.gpd.hk/gpdmicropc2345345345 #1
Co-developed-by: kylon <3252255+kylon@users.noreply.github.com>
Signed-off-by: kylon <3252255+kylon@users.noreply.github.com>
Tested-by: kylon <3252255+kylon@users.noreply.github.com>
Link: https://github.com/Cryolitia/gpd-fan-driver/pull/23
Signed-off-by: Cryolitia PukNgae <cryolitia@uniontech.com>
---
 Documentation/hwmon/gpd-fan.rst |  3 +++
 drivers/hwmon/gpd-fan.c         | 27 ++++++++++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/gpd-fan.rst b/Documentation/hwmon/gpd-fan.rst
index 0b56b70e6264..29527a77fe88 100644
--- a/Documentation/hwmon/gpd-fan.rst
+++ b/Documentation/hwmon/gpd-fan.rst
@@ -28,6 +28,7 @@ Currently the driver supports the following handhelds:
  - GPD Win Max 2 2025 (HX370)
  - GPD Win 4 (6800U)
  - GPD Win 4 (7840U)
+ - GPD Micro PC 2
 
 Module parameters
 -----------------
@@ -50,6 +51,8 @@ gpd_fan_board
        - GPD Win Mini (HX370)
        - GPD Pocket 4
        - GPD Duo
+   - mpc2
+       - GPD Micro PC 2
 
 Sysfs entries
 -------------
diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index 237f496c4862..1729729b135f 100644
--- a/drivers/hwmon/gpd-fan.c
+++ b/drivers/hwmon/gpd-fan.c
@@ -31,6 +31,7 @@ enum gpd_board {
 	win4_6800u,
 	win_max_2,
 	duo,
+	mpc2,
 };
 
 enum FAN_PWM_ENABLE {
@@ -106,6 +107,18 @@ static struct gpd_fan_drvdata gpd_wm2_drvdata = {
 	.pwm_max		= 184,
 };
 
+static struct gpd_fan_drvdata gpd_mpc2_drvdata = {
+	.board_name		= "mpc2",
+	.board			= mpc2,
+
+	.addr_port		= 0x4E,
+	.data_port		= 0x4F,
+	.manual_control_enable	= 0x047A,
+	.rpm_read		= 0x0476,
+	.pwm_write		= 0x047A,
+	.pwm_max		= 244,
+};
+
 static const struct dmi_system_id dmi_table[] = {
 	{
 		// GPD Win Mini
@@ -212,11 +225,19 @@ static const struct dmi_system_id dmi_table[] = {
 		},
 		.driver_data = &gpd_win_mini_drvdata,
 	},
+	{
+		// GPD Micro PC 2
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G1688-08"),
+		},
+		.driver_data = &gpd_mpc2_drvdata,
+	},
 	{}
 };
 
 static const struct gpd_fan_drvdata *gpd_module_drvdata[] = {
-	&gpd_win_mini_drvdata, &gpd_win4_drvdata, &gpd_wm2_drvdata, NULL
+	&gpd_win_mini_drvdata, &gpd_win4_drvdata, &gpd_wm2_drvdata, &gpd_mpc2_drvdata, NULL
 };
 
 // Helper functions to handle EC read/write
@@ -295,6 +316,7 @@ static int gpd_read_rpm(void)
 	case win4_6800u:
 	case win_mini:
 	case duo:
+	case mpc2:
 		return gpd_generic_read_rpm();
 	case win_max_2:
 		return gpd_wm2_read_rpm();
@@ -321,6 +343,7 @@ static int gpd_read_pwm(void)
 	case win_mini:
 	case duo:
 	case win4_6800u:
+	case mpc2:
 		switch (gpd_driver_priv.pwm_enable) {
 		case DISABLE:
 			return 255;
@@ -376,6 +399,7 @@ static int gpd_write_pwm(u8 val)
 	case win_mini:
 	case win4_6800u:
 	case win_max_2:
+	case mpc2:
 		gpd_generic_write_pwm(val);
 		break;
 	}
@@ -443,6 +467,7 @@ static void gpd_set_pwm_enable(enum FAN_PWM_ENABLE enable)
 	switch (gpd_driver_priv.drvdata->board) {
 	case win_mini:
 	case win4_6800u:
+	case mpc2:
 		gpd_win_mini_set_pwm_enable(enable);
 		break;
 	case duo:

---
base-commit: c6c80820ac5d845c19c4de2e6054e7c246017044
change-id: 20251222-mpc2-2ab1b3b07693

Best regards,
-- 
Cryolitia PukNgae <cryolitia@uniontech.com>


