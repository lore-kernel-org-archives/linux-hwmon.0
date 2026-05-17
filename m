Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEEF287259
	for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 01:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778980706; cv=none; b=g5TTEuOJ/jr7SwS1iS/k/7RAeh1AlNZQ9HzRZGcj2HOvFhGXZdpZOKRILDUe0Dpffku7qJzWScZEDHzTlBBoPmN5iHN3iKL+fBxG9vBPZe5pErNKWttHnX7HkwpDeGdrDiVwPCF4LKx0bKZf8kdtMRQeABt+WUqsTdhG/Q7kMDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778980706; c=relaxed/simple;
	bh=aqjK7wL4qG4YIi+HNyz219JOuZW698caEqsx9hyaQiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TpHt67S357GZxMKjXUBRPJ3F1m+8feA3eJnPPk2jQnug7BvyYRKbQ0ET/Nm+FW7U5E7/8160GG07KVHCXO7kAh7+IIFkR7Xyk/Sxqf7wwit9rVaoFGIVesuuQ6eih27ddb9bH26LkbUxIbWa7+AzNGB7ppRjrIdW8Ohoc7dlefw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=dOySqmcH; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="dOySqmcH"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso1083566eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 18:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778980704; x=1779585504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9ROmFxNAGb/pGdvNxezxVPGIOiaMGXemePEILBHCHA=;
        b=dOySqmcHz/8OPDnkBFmPCe9uS0axhIv6hfXTdisvfP5JNyUtJDAHDKCuTxeETa5kcL
         q7B2ajUh00vj+ksffvIEVsJmtbQjlpRq9QInID/5BgEr1D1D1ndYTXbVtIJw0gduAuSD
         2xvwXSls4Rv1YhiLdjSFlRgzzeKHLWumKCNHfZFCHipkaDllgELytHjkfu6HDy2EqtZm
         ficwIzeAVmbLskPzCouKkiCMkEpfeiHa1xvbcwO0tQaIMzDE0S2/NXBnpDdYGo8Vc6tM
         VpRnYa+u0xautoLZiftC+fG7bK1zTkasBBYcVEzA1yShQlA+/fV8TCtqqmimswKGxtyf
         vVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778980704; x=1779585504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w9ROmFxNAGb/pGdvNxezxVPGIOiaMGXemePEILBHCHA=;
        b=ZAGrgmBFoernY9unX9fiHUJvGuUaX/xBo6OV+iy0wpGQU/spBqWKRNBU814qu8Xm6H
         Q/+3R+u+iNNxOX3sZ45VfSC9ylmGcKqQ3wWX1czqi+ufIlGnFUsjIr84Xjl5wAcug5z+
         DPducnBTzRcBg+RkeVuOdrDwoiVLK3ME7d9qG3qDKgtMCn6L8ybDX9nS9xug+bJxmhC4
         IUVuLN9dShtgP+VSNNNDR3t+dl/soqn2cZWGe4VvAZfGRMl4nl37yaG9Y8F0RvcshV5t
         eB5cLsjNumrw5tt7SBCtQSP9fxvuaO1/cUCqRnX/eQ448oMZ6z1xfRHZ40tgTUdMfwHY
         v1jA==
X-Gm-Message-State: AOJu0YxqO3wlWb+636p/epaRivdcX0DhfISkiRSC1Jh52B2jfLcApYex
	nWGh49Kv4hZRaTJ3GMEiKcADBxB0zsiVWtuRF5ucckEv/qzVuxe9JvuIQlxZy5pg9hQ=
X-Gm-Gg: Acq92OHvuBElYUJsVpXyu+C52vDoOOlhLuTlrMxKi7Ejl18azoEBzQ1HbZYRYwfpULu
	LW1h5GSaSPgBXwZiWRHtErWWXEpyxtot3Bd4lRk7d+y982HQXlT6eQxDGj3tHJgLqQUMCfA11oj
	ouuWLC7EvlluvQIl1sCrFkvtZd3DzlevY0jPm9xeCh3ikDLvDM+D+ds/SH7x7RnZXn2BaHENaAv
	gvXnFI/8OoEqms3/Tum9Cj/yJBWIls6vJPdM6aZlXWql+P059SROozXgGcLsiorHCo5mqxjAKcj
	/BkxVlVRWZDjb2XKmv8cxauagU4AD8HjtO7QKQ/wtcQfUjMoElunmOPKnyQHanLgimsI5A0vcQK
	eERL/BLt8zYXpavnKT6seQqK7Sa1KYxNvISbpKCQvxdyjlAXCvPvxcRoM15FX2/fa3hAbDjgvNC
	n5GuCid6QkE/r46/bBOm2JNRUpqg==
X-Received: by 2002:a05:7301:644b:b0:2f0:4268:bc42 with SMTP id 5a478bee46e88-3039869954amr4386878eec.25.1778980703955;
        Sat, 16 May 2026 18:18:23 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bbd50sm10582179eec.20.2026.05.16.18.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 18:18:23 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 16 May 2026 18:18:19 -0700
