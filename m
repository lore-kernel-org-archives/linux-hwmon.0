Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E1636309F
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 23:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668473; cv=none; b=Y8HDisfsyb9QwVd+d4D7y+KfuDEydcQKO/gFlCwHopu/SbamHW0l012iX5rnmRML4vnxUo7qKpqDc1WoLrgVcGwcl4tTpN4/6RWHXgh3YEwbJ70pPjkLTTb30FPoACJKfs94TwDorP6uiwVgAiOrcAt2Zqgj6UJY/DIoaZkgwT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668473; c=relaxed/simple;
	bh=1ryANju3Ar4X9WTQ8vLKNNPSH0DRzpHGinxvGeEFaac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VkIxspCYPXqBfy/Q8u9uryp6G71u9FupXu6IhDaeRXRkMOQmus/oLPPSmolmPrim9QTo0ywbzE/sDMSY0dX9daFWCiZ+V4ELyWsZ98cNT7tMep/JH41dKe9zDrSROV18cnQHIVbchjuMwHlf4uzqHQGtsp2YYIMlH2AjZLkza2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0z/7OPT; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0z/7OPT"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2be27fa54feso3181546eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 15:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772668471; x=1773273271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpK5v0erAcEOSlwebTzYjsOHzTGHJQo4jlwH6VYDLJw=;
        b=k0z/7OPTF3OE9a5QviAT3O0lttW8MP+NJaHCt7uI0F84qPuw660VdkJKSaRcTjurJy
         6mOVMLwRcD6we6InSsCwJ2g7ZLuGI/oZ+1YxLVLQygfyEwmGBw4hG1rOwwM0agg8UE+v
         kWklKrz0JfiM8fzgG7o+humkdU+KcKbygfEowmtTN8bBKJ7/jtqooJt086CdYqRbsoYC
         x1uqb0oN33eyoVz/ZoeUbMN1YvjYWz2N3SKuszpYJYI3wR7kGzeqoPbAFPehvUqo2RA2
         nuMmufjFgXM6WtK5my9/5Q0xUtz8z9pGGdQHRRH/JSHJsAZyKQyO2IPizNiwAY8WnFDg
         L8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668471; x=1773273271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WpK5v0erAcEOSlwebTzYjsOHzTGHJQo4jlwH6VYDLJw=;
        b=p20/gbojmAExmkJ036/F0goajvPVd3uTOsmMoJGqj9RN7YKc1JWQrPsBP/InHD4EIt
         Tu6YV96ZUfsmsV2OYmcJZfWo0XehDmV57VfKsqOximXCr8Q3UsAyVB8QMoJvihJk+LVI
         E3ihC350IiSCIwX2n/zR5RrskthW30l9XpsLocU/lf6SiCFmVItP57W99iByXGCNtiJ3
         /1wuvc28aMlwFvUn9pqAPSeGgD/dmCAmuY5J0eIJQzhU7WqkHZlWuxD2vWqxDpsqmdUv
         WscCvBXYqlwNHB7kKvjabNz3PrqI6tr1MFX4yND7OzoFkHQ0Q64INJR1ok4qGUGKXTBr
         pJEw==
X-Forwarded-Encrypted: i=1; AJvYcCXt9oLHKqwdX8V4+3Ppa1Dx/L2eYj1f6+nAgLvokUgoENGRWeSWycBElPKkASSHE/MVqD8BcsHNQ7oJYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/9K9MJn8CEPcCVBtInyzbufqjqD/joYO6st0cuWJhnPMnlq/B
	hCLDx8ipcDbNCYUo9X5axOaSBvuH7qyct/3TehL3RszgocCFJp+nav3/
X-Gm-Gg: ATEYQzyxbeMj1Hq0E6gacZC9vXfeIgnwtjjppfctzwhywvrgAyT3wPKRKdw6FoFSsJs
	dXewgQ56aXyLfxqnWS7wLDR4H/ETUpNpLuROIU9XI6Vcl5H4p9Ac/od02ViJQ6cySQJo7Y5Eo66
	aExNGTw3ivvUrM5wmqZQyUP1exfPNuMMh7QmT2+3sMuFgdAzyrSzyRQGA1kohbGoYv8Ym/AWZLa
	xKyT3AfRyqj24+BGsXWfvpNRi3qhHtkuv5zSQcz0chh4UDHRCdZLKKR5xLqYzmoDd25at1WxaPB
	fiUZi+wbjAFhGvToc01CMy6sH/1h6Lm1f/FWUSIM1mtm0BzBOj5Dt27JbfmfwcdR62OSeT9I+Sk
	42rziJzNjDhzCLRubA43cru3Caxqa16igfhyY0Tq+A2VZ+LCVS9o/Z12qvGWhI/MLyPBr1jDN9i
	zuGx3VSbt1qWAwjqRSM8M+5PFRF4EEwguvPIDmEmD1AQ/Q+KIQJ8BNd39+1/iJ9DObTY5gJgLDI
	HPvUMw=
