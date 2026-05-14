Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890882F25F5;
	Thu, 14 May 2026 01:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778721248; cv=none; b=a6YXejD/RBOxCtjdxP6lJFpV1ZFcfsZbnWlvjszr/G9EW/Lws1DoHm8FZlw6nzDcfE9qaqOSQ16SobgDAZuO+uBOwytJsPp4QgstlycMqUgD6BR+vBZrnt65vejd1rcIRsrHuc07lfu10dmncCvdeWltShqpwOQZPGJ2emCHwFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778721248; c=relaxed/simple;
	bh=cxkxUPrSJ2IeZnHBjVvjS3/dazhBnmCEAiSpsqJniQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T6O3Mztn2d+cUMRjahi6QCVDFYDfU3IHJeLN3QmvbBPEgyWLYja7CdDSMrxPZgMkie7B+3p31+HkkgmiHCcZp8E8j1jauB+FL7DC8Du7K7GBozYV28og6SrbtCHsebiBAKj5zBTmjLYXD+e8ItTx0RXTt4MhV/d1Md5+JgzhkXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Lvu6R2tn; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Lvu6R2tn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=oi
	W6fdFwZ2NFuNvVtpEYyeDMUl1I4VJ6D0S5xvaXkcQ=; b=Lvu6R2tn2AGTFpb9Bv
	6Q+XRGKz5LrnR/0+JeBxbnzQUuZswGUlIkDf+9j6w06ooO9fgMJyWvlt7RHxX+9z
	ykwmgTIsS0oXKxUWohLl9y0RAX+3F33zqBb43btoPMFTbKilTj15x3nA5ouUJpYY
	hDmD1Bp1/O0CUFzEF4U4zhpTM=
Received: from debian.lenovo.com (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3Hy+1IQVqnFYFBQ--.27803S3;
	Thu, 14 May 2026 09:13:36 +0800 (CST)
From: Kean <rh_king@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kean <rh_king@163.com>
Subject: [PATCH 1/3] hwmon: lenovo-ec-sensors: Fix EC signature check logic in probe
Date: Thu, 14 May 2026 09:14:09 +0800
Message-ID: <20260514011411.4167069-2-rh_king@163.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514011411.4167069-1-rh_king@163.com>
References: <20260514011411.4167069-1-rh_king@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3Hy+1IQVqnFYFBQ--.27803S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ary8WryUJryDAF4rCr13CFg_yoW8WFWDpr
	4UJFWrCrZYgr9rWa47Aa409ayYqasYyrW0gFy5WanxuFnrGas2g34rCFnIga4DXF1rta4I
	vryFqrWa9F1DAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zND7awUUUUU=
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC3wBUA2oFIcD3CQAA34

The probe function reads a 4-byte signature ("MCHP") from the EC to
verify it is a Microchip EC before binding the driver. The condition
uses && (AND) to check if each byte differs from the expected value:

  if ((byte0 != 'M') && (byte1 != 'C') && (byte2 != 'H') && (byte3 != 'P'))

This rejects the device only if ALL four bytes are wrong simultaneously.
A partially matching signature (e.g. "MXXX") would pass the check and
cause the driver to bind to a non-Microchip EC, as long as at least one
byte matches the expected value.

Change && to || so the driver is rejected when ANY byte does not match
the expected "MCHP" signature.

Signed-off-by: Kean <rh_king@163.com>

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/hwmon/lenovo-ec-sensors.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lenovo-ec-sensors.c b/drivers/hwmon/lenovo-ec-sensors.c
index 8681bbf6665b..a32b1f2c6a3a 100644
--- a/drivers/hwmon/lenovo-ec-sensors.c
+++ b/drivers/hwmon/lenovo-ec-sensors.c
@@ -537,9 +537,9 @@ static int lenovo_ec_probe(struct platform_device *pdev)
 	outw_p(MCHP_SING_IDX, MCHP_EMI0_EC_ADDRESS);
 	mutex_unlock(&ec_data->mec_mutex);
 
-	if ((inb_p(MCHP_EMI0_EC_DATA_BYTE0) != 'M') &&
-	    (inb_p(MCHP_EMI0_EC_DATA_BYTE1) != 'C') &&
-	    (inb_p(MCHP_EMI0_EC_DATA_BYTE2) != 'H') &&
+	if ((inb_p(MCHP_EMI0_EC_DATA_BYTE0) != 'M') || 
+	    (inb_p(MCHP_EMI0_EC_DATA_BYTE1) != 'C') || 
+	    (inb_p(MCHP_EMI0_EC_DATA_BYTE2) != 'H') ||
 	    (inb_p(MCHP_EMI0_EC_DATA_BYTE3) != 'P')) {
 		release_region(IO_REGION_START, IO_REGION_LENGTH);
 		return -ENODEV;
-- 
2.47.3

