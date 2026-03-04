Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF2F379ED4
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 22:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.227.64.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772662483; cv=none; b=Q7U+IpgbnvZGgibmy0yIPdIlHYW6dGNkc0ijby+NafaZ2ndI2SaaV9O+V40I8zj21CkjgamEy4DdoJQMTKByV2Fp/K0Hm6xaty9INyp42t9AvMEgwF73GTUVl38fdx1q/khduc73tD9DmIPi3jJ7Xmm3x/Y2VK/QooNY9TxHM5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772662483; c=relaxed/simple;
	bh=6eG4eGCQ4itoD3Pv4GhY7q2RkLkMLFQs4hGKU0x7mXo=;
	h=Date:Message-ID:In-Reply-To:References:Subject:MIME-Version:
	 Content-Type:From:To:Cc; b=amIoH4rI18QOnf4AW7ucNj4hlH7HbK74cVs+KhX2bP++CRnCO/kmt6S6XTV/V26WKCu8q897jad1eCz1feWeEEpsTQvk/+TIHesCeoz6uHdL8yHyM8pc9WNuq+ZKc30q52F8+3VZlzXrUx84rw7VfaaWEUwH6thizflDAYwhLPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rere.qmqm.pl; spf=pass smtp.mailfrom=rere.qmqm.pl; dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b=qbbVMuzc; arc=none smtp.client-ip=91.227.64.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rere.qmqm.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rere.qmqm.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="qbbVMuzc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1772661925; bh=6eG4eGCQ4itoD3Pv4GhY7q2RkLkMLFQs4hGKU0x7mXo=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:From;
	b=qbbVMuzcRaizRmHejoXWj4/J2cE/x2laitkX6KzQV+6d9hjRZEyhRdFx7T96pfbTO
	 /4qDVSCvQJyOHOIw7cRekopMI3fOCjggkNdUuPxSiRLnNvruMnzmkVmeQgZCvUE+Td
	 si0uE7EtjB+wixZBj3pntscYmZCxSBzzkzUe6JGpUtbdKoU3tIZRD3M7C6HtA1hH1n
	 Qx39aevtwYWDi+l5GG7s2HD1p9S+V33Qw7Y3V7mz/f9WVP3y/nR+DWFSdnYDqkQLKe
	 fNd6VOrPNZ9DFI/SeGy1geACYz3VW+KZRAKgc7wzwZBNqJRIes5SQPDF4YF7epBsxd
	 k4cfyQeODEv3A==
Received: from remote.user (localhost [127.0.0.1])
	by rere.qmqm.pl (Postfix) with UTF8SMTPSA id 4fR6DP5rTFzd8;
	Wed, 04 Mar 2026 23:05:25 +0100 (CET)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.4.3 at mail
Date: Wed, 04 Mar 2026 23:05:25 +0100
Message-ID: <7c37034ab5b1c4067d42eb75997a993dbbbdc366.1772661800.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <c7a3a0b6c1658a8ce4cc5962de18c5b2cdbcdb8f.1772661800.git.mirq-linux@rere.qmqm.pl>
References: <c7a3a0b6c1658a8ce4cc5962de18c5b2cdbcdb8f.1772661800.git.mirq-linux@rere.qmqm.pl>
Subject: [PATCH 4/5] hwmon: gigabyte_waterforce: name input sub-reports
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From:	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
To:	Aleksa Savic <savicaleksa83@gmail.com>
Cc:	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org

Use a switch(command) with named labels instead of an if() sequence. The
hardware only ever uses 0x99 as the first byte (the report ID), so check
it at the beginning.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/hwmon/gigabyte_waterforce.c | 47 +++++++++++++++++------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/hwmon/gigabyte_waterforce.c b/drivers/hwmon/gigabyte_waterforce.c
index ef27c1ff8fd8..7f5c88f66e40 100644
--- a/drivers/hwmon/gigabyte_waterforce.c
+++ b/drivers/hwmon/gigabyte_waterforce.c
@@ -18,8 +18,12 @@
 #define USB_VENDOR_ID_GIGABYTE		0x1044
 
 #define STATUS_VALIDITY		(2 * 1000)	/* ms */
