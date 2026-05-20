Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869EF3C1986
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 22:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779316971; cv=none; b=IFMMmgTdUPBY1WFSSTlscZ2nMKSf24XNI3sPerM4udv3sRTfJEO9v1kfCsvdHP6joPVB/TnGiNrBfKtZx4p5sE+DJ/izKpLnixigk8xPtBdoqGiKIU7slS2NgJsPngdXVX/eUNHnUxrdaMoF526IHTy6CijkXXxJkom0SW8PhqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779316971; c=relaxed/simple;
	bh=kpxSi7jWVavvVYPl7UpO3wQxVoIBWssz+1mWqAlbFsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r2FX94Xm6hW4o0Cp5wsaUPwFA/mRRRyYEJdq5Fdad40Awar/v9Bjimm+6eLjAkXgQBY7TJ9p9hCmpoeqJ+Eu3nsg3+IKTDjwme6PelWm596WltYAZxOF7lc++rS0ZRb6OqTah5ZAG1owCD/mfGLrpfQESIfpftKHrdd1PfxWy9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=afekD03z; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="afekD03z"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ee990e8597so13687446eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 15:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779316967; x=1779921767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=naRx/tcvV4ICyuu1T2WRfyD3IYJbZPSfRXyBAbde4No=;
        b=afekD03znZEXVhmqQbyTwGAsxL5tAKeBC+x2xTclWJ++SHJy9WxaIBKVf2hPF51Te0
         FRaGInRCfgtgPhTC4NCd2DbWA2gCdBP/0lIt5P01GLSHRxTgfBMd9cgyq3bgttI/upuT
         bMZg5fwof3bO1daySlMqtF09fFOuwLVC/bfZFB3hXDF3+gr+Ovzk6K3WzVSF4gVnD+iz
         Tr6v8/uEdr8Qo3HuAfFeoWA73faGsI4e44dPlUffXC7gYcXs9E7+nms5qmw0Qv5OY4on
         ZdzMeYHRE+1Zf2ZsR0eCBGEll8shPONQCoRCogbhn/SePgSIsOiAgU2ExedHrullr4LC
         ZuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779316967; x=1779921767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=naRx/tcvV4ICyuu1T2WRfyD3IYJbZPSfRXyBAbde4No=;
        b=FW0IYX0zt8QgukNXlm9/mTR/trm/s3IRMw9zRWndHWYbGDlNyRKkFKFZzGL6yzGo2+
         h2M0eYT/y1NtifCg0x/G7izrOJv9ZDacmLH2WSFulVEmemFwSt5Fug+A+0X/3qihDVh5
         J5DFgdE2huUoRqT3gOkuxcCDQ/VimFDxs3pwj9cqLw1iE7ktxjXRu1RIl+ZCoWMQm/7j
         9PLoabWS272gBVRHNAFL1l8ar3WPDi1ICAIWQcYnXC85KgXjEMWjpdi6M+SfBifPOYbZ
         q7PXlTfq3Bg8bwCnbRwWDHWWbPBsJQ6KWpLOs2erzKDHvxYGrSo7j+zSZGBFViPjlu5Y
         iN1Q==
X-Gm-Message-State: AOJu0YyOAZOu0bdVSPymSDi86oj5k42jaaqTSbvuc5gA6gHLV0mcdQjR
	o4QhJ2mWr/4gBhWVqZLCPQYPvDlp10sdodCi9ysGYt0dItUuSWz/7jwVF28bCuct5q8=
X-Gm-Gg: Acq92OE+eJpcDAaziSDLwKAW8WmP2ZXzRSWEmvIh4a8mjf/KKlJJHBDm9PZXREHWneO
	SCYhnzMyu2sbSc6uag6VTSev3F+cthLtSvbZKwO2/xdfGLmAxfIPmjTnZtLtoc2zamNYVxEqPXz
	JtkWGkuCxBP9Hxwop5PCvMeuw3TKgYNsrH6agqS1kbkxcC8w3TO9FWQYenN63yyT6Zv760y7Iwe
	eksEL9cBFIGLPz4z6rmxo1bmCSXK9qgiWugtfDMdlkyA22ppFmS2tfWp1fPidz0n7wcZ3Eg/VkW
	v3/dq7X+ioLDmwig5q3nFcdSVQSQJC2lXv9BdoLt9doivvrE1ZCsnYdDL+gS0PNks602dUc/tep
	bJXHD4u8LgF30ojcbKHbLpl2caFIjKGrvWfuqHOdbzoOj2U+qOhBbAbBZeX3y6ypupWtS85tKQK
	6lLbO8S2ZF7dTxgoSPbSbHJpwg245LfnT/soQd1RgABNtJBlk=
