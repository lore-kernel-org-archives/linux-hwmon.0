Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897571;
	b=SAkgtVMLb3GcR3LYwmv41iawILAuXhgh6XAGpWqBvUqlW6ExSfs+IdAcG72AzauVLcUS
	 3chKV0tltUAwg4wZtKWOsLAoK8pqIHEDZPBOWJTASYXiOvR117WSbE/0QPIm48SIZSzU9
	 1/32Vt+FBzgXNh0YtIBolIyuIywmlRPsrX6SioV8nfXO8++Sdrxy+US3dT/f6HXes/ETe
	 KYB3DlrJHVJZRpGWiy0CXYvpc6gY4j0tTemwko7B8fVzRk9GJCMAY5GTZWeqYmWwqTg/w
	 ghbDguZyWurDCTwf+Sh8w0p5BZKMWX/Zgma+OJx69ok6F3RiMKi/G+3Vm0LWZNP5bIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=9rXit/G1B2KFGFxKlHMehzgVQ+QaItPOeQnpyECDLVw=;
	b=nmgdFhGzOhoOHC1c12VO913NH9k5FjJ8o/Gmj7/oTYXvWFNR6UyZ/n54EBONdHEptZoV
	 2RvlChDztKMdqic/M+Xg/ux5qn98vpLhwRUgIR4jwqlNEO5RWIgUYXxl3XqsSKC89tz4z
	 Y4C8aqoiB3UN84ich+/E30V11JOC3L03LZ6ii2IEFJnltj1gkvaLpHPzMdVQzKeDeQYVk
	 GCYYrKSQMA7UO0CJHCC7AilxonBOp6skyfa2Mqiv7IbHSfv5oXgKx3CSpDSOhmJmOR+JE
	 P/TLucN8Y9iFiL44zpm2eQYKJ851XEcyNdKyUttm7D+d39wseky6rOwkKT0X8L0g+9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jh5Mi3y2;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C8D606A323
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03C8D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jh5Mi3y2
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35943f55c06so2684032eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897570; x=1793502370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9rXit/G1B2KFGFxKlHMehzgVQ+QaItPOeQnpyECDLVw=;
        b=Jh5Mi3y25k+JdGKtxRjGi5IoEDsQkk8xyOn8VJeHO10iULHzWLpuv+WHQO0y46alIw
         hGG8GbRht+xXRgEC5OBARu9iWg0RNnY1SAaGyhnHBUKMo3FW8uEO1QjJn/8RxHGNnt7E
         ri51o1LxSztP70rsOFWP26ZiqmEU/d+WcoTNSQtG5uX1w1bLEgOqGz/HJS//0TX+drkR
         dJca+HYhMbNI5uArxUZuhvwAxBB8v7sJIyWGydg+GHs3FYwp3xPf7ToRxyIDiKBGT4gB
         D5h6XbZ379hc1BizGlhi5cVBl+BPkZ4Jm5NoNPCJyu78OT3EYSKXk1htLVG+nXLaBFnX
         4eMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897570; x=1793502370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9rXit/G1B2KFGFxKlHMehzgVQ+QaItPOeQnpyECDLVw=;
        b=n72N5kprQLhDRq2VjTLlJbijMFFes+WLwrfmm9qeo7z9KTxtGuZ3IOTuuxCo7yf3Kn
         6Qi13BojX3FnRZL605yt8unlPhwcVG5SwTQWGnPzvXKlxtuImJjYLXuecd9FG9UooUD1
         iU2sZxebKosfMLcY4khoCI0XZC+tIgOwAiYv8sDy4a3Zp82ES6QSw2EVqFw6K0Cyt3NL
         nLwZEAWya8F3E/qNThT6EFKJTJD+5uatZ6S1lKIKXgbcIYesFmRZYaPld+r+wACd6SBK
         MSEVzAwHbmZl/SiIlY+BETV+cU/OpJNRDy9bRi8RKDyE/3eEqdz+ksn+jwcpfKItwhc5
         rdZw==
X-Gm-Message-State: AFq9FYL/Ppkahp7UbQf5KlNdP+q7IPU/PS2SMgToOsQYc8V1ERx/lzor
	LdWEFE7PZoyXfDZQkM87pTWt/O51okGvGyHjCa9Ub+34/okKDmmOBmhA
X-Gm-Gg: AYBFou12ejeHyI6dqectFL8D+KNHfbZuSRJ2B4ibdPLXPk3TTiTgtfYDwQIJNe2GmA1
	c2H8jq+zVFmRh8H2IqHyNQVyeaMzuHCTnQAZHvEFQx0hENDQP6CEDa6EhCrmr6PbjuxQf3DPtfs
	+HfK1Yzk0WH5+FyD/pKhFhdT8jrnyRyOSCmN2OJBOcQp9rb5XpQNgiLGrwp8qIKFt3uM8cCVUuJ
	HaM37rFKdFe7uv1JUAs94ayrqMEK4Kg70OfyCt/pnSf2+G0Qb0RBEgJn5GqXwumyS6gDoFR92nO
	j2jK9GgToNERAgq7Ji/r5t7pYFlTOUZIedxkKnw9T/hnuLS76CBGxlInGPUkS2SJjpf7E6vTllH
	8UBMy1DSK11dF6P8tsgtwwoj/AsTH6d1m9quGIuYmcl4mX8O3YO0pehuQUwgoQmSvkOeD700eRk
	zhG2wzanbdcv3XkXDJo9T2qYciHvyeqEds2XPCH1P8//FOvNV/5NqHZOC1susjidS0v2E+isX6V
	a7c6FgEHFIG3lYJpFpLv0/KIA/AkF0ktdx1G1CePgAV9KFPgqt5OAc8AWMAa9eVF2UwB4PqDCm2
	UzVooBL3QzGmkjYbQmL536+xv+R5r5mVPnjTCUhNEX57ju2FaLM549AgVu9pTqn9
X-Received: by 2002:a05:693c:810b:b0:35a:3b98:b428 with SMTP id 5a478bee46e88-369e87cb951mr4033713eec.12.1792897570056;
        Sat, 24 Oct 2026 20:06:10 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:09 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:04 -0700
Subject: [PATCH 01/31] hwmon: (lineage-pem) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-1-e81941ad0cd3@gmail.com>
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

Pass the expected data length and destination buffer directly to
i2c_smbus_read_block_data() instead of copying through an intermediate
buffer.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/lineage-pem.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/lineage-pem.c b/drivers/hwmon/lineage-pem.c
index 2553e49f8401..75a44b0639dc 100644
--- a/drivers/hwmon/lineage-pem.c
+++ b/drivers/hwmon/lineage-pem.c
@@ -130,20 +130,15 @@ struct pem_data {
 static int pem_read_block(struct i2c_client *client, u8 command, u8 *data,
 			  int data_len)
 {
-	u8 block_buffer[I2C_SMBUS_BLOCK_MAX];
 	int result;
 
-	result = i2c_smbus_read_block_data(client, command, block_buffer);
+	result = i2c_smbus_read_block_data(client, command, data_len, data);
 	if (unlikely(result < 0))
-		goto abort;
-	if (unlikely(result == 0xff || result != data_len)) {
-		result = -EIO;
-		goto abort;
-	}
-	memcpy(data, block_buffer, data_len);
-	result = 0;
-abort:
-	return result;
+		return result;
+	if (unlikely(result == 0xff || result != data_len))
+		return -EIO;
+
+	return 0;
 }
 
 static struct pem_data *pem_update_device(struct device *dev)

-- 
2.56.0.257.gf7497c7d27-goog

