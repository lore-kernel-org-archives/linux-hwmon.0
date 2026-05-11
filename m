Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5734018FC97;
	Mon, 11 May 2026 04:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778474918; cv=none; b=GQFqyvpSRpmxQ7Ok6fapMscdcowG2IarAt6HF5lxlgx4pcG4pUVE+4A2dJj6Ulgw+gvX7w1nFOkWfWwWULwhWe/JGvHQP/Kse116JQvDxtINX58LmqFz9xe9Aj+Rk1jAsC977p2T7u9d9ZZmsYFiZ48CJXMg9M3ZjzXFZhLG3WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778474918; c=relaxed/simple;
	bh=/T9ROO3CVva2hKIuVrUoFLfTEH8bY6pGixuquZOSFgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ngXBgdOq3yzF2Se8XZQZSzKEO2GJmAj2s/UWK+XrAaCpk61h3Q57t60pYrbuYmmrm192sxddOJhlXy0aQT3Hdk40xbsgImZ1WmMXjtoH0twrXvH3ineCUWBRk3FwpojIgtiIlVBK9QM8KCh7Ef/4PThX+JTXDfrnGoBeLKiwGMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMAQXeoO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UMAQXeoO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22A7BC2BCF5;
	Mon, 11 May 2026 04:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778474918;
	bh=/T9ROO3CVva2hKIuVrUoFLfTEH8bY6pGixuquZOSFgU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UMAQXeoOiNtWpqTtDGz0Je1VDIOLkks7bSDDWJVsE2/n7cahhzZ231klgVVQH5/ym
	 GhtrABHawJ6oCH/sPYyqC37rQ9pIo04aLDd5/27LIYGI/DQiXv2KYfQSfGgDAGRorR
	 Ty7AhXWfYQwRB4KqyIkA9so/iohXKIjO1uU1nb7EDlXVRTUZflKYhMd7ha+c5crLEA
	 5QNLOSWpZDPdkptktS0YHP+qwQxj2Xo7NReGul7lWEOQ709rfnWLtjn7Ra9xGeDP+a
	 YuUJcCE9Jeid2imIueR/OoQiUBNr2KFr4VV51+EKGreaoiJvGePKIQbwMIhpKD8eTA
	 F4qLHg5ccrFOA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CB5CD37AC;
	Mon, 11 May 2026 04:48:38 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Sun, 10 May 2026 21:48:08 -0700
Subject: [PATCH v2 2/5] hwmon: (pmbus/adm1266) add clear_blackbox debugfs
 entry
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-adm1266-v2-2-3a22b903c2f1@nexthop.ai>
References: <20260510-adm1266-v2-0-3a22b903c2f1@nexthop.ai>
In-Reply-To: <20260510-adm1266-v2-0-3a22b903c2f1@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2640;
 i=abdurrahman@nexthop.ai; h=from:subject:message-id;
 bh=+s7AraqSSLTzzLZprtX85wFGz+qaFHzAS/LVroao8Pw=;
 b=owJ4nJvAy8zAJbYltPXv6rsCXxhPqyUxZDHGL5nl8y10OeOe+8rJPx62/Y46HVCdo/Rfxvxsg
 OIHEa8Fn/I7SlkYxLgYZMUUWeY88n/T1tEWsSHmkD3MHFYmkCEMXJwCMBEVVkaGjxWr18mGBfQv
 e76nJ+Hoh5alv3viRKcuqtg3IVaG3f9oIMM/pfK2Bys+dnwVN3rUkLWNg0dvxoYHhcUdsdfe7ik
 +rKbOBAA3709+
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