+#define REPORT_ID		0x99
 #define MAX_REPORT_LENGTH	6144
 
+#define CMD_FIRMWARE_VERSION	0xD6
+#define CMD_STATUS		0xDA
+
 #define WATERFORCE_TEMP_SENSOR	0xD
 #define WATERFORCE_FAN_SPEED	0x02
 #define WATERFORCE_PUMP_SPEED	0x05
@@ -27,11 +31,11 @@
 #define WATERFORCE_PUMP_DUTY	0x09
 
 /* Control commands, inner offsets and lengths */
-static const u8 get_status_cmd[] = { 0x99, 0xDA };
+static const u8 get_status_cmd[] = { REPORT_ID, CMD_STATUS };
 
 #define FIRMWARE_VER_START_OFFSET_1	2
 #define FIRMWARE_VER_START_OFFSET_2	3
-static const u8 get_firmware_ver_cmd[] = { 0x99, 0xD6 };
+static const u8 get_firmware_ver_cmd[] = { REPORT_ID, CMD_FIRMWARE_VERSION };
 
 /* Command lengths */
 #define GET_STATUS_CMD_LENGTH		2
@@ -257,32 +261,35 @@ static int waterforce_raw_event(struct hid_device *hdev, struct hid_report *repo
 {
 	struct waterforce_data *priv = hid_get_drvdata(hdev);
 
-	if (data[0] == get_firmware_ver_cmd[0] && data[1] == get_firmware_ver_cmd[1]) {
+	if (data[0] != REPORT_ID)
+		return 0;
+
+	switch (data[1]) {
+	case CMD_FIRMWARE_VERSION:
 		/* Received a firmware version report */
 		priv->firmware_version =
 		    data[FIRMWARE_VER_START_OFFSET_1] * 10 + data[FIRMWARE_VER_START_OFFSET_2];
 
 		if (!completion_done(&priv->fw_version_processed))
 			complete_all(&priv->fw_version_processed);
-		return 0;
+		break;
+
+	case CMD_STATUS:
+		priv->temp_input[0] = data[WATERFORCE_TEMP_SENSOR] * 1000;
+		priv->speed_input[0] = get_unaligned_le16(data + WATERFORCE_FAN_SPEED);
+		priv->speed_input[1] = get_unaligned_le16(data + WATERFORCE_PUMP_SPEED);
+		priv->duty_input[0] = data[WATERFORCE_FAN_DUTY];
+		priv->duty_input[1] = data[WATERFORCE_PUMP_DUTY];
+
+		spin_lock(&priv->status_report_request_lock);
+		if (!completion_done(&priv->status_report_received))
+			complete_all(&priv->status_report_received);
+		spin_unlock(&priv->status_report_request_lock);
+
+		priv->updated = jiffies;
+		break;
 	}
 
-	if (data[0] != get_status_cmd[0] || data[1] != get_status_cmd[1])
-		return 0;
-
-	priv->temp_input[0] = data[WATERFORCE_TEMP_SENSOR] * 1000;
-	priv->speed_input[0] = get_unaligned_le16(data + WATERFORCE_FAN_SPEED);
-	priv->speed_input[1] = get_unaligned_le16(data + WATERFORCE_PUMP_SPEED);
-	priv->duty_input[0] = data[WATERFORCE_FAN_DUTY];
-	priv->duty_input[1] = data[WATERFORCE_PUMP_DUTY];
-
-	spin_lock(&priv->status_report_request_lock);
-	if (!completion_done(&priv->status_report_received))
-		complete_all(&priv->status_report_received);
-	spin_unlock(&priv->status_report_request_lock);
-
-	priv->updated = jiffies;
-
 	return 0;
 }
 
-- 
2.47.3

