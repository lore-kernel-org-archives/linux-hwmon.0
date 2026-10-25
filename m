Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897582;
	b=ifvtl6OasjtYzNFLuXvSYAkopQKggt+FsmXG59Bike+EzyMwhvPn44Cp3Tc951WnUPxj
	 n/+psegUVIpepDrxF50YupoURDUDAO+ZB0H9y4qjzsmEUCwklaq2PymGd0Akh7Q2Si+xb
	 wOZdMV4Abi/Z91s8KHIQnmPLhvMhMJfRRTj8VEDqCSgLuRrscwg9ke+5LcQASKNcqBl6Z
	 tjPTJLbvTkcSFSYMpYbZt5uVyiqxL/g5uNGMfoSG17GbeTBmCf35KvrlKBNIsIFb2ws1Y
	 xEYUfaMjPjlBixjJsZcBbURHZm7+sJxyJR5AJINGg/4LWqMfQL0dXV74WFktKbYYpnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Iw3vt9sf2FUkSM6JLv5xZ5aiw05e7WhlXYZ1UTU+91I=;
	b=KD2KXFcP8iiqBTVFe70f/6JHK4tFqWzTQ/NdaWKvKmHmitFmXxFnKASsC5hno+ATNkG6
	 Z0qPVwkM0yXMkKiVO4ZafWfZhhlRDbduldpTU4RnWQHELaHMVcpunvFThcNX3pFbAd03A
	 BbCgurkqCdI+KYrAGcfdC7ACyz0nE9j4H9unyIyuYUmWccujicqNFrSomWW+Y9QAohqOM
	 LOVMG/erYAT1wrIiWPjbAQSze3/UwNAwLaUdEi+NYo5Ahh9D045h/3Ls6WISKYgEoGjXb
	 gpHkdk+ILp0/vpHz4h+vwXdtFjTPP4ROBJtmkVX7IINbjoW3u8uRcoXbn2YB+QaWR+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="jteQ/m5C";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156F860A380D
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 156F860A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jteQ/m5C
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5363747eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897581; x=1793502381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iw3vt9sf2FUkSM6JLv5xZ5aiw05e7WhlXYZ1UTU+91I=;
        b=jteQ/m5CE6lEx888f1GjlPTv5sdupO4NzY2UqnxDBjqKzSCPgF9pElcc2uJu65DIxf
         ilW0vtru/l1TdLspdoUHwrbPiTTuQRErRUlYb0qzdfPcifku0qF9JD6nGrMFfAUHHvVI
         GuM3d0f5CW4Z9SLdNubhORuiuz1jrY1QHsNEMK9/xIm3X1pyqsJeUW6DUR7U0VHWI7d3
         vU8C/O324PAq7UwEu+IODj1v0MtNFW6P8Hxnz67td/IJS/oJ4BVlDM3q8ACbjmWSEr6h
         Soy5Ve66cBhEMFeRZ2LYlfoTYPA+23QHSdhZ4cmN46ib93fUy2Gr8GuT1Koq7Iqa7nOr
         VNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897581; x=1793502381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iw3vt9sf2FUkSM6JLv5xZ5aiw05e7WhlXYZ1UTU+91I=;
        b=Cf2BrU+gLN4AgaCAnY1KLFKOgrx49ken9qMtvr5N/qEd0v18MRBNrrn/I3wYgVZhWx
         IYoaR66HlJVJK0S/TqRTStCErDhRhCCw8YjP+m0J8tTkwkYc3+/DD/3TiYfzNmGnFS8j
         Fll5hW2VBcnwR7tTrIMkXpLVHJ1gWwcLACI5RiSxamccblxH9mHfyI+aj/KE5zNvJkPo
         7UmAVWsQ/vLEtVco0QSxit3WXXXs1631R9LlsqjjRT8TOlI3a62M2R2UqqNn/toT25IO
         5LIhU/5/a6iS2yNDrD+DTZk2TEyeamhoVZRKp2Y7VGbsbh1yuj0b8ZTAXD+GhY1puwaF
         Gk6w==
X-Gm-Message-State: AFq9FYKJwmirxalqJ3yDSbO7ZhfMpJ7WgtO4zVv9xBfHaduF2+3SQn26
	LYRFx6WcgMr6IK7BVJ0ktGOYgpBI0t1PLvHJWzj+bndqBEgSWF4cFvshcWPZJg==
X-Gm-Gg: AYBFou15R2TVg804BtPUlX15yLdauqc+uwwVMY6I/PmXKH/73CzCQ2Nx33ZunKLemsk
	uw4KMw3z9NDGQ2MTOeKXko4hKCgKV58JCqJoESxXad/2QYJZuJePacOuM0JAgribyoLhIynsuB6
	BX0wFMzPwrW2vDpVfWDOZUTrk+tvXa1gqxHIMwt+gaKvm1fPWpUk2OlxpsHECzmrQpjzmQrdWV7
	Ygw09Hdc9Ld+zYjrI8pQ/FgLmvv8XrIgpX+B/YzfkY/aFHcCm7mjgR4dcGbo+lpwz423p3rOsiq
	HinK3IQZILsXPg6RuT52JDT7Uo5Ix95FNmkPzM0rChS8MvLegoQZkXe/JkX4GvYan2An1MiStI7
	xaXtukd1+Gz59vObJHqDRfHunsOA5+fS80del2OUVV5U6GmSVOWBhL/vmUQ+v+bJVHrcdTRUSZW
	4nJAIat8MSEeLooio7AFxYeYX94DB078ulix37PXWZLqxrnILPBygQY3L/ACO4p20Ppu1jke7km
	PKLNLZN4MYbuSAZNmS9tiN7BikDbBJti2OZW3WP0GqX38Qsv4xRqALLkVf95h3o8IQIcKHJsx5P
	9d2xwIs4akUawOUHNc55MWSeDVsZxkVBbe4xTrT/jDU=
X-Received: by 2002:a05:7300:5bab:b0:351:7444:8bfd with SMTP id 5a478bee46e88-369e8637497mr7654126eec.39.1792897581178;
        Sat, 24 Oct 2026 20:06:21 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:20 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:12 -0700
Subject: [PATCH 09/31] hwmon: (pmbus/crps) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-9-e81941ad0cd3@gmail.com>
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

Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() in crps_probe()
and shrink the buffer declaration to I2C_SMBUS_BLOCK_MAX + 1 since
only a single NUL terminator byte is needed.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/crps.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/crps.c b/drivers/hwmon/pmbus/crps.c
index 266ec8947519..2be3869ae8c8 100644
--- a/drivers/hwmon/pmbus/crps.c
+++ b/drivers/hwmon/pmbus/crps.c
@@ -31,9 +31,10 @@ static int crps_probe(struct i2c_client *client)
 {
 	int rc;
 	struct device *dev = &client->dev;
-	char buf[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
+	char buf[I2C_SMBUS_BLOCK_MAX + 1] = { 0 };
 
-	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+				       sizeof(buf) - 1, buf);
 	if (rc < 0)
 		return dev_err_probe(dev, rc, "Failed to read PMBUS_MFR_MODEL\n");
 

-- 
2.56.0.257.gf7497c7d27-goog

