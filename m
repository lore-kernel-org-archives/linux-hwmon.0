Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572762F8EAE;
	Mon, 11 May 2026 04:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778474918; cv=none; b=MhH0lVhwE5vLHY9cfNdTG5euANzLkd2t+A7pZ9ST6+653/WY0NbzQp0OGDKl40t73g4WV44el/Y5iCtsp5S6PVwlUJ3mplOz7459IF9hu1zS3N0MVtoOidWgq4sVgCq67eOi/J+PZPEyoh9bYXXfU9/mqrgCT6PWhJVxL3SzDKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778474918; c=relaxed/simple;
	bh=kp8AMKL3NQmcajNlthJgbsGq6Wqbf9MTD+qAs8cGVCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mb2raR7tTNu0pOZR/7tZAxFDQC+RjDM1YK/SDXYrXNSvWPYgT8mVhRxarhgZ5T8qCb6q1b+1gMNHX5KwnjPfm+vmhGkoQRsMatB5mYYdCx1lywZr5xLLbZ25kcFgXxc2rsOY4cbBcwHGCj4am/mdy3gMcaBQ0XW4te0DTGZAyyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r3ajJFra; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r3ajJFra"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DD8CC2BCF6;
	Mon, 11 May 2026 04:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778474918;
	bh=kp8AMKL3NQmcajNlthJgbsGq6Wqbf9MTD+qAs8cGVCI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=r3ajJFraYTVg7Q9UtUHmy2r0sIsACjznwINpTCzv7ls1DfGgajc8s8zk+nNnjR6TS
	 Pq/xDpdfDNIYgEmTmuvtvYctp2pxXqkKYMMt+siFxuBOnISzM0MFIJK6XrBBrto7qA
	 7Wt8gDCB2zlfB4r7XY4m6ZGBTRJx0uRYMFjtwudKuatNafHprg29pdQr9lNPtBHcd9
	 +5jD0tXgX9/1A94e93rXijJ9BngyIIEbz5T2uEdeelFi7PacmdiRW23HVi3DKnyEtV
	 CDcUVm0ooLLy+vo4p7e1I1pgXI6kStkBiPiWcEM9s45qztsOqlDk2M3XNNRTKODbH2
	 1yqOcgtZvHI6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0568ACD3427;
	Mon, 11 May 2026 04:48:38 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Sun, 10 May 2026 21:48:07 -0700
Subject: [PATCH v2 1/5] hwmon: (pmbus/adm1266) add firmware_revision
 debugfs entry
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-adm1266-v2-1-3a22b903c2f1@nexthop.ai>
References: <20260510-adm1266-v2-0-3a22b903c2f1@nexthop.ai>
In-Reply-To: <20260510-adm1266-v2-0-3a22b903c2f1@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2492;
 i=abdurrahman@nexthop.ai; h=from:subject:message-id;
 bh=6vBEHLMLOSh3PUQH6ftcKyQ9NFmKypGaweZdjAsCnfo=;
 b=owJ4nJvAy8zAJbYltPXv6rsCXxhPqyUxZDHGL1l17nXQx33LmJd98VQ756K6Yy7r059z01keJ
 Aetnyi7X6umo5SFQYyLQVZMkWXOI/83bR1tERtiDtnDzGFlAhnCwMUpABNR72H4K5TQasqgxecW
 NZPta3kf38HaOS/fVFgbPN/g89VrlijQIf8s37Qfj1ow9XCSDFee8VyHe2WP+memVZkz3q5/Z/i
 ZuZkTANB1THc=
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
index d90f8f80be8e..7b8433226176 100644
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