X-Received: by 2002:a05:7301:eac:b0:2e7:5737:8364 with SMTP id 5a478bee46e88-3042f487b62mr329241eec.15.1779316967428;
        Wed, 20 May 2026 15:42:47 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e3c0sm25575614eec.3.2026.05.20.15.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 15:42:47 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 20 May 2026 15:42:42 -0700
Subject: [PATCH v5 3/3] hwmon: (pmbus/adm1266) add rtc debugfs entry
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-adm1266-v5-3-c72ef1fac1ea@nexthop.ai>
References: <20260520-adm1266-v5-0-c72ef1fac1ea@nexthop.ai>
In-Reply-To: <20260520-adm1266-v5-0-c72ef1fac1ea@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779316964; l=6006;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=kpxSi7jWVavvVYPl7UpO3wQxVoIBWssz+1mWqAlbFsI=;
 b=eu91dOsfcAYyS/vtzcaFMNWJeDuPidBQMTmJeDjrm1LIgKginIDDJIXb2pFW3Zmjnwf81u66t
 uRIm7u8pP/wCk5BdUKLM4zmE7ygsD2KjYDRX+c7f715S2ekhPba/RCQ
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The driver seeds the chip's SET_RTC register once at probe with
ktime_get_real_seconds().  Over a long uptime the chip's internal
seconds counter drifts away from the host's wall-clock time, so the
timestamp embedded in each blackbox record stops being meaningful
in wall-clock terms.  The datasheet recommends that the host
periodically resynchronise the counter to address this; today the
driver has no userspace-facing knob for that.

Expose SET_RTC via an rtc debugfs file alongside the other adm1266
debugfs entries:

  read  -- returns the chip's current SET_RTC seconds counter, so
           userspace can observe how far the chip has drifted from
           host wall-clock without writing anything.
  write -- the kernel re-reads ktime_get_real_seconds() itself and
           pushes it to the chip.  The write payload is ignored;
           userspace does not get to supply its own timestamp
           value, so there is no way for it to push a wrong time
           into the chip.

A small userspace agent (chrony hook, systemd-timesyncd dispatch
script, or a periodic cron job) can write to this file to keep the
chip's counter aligned with wall-clock across long uptimes.

Both the read and write paths take pmbus_lock to serialise against
the pmbus_core's own PAGE+register sequences and against the other
adm1266 debugfs accessors that already run under the same lock.

While at it, drop the now-redundant adm1266_set_rtc() probe-time
helper.  The new adm1266_rtc_set() callback does exactly the same
byte-packing and write; probe just calls adm1266_rtc_set(client, 0)
(the ignored @val argument) after pmbus_do_probe() so the
pmbus_lock acquired by the new helper has a live mutex to take.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Assisted-by: Claude-Code:claude-opus-4-7
Assisted-by: sashiko:gemini-3.1-pro-preview
---
 drivers/hwmon/pmbus/adm1266.c | 90 +++++++++++++++++++++++++++++++++----------
 1 file changed, 69 insertions(+), 21 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index b6820415d99e..dcf2b038cd37 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -431,6 +431,69 @@ static const struct file_operations adm1266_clear_blackbox_fops = {
 	.llseek = noop_llseek,
 };
 