Subject: [PATCH v4 1/3] hwmon: (pmbus/adm1266) add clear_blackbox debugfs
 entry
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-adm1266-v4-1-1f8df4797258@nexthop.ai>
References: <20260516-adm1266-v4-0-1f8df4797258@nexthop.ai>
In-Reply-To: <20260516-adm1266-v4-0-1f8df4797258@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778980702; l=4654;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=aqjK7wL4qG4YIi+HNyz219JOuZW698caEqsx9hyaQiY=;
 b=BLUJi7FiSAnjHBV3NXgVBmqxWfba4gFTCSk2aZpf8Hc5FsP4zcRUn2G9ie6yMup6wdWF/Vskh
 6pjLW6YY8oYAkOwEP8JN0kJCNvy8xMRtaq6Eb5H/VcxBP+lm7Ewmdzx
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The ADM1266 blackbox can be configured in two recording modes via
BLACKBOX_CONFIG[0]: cyclic, where the device overwrites the oldest
record once the 32-record buffer fills, and single, where it stops
recording until the buffer is cleared. Deployments that need to
preserve the full record history across multiple fault episodes
typically run in single mode and need a way to clear the buffer
after the records have been collected.

Expose a write-only debugfs file alongside sequencer_state. Writing
any data to it issues the documented clear-blackbox sub-command:
a 2-byte block-write to READ_BLACKBOX (0xDE) with payload
{0xFE, 0x00} (datasheet Rev. D).

The clear is taken under pmbus_lock because READ_BLACKBOX is also
used by adm1266_nvmem_read_blackbox() to walk records one at a
time; without the lock the clear could interleave mid-iteration
and corrupt the read sequence.

Also acquire pmbus_lock in adm1266_nvmem_read() so the memset of
data->dev_mem, the blackbox refill, and the memcpy out to userspace
run as a single critical section. The nvmem core does not serialize
concurrent reg_read calls, so two concurrent reads of the nvmem
device could otherwise race the memset against the memcpy and copy
garbage to userspace.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 47 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index d90f8f80be8e..9f4709bc85af 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -331,6 +331,39 @@ static int adm1266_state_read(struct seq_file *s, void *pdata)
 	return 0;
 }
 
+/*
+ * Clearing the blackbox is required when the device is configured in
+ * single-recording mode (BLACKBOX_CONFIG[0] = 0): once the 32-record
+ * buffer is full the device stops recording until cleared.
+ *
+ * The clear is issued as a 2-byte block-write to READ_BLACKBOX with
+ * payload {0xFE, 0x00} per the datasheet. READ_BLACKBOX is also used
+ * by adm1266_nvmem_read_blackbox() to walk records one at a time;
+ * both paths run under pmbus_lock so the clear cannot interleave
+ * mid-iteration and corrupt the read sequence.
+ */
+static ssize_t adm1266_clear_blackbox_write(struct file *file, const char __user *ubuf,
+					    size_t count, loff_t *ppos)
+{
+	struct i2c_client *client = file->private_data;
+	u8 payload[2] = { 0xFE, 0x00 };
+	int ret;
+
+	guard(pmbus_lock)(client);
+	ret = i2c_smbus_write_block_data(client, ADM1266_READ_BLACKBOX,
+					 sizeof(payload), payload);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static const struct file_operations adm1266_clear_blackbox_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.write = adm1266_clear_blackbox_write,
+	.llseek = noop_llseek,
+};
 static void adm1266_init_debugfs(struct adm1266_data *data)
 {
 	struct dentry *root;
@@ -343,6 +376,8 @@ static void adm1266_init_debugfs(struct adm1266_data *data)
 
 	debugfs_create_devm_seqfile(&data->client->dev, "sequencer_state", data->debugfs_dir,
 				    adm1266_state_read);
+	debugfs_create_file("clear_blackbox", 0200, data->debugfs_dir, data->client,
+			    &adm1266_clear_blackbox_fops);
 }
 
 static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
@@ -355,7 +390,6 @@ static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
 	ret = i2c_smbus_read_block_data(data->client, ADM1266_BLACKBOX_INFO, buf);
 	if (ret < 0)
 		return ret;
-
 	if (ret != 4)
 		return -EIO;
 
@@ -365,7 +399,6 @@ static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
 		ret = adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, 1, &index, read_buff);
 		if (ret < 0)
 			return ret;
-
 		if (ret != ADM1266_BLACKBOX_SIZE)
 			return -EIO;
 
@@ -383,6 +416,8 @@ static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t
 	if (offset + bytes > data->nvmem_config.size)
 		return -EINVAL;
 
+	guard(pmbus_lock)(data->client);
+
 	if (offset == 0) {
 		memset(data->dev_mem, 0, data->nvmem_config.size);
 
@@ -470,14 +505,14 @@ static int adm1266_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	ret = adm1266_config_nvmem(data);
-	if (ret < 0)
-		return ret;
-
 	ret = pmbus_do_probe(client, &data->info);
 	if (ret)
 		return ret;
 
+	ret = adm1266_config_nvmem(data);
+	if (ret < 0)
+		return ret;
+
 	adm1266_init_debugfs(data);
 
 	return 0;

-- 
2.53.0

