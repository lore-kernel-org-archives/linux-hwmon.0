Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E9A371D1F
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 18:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778612207; cv=none; b=RRzLIIQU6A2J1zN+uUw3TRfJPhplMnvlvfifjDFlmV1jv/3CfxnnmUnXnLVzdoO3PoqcmxL6F/5EZG9mKaw3WpbFL4eTtqGvDgX+GXkA7zkGFSulUhi9P24xjf9uKYldnaSTdrXFpFm9dA9LThjyDSl3AmLBWZk3woNU2N1cOHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778612207; c=relaxed/simple;
	bh=6vBEHLMLOSh3PUQH6ftcKyQ9NFmKypGaweZdjAsCnfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s0haI+MPo/id4tZv7Gl2cJAy307CZITCbHIJIK8LC283nFZ9hNmaTxNNdRRgfyC5Bmgh3zuC/0RlQjXn092uB7Eju6gVHLy/5oA+8tsE9E/BTCe2RojlXPhTuknSgI0KNtucTZmSXbY21LXkVBW03peiFO21kt0g/q0bp9FQptc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=jCu9v/R4; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="jCu9v/R4"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c15849aa2cso7823117eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 11:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778612205; x=1779217005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmlEmHdWn0teIVBaM5N/uRakvieamDiDIKxKpSCD5g8=;
        b=jCu9v/R4G4gAXoDlalY7BjS8FnfD1tvrT5EXFW0nEsid2JPPAtiL7Z2DTOh45B5vh0
         x3YwIfew8GvjdbQqvwa/p+K3Eh5eNOeqby2EYvV3RGzFxCjlVSJjW2HqvJWJlqAT1KyI
         9k87U++OvwfORpHVZjoRCeXSMLxgwR3wFolk/HNM6tC2zuNkbaFjgykkfZ1ro9v/NYI6
         fm0SpVAxdpa83sipeRbDpan1/qYI998te9VWgTQpRtKSLq32jBA2z4oFxQm8SnrTB9yZ
         6LlhsaHg4ClQnjVJGuDpKq136OPOo5VeCpOrgmr1jFucDDrrHQJF5haExw0aCyaXvb6O
         UB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778612205; x=1779217005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qmlEmHdWn0teIVBaM5N/uRakvieamDiDIKxKpSCD5g8=;
        b=dY5WTMCAkDqQmvTiyoWPmox+FMEMB+5L+eccR0tJvGpb6NvF3bKSbYpaBjKqEK3+Nd
         7c8ZulaO/B0ya5MRnP5pT7s4nLqqaQYAOfeIec4Z0kHfeOFOSvWyjpYtphMNWcQ6mGt7
         Br0/eVc0RqkLEOznIeSXxhn+0lcnJfTXGdQSoGhf/uEDfTHhlgdeYoifCRIDK6m8hgt7
         pjvkxj6lmSGIc8ekBPHVFZtnUKP8TxAY6TCDKWa9vDPSN0xZBbJR7wr1L5y0KNL1BG4p
         Em+eZ5Lgh5/A7R+g1nBKYBbSAUgJVvD1Cao0+fmJuhJjoYAhP5H0SaffvKBDeliakao5
         FuVQ==
X-Gm-Message-State: AOJu0YxykWqdhxCNSFv3ZTBgEAdSnF4xy8bdPEHheUKmJkkftHVit4aA
	EC+g97E6W2gNvj94WeXvwhsOZVl7x6ukVLkuyltXCK4c/iU8f7QVFPKQNXaor8wE3r0=
X-Gm-Gg: Acq92OHdN3GLf4oTJvTOJa5jwqwlsvTRzfe6qX46TAr/hv02yPu0aHvJcmFuMa3grFQ
	6WIclbbQPlRGdhhBv+Bbmspyoc/RV8FY7wB5lJcJ3IzZlc/Xp+BAP602ux9PfRg7tzdrCDz9Uuy
	NagtNJ6ViwAFtCKft+yr6Iozh1A/tObBa92Peh4q0vbLa0FE3rzWf6ciiyQJAYNDdA3NS+oVnsj
	V+MQMKfUU+p9/Xd8kGQZDhOYzinyDgK91K5vf5p5iNZLQHFO1fryutR/h01dbz6MHBMJa5qwcmo
	F/gbKoHX8mCv7+qw2v1Oekw66mjmWpAcRn5kCVHtewXkP96om2GFrkAwQrdLRAFZtAYD1IfHk/Y
	H7c/zjtNpYhNdCcJJggzTm9Lqc8zIECn/3YmXfFQiDAlZCzcCzcsU9RdzRxMwp7abIYED6bWPZr
	hBwsOODAMvjIu7OeuMVKwjP4jWhw==
X-Received: by 2002:a05:7300:dc10:b0:2ee:be86:7b90 with SMTP id 5a478bee46e88-3011977a8a3mr184693eec.29.1778612205331;
        Tue, 12 May 2026 11:56:45 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm18626408eec.11.2026.05.12.11.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:56:45 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 12 May 2026 11:56:24 -0700
Subject: [PATCH v3 1/5] hwmon: (pmbus/adm1266) add firmware_revision
 debugfs entry
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-adm1266-v3-1-a81a479b0bb0@nexthop.ai>
References: <20260512-adm1266-v3-0-a81a479b0bb0@nexthop.ai>
In-Reply-To: <20260512-adm1266-v3-0-a81a479b0bb0@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778612203; l=2492;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=6vBEHLMLOSh3PUQH6ftcKyQ9NFmKypGaweZdjAsCnfo=;
 b=E1SfiCYwRsxPNgtJQpxEvLQ6uzgLlppOi0Ebc/3AtrJikD7Ag7IbyRP62k5LSqZgRn8FYuElM
 msgf0fq4ejrAOWQ4+oYmQENu1NtbcwoUhrTSpbwkWr8gCpI3NV1LpFb
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

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

