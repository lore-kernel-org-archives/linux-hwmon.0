Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897606;
	b=d/d3dnZqY9xRvSrBDA/RNIE4aB5fJGwVMMRpUWh2nbWQMp4VMPScdgpbaTrs2FBkE4da
	 wA0ubKWEnf2KU5og86P42Bf+KyyqCAO6hS8qZS0X+GMDOXu9pDa/LxFxek8+4RAsVWyIu
	 qmRs+zcjDzuyirgukijrWCz2CHJ/nU818omQRgHEIgM01umeWgYpvJ8r+PK4jd4sdlZt7
	 yihNjDw3GRrt40mKpOyHTIa8JrNYZI4uV9+iLXY+lzP2EZtbmhxOZYrvSRTtI7/IPexUZ
	 YYwiynoQmk7CFzm7mjzRMobPkt3UlxS127J9FrOi3TnrqyddTN1dQVI7ThU70zA+h/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=l6L4FA/RuByNvMSHE4w4JlpLOZhuu2yw7v2+IF1sZF4=;
	b=D6l2qF/+Yx7pHN9zBvAoZD34R1HxdT+KrQOII78cn++bNbDiXaICOqAyhr2cY1e282ZE
	 x/cL2+Nq1CW3CTkDnWuKtBP7x+5VIlbt9RpAykVjx3jX/pADCxBy9qiyTYzqPzQewb3y5
	 KYpPW8ZeiTu26BtJzLaxFI0sH1HIcVgK9fvt+sA2ksB2/bl6CJh9YwaIYhH23q15GQVi3
	 ngP0oypPuYlif2dE4tauM465EMa409HLFWi3dunJF+JXx/IpeLm1hC13JxHIA2JjHRec5
	 I2Fip8sqBuEYeopdVXdmwdwIttdFa8/uoltq7DUnA0nZw+DbfjNvaXWsuP4N914wHpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="W/Dw4INJ";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DA3606AA5F
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41DA3606AA5F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W/Dw4INJ
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-354ba08cfd1so3595744eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897605; x=1793502405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l6L4FA/RuByNvMSHE4w4JlpLOZhuu2yw7v2+IF1sZF4=;
        b=W/Dw4INJ4+VT90jUn9FMT03ImMknOKU8HROgJr6UZNKDQtgoH60S/uA22b3qzzbU9z
         8VERCbL1IhRUYi4dXArvcjJRTI4O7cjjHwwvjRETl0eh9usQrFMgdvnI3yNhrznwWhEt
         q1vz34L0CmBjpGCGLhMKUn49JCBbojmc6+ii3L8M5xGwU6kco5r6v9Xp0PQGELVrsetI
         mwtW7J30OfAMFQtK/TWILv7upl7C3HL5JI/xqn2fegdmce4opfMqTz15EZBV86p9jyuk
         4bfz9/UjIxsrLToCpDJW5dIQIgT3szErEk9zxPCXK/ybTCulIpAb9Hab+ocUXpRmNKlv
         F/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897605; x=1793502405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l6L4FA/RuByNvMSHE4w4JlpLOZhuu2yw7v2+IF1sZF4=;
        b=xI1Qi9BLkH+wqDaJIYZmdRWZAwwwIwmB1+Y0EIL8i3i9sro7q2f/tpJVEiWAdqWt0A
         ApW64icorF5GYcSMiaODZ6mX0DtKGkRXh/Mdi30T0siXBPGhCWyXCXsnM9ASuXbIW+2v
         ndIzHKfl487UXF8nJC/EtTDQcT4OMXXtN20z+H/G3Z9FRIRvv+bJFNOhAn7agH6fbip/
         Z/g2B6dboEjhZnj30b5ZFOh6MF0WEY7SB6jTjr8hHnY2rsf9KJdD2v/5PxytH5niYxO0
         DJ1hQ9SGL+hLD9TXZlYPE0OPJ4XWcbRTWiokI6wL7eSKhcWs06IzovnsAnITZe0Fs9PZ
         w+4g==
X-Gm-Message-State: AFq9FYKzJuWjg1Tc7WvxWRAtks3p//FCOtF3kv+Ho8/RkqPNh3rUuA9G
	zXlFUgYzQAf0QK0ScKWRCwRtgnB7wFVcqpli3p8WwmX7AHLP41V7vi+6
