Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E27332917;
	Tue, 10 Feb 2026 07:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770708398; cv=none; b=CUW5/dqyE68YiKQ4UqgHuf8YfkGH3YQTC7EhWmhNVr1jlLnCBWPCJkeSNjNKxiLi2hSfQO3maSqscs0zAFW2y6vGzlFgWiSqMZIb0wT3YbocQvUKBsoj5T3QS8PF26A3OT5uUT/87F6RKrmKM+Vr4RBk9+f0G8zKypAPMBjPEiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770708398; c=relaxed/simple;
	bh=azYJ70UCkd6ewxDbN2Z1oowj1ERPXJLfCcuKGvjkH78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uev2QFQ9ULLFAh4aAuQeeCJKKreF9lgeTo/+NZk6lFPg+jelBQTuqqd75iDee99nUeAhpxzZzEpXv3cYW4VNo1K0Q4LTSUQPveZYJNmcVLEWuPmvAXJGj8xQld9QAClRKAfvWRkIWXZRi4nCO7KGSD5yzLrhu0tH2kOI+fUcFgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYYMduTo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYYMduTo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F3EAC116C6;
	Tue, 10 Feb 2026 07:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770708397;
	bh=azYJ70UCkd6ewxDbN2Z1oowj1ERPXJLfCcuKGvjkH78=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=dYYMduToBIZjok9xs+7XkCFXPWeL336JksfVqm6ar/j80qVsRSXolPJabdNZQVlK9
	 h7neodVG9XKhsqZuX+f/A7toUtJZnxajPriDNRt40JnkLeBSSz2cgkv9rY6+I2T1id
	 qUrPeYaxImVwjlehXxnCMnWvk9HI3Sf01C0NSj8IfVEb0fKhoQU/4ltxDnscD8UfAH
	 wlGkD17noi40V5QUQjFR1hjJRfloOXcNTcX847oBG0SsA4Wid7Pe13iIBrThkaaDgL
	 ifWmjkGinNJ0vuVvlwNitYlBMFLskbPLb4t06rQfvojeEx/ttsPTJJK/Ocvd/2W8X+
	 gGZbdIuuja5Qg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D338EA3F13;
	Tue, 10 Feb 2026 07:26:37 +0000 (UTC)
From: Carl Lee via B4 Relay <devnull+carl.lee.amd.com@kernel.org>
Date: Tue, 10 Feb 2026 15:26:34 +0800
Subject: [PATCH v3] hwmon: pmbus: mpq8785: fix VOUT_MODE mismatch during
 identification
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v3-1-84636ccfe76f@amd.com>
X-B4-Tracking: v=1; b=H4sIAKndimkC/6XOvQ6CMBDA8VchnT3TlkKLk+9hHIAW6NAPW0AN4
 d0txERn3e5/w/1uQVEFrSI6ZQsKatZRO5siP2SoHWrbK9AyNaKYlpjiHOQIjbZS2z7CcDfOgjf
 NFMH4m+CigFrK91xCnLx3YYSOCcwqJRghCqXLPqhOP3b1ck096Di68NyfmMm2/c+bCRAoeYMZU
 bTjJT3XRh5bZ9CmzfRbKH4TKGDIOWOtrBoqCvwR1nV9AWHtPUpWAQAA
X-Change-ID: 20260203-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-f48049e8411e
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Charles Hsu <ythsu0511@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, carl.lee@amd.com, peter.shen@amd.com, 
 colin.huang2@amd.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770708396; l=3189;
 i=carl.lee@amd.com; s=20260203; h=from:subject:message-id;
 bh=DHv3qYgkJTh/6E+3LOp8GqDIxJ4CeCy84LAPdnBLZ8U=;
 b=hpw4xdcGTjEjU7TfOl/vcBy9+4SWcu2Ruqa/7BsCC+L7tQn6I+0w9PU3nNE2e0Z+4LXmxb/tO
 cM7SjU1aW0gBZD5leIe84KH1I87IlQVYkYBFyeg9MuRsv+fid64Qjtw
X-Developer-Key: i=carl.lee@amd.com; a=ed25519;
 pk=pyq7QaQvoxMg806KVkRwpCbiah+7ncWr4MBpK1AEyjA=
X-Endpoint-Received: by B4 Relay for carl.lee@amd.com/20260203 with
 auth_id=623
X-Original-From: Carl Lee <carl.lee@amd.com>
Reply-To: carl.lee@amd.com

From: Carl Lee <carl.lee@amd.com>

When MPQ8785 reports VOUT_MODE as VID mode, mpq8785_identify()
configures the driver for direct mode. The subsequent
pmbus_identify_common() check then fails due to a mismatch
between the reported mode and the configured mode, causing
device initialization to fail.

Override the reported VOUT_MODE to direct mode to keep the
driver configuration consistent with the reported mode and
allow successful device initialization.

This does not change how voltages are interpreted, but avoids
a false identification failure caused by mismatched mode
handling.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
This series fixes a device identification failure on MPQ8785 caused by
a mismatch between the reported VOUT_MODE and the driver-configured mode.

When the chip reports VOUT_MODE as VID, the driver already treats it as
direct mode, but the mismatch causes the common identification code to
fail. The patch ensures the reported mode is consistent with the driver
configuration so the device can initialize successfully.
---
Changes in v3:
- Drop patches 1/3 and 2/3 from the series.
- Pass through non-VID modes unchanged
- Add clarify code comments
- Link to v2: https://lore.kernel.org/r/20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-0-3744cd9b2850@amd.com

Changes in v2:
- Combine DT binding and driver changes into a single series
- Fix VOUT reporting by forcing direct mode for VID VOUT
- Link to v1: https://lore.kernel.org/r/20260203-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v1-1-67b041e2f762@amd.com
---
 drivers/hwmon/pmbus/mpq8785.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
index 1f56aaf4dde8..87bd039c77b9 100644
--- a/drivers/hwmon/pmbus/mpq8785.c
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -47,6 +47,33 @@ static int mpq8785_identify(struct i2c_client *client,
 	return 0;
 };
 
+static int mpq8785_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VOUT_MODE:
+		ret = pmbus_read_byte_data(client, page, reg);
+		if (ret < 0)
+			return ret;
+
+		if ((ret >> 5) == 1) {
+			/*
+			 * The MPQ8785 chip reports VOUT_MODE as VID mode, but the driver
+			 * treats VID as direct mode. Without this, identification would fail
+			 * due to mode mismatch.
+			 * This override ensures the reported mode matches the driver
+			 * configuration, allowing successful initialization.
+			 */
+			return PB_VOUT_MODE_DIRECT;
+		}
+
+		return ret;
+	default:
+		return -ENODATA;
+	}
+}
+
 static int mpm82504_read_word_data(struct i2c_client *client, int page,
 				   int phase, int reg)
 {
@@ -129,6 +156,7 @@ static int mpq8785_probe(struct i2c_client *client)
 		break;
 	case mpq8785:
 		info->identify = mpq8785_identify;
+		info->read_byte_data = mpq8785_read_byte_data;
 		break;
 	default:
 		return -ENODEV;

---
base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
change-id: 20260203-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-f48049e8411e

Best regards,
-- 
Carl Lee <carl.lee@amd.com>


