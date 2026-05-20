Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA153C0606
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 22:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779316970; cv=none; b=i2pHbTh0ElKYj2vs61ZlCNVXltavF37KL+f9Ru0uLJwdIp7aTomhiFc6IyzRCOhDEimRjHXQwggtFhbBBcKl7e7hL9liVzOm7vrl+RNwTkn0x1Ye6CWtroDGq++eOjaY9scO7MfY63e3Jp26C/qct98xr/h0IujlWeaP5xn4lj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779316970; c=relaxed/simple;
	bh=xg2ajx8NOtci7WUfRgy6qk4gKyeLg00eUNa5NfBq5fI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K9GPnVQ0AJZRr+447FyWxpzwMV9iyj1DM4tB4Nc9Ft55uY7eeMwDKoqpOUiQz0UWErxIV4aqqoM4EzWjx/STBgxtOaTIhQeacfcqJPvxxcuv9kxK+vrFEUnZhLJvxhb/r6NMIj/hjtLyyC3XJcwHMjdMtTulZXeLumoZaRxxt5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=BScPc5pr; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="BScPc5pr"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2f7020a928eso7867199eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 15:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779316967; x=1779921767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1ZyPt3QPoTJXeeOiq1m7CepxDNls2APDNcrwHqN3BY=;
        b=BScPc5prJ8U4vbczdrPe+/RNIaNcjsflQ9dDLjx/FnRo9ln4C/0ptPPoV9F3p0Oyel
         AsyTOjwTU/cruv4zsxARmCCmodOqTQwB9tKCQUDbGqtoIw10N+5VQDnd52I6D87bKw2+
         prLlD6+m++zNOigkaUXBhyXGMHCviFal/TfsE7iNmTB2apjhPCR1SVmqa90gYAqeXfu1
         OlIgHtCy1pJuPfCOlV3IQMJh1Ff/OnA8GuesQI5G7bC9ErVGai1725yyXCAxuDmTGBn/
         PGQqadKGSW25EXVEhmINPLQsjXxDvM1arMD431QaUT8PnxKH0vs2lEw4lUO47rhUi+t7
         GAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779316967; x=1779921767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s1ZyPt3QPoTJXeeOiq1m7CepxDNls2APDNcrwHqN3BY=;
        b=mCJdoVUFxLzNS71hOmVZ5b7jYXGK1/J9b6pgd6fNglhPV9eyia4sgL1TYc/lfPmHX0
         MvCbyiaIAGd/devhPHmfpdgZL0HxggTW6dEmERJDtUEc5L/ZI7eYDRjGdbGcTdpv3BZn
         pfJky5pAfEIyv/nQlrKhl7zSLke58vN4o6LYiYDKBOIgWmepgXbSxZXbxYJvueXzHtfw
         WX+PTde1qECGZDCUqC0Ktvwp5fj7A0eqDquy28OM0BI3iZlC1ghVFU0t3LYrkrqyy+Bi
         zaXM0YZ5s8dRprzPPrqznDbo2YPf/hX8BaV4CrL7BqONYVSTbXkPt2aCmiH7S9X96zWU
         aUug==
X-Gm-Message-State: AOJu0Yw83cWyN08qDnEd6V55eKPHjEHocwpJXW67ES2xvsYQV2t/XFCd
	I9gy37ojxmeqWhR4hYifcIrSSILVmOD79B+GlJptcbLKd65KB3Eih9azF/CleMgMyRc=
X-Gm-Gg: Acq92OH9/FoepdNHnnZEj1kWpUQkw34EDA3byxwLayr6VojyULOeb3rLldOyoB1r8QN
	sa54XJSvDgmFA2CaUy94pXHCTJIEyJ+hzAReM2f0vgLiqka1P16KB49tCezmBafU7EMAe4UHY9R
	Vw5g/g9zJ7AUKyHMFM8qBkMykvaCeCRLM+4uEK4mohNQxy/2EVobLRtJ4LmFaYSjkUlKM9cGwOs
	CsbvvqwG2ep0s1CEiN9Hz5M3VxURK9HZ80RnKUQB8cQgHmmZ1WXLBkFHb9yC8yA8+/GsPDpOjBQ
	lin17hwLVCgNN9AQyYzjl29kvE2lwRoVijnv7X41mBrjhkI+EhrCO+0AELctap4SiD71yekfoRa
	RnyFJaUk4JMrkFVa4Z94ggvwuNkrKgq5d8eFhGaM5hyM06LKvZ9WNGeZSkSxEovqr+EaAbanidK
	g5nSWUX9IhH2q+mnQgoR2Ypd2FwQ==
X-Received: by 2002:a05:7300:bc03:b0:2da:1a81:588 with SMTP id 5a478bee46e88-3042f5a49edmr320107eec.14.1779316966704;
        Wed, 20 May 2026 15:42:46 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e3c0sm25575614eec.3.2026.05.20.15.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 15:42:46 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 20 May 2026 15:42:41 -0700
Subject: [PATCH v5 2/3] hwmon: (pmbus/adm1266) add powerup_counter debugfs
 entry
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-adm1266-v5-2-c72ef1fac1ea@nexthop.ai>
References: <20260520-adm1266-v5-0-c72ef1fac1ea@nexthop.ai>
In-Reply-To: <20260520-adm1266-v5-0-c72ef1fac1ea@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779316964; l=3153;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=xg2ajx8NOtci7WUfRgy6qk4gKyeLg00eUNa5NfBq5fI=;
 b=7zkYU5FMlsDaEk/xelNosT8Vq1edXxOc4/qoOxMsk0ajogDvHpzbFHcaWKbC7vsTB1OqhEAeP
 ap3BJT/tinqAJC1SNRrD2u1JHJyKdKqX3O+KgQp0iA9d9h3cBcDGzsZ
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
Assisted-by: Claude-Code:claude-opus-4-7
Assisted-by: sashiko:gemini-3.1-pro-preview
---
 drivers/hwmon/pmbus/adm1266.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index e9d9cdb11e67..b6820415d99e 100644
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
@@ -370,6 +371,32 @@ static int adm1266_firmware_revision_read(struct seq_file *s, void *pdata)
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
@@ -418,6 +445,8 @@ static void adm1266_init_debugfs(struct adm1266_data *data)
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

