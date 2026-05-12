Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FFD36D51D
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 18:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778612208; cv=none; b=bYD75m7UGIA5E1ZBdm0xWumd7Azq/Iqpm/SSDfsXWWu0GTIZmf+sACDX10cDsMjvsSipvzQpCMPO6a6/md5HV+wb16buO1RJ3w/LYvYx9lGZevcwLA8wfzxxVZr/1eduWMMevXWNFE3Ys0Y7yAJs748SJiBojRlH93gWOB/RkWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778612208; c=relaxed/simple;
	bh=Z7hkncgsOQY/+2tXdlSW2APoMxPqmZfYnmq7uiHim+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PwlhpiUR05LI+ooSY9RTrJ/bigjQ7BfY+Pg2YNbHJl09xaf0bQc9+iJINmyew7Wq80Ia2bfPLoPWYO2TcMccQ+BKmwZM8dfYp9lHHcAOKxPk7hKvjgCYkTk+zEObhWaZ6rw/b7zibG5cZ8YCL4LlKG2Po9Vagm/vsb791cnSjzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=VDDtk/Uo; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="VDDtk/Uo"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so14141101eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 11:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778612206; x=1779217006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXhdJByMTXKnr5SUOLnc+CwZJu8wV9dbpoJ9K/0/NZs=;
        b=VDDtk/UoJvtb0wYOfmkSd3U2k5FQS1lm9YS+NZwMwV92p8gZuBP4CmVmILjyzWCyHG
         +tdexM9m/r8vTq3KUDH3bZcIYNHYloWCQ1EZ4ZI8WyHYJ9VAkYMqd79PoPtiIxiMHENC
         YUsMMvSuod3/vWSdwfh5lo+PobCZ2FAd6ZNUw2njN5TFuYpJKuvD4ysZZ2q4P2GTQ/SD
         WxIya5Uxo6tWX+/fRwRkMUNjmjGqpOW8lG0vqi4pJiFjmLcGnW3FL4kAMeQ5YE38PMuq
         3ow14fcAFouINn9SWn0Y1hxamvD8RxwKaRnnwTni4gMSIflSghIUuGF4YfKWxaebYJfv
         YrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778612206; x=1779217006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gXhdJByMTXKnr5SUOLnc+CwZJu8wV9dbpoJ9K/0/NZs=;
        b=TIWliVE5kTZLD5xzPxCewmQ8Hc4mNT0eMquF4hg+ejnvIrNO1ujwNSBbJ6OyEoEFkm
         CDUxBID35esMjOaE9BuOMuoVcZNmo/UkaQDuFjeZOpJ2kLkLQMqdIw5OJS2gryZ6VATp
         msjHIQ2PVv5eVLSWMeP/wR5jqN4OUl+2oQZpH4hM1gG2RS9qlbV9SyxetpY4HkO46Q4s
         R6CliPZeZw36jGrpvmMYsqZ/CRDxpmsUh356c/yNrfMywz0zghOME2afJBK9HzlsWMsX
         bKojV2nSvICuKVCJ/Jrao4I1Syl5i+w119XaQSYutTpb5msNVLkADYEWBg3ShWRs32+v
         lurw==
X-Gm-Message-State: AOJu0YyOK8vKRs/aRjtPo6d56fTrn+oLyNEF8dKjv8Tklnd2mINTo8IH
	/rpAJ2DFbFtTSa40/rxyDejmQWDKkuoyEWzAftCKqrBWlRDAA5gAsrID0IiPes1Oz5E=