X-Gm-Gg: AYBFou28Wozp1DJNGFKKWTWP1vmlP3QCvc4nxB+/G+X5B0X3TqFE+h0uX3UeWix2eFU
	jMR77GILw92RHYQMM7r8Qb4FuCh+yqmdpa0g33gvt+egHApiORsbw/Ra4+8pY+bRrQpj3I0gSQ9
	4+bT0FskV0tmGV02G7gRhFEWW1LDKZMdaGRNMsV6e0ufcwCOMqdVNEaEE5z+EdeevfQbd86J/22
	bjycfz3Wtf8w1fvlPE+enV5b7zHkz4ZJ76BoM3jRtZapDQ7yvPHIjP8MwdgTVeFhsOcPnFf0V53
	Ay2pl6kTmxZFTruMLWOKQx3a/CTblIvDn99xYV7B7Dl1wRo4r/2RMJqMD/rGg2wKPfE3GEondyy
	UsTAWn68s6ReXiVyrZilQ0uPdqDBK9g2STt2eO66VVDTvYepFNu9evH4+yKVH2x0FR1yn/K5vUG
	g/vHgX0N2dOhWmg5I7l74wJSESRcUguRDI7muwYg4CgsMJuCMze5WjJW7DPs1thZVUswEmZX2Ej
	WqbUZB8zENkxNZAQ+dOsw9KmY6llpRz1X+6/lsU4mxEvJZg7tQmNyJ0KG1HZBSEsBEzrPW7IWI8
	a9HUlcCCMh8AKfh8G9ep220Wy4kIegspFlDnJO8h4+Qk6cHy6KPzAhkrxZMpjihv
X-Received: by 2002:a05:693c:6399:10b0:351:595:750b with SMTP id 5a478bee46e88-369e851ab36mr4950075eec.36.1792897604898;
        Sat, 24 Oct 2026 20:06:44 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:44 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:29 -0700
Subject: [PATCH 26/31] hwmon: (pmbus/q54sj108a2) use 4-argument
 i2c_smbus_read_block_data()
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-26-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Andy Chung <andy.chung@amd.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Robert Marko <robert.marko@sartura.hr>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Daniel Nilsson <daniel.nilsson@flex.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Pass the buffer size to i2c_smbus_read_block_data() in
q54sj108a2_debugfs_read() and q54sj108a2_probe().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/q54sj108a2.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
index ecac405d7536..8ce1824249e7 100644
--- a/drivers/hwmon/pmbus/q54sj108a2.c
+++ b/drivers/hwmon/pmbus/q54sj108a2.c
@@ -120,22 +120,26 @@ static ssize_t q54sj108a2_debugfs_read(struct file *file, char __user *buf,
 		rc = snprintf(data, 3, "%02x", rc);
 		break;
 	case Q54SJ108A2_DEBUGFS_MFR_ID:
-		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_ID, data);
+		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_ID,
+					       I2C_SMBUS_BLOCK_MAX, data);
 		if (rc < 0)
 			return rc;
 		break;
 	case Q54SJ108A2_DEBUGFS_MFR_MODEL:
-		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_MODEL, data);
+		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_MODEL,
+					       I2C_SMBUS_BLOCK_MAX, data);
 		if (rc < 0)
 			return rc;
 		break;
 	case Q54SJ108A2_DEBUGFS_MFR_REVISION:
-		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_REVISION, data);
+		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_REVISION,
+					       I2C_SMBUS_BLOCK_MAX, data);
 		if (rc < 0)
 			return rc;
 		break;
 	case Q54SJ108A2_DEBUGFS_MFR_LOCATION:
-		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_LOCATION, data);
+		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_LOCATION,
+					       I2C_SMBUS_BLOCK_MAX, data);
 		if (rc < 0)
 			return rc;
 		break;
@@ -147,7 +151,8 @@ static ssize_t q54sj108a2_debugfs_read(struct file *file, char __user *buf,
 		rc = snprintf(data, 3, "%02x", rc);
 		break;
 	case Q54SJ108A2_DEBUGFS_BLACKBOX_READ:
-		rc = i2c_smbus_read_block_data(psu->client, READ_HISTORY_EVENTS, data);
+		rc = i2c_smbus_read_block_data(psu->client, READ_HISTORY_EVENTS,
+					       I2C_SMBUS_BLOCK_MAX, data);
 		if (rc < 0)
 			return rc;
 
@@ -156,7 +161,8 @@ static ssize_t q54sj108a2_debugfs_read(struct file *file, char __user *buf,
 		out = data_char;
 		break;
 	case Q54SJ108A2_DEBUGFS_FLASH_KEY:
-		rc = i2c_smbus_read_block_data(psu->client, PMBUS_FLASH_KEY_WRITE, data);
+		rc = i2c_smbus_read_block_data(psu->client, PMBUS_FLASH_KEY_WRITE,
+					       I2C_SMBUS_BLOCK_MAX, data);
 		if (rc < 0)
 			return rc;
 
@@ -297,7 +303,8 @@ static int q54sj108a2_probe(struct i2c_client *client)
 
 	chip_id = (enum chips)(uintptr_t)i2c_get_match_data(client);
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
 		return ret;
@@ -311,7 +318,8 @@ static int q54sj108a2_probe(struct i2c_client *client)
 	/*
 	 * The chips support reading PMBUS_MFR_MODEL.
 	 */
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(dev, "Failed to read Manufacturer Model\n");
 		return ret;
@@ -326,7 +334,8 @@ static int q54sj108a2_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_REVISION, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_REVISION,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(dev, "Failed to read Manufacturer Revision\n");
 		return ret;

-- 
2.56.0.257.gf7497c7d27-goog

