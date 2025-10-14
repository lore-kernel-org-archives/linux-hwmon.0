Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EE22FFFAD
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455545; cv=none; b=O0D/jA+r2FgCimj6B+ZDjle1huTIjf9l9L7Z0AsfF/v3B6ih01H5nVvRs/zYpFZqkf0xJlBZ4P+l9Mt9IBiZfi+oLuz50QbCvrDSOOCKIO8fxlHQ62u4oQbJZ34pEKX7W7vu92yjoegde3TsaZrBTrB2reH+UgmKEaqtO6gzxLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455545; c=relaxed/simple;
	bh=oBe8g9Pcl2LqrFimyiy51HO2Ri9V8QTzCmhxG8qZnpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N22jHljfo0J3LIUT/Txe2VX+SWKIYp3b9qsU8u/CKJzCB4P9VfonSWwt/sHWdIaKZ7temuF0Dox4Ho+KoDEiZw5zO54L3UC5KcQgnL1aedl1SgFeoEJwVhMsHnasBzJW4KC6DBP6yg0Mnk2Fp0YWClgAxJp4nrAu/a2txrzhZfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlrhqXBt; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlrhqXBt"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b62ed9c3e79so3491831a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455542; x=1761060342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRexuMiLV0xitvkMLWzKwhYHSGoYUc2I5H3zoI8fI7o=;
        b=RlrhqXBt9izsIt2RRIw9zbediFhNDhFUtrIMKSsvmwbcOeMj6Pkp2Q5Fgw426Died8
         9DoWbU3B9vsKM1b+TIG2/qgN6rqtqQMAM4moKKLSRuUcbV9xQPJaAI9zdBhdHbMS8zdj
         ex7WboDcHnSvnNSQB+GKjw8QkUV2QvsNUyw/cqB3Dj6fXH/oVQzzTIXu/m6Usdq2Qoty
         iN8M3NY6lTKy8iwBLrsInwQ4mv8B7G6xOusiEMy5lMhoeeW1CyOaHetfCUL/nl8mFvcz
         ZjZdAL+jm55r4UbhyMSKxRE/o9vsm0w7ED73eOJDW3RexngchOqUNyh+k283j8A7+xUv
         T95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455542; x=1761060342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WRexuMiLV0xitvkMLWzKwhYHSGoYUc2I5H3zoI8fI7o=;
        b=qk+a0u436XDJAUA3wfzrcZ70V7TttnLV/Wzcf2OG/HnAMNdNS2487OkGyOl2ZS7Dlt
         HaZE0xfsVQhq9q63pW9Yj+1pRKYGR+dABrjelm1qY3umnWGOabRc2OHkk+HR0WvWx+kT
         Goz1VfSSHYmMTa9LbmiJoanBXAbDC3ZrCkyrhPd8o2GjiWx7mXid/4d4YppAbGoPdNNP
         L9R9IBe+F3/T/By+RXDcXtjEtvac0h5mL0rkqplpv8e7rD6z09rkhaHgrkhfw2HkEOZT
         q9i6VYVir6I6U2GnZ6kC+JZXsC4NtBVIGqc7Rtt/dzuSfu/rz0AnguKdLCFe7yHxO5FV
         9Z7g==
X-Gm-Message-State: AOJu0Yz7ErYHDeUrtFCIcNofINskllDzLU+q8FQEKe3brA3+lCrkeisx
	/Haf1DL8WUpde8gMy2k3Sma2FaWgxbsZgpL5DIHchjlI7FfpAAq0uYN4SdTDXA==
X-Gm-Gg: ASbGncvbCx4B6FuiXXz0AsTVajL8RR6g06lo+1buHlGIH+0Z3dlb21fI1Z906wNGAFU
	q/EjBO7Z7p4HhjROb0FyTWgAZLlp3My9/bogtya8LvuxyO10izQOVf3dNV/jcbEbg6gc+l/lSXF
	l1/P0D8kFnJzbGwsopqOjmvQJI9Tig6+Ijgg7oC6+cniTClDyS5TkblMxjlqv3MyxBfvXFMqBUc
	TYO527ppZtobp7bBdnyNp3m5McQ21kNMsMd1TTTYS8LNAVR89bL0CcgeVmNrduz712vOCuz9UEr
	QsPXFMeUvEjOzmKC1m4rRYfSH3xHSVUOQYl91cY/aCXU8AeYNVkAY++cVrBlLK6IpUAW8URCEeF
	eEL465k9/i6Iix9dJ9PSjHdRmGxCZWRKOH8PGZPKiahSAnwW8eTbaRg==
