Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11D7363C6B;
	Fri,  8 May 2026 23:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283205; cv=none; b=be1X+MVIAn9Ih4fLV1JV2dkVbg6XZnJ/fFTohJMb/8fojypNJ9/kn4mN/6/ZzFCybVhZbnwUK/LVed/jpWV3MEOv2SitGg3EChznJU4x9dJTdOSlTO/VLvckJyFeXj54xwiZhKQB1XkI2i5051+yFUcsLN0yML2PLT1TEd9ETdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283205; c=relaxed/simple;
	bh=XyPD4HZ2I2akRjuUwLysi3XwhZNfWpG01pRTy/Bl05U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fn0Oug5iBJVYbvhqiTBNHQCZe9mCZu/wpPBJNEmqcwERcedo0rt1PON8x/q7KPGNJb6Bmss5bVyliErysL1sQVVtPFvTB/Y+N3o6HB+fDTj5//MMwauDnKFUdEkwovVRpaNFxU+eokwdxBj1tWndd7r1LjwtYBnmMp2wIDTj/Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQeeUq38; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQeeUq38"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9562DC2BCF6;
	Fri,  8 May 2026 23:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778283205;
	bh=XyPD4HZ2I2akRjuUwLysi3XwhZNfWpG01pRTy/Bl05U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hQeeUq38zFke+199YDlrzB3srsCpmwXdAewSjITS2XDFMeR3V+Foo30E5fLR450wE
	 8zokQgm15OA1sZggW6VQa49IRi+ei+jRVxszq3cu8FVcDkVEWFZkXuf9FGf8FfsFil
	 q0sm4QPd6Z8K+X5khw9hNzZiBowPAUN5RS+48WjzGVOzL+gDGQKjERls4FLMLm990g
	 md+7NL9cykLnBjw77kY77KLJYuI3XdDD4D8G/FecWQAfRDVU/X0lvc2dqlpjnnQ9tc
	 ssmIWrT8AZ2XX1kgDOZe8KB6ER793LDlo2lAG/AxgolSpYIHi4xW2Mbo89tiYRzX3C
	 bM8FLxYF+Fi0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F426CD37AC;
	Fri,  8 May 2026 23:33:25 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Fri, 08 May 2026 16:33:17 -0700
Subject: [PATCH 5/7] hwmon: (pmbus/adm1266) add powerup_counter debugfs
 entry
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-adm1266-v1-5-ec08bf29e0ce@nexthop.ai>
References: <20260508-adm1266-v1-0-ec08bf29e0ce@nexthop.ai>
In-Reply-To: <20260508-adm1266-v1-0-ec08bf29e0ce@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2726;
 i=abdurrahman@nexthop.ai; h=from:subject:message-id;
 bh=enCxKzecGJQP+K1oC89viiJPWaPvVQEAVH/Tn3UpTfQ=;
 b=owJ4nJvAy8zAJbYltPXv6rsCXxhPqyUxZP4rOiJUKWyz6OjGJ2f9zM62t3yrWaJ2pOeO/49bn
 /2FqnkZeP51lLIwiHExyIopssx55P+mraMtYkPMIXuYOaxMIEMYuDgFYCLO9YwMkx50vD/e+dn2
 ai57bYrBmcXBEt+7DeuPMs8/3+1UPjluIiPD216Zr9zvdkoVaSQq2m8N/yJ3fKOsd2pU1omp03I
 VtL4xAgAJX09g
X-Developer-Key: i=abdurrahman@nexthop.ai; a=openpgp;
 fpr=9CE24FEC86888658B05CC23FB45585FDABDD10F4
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/default with
 auth_id=756
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Reply-To: abdurrahman@nexthop.ai

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

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
index 4c8d2e9e07dd..a058616d4215 100644
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
@@ -400,6 +426,8 @@ static void adm1266_init_debugfs(struct adm1266_data *data)
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


