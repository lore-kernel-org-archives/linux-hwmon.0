Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2A3371D1F
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 18:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778612209; cv=none; b=PXKOVRqTWC1r769tK1tGyt/NWtBR0Idi1iDlnhKPlbq58e1LqaU1vVDC1kDkjVxQpiCK+Mbx+ZzwANasVRQxPPjJJ4PJck71ri0lPgLWVglhnPT7q2OaGHdSBZ4MBthLahpMIt5ZuXiEhJB6u44Z6AoP5IH9FBlL95zHNDELeGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778612209; c=relaxed/simple;
	bh=k/WeXsyIs4N8EBomdIUZhc6w7uqY0msS071m02q6900=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n+vfwt9z6e7kQn3S0Bf0j+f8KHwz6tMhIDFyxvIL3/dB0VcV1Z7f2ibZXGV1g1se5qQf4XEi2micgGpJvuOUGSo99Tb60h7H9gDyHMsfD10z0M6narVZebeYNp8opZHw1NABvMnE2ixiYvtPhXYcv6su8aOfcBD/gXYmnXBC2uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=b9XySYwo; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="b9XySYwo"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2f30a4601bbso6341427eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 11:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778612207; x=1779217007; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eieIXGoJTyA0haz1UtIrd2PB79IVIZJdV7E0usIY6Q4=;
        b=b9XySYwoxt+GBjKIDhNRrqiiV+zP2hF8KoTrU5nqgoFsDStK8FYpxdua5UQMawMtVd
         01v0j3Ft+9OTdpMJ0mZPx708AphrrkbNpuptF9qlUGRMGmracXDPkX2F3NRyLWNCC5n2
         lVycH7Zsh03lZ9igq5kkATmKOxTvW7GMyyWxLrfzOEuUsdq4I/bAYfkYgPh16npk1Bje
         trFpEFbB0iVdSVS4yXFD0YocMGReo2MqE81sx5dfuIesrwB7vz9ZNLGIOPVqP3lbuC6N
         fZKBgbJoImAPTs0igZAV6UcEtrkNA1IcYOKAVrAa16HOMcQVJLIOYCV3/FLKpwFJW0Sh
         z7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778612207; x=1779217007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eieIXGoJTyA0haz1UtIrd2PB79IVIZJdV7E0usIY6Q4=;
        b=kaIeVCEnVUGaVDiAqWXdsrolGWKJ3ygHluY1mZI/II6N4Up4Ir78h9kaVsMmUpnwB3
         KT0jg6Zf5q0daY1WaDQY8XvDbc9f61P7RfchkwHs9geycdMjBou4emvp6ijvgDL4CoAF
         cNljmYQYiyWc8xqEaJtbghcIiI39X8hOPv6O1GU/qMC/7RZdMOy1ubwkof0HwC7sJ+CB
         +Z62uq5kBzaUXnDjEAcp9rLB3r3PjyfZTyl+33vv6mLQutbRl931jlZWI4UdRWSvLc27
         j2YhaElen7DrRV/sthDH9MRk/k4h1l7MY46SB08FAhfbwnTmr3bjXVD06ijhk/w5jikK
         jj/w==
X-Gm-Message-State: AOJu0YxJ/bQ5uuWQKAPDP/jpxad8Pn2moHdiCSs7B8zqYZ7rGxU6AKiP
	+UueW0g99qopcuOMD2pJ0e/NKNPtY7+Y0zxs/XFM2bbkjfwmiZj2gLyvYOmX3chX+j0=
X-Gm-Gg: Acq92OFjjqQKJ6bCnSL0vj6NL1pg/IqZeenuVQ6l1tYYgk3bhFT0JpXdZ0fzxT6ztru
	1qLqfHiyAt+Ii1YTamX6sO8FMuZ3OouO5+zEJSM3f+49S7cqnRTx8YtehpKiaxACUhcQJqqi0d+
	QB+i/mXhS8LvtFJAv1FK4C8i43AUDKtvnbQ9Lv69oXnw04IKa4FxGFoTycXtEQuoZRuIxgZifpM
	2JIpRoiCEE4/GowRs50dgkynWBsnZGOlT5TxsVztzcGcyh7Zwdttc2Ofh8APDwMDHzwzpfgbQep
	bXqXCwMsUmoZ59JOcSbRyqPlZVLVJaNhf8xTzHDwlxmTzvvWWrv6Fl3HOiIAYPzPZEpHjNUWVS9
	N37+Eza2ZEGrtBl2y3Evz1auv0MW27nYUNg4317qv2NqYWuyduvKRYlbpiZTvqHh4BXdKQDVf3x
	7ex1435jvixKAz1pDJLyYVxB+BHa0oQwbMJ/NT
