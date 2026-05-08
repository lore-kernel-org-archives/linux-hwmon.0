Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41B2363C6A;
	Fri,  8 May 2026 23:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283205; cv=none; b=Y4TIACotEyJGOzVd64JWt96uf9wOYrtEIXKUl4jD+YDDL7Kt3y7CMrnnT1x2fKdwvYuECNz7XSj5jBMBBzhX5Gu0msTLn3nxv47kY/RvOiI1Q1mlCuE/nV1EcskPUxp3EidIxl66z0gu8C66YOB152o7FmITL0HSIjUAyljQeSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283205; c=relaxed/simple;
	bh=3Jk+MCPJV9A6mfPn4xgNbIiXSnu2WaJ3tVt2NCsUpQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LXLdTa72faNDC2PwUTflqbNMvwW9c8nVHSPyfraQmY977jsMe1M97en5hSyr6c8F4OD5yTU9yLTeL1UeYxJb/DixLZ9iF4s+LYOtaubhQTSj4conGtebDKBU5MLY902WuVCmyfGmfOxe1d5+pBALvR9evsew2WZJDIpIzwWRdbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lX/bKh+m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lX/bKh+m"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88E3DC2BCF4;
	Fri,  8 May 2026 23:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778283205;
	bh=3Jk+MCPJV9A6mfPn4xgNbIiXSnu2WaJ3tVt2NCsUpQc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lX/bKh+mz9tmrZk9kVeWGg9VpFk9f8+sDDpfG9dLg7drPGxqBbIQ7PJ+ak4h1Tadx
	 JSuF0rUrT2iKacdeYLPfY3HCXBTgtNbKMdXpFh8E1fvG9QKDv+TQefY+1IKnlGj1rl
	 ZeWtxpMKBap+iajLW+sbvodsjSlKC23ouo29dUR0YhJC7b6RR8mjsMeUd4Xtypv55U
	 SjdkfpY3l9R1XuVnzgM2TItAI4rfeJV9iPWTxkryu7q3u6XXOpmZ3iuE2tvozilb7A
	 uqH7LpMB0U72UGHlkpGPqR6FBRL2QYT0FbMAwEam9WAiEk5Y5kVVMlfJS97D4JMVxQ
	 RNEY7dl0qTYEw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81619CD37B6;
	Fri,  8 May 2026 23:33:25 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Fri, 08 May 2026 16:33:16 -0700
Subject: [PATCH 4/7] hwmon: (pmbus/adm1266) add clear_blackbox debugfs
 entry
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-adm1266-v1-4-ec08bf29e0ce@nexthop.ai>
References: <20260508-adm1266-v1-0-ec08bf29e0ce@nexthop.ai>
In-Reply-To: <20260508-adm1266-v1-0-ec08bf29e0ce@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2640;
 i=abdurrahman@nexthop.ai; h=from:subject:message-id;
 bh=k9XGGAziLKna9OD3zoDFGbWFq64Y+DfU8TmPayUhAPg=;
 b=owJ4nJvAy8zAJbYltPXv6rsCXxhPqyUxZP4rOhLF4R476eTDJDWTCnnva0bvAw4UeUy4p5mxi
 N152uW81486SlkYxLgYZMUUWeY88n/T1tEWsSHmkD3MHFYmkCEMXJwCMBEOKUaGqRVNVgni0ic7
 raZn7j77sKDzv+WP5z1cNdv3zTjnu/VXOsNPxoiuH5+d8nJ9Q9jfS4g+qXPp2Zw1p/z5vociV5l
 Fgo4zAQA54U+X
X-Developer-Key: i=abdurrahman@nexthop.ai; a=openpgp;
 fpr=9CE24FEC86888658B05CC23FB45585FDABDD10F4
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/default with
 auth_id=756
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Reply-To: abdurrahman@nexthop.ai

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

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

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 5cfca00a4468..4c8d2e9e07dd 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -356,6 +356,36 @@ static int adm1266_firmware_revision_read(struct seq_file *s, void *pdata)
 	return 0;
 }
 
+/*
+ * Clearing the blackbox is required when the device is configured in
+ * single-recording mode (BLACKBOX_CONFIG[0] = 0): once the 32-record
+ * buffer is full the device stops recording until cleared.
+ *
+ * The clear is issued as a 2-byte block-write to READ_BLACKBOX with
+ * payload {0xFE, 0x00} per the datasheet.
+ */
+static ssize_t adm1266_clear_blackbox_write(struct file *file, const char __user *ubuf,
+					    size_t count, loff_t *ppos)
+{
+	struct i2c_client *client = file->private_data;
+	u8 payload[2] = { 0xFE, 0x00 };
+	int ret;
+
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
+
 static void adm1266_init_debugfs(struct adm1266_data *data)
 {
 	struct dentry *root;
@@ -370,6 +400,8 @@ static void adm1266_init_debugfs(struct adm1266_data *data)
 				    adm1266_state_read);
 	debugfs_create_devm_seqfile(&data->client->dev, "firmware_revision", data->debugfs_dir,
 				    adm1266_firmware_revision_read);
+	debugfs_create_file("clear_blackbox", 0200, data->debugfs_dir, data->client,
+			    &adm1266_clear_blackbox_fops);
 }
 
 static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)

-- 
2.53.0


