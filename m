Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392713A9002
	for <linux-hwmon@vger.kernel.org>; Mon, 11 May 2026 07:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485898; cv=none; b=KZvjnO41TPW6D0PtW6K2PZUlj8Par7rxcUPeZ9Xgb0RKt+s/w50Cbu5W2qUxBsraSC2jO4I4oAWwUnEjdZOzVak1SywQKNCJ5kZ79u4zEFZGru2swKevZwf/7s2WmWfLoAFoxisgoedae+/94OkClzyKo+db1LCCr9s8k4I9fm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485898; c=relaxed/simple;
	bh=+s7AraqSSLTzzLZprtX85wFGz+qaFHzAS/LVroao8Pw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xuy8+p+CbXy6TeUBb5r2EreWrjwFT8g5SoZGDgdbrMTAYxm7jdH48beDQoXRCiDmAYWAKcGmxzlwe6ESFgRKzO4BrrEOXcktGBoFyzu/BxbUHl5mLGEPwfDXbXx+/yPf3UFSBPsZOiT1FrpygYmBq7HMtdrXp/jL6gf3xrx5R48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=D73AanxA; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="D73AanxA"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso4105291eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 11 May 2026 00:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778485887; x=1779090687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AmrptWkczEF869M9qrsApFWh7ZKodviz0ehsBGJgsM=;
        b=D73AanxA5GAq8woMQyq7DcvumycFhZAP77vY58pkFj+oJo3pLWwrXSuWzE3JjWO5dx
         xYn6N1dp0RxrEs7LJ3zklrdEpKxMuyY6m20lFflJiWmOGcKhbOTGrnNJhSjbI41UCIKk
         R1PF813zekHlNIHeFSkUwGYoA8PB/vTTqaKic0hvwDaTJHROFizW1bx9VoeU4ekjqjLs
         s7VB/jAhmfAJ5+S/nvWA3sCoN0Mr4aOlR1BrXJtEPUoUloWjtxuJ8HIK9MVaSqWzKClQ
         0+Pz2LoFDDNtTyp4gZfeZg8vtqnVkk763+gWNITNP6QbFX+CuQPA2yLV88Gqdxn/VsyZ
         v1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485887; x=1779090687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4AmrptWkczEF869M9qrsApFWh7ZKodviz0ehsBGJgsM=;
        b=ijVgvYf/+//3PDIl2P90xuoR5T5InGMOjGewgeTSAe0qdK+or25CgKF7lUaO3bnvZO
         sj6MvMiAkjnB1aVDEgLe2ol4hlxSQC/NtXgXSgK6g2pnviK5iyjHLou6z0Nhs5e1pAkb
         Wolb+TbgRmIU8XulG1cedREq3vVVUmq6b+vvalXA1PM0lJC5evVFjRV/mHelHDNsgNg+
         jaf5uQu9omWKrX/+J2y/s7hMoSvUDm3ZV6KhiwaC7rFQyr+zRG/3howBZ9UZXKZBCcqV
         5uNaLkJe1PS86AAH799IOwCNKATWL2QOHZWm04ITelSAz8b8tW/jzdTy1FWblBIVNxYG
         vz4A==
X-Gm-Message-State: AOJu0YyWMHAVDTWyWoY2R3O8bh+xj/IA3nxXqhWEWkwrTH88yLagUyvu
	XviyeDAZcGy0Nt/ISH+6lUpLQLStn7zUVxbsU2u+NOb5XdrPkHw5HVnF0Fz0Y0iMAVQ=
X-Gm-Gg: Acq92OGPfctxYX4dA8ht4GXxBCXPcn0SK3crgHeb/IZeHKVJT/bvOOJMpN6hJ1ZTJj+
	ivRSNrePmn79jOJ04MWCdtPhJZRsgrarUv8F2364JR3HegPCGwTo1ax57YmEquxWWcZYjGjrihj
	eLswL94WY3PQv1Eid/UD7kO0XgUkMd8r95kw1EmjFQ+c+9yLphI2gkTLjmJvPlzDBwRT5wiYsKF
	+qfLDXwpf82iOi29cHzT0Lwzx2xJNu6id6eF8iCST+eW9FoY+It1PwpJrp6+L8bl6dv2RurFQrT
	eeloEGRhaOjuZo3KIBqNTIl0/BzUVx3ZDBMk2ADhgoC3ov5FXOrJnYYq3CGJsMFo8Ww/Tem+i+e
	AmNRLHHsbfVNTY+AN9qX9JQo2iQoN9z72CZKIse3XZF5Pfo5Mg2jS5/AL4bsdaXUYYxzZu88Jbk
	/SYqr00bL7Ws+qJB8YZctNhILUe0rIc9LM0aoS
X-Received: by 2002:a05:693c:3015:b0:2ef:2878:7ade with SMTP id 5a478bee46e88-2f548b9d579mr11792574eec.15.1778485886641;
        Mon, 11 May 2026 00:51:26 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d429asm12549498eec.12.2026.05.11.00.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:51:26 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 11 May 2026 00:51:20 -0700
Subject: [PATCH RESEND v2 2/5] hwmon: (pmbus/adm1266) add clear_blackbox
 debugfs entry
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-adm1266-v2-2-7a6d34f0de5d@nexthop.ai>
References: <20260511-adm1266-v2-0-7a6d34f0de5d@nexthop.ai>
In-Reply-To: <20260511-adm1266-v2-0-7a6d34f0de5d@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778485884; l=2640;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=+s7AraqSSLTzzLZprtX85wFGz+qaFHzAS/LVroao8Pw=;
 b=Nv+wnetTK53JcpETk016gR49G2k2LvmpuFfWh1lSCDwq84785lv4CqrT8m6vuzb7f0FORl9Ug
 C4RjvNW2MZ2AAE6qxP1DElN6gqz28FwAHMiJZKiBSryy4AYU6WfCjV6
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

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 7b8433226176..31aefa8fc75f 100644
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