X-Received: by 2002:a05:7300:6423:b0:2be:1f56:ecf6 with SMTP id 5a478bee46e88-2be30fcff4bmr1485430eec.6.1772668471087;
        Wed, 04 Mar 2026 15:54:31 -0800 (PST)
Received: from localhost.localdomain (c-67-164-93-214.hsd1.ca.comcast.net. [67.164.93.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be12805b93sm9269888eec.15.2026.03.04.15.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:54:30 -0800 (PST)
From: Sanman Pradhan <sanman.p211993@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: psanman@juniper.net,
	andriy.shevchenko@intel.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] hwmon: (pmbus/q54sj108a2) fix stack overflow in debugfs read
Date: Wed,  4 Mar 2026 15:51:17 -0800
Message-Id: <20260304235116.1045-1-sanman.p211993@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <e7191c1c-ecd4-40f8-9e47-9357bd82984f@roeck-us.net>
References: <e7191c1c-ecd4-40f8-9e47-9357bd82984f@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanman Pradhan <psanman@juniper.net>

The q54sj108a2_debugfs_read function suffers from a stack buffer overflow
due to incorrect arguments passed to bin2hex(). The function currently
passes 'data' as the destination and 'data_char' as the source.

Because bin2hex() converts each input byte into two hex characters, a
32-byte block read results in 64 bytes of output. Since 'data' is only
34 bytes (I2C_SMBUS_BLOCK_MAX + 2), this writes 30 bytes past the end
of the buffer onto the stack.

Additionally, the arguments were swapped: it was reading from the
zero-initialized 'data_char' and writing to 'data', resulting in
all-zero output regardless of the actual I2C read.

Fix this by:
1. Expanding 'data_char' to 66 bytes to safely hold the hex output.
2. Correcting the bin2hex() argument order and using the actual read count.
3. Using a pointer to select the correct output buffer for the final
   simple_read_from_buffer call.

Fixes: d014538aa385 ("hwmon: (pmbus) Driver for Delta power supplies Q54SJ108A2")
Cc: stable@vger.kernel.org
Signed-off-by: Sanman Pradhan <psanman@juniper.net>
---

v3:
- Added in-body From: header to fix author/sender mismatch.
v2:
- Fixed email formatting/line-wrapping issues.

---
 drivers/hwmon/pmbus/q54sj108a2.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
index fc030ca34480..d5d60a9af8c5 100644
--- a/drivers/hwmon/pmbus/q54sj108a2.c
+++ b/drivers/hwmon/pmbus/q54sj108a2.c
@@ -79,7 +79,8 @@ static ssize_t q54sj108a2_debugfs_read(struct file *file, char __user *buf,
 	int idx = *idxp;
 	struct q54sj108a2_data *psu = to_psu(idxp, idx);
 	char data[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
-	char data_char[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
+	char data_char[I2C_SMBUS_BLOCK_MAX * 2 + 2] = { 0 };
+	char *out = data;
 	char *res;
 
 	switch (idx) {
@@ -150,27 +151,27 @@ static ssize_t q54sj108a2_debugfs_read(struct file *file, char __user *buf,
 		if (rc < 0)
 			return rc;
 
-		res = bin2hex(data, data_char, 32);
-		rc = res - data;
-
+		res = bin2hex(data_char, data, rc);
+		rc = res - data_char;
+		out = data_char;
 		break;
 	case Q54SJ108A2_DEBUGFS_FLASH_KEY:
 		rc = i2c_smbus_read_block_data(psu->client, PMBUS_FLASH_KEY_WRITE, data);
 		if (rc < 0)
 			return rc;
 
-		res = bin2hex(data, data_char, 4);
-		rc = res - data;
-
+		res = bin2hex(data_char, data, rc);
+		rc = res - data_char;
+		out = data_char;
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	data[rc] = '\n';
+	out[rc] = '\n';
 	rc += 2;
 
-	return simple_read_from_buffer(buf, count, ppos, data, rc);
+	return simple_read_from_buffer(buf, count, ppos, out, rc);
 }
 
 static ssize_t q54sj108a2_debugfs_write(struct file *file, const char __user *buf,
-- 
2.34.1

