Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897576;
	b=BQfbnbp9iAsakKz32zLF7Kt8eXQF/0xksC8DGc3uXTFB7fXOE7KZy6z4P6QOMGUtiJnF
	 2dHc5VSsEqpKmRUOzxvhze3fJ2VO6qrZJwY0+XWVOhNdkzTMLm+/9bH1Rj21iyf6QiNuZ
	 Wu+OhH3KRJptjG5jJfOTXlYowq2VnQeKIoDuVA9FtgjgzClosqbXIwoEGNtIr5vpBLLUt
	 /GmAzFdC0HPbSURGxCRP3a3IhaY4t1v6NUlazTUwY0iwVm7KnAjukzjwHRQSjTWOgzAJo
	 VyJoHu7Dy4LzTFAIE2tMvn9Y2vaTojIB0LyAq3BFRO4XQv9ogTge1nF907XnYDbqS9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=QXJ1lAA5CJL+VwXuJtf9fzAkgG9SQEGMbPU6n42N680=;
	b=z2FWiJBsG1DqkGOPjb4fPokBWynF76UxcJW6SeZtF6NdH5zV9r7knsqYsKiz1l988cub
	 4T/ZORQZF2AZWgxlhOV9VT/OXycn32HsyLLVUh/6a0HVfxWeOxDyAnvi5zvThAKuT4tV5
	 Y0c8Ka9iWEYC1HhKzGdm5wOWbxCfifht+WBpTn7Qf4aMKo1JlsFLlcnuBi11n104Indnt
	 Lic0bpjTOrXf13bsYl5xycw2T0Tvf/73w8sjimmfoMjMX2c28MgZrH8rV0KCV3hhoLDFx
	 tAF+dTsgbbV+x6oUz/8bkiVp5HC4p4OZOX9m9oVe8jML9R8JiLhVpJH6iaAVwAP/82A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X1vUlKzm;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD0D606A333
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CD0D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X1vUlKzm
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso3523212eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897576; x=1793502376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXJ1lAA5CJL+VwXuJtf9fzAkgG9SQEGMbPU6n42N680=;
        b=X1vUlKzmxrVzca0s04RBW8h3S8B/UlLGXeQV08TMrlGFFbPgHOOKI6JsH9cpURZVA0
         N9tzxcuPSn2OpAX4luRNBMowT7WOLzPSiN4SGLD7Y9efSk5MV6drC7fzXf+3LxVhhzer
         U0kHH8Pt2Tm37DOWF0YbMiyfKLA91Cqlm51cVDEmDwiV5OKOtBfG1ceOTPrO3ucZVLnh
         QaK4kEQ5nY6tP7OSNVFkiEH+LD7NVbZI8Gj1UQDnROrJ+mJScfj+LZFIGbVCLkP1wfVr
         NuDZT5wtAgaTr0u5fRn0Y4ZGXbK9cJhP1aMjo1OTHf4WiAzXI+VJ/HOxJ4mQfW+5/x1c
         q3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897576; x=1793502376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXJ1lAA5CJL+VwXuJtf9fzAkgG9SQEGMbPU6n42N680=;
        b=p+UmZLOByPaUCNqpy3/1oRzRMyLh2bIKCJv0RnKrYWTa0JBWfjGb5uB0eH6dSJPRac
         bGisTyCXwGb97/cWEBc7vyIoGfhvJjrYAMQFwh2G/onvdRABtM/NQv0CThfqAydF7RYU
         c7cz+kDvmMh7PMRr+Y0oEbCk86ydw8d6J3tFhXFNrsltM+y4okqMv1tlgznR0imRdLZd
         NP3j1JNITQ398UyyQt41poh0Io3b0lAZ2aaYj7RgkQI1ZdnQ4qoyTeChxl8ejTvwf433
         Y19C7nHpW3gG4T3+IKZzk7korg8NI+RNpsrmaa9azwyi+xvzqGr3d5VqfDxTHTwFDALf
         QsMg==
X-Gm-Message-State: AFq9FYL4SSq6NfTtgZP4YoGg5zZhYJrIIvzpTnO71cuwz6W4dQ5Uczpk
	FFymueLkMpq/TXFEto61ALMUgZzT2dvYCWOhKQ2JIyn6UqgAw4p0o7uh