X-Gm-Gg: Acq92OE3PXCRKEGSzoGOH+qtQtUjV2RsKk41kxF98GYv4Abac0uAGafxL5DQlHHpXs4
	BzJxpq2Hm/+yzxEY0kuD+mfY+R1Sgy5di+kIvabasEF/R/COjmCiuI3xmi3au+j+wpHwR8gIkdY
	iMjC6bzgAmiVGOLdnuqExAMVTrwOmdCzJUpWGge9hapbuHDK70eROOvJ4kh5fijkYDYvNX0rvzH
	cIbkxybFVBCQIApw4B+Xy7NYiU4KeTu9yYrVv4A6PpcWzecDalJt4CrDnMj/VLVLLV7upBYzK0H
	qFwhJsAjRR7celDIryHFQ4m0yphZa2mixticEa3Sndocie4/ISHbsW34qgN1ObiLrnLLnGbM4K/
	x6THtudRRk5GkhmSKsBUGv4wn7ep9Hzv2HaApRvI4XViHp3TDZYOs+lYura4dmnV4YzRDX6Bj2K
	Yd665BVRlWm8gA5XpvgH3y+gomQA==
X-Received: by 2002:a05:7301:fa12:b0:2df:7fe3:96a with SMTP id 5a478bee46e88-3011437364emr243570eec.0.1778612206001;
        Tue, 12 May 2026 11:56:46 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm18626408eec.11.2026.05.12.11.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:56:45 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 12 May 2026 11:56:25 -0700
Subject: [PATCH v3 2/5] hwmon: (pmbus/adm1266) add clear_blackbox debugfs
 entry
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-adm1266-v3-2-a81a479b0bb0@nexthop.ai>
References: <20260512-adm1266-v3-0-a81a479b0bb0@nexthop.ai>
In-Reply-To: <20260512-adm1266-v3-0-a81a479b0bb0@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778612203; l=3902;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=Z7hkncgsOQY/+2tXdlSW2APoMxPqmZfYnmq7uiHim+M=;
 b=hffBXCWKJ8/ONUkpmKyalJ1r4OU+MupJVvVPPSd6Hf0/1itF0tVeU/emknBchy7RtUL8p3AvW
 Encmagcwtz2CtagLee33pwFQ2BtPmKG/Eb+yHI+WMvxSxqJ7v/bRcUY
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
 drivers/hwmon/pmbus/adm1266.c | 48 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 7b8433226176..bd3784d59a7c 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -356,6 +356,40 @@ static int adm1266_firmware_revision_read(struct seq_file *s, void *pdata)
 	return 0;
 }
 
+/*
+ * Clearing the blackbox is required when the device is configured in
+ * single-recording mode (BLACKBOX_CONFIG[0] = 0): once the 32-record
+ * buffer is full the device stops recording until cleared.
+ *
+ * The clear is issued as a 2-byte block-write to READ_BLACKBOX with
+ * payload {0xFE, 0x00} per the datasheet. READ_BLACKBOX is also used
+ * by adm1266_nvmem_read_blackbox() to walk records one at a time, so
+ * both paths take pmbus_lock to keep the clear from interleaving
+ * mid-iteration and corrupting the read sequence.
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
@@ -370,6 +404,8 @@ static void adm1266_init_debugfs(struct adm1266_data *data)
 				    adm1266_state_read);
 	debugfs_create_devm_seqfile(&data->client->dev, "firmware_revision", data->debugfs_dir,
 				    adm1266_firmware_revision_read);
+	debugfs_create_file("clear_blackbox", 0200, data->debugfs_dir, data->client,
+			    &adm1266_clear_blackbox_fops);
 }
 
 static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
@@ -379,10 +415,11 @@ static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
 	u8 buf[5];
 	int ret;
 
+	guard(pmbus_lock)(data->client);
+
 	ret = i2c_smbus_read_block_data(data->client, ADM1266_BLACKBOX_INFO, buf);
 	if (ret < 0)
 		return ret;
-
 	if (ret != 4)
 		return -EIO;
 
@@ -392,7 +429,6 @@ static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
 		ret = adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, 1, &index, read_buff);
 		if (ret < 0)
 			return ret;
-
 		if (ret != ADM1266_BLACKBOX_SIZE)
 			return -EIO;
 
@@ -497,14 +533,14 @@ static int adm1266_probe(struct i2c_client *client)
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

