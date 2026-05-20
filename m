Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BCA3BCD01
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 22:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779316968; cv=none; b=RBVEt7e1VqHui/sDydzb3LeBXvdBb15sJhMPPo3bQpt6JeLV59Av7L8dU3bOVpkDcISoJVPh/Kou1YFpsxiO6zBIkZWq1/VJQ0eAtM0AArbGheEnlRzgdUdn9L7Wd+Makhz0VCOu+bgY6sqf8NFwlSVgfamaIzRuKJL2ISQcAUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779316968; c=relaxed/simple;
	bh=cjNAvb2CUF+16uCtjzoFz5BSRbJ34KEoz9HHaGrsXOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oore+2pAGMq+Y1ToBL99yAoBfOKZZM64vUhHmT8569x23MsYP3/uANrC9yZg2Y5wuYUI6ZRgGJU69JpZzpEl+T7n6w2KeG1gvOuLZFX7afurxc3yrg7pCnzHc0mMVDAdB/QKEUInB4zS2T8C+TnaJeNiPjkHfqeTpXBapgWtSRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=aR8m3nPC; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="aR8m3nPC"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso4685287eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 15:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779316966; x=1779921766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ics9Q+j7sZbOf6yU1DWNTIFuD49pEL8OYqz+Aj7MIg=;
        b=aR8m3nPCCq0Ca+U1O3heYXOxdsnyScToT/KLkjcnh7z67PqMrt3Nbz+QosJqSelJvS
         sCOv531I/gTUsKNZYyZKKK32948qaexb5Hk5ZIlnKAB7Va7zovJGqNZFvgVrkQI6fUHL
         U6IE2igS3cu9le8XYUqKRqOer4Bed9KvW68CU+13I5cpioJLWI888E0YJRKTV6qsTu5u
         8ftYXy6bkj6Wabfxzjn92dQwpXhr6eXWUBq5V+MWfcO0ntdIYH5mNVFLNTqptgAxTL0G
         +17DfzxFjnaUHvdAJyRcBACXCS6YkNFNGlwB/Gj3A6gLy4xnAfINogPTQCcRMbxc3xgw
         AGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779316966; x=1779921766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ics9Q+j7sZbOf6yU1DWNTIFuD49pEL8OYqz+Aj7MIg=;
        b=MJGRJiz1e6Q1prtkzEcI/+eiiPTRnX1dNs7rcLrLODnTuHJM07wPebD0QDV8xJbg0+
         CGNDqsZaJyfEjyQIqekPiSe2osIYU6hS79B/ezbMWWVvEYPL8aEl/4o1PfhowpIYMKPI
         ThjlA+64xRthMRqHwASseRPpZesNVfxGHTNGvEVaq4urqivew9zGNgj53bwpam2/e226
         dwwrGMGzxsZcpKW3oGnRna3M71LNgYfbjlO14aZ1xJ85suQ0F9x2irsaa8b+8LHGS/ot
         of6AMABZkMoSTJGQp9SDl7GfRSOjC2acbu44nbVfQfxLyx8ar6LuUsx3a5xMAKgalAX+
         VvQg==
X-Gm-Message-State: AOJu0YyRONvo5y6kFyftlW1Ag7sJJnHPNJwJAx9HhCIzIghVxpF14uBT
	XQ8lq4lbeZOdmKVt5Fx3BYBZ03VhqkLYiRkQVRZcTsNuTeouEHG5TmPU7MAcyD60rVTM4LSqbgB
	GDMyj
X-Gm-Gg: Acq92OF4Tf/Jn9HcJIT7FAaVVVFHAmfTSFIJj6+P+4VgPGSBo7zpgDgVAz8TbZK32rf
	O49Vb1pYrfYnlj9uDYz44CTay1cE6dIg9N1vsUh58JO03g3TbBbt9GdmHiEBpgl6LDMLra6VyxB
	lcWNigjsQ6JVmhcrRmK1/DA7ZedcD0Wg19uRkhUCR0fM5TGyD9xBWH4YUYkOtnNAf+UggOf3EvG
	J+/25Nc6tZ1CMJJf4sB+LmX0XobHzfXl/x++FmXHEr9hLshUbh6ifbZu2Cpvh7DQ8o9e5AA3L+Z
	ErUh/zOvidAut0m8oEmU24rWXd5NvrEXryWqzeyZMT2hKmKgi3K1iCcuOI2vRvAqy1/5eO6LLrP
	acN8q7ZRYcvgIsaGZQ0k/YTy3k0md4IBc57RuJNryTFHLWN82FSTtOcRefEtvJl2cL5M0yS6F5V
	HeDW4ywQppaxyttYJcKNbp8tbJ5A==
X-Received: by 2002:a05:7300:e787:b0:2f5:5dd3:1fd8 with SMTP id 5a478bee46e88-3042f476c1cmr326200eec.8.1779316966028;
        Wed, 20 May 2026 15:42:46 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e3c0sm25575614eec.3.2026.05.20.15.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 15:42:45 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 20 May 2026 15:42:40 -0700
Subject: [PATCH v5 1/3] hwmon: (pmbus/adm1266) add clear_blackbox debugfs
 entry
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-adm1266-v5-1-c72ef1fac1ea@nexthop.ai>
References: <20260520-adm1266-v5-0-c72ef1fac1ea@nexthop.ai>
In-Reply-To: <20260520-adm1266-v5-0-c72ef1fac1ea@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779316964; l=3224;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=cjNAvb2CUF+16uCtjzoFz5BSRbJ34KEoz9HHaGrsXOM=;
 b=AyT6TEV99hU6oaqBdPFXheLN/q5cHA1fqgPyPVVpOXmhPUtCv+T7tjOJ5ewkefg0XalIHp0j1
 dTvUJs344DNCbjlrqzd6UBxi+JeQ0NMGUz2HPDGhmHEynwlcKSpaIGE
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
time; both paths run under pmbus_lock so the clear cannot
interleave mid-iteration and corrupt the read sequence.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Assisted-by: Claude-Code:claude-opus-4-7
Assisted-by: sashiko:gemini-3.1-pro-preview
---
 drivers/hwmon/pmbus/adm1266.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index aadca716fe7f..e9d9cdb11e67 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -370,6 +370,40 @@ static int adm1266_firmware_revision_read(struct seq_file *s, void *pdata)
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
+
 static void adm1266_init_debugfs(struct adm1266_data *data)
 {
 	struct dentry *root;
@@ -384,6 +418,8 @@ static void adm1266_init_debugfs(struct adm1266_data *data)
 				    adm1266_state_read);
 	debugfs_create_devm_seqfile(&data->client->dev, "firmware_revision", data->debugfs_dir,
 				    adm1266_firmware_revision_read);
+	debugfs_create_file("clear_blackbox", 0200, data->debugfs_dir, data->client,
+			    &adm1266_clear_blackbox_fops);
 }
 
 static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)

-- 
2.53.0

