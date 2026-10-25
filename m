Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897613;
	b=MoWVkz3Bu2OUK/yuMXX+fIulnpcZxmorF/fpQEnarlOf2mpzQiUmCJI5vgHGGAa1/N73
	 69WG4EtkoC6r4deC3FzrcdV1H45jjMfZ1EYlk4C3Q5KWfluI24xvRMWqjn19hlPZHfcxU
	 yRvLqCju/oYvqRoVBjjfCgNq7ABcfVb3X8xopPCLiBct+qeOsWCK8in5aNT3QFuYyV1Hk
	 a5r5q+UPpoT2a0M4b1UzwfdRsAH+hXMjEWQ4kUo/2LrAiDRC7nuWPxir5UWmrdWWSmZ0+
	 7eYDtKpgz7N8zFGTj07lqksnoDRLvRjIILBxkzNaBldFrZ3dpdSp6S1TZ+XZGyi5LWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=voc6EaGMtL6XDakpcVc8NpDiKBkcmvY/g3qI5pC6tz8=;
	b=pEhX8shGzrfk1T57autRsi+2xrYXPjtrDXDZzpgdh9rlRKjXlU7PwYXexCthz/B3slXk
	 FnPdGgNbptfK/3RZywja6CyFsQSYPctttkdQZAxo8Qa2LvjKfdb0zXQT1lhyF+PyZC8gk
	 97kKzLGCI+OedObYPOO75mEZGqorUk/g059/s2Z0K9UT1yfnnayjEO8WAtdt6Vwh7JNIR
	 t5p0Q+Zyntj7YC6thQ7FnVAc/rXqfFZ3z/VFsLOyhi1uPp9mvqhJm84Hdosi+lHQD9dBl
	 U9ItQy/ZWjsFLkwEMCv+OzF2E+we90mcBmJJyr/Fu61xjmlfA2G5iRjsQpa8+6evk3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QSwVRTNx;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CCD60A383B
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43CCD60A383B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QSwVRTNx
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35f1f76ea84so3393229eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897612; x=1793502412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=voc6EaGMtL6XDakpcVc8NpDiKBkcmvY/g3qI5pC6tz8=;
        b=QSwVRTNxOhKtflPMGAGnaTNlTdDebpUBwYhQyfVbslOKYLYiA3e7IMxH0RyEAtyZzP
         sxe9vZKCGftcFHK/G+29Zthm1/heaFh/PQgKrsgQxQmMmiRbEIXkfymlrFPKoAZ8KmEj
         uQv+oNnWXEgzYOwScVtI2gb+9edXSTZHRkgGy5DxoGu1V/ZWwxWOI2EentBQ4uezxIHQ
         RFlsV0q+gkFPqaZ4AMo8s5D3xorQ2yRzII++OnitB6PT+wumiHrTtrJGyQUb0M+//XXh
         LVasCyq4Vos2gWPJj+TcOEGeZEEYkQxvvRycpp8Ht7Ra4MEA+6p5nBuisqBKp73rvjS8
         YD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897612; x=1793502412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voc6EaGMtL6XDakpcVc8NpDiKBkcmvY/g3qI5pC6tz8=;
        b=AshxSX1XlJocviw916GW17UEiQG2FIxWxHBl5vjrciI7mIkaJGBw9RPvlKjz4uU4kH
         xEB/9+ksGZt3wFU00zQ1nOxIxRdd/bzQyr61p5j4f/onnlDl+yEd4WrokBArwCCBALNt
         bUuBkmsmh+RDhKNMsji53bCs5F5Tf4n3I3lL/mSBHUyyeRLCdKd3KCBLiC5KZa9jFQwE
         DFYNraP1aK03FBdM9PLqLF2m8LQARudJFKisDBHhCP1FzT4oMkILKs78EDjJzPBAuPAG
         q58hcQ9CYDiNEhWGnVBY3Y6Z4G4IlOTPgoX7I7Hs+2ZMxEO2Zv9zkYy6volceEgk1bxT
         U+sA==
X-Gm-Message-State: AFq9FYLrsYhm7YY9xU9gduFPzOg2xgzMzghMmIfvmzlYOeM8gkhG8Hhv
	syp+JK63Ogi11zge7+9On89iCyY7BeCAG+t6hrGjh30d4K+utl8sa7r7
X-Gm-Gg: AYBFou3c5X8K3DNTvm0ponVOsqNAm0AGTCRQz1xEeWNSzpdQMZyNWze8/tL6urkCgjG
	jlityK1fKl3RhR/wCPUk3revjTsSBrHsGTdYivegQpIl5c6G4lBqX0oLUrwTnlxEUx1tQok52nb
	AopKLOcB1DEvIXyJLiNib/8g6KKxtta4NYoxnvG3zV7MUVM7uIiwYYUE2DqlV5kjq9eQHesEhLn
	rGlP2ZvnmfhLozQzsE6Fp8a5Kr9zxt/GFG1sHkmaxGDVv1GazYxjHqwMuJWPlt+Ccm9wRmyvujb
	SxjVoxruVf9dXCYMziFlpTseN+alkDqdYoEfQ9iQb98b2blXbOklr8cAY2yLsBVl02GlRoZfQ6F
	Mxt7GvkSKQbeG0QplUCILdsIzjJtQsUXPr+bIFdmPLErz9nNcdNdnJ1HoAZzxPuLtaJLZ5zEdNZ
	e+SX0l8WkEBa+H5yYFE11rcGW67p/DRN3QdFmSviM6zcVK7pi9q4Jo14O6GLq5MltgUj44GFoIH
	Q7beSl2W888gn3GzzYBhuW9a61vVsIbT6aCyhaywMtgjDkchz7klJp3EetiGkhZb8fk+I39+MGw
	5MTlIQLeRQ154EBmrJ1ufIX2BJgOFqTIlbVMl9VfICA=
X-Received: by 2002:a05:693c:83d4:10b0:35f:5591:e40c with SMTP id 5a478bee46e88-369e8612a8cmr4953885eec.22.1792897612351;
        Sat, 24 Oct 2026 20:06:52 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:51 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:34 -0700
Subject: [PATCH 31/31] hwmon: (pmbus/zl6100) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-31-e81941ad0cd3@gmail.com>
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

Pass sizeof(device_id) - 1 to i2c_smbus_read_block_data() in
zl6100_probe() to leave space for the NUL terminator.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/zl6100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/zl6100.c b/drivers/hwmon/pmbus/zl6100.c
index 5db2a7818d16..43f59cfc313f 100644
--- a/drivers/hwmon/pmbus/zl6100.c
+++ b/drivers/hwmon/pmbus/zl6100.c
@@ -290,7 +290,7 @@ static int zl6100_probe(struct i2c_client *client)
 		return -ENODEV;
 
 	ret = i2c_smbus_read_block_data(client, ZL6100_DEVICE_ID,
-					device_id);
+					sizeof(device_id) - 1, device_id);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read device ID\n");
 		return ret;

-- 
2.56.0.257.gf7497c7d27-goog