X-Google-Smtp-Source: AGHT+IGbEGnbztUBV8zLaqDlC2eCHknrMAzzLjLRKwYtJo2Rb50QH6HyB6XD8Omo76YgEchF0jfAMA==
X-Received: by 2002:a17:903:9cb:b0:266:702a:616b with SMTP id d9443c01a7336-290273799bdmr305806235ad.18.1760455542291;
        Tue, 14 Oct 2025 08:25:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034deab27sm168883065ad.9.2025.10.14.08.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:25:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 17/20] hwmon: (nct7904) Rely on subsystem locking
Date: Tue, 14 Oct 2025 08:25:12 -0700
Message-ID: <20251014152515.785203-18-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251014152515.785203-1-linux@roeck-us.net>
References: <20251014152515.785203-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking in the driver code is no longer necessary. Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct7904.c | 63 ++++++++++++++++-------------------------
 1 file changed, 24 insertions(+), 39 deletions(-)

diff --git a/drivers/hwmon/nct7904.c b/drivers/hwmon/nct7904.c
index f1e6eda949ba..2fa091720c79 100644
--- a/drivers/hwmon/nct7904.c
+++ b/drivers/hwmon/nct7904.c
@@ -21,7 +21,6 @@
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/i2c.h>
-#include <linux/mutex.h>
 #include <linux/hwmon.h>
 #include <linux/watchdog.h>
 
@@ -128,7 +127,6 @@ static const unsigned short normal_i2c[] = {
 struct nct7904_data {
 	struct i2c_client *client;
 	struct watchdog_device wdt;
-	struct mutex bank_lock;
 	int bank_sel;
 	u32 fanin_mask;
 	u32 vsen_mask;
@@ -142,24 +140,19 @@ struct nct7904_data {
 };
 
 /* Access functions */
-static int nct7904_bank_lock(struct nct7904_data *data, unsigned int bank)
+static int nct7904_bank_select(struct nct7904_data *data, unsigned int bank)
 {
 	int ret;
 
-	mutex_lock(&data->bank_lock);
 	if (data->bank_sel == bank)
 		return 0;
 	ret = i2c_smbus_write_byte_data(data->client, BANK_SEL_REG, bank);
-	if (ret == 0)
-		data->bank_sel = bank;
-	else
+	if (ret < 0) {
 		data->bank_sel = -1;
-	return ret;
-}
-
-static inline void nct7904_bank_release(struct nct7904_data *data)
-{
-	mutex_unlock(&data->bank_lock);
+		return ret;
+	}
+	data->bank_sel = bank;
+	return 0;
 }
 
 /* Read 1-byte register. Returns unsigned reg or -ERRNO on error. */
@@ -169,12 +162,10 @@ static int nct7904_read_reg(struct nct7904_data *data,
 	struct i2c_client *client = data->client;
 	int ret;
 
-	ret = nct7904_bank_lock(data, bank);
-	if (ret == 0)
-		ret = i2c_smbus_read_byte_data(client, reg);
-
-	nct7904_bank_release(data);
-	return ret;
+	ret = nct7904_bank_select(data, bank);
+	if (ret < 0)
+		return ret;
+	return i2c_smbus_read_byte_data(client, reg);
 }
 
 /*
@@ -187,19 +178,16 @@ static int nct7904_read_reg16(struct nct7904_data *data,
 	struct i2c_client *client = data->client;
 	int ret, hi;
 
-	ret = nct7904_bank_lock(data, bank);
-	if (ret == 0) {
-		ret = i2c_smbus_read_byte_data(client, reg);
-		if (ret >= 0) {
-			hi = ret;
-			ret = i2c_smbus_read_byte_data(client, reg + 1);
-			if (ret >= 0)
-				ret |= hi << 8;
-		}
-	}
-
-	nct7904_bank_release(data);
-	return ret;
+	ret = nct7904_bank_select(data, bank);
+	if (ret < 0)
+		return ret;
+	hi = i2c_smbus_read_byte_data(client, reg);
+	if (hi < 0)
+		return hi;
+	ret = i2c_smbus_read_byte_data(client, reg + 1);
+	if (ret < 0)
+		return ret;
+	return ret | (hi << 8);
 }
 
 /* Write 1-byte register. Returns 0 or -ERRNO on error. */
@@ -209,12 +197,10 @@ static int nct7904_write_reg(struct nct7904_data *data,
 	struct i2c_client *client = data->client;
 	int ret;
 
-	ret = nct7904_bank_lock(data, bank);
-	if (ret == 0)
-		ret = i2c_smbus_write_byte_data(client, reg, val);
-
-	nct7904_bank_release(data);
-	return ret;
+	ret = nct7904_bank_select(data, bank);
+	if (ret < 0)
+		return ret;
+	return i2c_smbus_write_byte_data(client, reg, val);
 }
 
 static int nct7904_read_fan(struct device *dev, u32 attr, int channel,
@@ -1023,7 +1009,6 @@ static int nct7904_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	data->client = client;
-	mutex_init(&data->bank_lock);
 	data->bank_sel = -1;
 
 	/* Setup sensor groups. */
-- 
2.45.2

