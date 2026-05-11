Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3884A3ACF15
	for <linux-hwmon@vger.kernel.org>; Mon, 11 May 2026 07:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485903; cv=none; b=Mm74CGcmt66NvQCLbigT4+Q9rrV/PW74ay/GS21G7xnPjHPjpw5f5B3UdzTknaqveecjJDMWgWBoX8R3PyT4m9wgoQZtInmHranPXQg6c1E2lDjpVv1WYMM8OyZoca0b2s7xeyQiaPX/uTBDVIx02gwDtCWVmORdZ25+vXZJ8ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485903; c=relaxed/simple;
	bh=6vBEHLMLOSh3PUQH6ftcKyQ9NFmKypGaweZdjAsCnfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NtkcdpjZRZH1Lb9QBGu0uz3v6QdvF1SpCyNdK1Nw02zdKbkwxaJyTk178hx28iTeeZjZJV2hS6O95H2MWFpCEscfKVgpIGFJZqE3AHVXLHAic8HVekwFzJ0HlfsxmsTBWPMZOBi1WWUneg619RApMVbQG3wUkQaS8AA7l1+jU3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Sgxsbk4k; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Sgxsbk4k"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f3c623322bso6668965eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 11 May 2026 00:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778485886; x=1779090686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmlEmHdWn0teIVBaM5N/uRakvieamDiDIKxKpSCD5g8=;
        b=Sgxsbk4knNncflbso/qQIeh65TiUUa2VsC37vKBJFDopNhHAsowVs0dmE+5MhDH82L
         joKuH3QK5Hl/OjzGBBR4l/0mio+VYxaYunZsRYPnQA2IkjxM9vggJ/ke9/r9gm733E2U
         JD62RlDKRt2aBWS6gs8ds1e5u0WGXhu8pXdkQ7NsHWJ3E+JYULoHSW89aYPrsVyDMsnW
         ZpdYyuI11S7l6bAB42EglgB3DClbzYQO8IRlfUQ9dD10z04wX2B+4TX3NWaHrmE0ZyBK
         qn7mzg4M5ng97vfsNd+VF1KpIiZkb9FkJ9dkDskMQ+s9QL+wRKB4g+XmVLA9SWcEXgCD
         bugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485886; x=1779090686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qmlEmHdWn0teIVBaM5N/uRakvieamDiDIKxKpSCD5g8=;
        b=b98Fq1lAWy6n1Kat/yqyf+slD85kmDSZDhdehlx1LG92nn4iCpRZmbg+UCR+/Xy55Y
         H9spnicjqjyRFdzA62R805AqwrBZXFaQPfKc9wTAV1LB4clHvys7C6kmubaIVVNgrD1w
         zx6eW1JlQKWKTkf2uHYzXEaANaeIlwHosR0yat4jxRVb2zg4aigGIOEit7o8GI0pVmJG
         mvgLVQpMRz3hOOXvYwHEUNroHGvjzlGV9QkHg+34RutVqokwhBrwmncg2dwvwzdivHyk
         fKgZDcUU2mcpODalyb+pXoToFlmEgfC8XMVW7gMcgI8iOu+BewIE5ZSETOZaN/6Oa0wt
         qgwg==
X-Gm-Message-State: AOJu0YwWz1fOzKOBH7NlvyNngvOCmsKh/kglW+YRJBmDPlQPXMaGnVhn
	3Y6wBgeLYk/WM55xoUjLO+jix71I1cq0E791wE9b704cqvNzP4vlIl3vx9L3Xi5z01g=
X-Gm-Gg: Acq92OEmMNG86cNdgvgAUNcmwMjt7RL34yZ0DTZWt+lugr/bP9b9EdHg5J+iIES3OGZ
	+3SWAp1zHaO+BesAiYGFjtKCku3nRo7hUms0yCDFfot0E3Q7jzq8j0/zLmVEHEZ18TaoJ5HQqF2
	W0v8EwewngEY79a8uicWlJFIRNZvzZ1J/r6m+Q0KVxu01jGhIr9piNuSx7KNZQAZqywVnkzF1wN
	ASWyVrSHant5qvrXELVSvxKJj/PXcyE/NjB65Sa6S79aCnTME3LUmpzoi7xihGgC3FuWtIZPMKg
	SOS4KzBS9d00u38p4hMP2bha0Pib41H+LPprLsbPWNB/ZLFhw0kOgDfdPg2hh1Q5t7dMTbZIMDO
	ZZ7iCgJUY/jvHWpb8DiK5NbPw9Ot1lruxLswsChDWNJNGxl6RVF5uorwVj8RcL/DTCJ8eb86/uT
	MW3jp1K8LG+W2tML9opqkXOOxd1Du68CQXxgwc
X-Received: by 2002:a05:7300:e60c:b0:2dd:6937:79bc with SMTP id 5a478bee46e88-2f54ad72f58mr11433054eec.6.1778485885893;
        Mon, 11 May 2026 00:51:25 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d429asm12549498eec.12.2026.05.11.00.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:51:25 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 11 May 2026 00:51:19 -0700
Subject: [PATCH RESEND v2 1/5] hwmon: (pmbus/adm1266) add firmware_revision
 debugfs entry
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-adm1266-v2-1-7a6d34f0de5d@nexthop.ai>
References: <20260511-adm1266-v2-0-7a6d34f0de5d@nexthop.ai>
In-Reply-To: <20260511-adm1266-v2-0-7a6d34f0de5d@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778485884; l=2492;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=6vBEHLMLOSh3PUQH6ftcKyQ9NFmKypGaweZdjAsCnfo=;
 b=FY7aCu84f2H+Pbpjl40LEPsA/JvRZxrYvwtgkWu1S6HPHGV61/dj+LIr7LQqP7XLUztrBrIRs
 4fxggJ9feGyDZXBH0XG/pVH6Ef1WtzzpNNLNCbmigCAEURha2rklNZb
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