X-Gm-Gg: AYBFou3Q2VV8I2rz/j495Kcy1MkOQHS3x6fWNxHvygeSZ7b5frA+HWLdAOq6TZ4tvSq
	2jzXwhezdyQ3ujz9mnwMk8kKCgDDfiwVthmAmjdb2y/wvJQfV2EQj6nKCjhrL6Owl9p+JZp4bfw
	0AFdt4SLAXsCPXS5jk5nCcHtmFamdL+4Svz79a0bp1xkAnAismMHsVJLiG3da0Rfjz9KAnufyEW
	Zgs4wKI0gSTzOtWXR+GGWxVHy47MeDScXmfUlElceO3BxX7MSh5ofTfXjvAEkFGPMb8+5fmHRmx
	gzdD9mp8bZ7R51Eyu2+ygyye+AHluHnXceRaQQoXDie2wFCecmj9ocWgbI4w6QGTfoCEGOv0sY4
	0zpVpwogDlhAvc9rzdkNxX4nED0ZZG9d5bZj9zM3nTnbHVh3AuL5YGqLjSDg2yBpJpwrwTn18Li
	nUsVkxm0I2WYksSA9WvjZJ7wCf4m0j2amjqmFpBQ8Dxry8Sw19Bi7opowLMZWbPk6QkzX74gJ2T
	Jh+yQzOTrJg2H+wmDwtOQnjJ7rsVyhG962x+MoukIsHqF1+TVhHlw57XBKvFYNA7IYSw1h+BEEx
	P08cu4vrklcTL1I+yiwzZr/4rilt2W9QZymTKw3ACwA=
X-Received: by 2002:a05:7300:f292:b0:368:a825:bf7f with SMTP id 5a478bee46e88-369e84fa201mr4858295eec.13.1792897575668;
        Sat, 24 Oct 2026 20:06:15 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:15 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:08 -0700
Subject: [PATCH 05/31] hwmon: (pmbus/acbel-fsg032) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-5-e81941ad0cd3@gmail.com>
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

Pass the buffer size to i2c_smbus_read_block_data(), shrink the
debugfs data buffer to I2C_SMBUS_BLOCK_MAX, and ensure the string
buffer is NUL-terminated before comparison.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/acbel-fsg032.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/pmbus/acbel-fsg032.c b/drivers/hwmon/pmbus/acbel-fsg032.c
index 5222e7aeca44..d36076b9c44d 100644
--- a/drivers/hwmon/pmbus/acbel-fsg032.c
+++ b/drivers/hwmon/pmbus/acbel-fsg032.c
@@ -19,11 +19,12 @@ static ssize_t acbel_fsg032_debugfs_read(struct file *file, char __user *buf, si
 					 loff_t *ppos)
 {
 	struct i2c_client *client = file->private_data;
-	u8 data[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
+	u8 data[I2C_SMBUS_BLOCK_MAX] = { 0 };
 	char out[8];
 	int rc;
 
-	rc = i2c_smbus_read_block_data(client, ACBEL_MFR_FW_REVISION, data);
+	rc = i2c_smbus_read_block_data(client, ACBEL_MFR_FW_REVISION,
+				       sizeof(data), data);
 	if (rc < 0)
 		return rc;
 
@@ -70,25 +71,26 @@ static int acbel_fsg032_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	int rc;
 
-	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
+				       sizeof(buf) - 1, buf);
 	if (rc < 0) {
 		dev_err(dev, "Failed to read PMBUS_MFR_ID\n");
 		return rc;
 	}
+	buf[rc] = '\0';
 	if (strncmp(buf, "ACBEL", 5)) {
-		buf[rc] = '\0';
 		dev_err(dev, "Manufacturer '%s' not supported\n", buf);
 		return -ENODEV;
 	}
 
-	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+				       sizeof(buf) - 1, buf);
 	if (rc < 0) {
 		dev_err(dev, "Failed to read PMBUS_MFR_MODEL\n");
 		return rc;
 	}
-
+	buf[rc] = '\0';
 	if (strncmp(buf, "FSG032", 6)) {
-		buf[rc] = '\0';
 		dev_err(dev, "Model '%s' not supported\n", buf);
 		return -ENODEV;
 	}

-- 
2.56.0.257.gf7497c7d27-goog

