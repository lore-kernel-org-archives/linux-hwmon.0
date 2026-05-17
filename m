Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B44288505
	for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 01:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778980707; cv=none; b=dGbwAW9hZ7dVrkpzDc/4YiX4nMk05GgqbRxy941MTy5l36EsF9mJEwjDivdRY+eMIAZvXSzQNt5FkiXjg7b1Y2aeuUkEUvTxCgzWOC3wrH2Vm8RN6KmLL+S1ZfDfpGKwZgbNPYKLbHDPo7ap6D7g/I0cv3ByKnfNstrl03EAnpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778980707; c=relaxed/simple;
	bh=GfZ4v/mNpI+1fGteLD86m+DRc8AuH5keWfQhto4lX6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F8nv3+CkZ4M9N78/Ru/IAGiuNMc9qqBV5WhRQQ4WGUR5uNgbpmsLHFMbrIr0aUjUDgTtY+DWxFe4BHZwsdRnoXvH0Jqc6Z+HK2RB6L95Rwo3EnyEAOyEuy/Z5HmoLolLYGTfE+svRDFzeaEsJ8pbmqkxp8KPrfZAg79vXlpcJ90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=ABADUWkY; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="ABADUWkY"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so5126871eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 18:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778980705; x=1779585505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIjV6KloXt2Yl7YHLO/Gzukpo75oolPgwlt5A0S4fZY=;
        b=ABADUWkYW051Lw+SRld0DclvzL4Vi3u+M4cYD1epyvRz1k6/I2Nm/ZkV3IxMMmWJuk
         YR+3ppBpzjy6fw0NSlU/XjIjUPlT2Ku5CG5+VfNRHok6RYMvk3WVia+DDSUOWQnO/yxU
         jwsamQrvzgGRNTrlTdVp1eiSyBiz/ngMZ6jBBDdHZabP+yKxcy/MUpGJq2iSjfrOWHav
         4QO4pqxYlB1yGzNLCFjEl4NcoDFOsd3LSRBgcU0i9nClCULxLGarnJF4N/81KC6p9qlZ
         rn1p/zi0Jcwb1NUouGhDM6QFRQwm9so7/AC2B+YI+3NjKm0iMI4+ey2+6pcJkMfj9aWK
         qk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778980705; x=1779585505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HIjV6KloXt2Yl7YHLO/Gzukpo75oolPgwlt5A0S4fZY=;
        b=GwFyndrT4T3qR/wPF6pNeY8A0n+LAf01+XnSChWwKwWhz0V4thkMgnfG21rbCdaGv+
         NxEaUTLfNV6WLu8GDr//LCNFm1cgCIk3TzPhp5hvtKYXwAUNbjR/f2jeA3mdvKmddaCY
         YUTWC5qTS0buKlt/XyYcR2oUk3+5NFno10Wc6L4fqqf077AlPY5tngAADXV0ZUMJV/8r
         A19L6uLXp/63k+B7hJHFpdZSYUKRajAKEDSUOF2/A2DsCiSBTO15ANiPG4XlQEjVOvX7
         p6emXalhGHHtbVWvkiLALBHGP8wdXQWap/h5zGIc7tTHlZPFuNjSUGkIsMvzyD9cTVWV
         EGMA==
X-Gm-Message-State: AOJu0YzF8oyeJC4EImkqjBqBRMw66/mGvewT6uMbOVautqVG47i+b5cH
	krFekuiIjeKXxWx+nlFjmHXKYH+ilncfatweNEljOfXXLJJtdM86oGqhN6wQN7p+55c=
