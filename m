Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897579;
	b=mfJPYTJOnhssBHuXpC2W1YtOth5DSyswsWycBRfA38ea0mpGYa1+Xu1Twi1UgVhdKbaG
	 2AIXshMOPvUfMxgNGEerK8W1shqffh3sklbqtepDDJRSQlvxmP9UQ6MBkLTh+gkgMPXSU
	 vuMdMFP2R8ZfKAjBnBHlWziO/TIfqs5Rj9i7yIrNudCfz5+T/PPne7QCVaN++ZsLMpadK
	 DmwVxWJXtFpL4HVnLP+Jfo8Dnd+V/dHH3NfPJcOSPMm/2iy5jJfEGp4Ms2przFaK41R6F
	 2LEmfyQ/XCbrXptLQMWkouYA73U10uZ8o13DZuMRcqYaSt6MyoXeomFYlAURgvwXtFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=FF8w9zVu4AP+nPNl1ALaiTw8x67GRQ4wpz3rkS2M2QY=;
	b=OXUCY1vlh8IO6tCWmOK5S5l5gL73gqQHX/kPrTj+ZjaNn4sI6NuRvs+hrvHQ3C4JIeOT
	 3fFzQ9odxVlJg5EHOkasWP8wuLCYKhti707IQdzdbyB+OyKE6mZKB6v2esEVFD907z7df
	 3Yt4TiPF1jup6+0LffSD7uJvp58CcjjrBfBjJB7vi8KmFy710IDG/Jj990ob54YuFozgu
	 wo6dMVHmFFdF8t2lSqmwznrccT0ZEoSOE5prbO9kng9S/Sza0Awujgkllf0OnliW5dr4E
	 G7bBVDU8VB+gL/X8qVdYh9t/g0tCWaCy7xbwGAOq3H08WGVJwZqO3+cFarQqA1YFZ4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W74iyBgN;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289B260A262A
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 289B260A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W74iyBgN
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36681e85e87so1519632eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897578; x=1793502378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FF8w9zVu4AP+nPNl1ALaiTw8x67GRQ4wpz3rkS2M2QY=;
        b=W74iyBgNuvhBA96Gi6tsTdhdZgNkOIC3Zu6tp5KSv7uu9rqwZgpi+29BrT74+Hbgm0
         dgDOgGGnV2Q9wIoYiZpdxuTYrc/4lE21Bhn+Bki2Lg7cUDz0xVFA9S4fAUbKR5MfU+7e
         1ieRPtMVkS/4J/tCSoGkX/eBOkw4rMeW3fRHPFsXzCDbZLGY3fjP8nWU8dv4Ae/K8B88
         dTPIfmksmhvAOH7QcvYtwFfNuYQb24ytJSg9hGAToKHwbA+q+tyzgfjRadzv+JDmSNUC
         QZO6C74nE2ABuLe9ADhAv0YxQeSGnGjRr85F2AdNGMnbdWbUURqxnIU2FPa3j1k0rq09
         0Eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897578; x=1793502378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FF8w9zVu4AP+nPNl1ALaiTw8x67GRQ4wpz3rkS2M2QY=;
        b=NTMW+R8vK9ApmNE+D6+jQyD1+XUnQNY12E/qLmbccXWGxjQ5LpS/1xGuPrLPPY+0GT
         KBXAQkoQMN9Vy72quyaZ7sNj9E4JFFz5D+sLzNEFZusV5gLfly6xVrLRtSStAg89QhWQ
         k1AzUppymokrRw2lNdJ22iv9MUPXNZ4cvcoeamvUjpmiuG5vkYDKOmc9tjjxp7maRu5Y
         TIH4iYZ7ZyIix4MUoPIxGzdh5Nnjgqrw8sfnjKrubJOWz/OPPxCWcAgVEoRF/08C3DyM
         yv4D/54b+SrTdvSgVGUs3L/JREzEMMFjCBbgw+kTsy7aiyUQRQidDpUO8dixbEDgvEPJ
         hsiA==
X-Gm-Message-State: AFq9FYItwvVRRwtecCK2FGPTFwPYuoU4fiiJM05Ic4+paaBdsHdgke9w
	MDzvDmdGfyFJR/JzziZl9BK+VhikGJwvBAnokh8Mi5lV3a51+WbmlRGp
X-Gm-Gg: AYBFou3zEnhznIocawiB0M8WFF+deN2HCu1hxIFXZihmF647mAbHd0SueYxuvO6n3Ww
	KZsQ3zm5l09xc6qg10svc0pPkcElvnwe2U9BDdidZobt66VyI4/SdRiojytkm0rCZUYMRCQiaR+
	B52N9DBSzs9unS5UQgGB2jbRedFvi+th2GSxG7c1xDLhjb9Gu0cxAjJ/9kFQgU9hPFtmaG8199Y
	XN99EvbccK3Wjm1Eko1pg4YvrweiLGzThXANiFArNgVjfQyxY+wDYPg/Kw5KhKbrc2ECwjs/l+j
	fck4GJVoGPNGKbdqZX/ANAmmacggfNotylOH2ee/k4vz1DXtFh4HneDhaYhIwa2nIZF0As8OdoB
	SqVj8FFXw7lolqocNWTdnervRoqVS1QsHZMluMD/RcP67pMIgAYetlO7hA3YHKALSQcAzhamtCv
	43GFmxv1+Ydj1xjYzeHKJu7GEd8Hxrr5wAr/ISHeelb8CXbJwO7FpHl52yPEzxHLbnG1At7XspP
	lnhcyLozxChfs5+MmNMWwARe4FS8F7dKI0JJ+NGt2fol9TK+8TBeYT1xqvT07NCMYTlcDyH7sJW
	f0RZiJLUXgKJAYfVHTsjr8V5UzHv5lo4Fps21KHauYdRn5D4kl6Z4hYvGBsRGYwu
X-Received: by 2002:a05:693c:66cf:20b0:369:f18f:34ab with SMTP id 5a478bee46e88-369f18f376amr2467244eec.11.1792897578383;
        Sat, 24 Oct 2026 20:06:18 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:17 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:10 -0700
Subject: [PATCH 07/31] hwmon: (pmbus/aps-379) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-7-e81941ad0cd3@gmail.com>
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

Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() in aps_379_probe()
to account for the NUL terminator.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/aps-379.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/aps-379.c b/drivers/hwmon/pmbus/aps-379.c
index 3ec0940ae564..a21213c21f7d 100644
--- a/drivers/hwmon/pmbus/aps-379.c
+++ b/drivers/hwmon/pmbus/aps-379.c
@@ -117,7 +117,8 @@ static int aps_379_probe(struct i2c_client *client)
 				     | I2C_FUNC_SMBUS_READ_BLOCK_DATA))
 		return -ENODEV;
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(dev, "Failed to read Manufacturer Model\n");
 		return ret;

-- 
2.56.0.257.gf7497c7d27-goog

