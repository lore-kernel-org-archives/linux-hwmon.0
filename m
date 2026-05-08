Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12DC363C7F;
	Fri,  8 May 2026 23:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283205; cv=none; b=aObDr9dkBv09SVPRvXCLbSCVfGFWg8J/oRW5Y2cbeBEj2bs3H0kc+Vb8sZ8j4R977pM07fqt7EgkIe5aYt/aOcCRuDebQhwpxLLwPS/YoFSy1KUDCG1I3rGx78nsMGgVsDY6VyQOex906iH29o6NHjCL8QHH2kq7x3v9HRR+KtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283205; c=relaxed/simple;
	bh=Kp9OWsNd69fna56PlBxX9vAuCmIkeeuN2ejOzP4x7lA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qC7BUq2GYrpr56b/Xi3BvVMztpEegf5DXAtvspVPK0JDqnPn70cUkUsmsSks5jD64urn9BcUCCpcbjj3mKcrfsxCQieJD0k0V4XmOP6DgnimgaK5qIoDXTccQce7VBRREQzwCiG8lJRIuBG532FZoVmzuKpgTMo+ayY13Fa86qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DOmg3M/Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DOmg3M/Q"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B818C2BCF5;
	Fri,  8 May 2026 23:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778283205;
	bh=Kp9OWsNd69fna56PlBxX9vAuCmIkeeuN2ejOzP4x7lA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DOmg3M/QhC6AfMR/y86caiowNCVufDNyVhFXGLN5DGlSM0mz+Yo/QnQJKQRHAtG4Y
	 8I+mOfzuQY+niwL7sJfuNk1V3HOhw3pHQOB5SQoD6xC4ah0E7li4nlb67C1k6R9oX0
	 7d/dh1XdxYbxkgahtjlRo6UMnrJjnpdAjKAzuZo1Ej6H7S3sl/LZQB0xSU6j9/dPaS
	 dgRlERjtoV4GPtztltqIglW3y7/c6QFMTFKR6KBdHVrnZqUs64CC04KVoeM6YZIyz+
	 NFEg6yJseQKVJ2UKRi6EXDWYDMzCvtyR7t360Jc5xfung5uOyRB6P+yNm8BDj/xPx3
	 bc1nuP9w1WDLA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73215CD342F;
	Fri,  8 May 2026 23:33:25 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Fri, 08 May 2026 16:33:15 -0700
Subject: [PATCH 3/7] hwmon: (pmbus/adm1266) add firmware_revision debugfs
 entry
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-adm1266-v1-3-ec08bf29e0ce@nexthop.ai>
References: <20260508-adm1266-v1-0-ec08bf29e0ce@nexthop.ai>
In-Reply-To: <20260508-adm1266-v1-0-ec08bf29e0ce@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2492;
 i=abdurrahman@nexthop.ai; h=from:subject:message-id;
 bh=Lr4zRQ0939Un6oq1rHCP45etCsvvO2r0j1vqw5pu5tU=;
 b=kA0DAAoWtFWF/avdEPQByyZiAGn+csSj5K92O2UEe1U95wB9zC3kBL3ORM0rLiJo7FHhIQxHC
 oh1BAAWCgAdFiEEnOJP7IaIhliwXMI/tFWF/avdEPQFAmn+csQACgkQtFWF/avdEPRipQEA7xJr
 AjPEt8jWPiW6xAtLyWAC9NyCBk2Ttsaea+9KexkA/1BOVSG9qkiFDr8KiI3CGvsT3e9VcSHvZ/P
 6WxGoPPYD
X-Developer-Key: i=abdurrahman@nexthop.ai; a=openpgp;
 fpr=9CE24FEC86888658B05CC23FB45585FDABDD10F4
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/default with
 auth_id=756
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Reply-To: abdurrahman@nexthop.ai

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

The ADM1266 reports its firmware revision via the IC_DEVICE_REV
manufacturer-specific block-read command (0xAE, datasheet Rev. D
Table 80). The first three returned bytes are the firmware
major.minor.patch fields. This is useful when correlating field
behaviour against ADI release notes; expose it through debugfs
alongside the existing sequencer_state entry.

The standard PMBus MFR_REVISION (0x9B) register is already exposed
by pmbus_core's debugfs auto-create path and reports the
manufacturer revision, which is a separate thing from the firmware
running on the device.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index ba8a02509528..5cfca00a4468 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -21,6 +21,7 @@
 #include <linux/slab.h>
 #include <linux/timekeeping.h>
 
+#define ADM1266_IC_DEVICE_REV	0xAE
 #define ADM1266_BLACKBOX_CONFIG	0xD3
 #define ADM1266_PDIO_CONFIG	0xD4
 #define ADM1266_READ_STATE	0xD9
@@ -331,6 +332,30 @@ static int adm1266_state_read(struct seq_file *s, void *pdata)
 	return 0;
 }
 
+/*
+ * IC_DEVICE_REV (0xAE) returns an 8-byte block (datasheet Rev. D, Table 80):
+ *   [2:0] firmware revision  major.minor.patch
+ *   [5:3] bootloader revision major.minor.patch
+ *   [7:6] silicon revision    two ASCII characters
+ */
+static int adm1266_firmware_revision_read(struct seq_file *s, void *pdata)
+{
+	struct device *dev = s->private;
+	struct i2c_client *client = to_i2c_client(dev);
+	u8 buf[I2C_SMBUS_BLOCK_MAX];
+	int ret;
+
+	ret = i2c_smbus_read_block_data(client, ADM1266_IC_DEVICE_REV, buf);
+	if (ret < 0)
+		return ret;
+	if (ret < 3)
+		return -EIO;
+
+	seq_printf(s, "%u.%u.%u\n", buf[0], buf[1], buf[2]);
+
+	return 0;
+}
+
 static void adm1266_init_debugfs(struct adm1266_data *data)
 {
 	struct dentry *root;
@@ -343,6 +368,8 @@ static void adm1266_init_debugfs(struct adm1266_data *data)
 
 	debugfs_create_devm_seqfile(&data->client->dev, "sequencer_state", data->debugfs_dir,
 				    adm1266_state_read);
+	debugfs_create_devm_seqfile(&data->client->dev, "firmware_revision", data->debugfs_dir,
+				    adm1266_firmware_revision_read);
 }
 
 static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)

-- 
2.53.0


