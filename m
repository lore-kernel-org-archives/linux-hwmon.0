Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897588;
	b=1PQPWVdvZahkD0883b3fzhlKJMDS1CXfbC/W+8yb+KfJIUrQ7QI55mmJnyoa+wn/jDHt
	 K2KKR6QQFlqoeun+KqTDAvAw9K7IqgEbZqgSziwqLxENPTUMiForqDVD84/2KnUektNEZ
	 BsHoZnRPOAme9L0O9EhmfUAM6BVJS35eDWZhSOt5sXHEG7f35xqUsnJMHBF8pA/DsdrWE
	 eQRTHbHNofFnv6q0S44wmeLZB55kIv5LkzSUQoIUC2exeHUD398nbekF7ys0LM7G7Z+RI
	 5QiRGOw7iYNa7XggU7Er8xb/K2yQ06XIfmyQHX55pQcFeCe1SjYkCtV7FRxpXNL54Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=cNYb7L6nBRyXL9IRJL61NCA6VNcXvfAiZugsg1CTZ98=;
	b=aD+0TA+lqltgF1ImYWu4yPAGBRbt2MkHhoxYcAuzLLst/mTnuFNxlBralhmZ6jtDiN21
	 saOe4h51lWEqS1hAtJFDAgZnEjH9SSMXMGWsNifb3aElYFTbWGZFP9GAyNFMqHBruyQ5h
	 YMJPLrsEjeYM2HHlYLluWEzII/lCq9NWjzSammfsg13h+oQC46Fjt3CAZTfI+NKU5Qa9T
	 By36R6rrkc95pkFoDTqUBLwVrZ6NvwXepMoxhyB8qlpEPhjgaI6jJXfYAarKFy3b7i260
	 4ogmXR7iD0P8FjSAa3yGsMkOK2/hA0WDvIgglLlx/9E6Kk+URIogRZdbd9ocTLzPoMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b8dLojR+;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E0160A2625
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E0160A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b8dLojR+
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33fb4680717so3257082eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897587; x=1793502387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cNYb7L6nBRyXL9IRJL61NCA6VNcXvfAiZugsg1CTZ98=;
        b=b8dLojR+pOdlpMu/3WwrWDgf0Ht74MCQHYSWbqOM2oefsKqAtTYIXkxVswucsEDdAr
         rW22Eo2oEiFygEI4yWesWWiqwpyR4BgaHmqdlTQlgeqABhNMCEvn7dSSi1Hz46lsrLgK
         cjQFIN4gFJCDURfGg2CYRFLrdCFwIFaobhKA216vkHTpqGUilLizMjvgINMIr7vyucEd
         McEzpUaYYYvD6ocAdSF85uF+4yle7RQk88F+byqcF4YP75iJ6jE9tYA7MTo1EbsOj8Aw
         s3bD7LdnOhPwTrD3U/6/gFSi1ItgqcLsz0fUbFOoe2AKYQg5rKgJCG8qFEloW2FT2229
         RO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897587; x=1793502387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cNYb7L6nBRyXL9IRJL61NCA6VNcXvfAiZugsg1CTZ98=;
        b=bEhlmBw8gvY6FYFEadqzkhzovuovAfozuJnxSH51pOm1G3YNb9j3qxaFOQ7JVvBpqJ
         92kfw6QucLqrGCjSsTLUpdgJYSck3yIucqnWyW5f+ajk59XNq6xVnxUHIaQIE/RG9FzJ
         9boLEYSAxsCpN3dJ2fgu28AeZJi9378S96yNCia9U9vkjyI3pQnMIgp8Ky2vnGVnowC1
         50AzPC+4Lff7aNnTd9ni8yWV1mm9tSJ8/Ol10cOGxkvKZ3uE1rzW4fo+9hfiKwNoyG+J
         q/DhhjlyEbPj9zp66SM4Gezd+SICB5y3FQTnkJc8NpSica8APkPsIBGMC0Bk4lB1fX9k
         nwIA==
X-Gm-Message-State: AFq9FYK1YQJ9ECsZhop9uOor444zZT1WED27xCRT3uOA8gz+9ft93Mm0
	CRx/DRY6avs+WOXlnLq8IsKRJffDS1WmGaJQPpFXEPR9uxrtIEwwPxjJ
X-Gm-Gg: AYBFou13Srz/yG26cK5uWDm3ZSTpIVOflNzQGnCt8xmllsIuoA4o2VKQ+uvqNBylY+X
	CHCfFdFZeIqKeZYEXQCIVcHb0BqaU91cJjFee2315qZh3iFYtQqQtaDLukuAk8HBc8zUQI2yfkm
	T8zBRmF3NsJ/Af5a+NFvmKxQcUqSkoDIyKUUTPDqJQDfEnOSQM/QxamPdUmRHYqfVO09bKZ9rvT
	2VtgvBMrIEA3OYlMxX1+hLKRFULvDnmbum3icK8/q/d2ZTQmcc8rVHOk6oAYkQXqcV7Pk0vGMMZ
	s6FNIvGDvERycajta2i/Ef8LkSTZcdMHSUjO+2Jeq7Rn3X/PzSExaRfagXmCxdSr30MDV+ML1Ad
	AxuL667pFuv71DBKIoeS2iaYYO+tnN0TQsYIkgg1bHY0gOkcvu+Ysk46fKmGT3+/AHnteqtrOUK
	5UsT8+e7hPQf5Ogq1/6jE74kxZv7ios36sLgCjsW0PC2c05ptE0D9kjxIFu0Cjv0BEtsZBOueFx
	elk4Q6SKHHdq9zLhhT13m6Ely7xv2K6X3D0CsTGHcQHzpv8plxemH2gVU9oPFh2jRFiL5TTznbk
	IrBYK7M6hEHd+eDAX1lSWh2e1uTFMIXL+hL41vtLDwY=
X-Received: by 2002:a05:693c:83cf:10b0:367:941:c253 with SMTP id 5a478bee46e88-369e848b8b2mr5726339eec.11.1792897586831;
        Sat, 24 Oct 2026 20:06:26 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:26 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:16 -0700
Subject: [PATCH 13/31] hwmon: (pmbus/ibm-cffps) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-13-e81941ad0cd3@gmail.com>
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

Pass the buffer capacity reserving space for a trailing NUL byte to
i2c_smbus_read_block_data(), and shrink the manufacturer ID buffer
to I2C_SMBUS_BLOCK_MAX + 1.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index 2498c6f4778e..adf4b7925771 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -490,14 +490,15 @@ static int ibm_cffps_probe(struct i2c_client *client)
 		u16 ccin_revision = 0;
 		u16 ccin_version = CFFPS_CCIN_VERSION_1;
 		int ccin = i2c_smbus_read_word_swapped(client, CFFPS_CCIN_CMD);
-		char mfg_id[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
+		char mfg_id[I2C_SMBUS_BLOCK_MAX + 1] = { 0 };
 
 		if (ccin > 0) {
 			ccin_revision = FIELD_GET(CFFPS_CCIN_REVISION, ccin);
 			ccin_version = FIELD_GET(CFFPS_CCIN_VERSION, ccin);
 		}
 
-		rc = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, mfg_id);
+		rc = i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
+					       sizeof(mfg_id) - 1, mfg_id);
 		if (rc < 0) {
 			dev_err(&client->dev, "Failed to read Manufacturer ID\n");
 			return rc;

-- 
2.56.0.257.gf7497c7d27-goog