+/*
+ * SET_RTC (0xDF) is a 6-byte block (datasheet Rev. D, Table 84):
+ *   bytes [1:0] - fractional seconds (1/65536 s, written as zero)
+ *   bytes [5:2] - seconds since 1970-01-01 UTC, little-endian
+ *
+ * The driver seeds it once at probe via adm1266_rtc_set().  Over a
+ * long uptime the chip's counter drifts away from host wall-clock,
+ * so expose it via debugfs:
+ *
+ *   read  -- returns the chip's current seconds counter, which lets
+ *            userspace observe host-vs-chip drift.
+ *   write -- the kernel re-reads ktime_get_real_seconds() and writes
+ *            it to SET_RTC.  The write payload is ignored; userspace
+ *            does not get to supply its own timestamp value, so
+ *            there is no way to push a wrong time into the chip.
+ *
+ * A small userspace agent (chrony hook, systemd-timesyncd script,
+ * or a periodic cron job) can write to this file to keep the
+ * timestamp embedded in each blackbox record aligned with
+ * wall-clock across long uptimes.
+ */
+static int adm1266_rtc_get(void *data, u64 *val)
+{
+	struct i2c_client *client = data;
+	u8 buf[I2C_SMBUS_BLOCK_MAX];
+	u32 seconds = 0;
+	int ret, i;
+
+	guard(pmbus_lock)(client);
+	ret = i2c_smbus_read_block_data(client, ADM1266_SET_RTC, buf);
+	if (ret < 0)
+		return ret;
+	if (ret < 6)
+		return -EIO;
+
+	for (i = 0; i < 4; i++)
+		seconds |= (u32)buf[2 + i] << (i * 8);
+
+	*val = seconds;
+
+	return 0;
+}
+
+static int adm1266_rtc_set(void *data, u64 val)
+{
+	struct i2c_client *client = data;
+	time64_t kt = ktime_get_real_seconds();
+	u8 write_buf[6] = { 0 };
+	int i;
+
+	/* User-supplied @val is ignored on purpose; the kernel owns the
+	 * time source so userspace cannot push a wrong value into the chip.
+	 */
+	for (i = 0; i < 4; i++)
+		write_buf[2 + i] = (kt >> (i * 8)) & 0xFF;
+
+	guard(pmbus_lock)(client);
+	return i2c_smbus_write_block_data(client, ADM1266_SET_RTC,
+					  sizeof(write_buf), write_buf);
+}
+DEFINE_DEBUGFS_ATTRIBUTE(adm1266_rtc_fops,
+			 adm1266_rtc_get, adm1266_rtc_set, "%llu\n");
+
 static void adm1266_init_debugfs(struct adm1266_data *data)
 {
 	struct dentry *root;
@@ -449,6 +512,8 @@ static void adm1266_init_debugfs(struct adm1266_data *data)
 				    adm1266_powerup_counter_read);
 	debugfs_create_file("clear_blackbox", 0200, data->debugfs_dir, data->client,
 			    &adm1266_clear_blackbox_fops);
+	debugfs_create_file("rtc", 0600, data->debugfs_dir, data->client,
+			    &adm1266_rtc_fops);
 }
 
 static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
@@ -538,23 +603,6 @@ static int adm1266_config_nvmem(struct adm1266_data *data)
 	return 0;
 }
 
-static int adm1266_set_rtc(struct adm1266_data *data)
-{
-	time64_t kt;
-	char write_buf[6];
-	int i;
-
-	kt = ktime_get_real_seconds();
-
-	memset(write_buf, 0, sizeof(write_buf));
-
-	for (i = 0; i < 4; i++)
-		write_buf[2 + i] = (kt >> (i * 8)) & 0xFF;
-
-	return i2c_smbus_write_block_data(data->client, ADM1266_SET_RTC, sizeof(write_buf),
-					  write_buf);
-}
-
 static int adm1266_probe(struct i2c_client *client)
 {
 	struct adm1266_data *data;
@@ -574,14 +622,14 @@ static int adm1266_probe(struct i2c_client *client)
 	crc8_populate_msb(pmbus_crc_table, 0x7);
 	mutex_init(&data->buf_mutex);
 
-	ret = adm1266_set_rtc(data);
-	if (ret < 0)
-		return ret;
-
 	ret = pmbus_do_probe(client, &data->info);
 	if (ret)
 		return ret;
 
+	ret = adm1266_rtc_set(client, 0);
+	if (ret < 0)
+		return ret;
+
 	ret = adm1266_config_nvmem(data);
 	if (ret < 0)
 		return ret;

-- 
2.53.0