X-Received: by 2002:a05:7301:2a03:b0:2f8:42b0:e63d with SMTP id 5a478bee46e88-301180a53bcmr218037eec.2.1778612206800;
        Tue, 12 May 2026 11:56:46 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm18626408eec.11.2026.05.12.11.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:56:46 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 12 May 2026 11:56:26 -0700
Subject: [PATCH v3 3/5] hwmon: (pmbus/adm1266) add powerup_counter debugfs
 entry
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-adm1266-v3-3-a81a479b0bb0@nexthop.ai>
References: <20260512-adm1266-v3-0-a81a479b0bb0@nexthop.ai>
In-Reply-To: <20260512-adm1266-v3-0-a81a479b0bb0@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778612203; l=2726;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=k/WeXsyIs4N8EBomdIUZhc6w7uqY0msS071m02q6900=;
 b=N+BodH61Oi/VdwPnYVsQATZAvZK/fRdNoe4l4tUOy77EmcomAiw2iBJKR++7c32C4VpgqDabo
 DDQ/ZU4kJsmDVXr6gKNe99qOdlAcJGqt8QSF4zU2gErt2WHF9D8NfWl
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The ADM1266 maintains a 16-bit non-volatile POWERUP_COUNTER register
(0xE4, datasheet Rev. D, Table 93) that increments on every power
cycle and cannot be reset by the host. Each blackbox record already
embeds the counter at record time, so the standalone live value is
primarily useful for matching a captured record back to the boot it
came from when correlating logs.

Expose it as a read-only debugfs file alongside firmware_revision.
The block-read returns two payload bytes in little-endian order.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index bd3784d59a7c..080e7dbd0c06 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -28,6 +28,7 @@
 #define ADM1266_READ_BLACKBOX	0xDE
 #define ADM1266_SET_RTC		0xDF
 #define ADM1266_GPIO_CONFIG	0xE1
+#define ADM1266_POWERUP_COUNTER	0xE4
 #define ADM1266_BLACKBOX_INFO	0xE6
 #define ADM1266_PDIO_STATUS	0xE9
 #define ADM1266_GPIO_STATUS	0xEA
@@ -356,6 +357,31 @@ static int adm1266_firmware_revision_read(struct seq_file *s, void *pdata)
 	return 0;
 }
 
+/*
+ * POWERUP_COUNTER (0xE4) is a 2-byte little-endian non-volatile counter
+ * that increments on every device power cycle (datasheet Rev. D, Table
+ * 93). It saturates at 65535 and cannot be reset by the host. Each
+ * blackbox record embeds the counter value at record time, so this live
+ * read is mainly useful for matching a record back to its boot.
+ */
+static int adm1266_powerup_counter_read(struct seq_file *s, void *pdata)
+{
+	struct device *dev = s->private;
+	struct i2c_client *client = to_i2c_client(dev);
+	u8 buf[I2C_SMBUS_BLOCK_MAX];
+	int ret;
+
+	ret = i2c_smbus_read_block_data(client, ADM1266_POWERUP_COUNTER, buf);
+	if (ret < 0)
+		return ret;
+	if (ret != 2)
+		return -EIO;
+
+	seq_printf(s, "%u\n", buf[0] | (buf[1] << 8));
+
+	return 0;
+}
+
 /*
  * Clearing the blackbox is required when the device is configured in
  * single-recording mode (BLACKBOX_CONFIG[0] = 0): once the 32-record
@@ -404,6 +430,8 @@ static void adm1266_init_debugfs(struct adm1266_data *data)
 				    adm1266_state_read);
 	debugfs_create_devm_seqfile(&data->client->dev, "firmware_revision", data->debugfs_dir,
 				    adm1266_firmware_revision_read);
+	debugfs_create_devm_seqfile(&data->client->dev, "powerup_counter", data->debugfs_dir,
+				    adm1266_powerup_counter_read);
 	debugfs_create_file("clear_blackbox", 0200, data->debugfs_dir, data->client,
 			    &adm1266_clear_blackbox_fops);
 }

-- 
2.53.0