X-Gm-Gg: Acq92OGJbKUCIntzQQfe1V+PMebMIlD1tuWgeIRXi9obgC9HMfTkPW9x4MXRY+05AE6
	keNQ63WiR0V7Jabtn5EseSlxKJh0VZT82wRgjO4vi7/J3VCG1F1jDkMKq4llhWHjAMh7e631Yyy
	tKDaRazeGiSnCGjA7GWxn0dSs2cwZMdmi4ZwI+WA+OcIQlG87hgep9ssHTO81WtM63UXRtoVqc3
	9nUiHpMiq5gqs2X4ehe+06Do0rTTp/iH8NDg6t+9OYGU9CMq7oNIpJanQndtRfRM4Ti4g46TmqF
	Kjr/Z+bV6DkLNWYVuh/IPp897e6FxBG80MmB01KG6EdyY/0/ws8SzMiuYKw2U0irmdrV/Rn0iTW
	0LVHKRcxDGvtnYDlX3taiO/+iqXY8uB/fGm0snVZWktJLRbfpGlTIFGaYslTDSkPoj9USIOax08
	732myWELz/mdDIWGaxeCTrE8QT5flFVgqTDWUGM1BRJF9683A=
X-Received: by 2002:a05:7301:678d:b0:2ed:e15:c925 with SMTP id 5a478bee46e88-303986be114mr4750520eec.33.1778980704636;
        Sat, 16 May 2026 18:18:24 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bbd50sm10582179eec.20.2026.05.16.18.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 18:18:24 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 16 May 2026 18:18:20 -0700
Subject: [PATCH v4 2/3] hwmon: (pmbus/adm1266) add powerup_counter debugfs
 entry
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-adm1266-v4-2-1f8df4797258@nexthop.ai>
References: <20260516-adm1266-v4-0-1f8df4797258@nexthop.ai>
In-Reply-To: <20260516-adm1266-v4-0-1f8df4797258@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778980702; l=3012;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=GfZ4v/mNpI+1fGteLD86m+DRc8AuH5keWfQhto4lX6U=;
 b=Ng+E4eEqA7hk5dkWc9EW8BG9VXfHi4OAZttlGMfkQZgGwc8XCL8xncpIiLqDAz55G01bioXJF
 EOQH6l4cODoA1z6lprWviixsGMq2bwVcFwPQMTjciGb5n26r/rvZDLs
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The ADM1266 maintains a 16-bit non-volatile POWERUP_COUNTER register
(0xE4, datasheet Rev. D, Table 93) that increments on every power
cycle and cannot be reset by the host. Each blackbox record already
embeds the counter at record time, so the standalone live value is
primarily useful for matching a captured record back to the boot it
came from when correlating logs.

Expose it as a read-only debugfs file alongside sequencer_state. The
block-read returns two payload bytes in little-endian order.

Take pmbus_lock around the block-read so the access serialises with
any pmbus_core sequence that sets PAGE on the device. Without it, a
PAGE write from another thread could interleave between a PAGE set
and a paged read elsewhere in the driver and corrupt either side's
view of the device state machine.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 9f4709bc85af..2edf3a424679 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -27,6 +27,7 @@
 #define ADM1266_READ_BLACKBOX	0xDE
 #define ADM1266_SET_RTC		0xDF
 #define ADM1266_GPIO_CONFIG	0xE1
+#define ADM1266_POWERUP_COUNTER	0xE4
 #define ADM1266_BLACKBOX_INFO	0xE6
 #define ADM1266_PDIO_STATUS	0xE9
 #define ADM1266_GPIO_STATUS	0xEA
@@ -331,6 +332,32 @@ static int adm1266_state_read(struct seq_file *s, void *pdata)
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
+	guard(pmbus_lock)(client);
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
@@ -376,6 +403,8 @@ static void adm1266_init_debugfs(struct adm1266_data *data)
 
 	debugfs_create_devm_seqfile(&data->client->dev, "sequencer_state", data->debugfs_dir,
 				    adm1266_state_read);
+	debugfs_create_devm_seqfile(&data->client->dev, "powerup_counter", data->debugfs_dir,
+				    adm1266_powerup_counter_read);
 	debugfs_create_file("clear_blackbox", 0200, data->debugfs_dir, data->client,
 			    &adm1266_clear_blackbox_fops);
 }

-- 
2.53.0

