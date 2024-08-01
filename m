Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE37F198A10
	for <linux-hwmon@vger.kernel.org>; Thu,  1 Aug 2024 14:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722523767; cv=none; b=mevz11zRcLDstcrzvEPed6340adA4lmXAdWYSTQN5ui3UxidXrF/aZRQvlkskYBxJ6DTX5jHq7uatozwVIMmWIdhpy4Vseb3BOIDDcyAY/3TRj7W7M1oxRxskiMbnA+EpJSI1RloygvnksL5iq3tMm+IXY/RZirmBRfbVMdmP3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722523767; c=relaxed/simple;
	bh=LC0clT8WFU6qIQxSILnxhfKrHuibEGbgMT3lvfGQx9I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gs77ckxwgkUN9dpFd/hnMd6V0wRTKrg13FlJolbFxCAYkiawD4GzE4Eg66FfIzjtD2quYPEqV5hiZTT0A5fSoneTItMXmLeRrTQxU3eOKzRr1Gvuzg+ImpGpm1IEmhiJ849Ims3RyVnboYwmKFONuScen4ZVI7Nk8/Aw4suGQ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fU1BWeOp; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fU1BWeOp"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2cb81c0ecb4so1655788a91.0
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Aug 2024 07:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722523764; x=1723128564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7kpafWE7ZxSKn48/frTNbSlf6U7pKkGaZJ1ZDSR/Io=;
        b=fU1BWeOphFfsv1pw+UkVh/pCxH1Em02gXU3lpE68UEwDmhSFAZQnec54biPmqddq3k
         BKRZ3QH7vzEV+JtWkYUdihBZ9mYH1qjaCKuPJcizUMKOg99HKH4UtbShZQdaQbhTrlOi
         bR5kuudLYrE4V8o1y8hvPySYf7bk+4z1aqjbWWUHQB2ZCRxtyFekWYiIEPMkbbiuqk1S
         riMpCGi7omrvPXnnRsX1KQRi94Eb4ey6SPdqTjCC21/VfKgL947zMu4XxPsx+JQyb6v5
         SBcQ4fNNOJes9+GXhlR++0tWFk7vsKqzFE7GtAjaj4JbRxn2sEciotbkL4eOWPZljj5X
         Q2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722523764; x=1723128564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h7kpafWE7ZxSKn48/frTNbSlf6U7pKkGaZJ1ZDSR/Io=;
        b=LQrOQHW+LATa+8RWw/l+oNUFcn+YupqCimfJhbRFuHWJnjbDl9/OGSw9oLBI8ewbJO
         NEZ14fwJnxy5DHhJbs09VljaBlhcIIvBOGQ6XOW3D6ApyjFtq87OS3cWdkegm9+u6WHC
         +/82uz74yQxMcgMzGck47ulMZCkn8r511kvuu7iGsu3a32J1EdA443P5p300SLE3vbVP
         Scf9ubC+5BiiJKyoh6k1z++Zjj0GrPKWPqZ36Mmd550QJ5cX43xTMTkjk7rdd/k6MW76
         c/cexrJ0Ux6pDg5Z4qUhKRToJh22/THbCINDZ2kUHXbYAw9kkBXXcSBMeDFGEeRroojV
         +s7w==
X-Gm-Message-State: AOJu0YxyZ9vR24L6TVWSS2VyytwstPz3469/dnBiFnjq7OHRJA3FjEuD
	/1hE35P02YQt/HUrkLSAZ/B8fEjaq+LFk+ppczTediaUj18sVFHoemTY4g==
X-Google-Smtp-Source: AGHT+IFg/FXbnxbVGTFe04+U6+yI8V6hoqwTh2VZKF4uEaGm/Fbe3PG3NzqBltvztrvOpjFST4+qRA==
X-Received: by 2002:a17:90b:4d05:b0:2c9:5a71:1500 with SMTP id 98e67ed59e1d1-2cff9d8389emr395031a91.0.1722523764537;
        Thu, 01 Aug 2024 07:49:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc406a0dsm3480139a91.3.2024.08.01.07.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 07:49:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/6] hwmon: (lm92) Improve auto-detection accuracy
Date: Thu,  1 Aug 2024 07:49:13 -0700
Message-Id: <20240801144918.6156-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240801144918.6156-1-linux@roeck-us.net>
References: <20240801144918.6156-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checking three configuration register bits and the manufacturer ID
register to auto-detect LM92 is a bit vague. Repeat twice on replicated
register addresses to improve detection accuracy.  Check the manufacturer
ID first and bail out immediately without reading the other register if
there is a mismatch to reduce the number of i2c transfers needed in that
case. Also explicitly test for an error from reading the configuration
register to avoid potential situations where the returned error masked
against 0xe0 is 0.

While at it, drop "lm92: Found National Semiconductor LM92 chip" detection
noise.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm92.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/lm92.c b/drivers/hwmon/lm92.c
index 46579a3e1715..e2d8c8afcbfa 100644
--- a/drivers/hwmon/lm92.c
+++ b/drivers/hwmon/lm92.c
@@ -272,20 +272,28 @@ static int lm92_detect(struct i2c_client *new_client,
 		       struct i2c_board_info *info)
 {
 	struct i2c_adapter *adapter = new_client->adapter;
-	u8 config;
-	u16 man_id;
+	u8 config_addr = LM92_REG_CONFIG;
+	u8 man_id_addr = LM92_REG_MAN_ID;
+	int i, regval;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA
 					    | I2C_FUNC_SMBUS_WORD_DATA))
 		return -ENODEV;
 
-	config = i2c_smbus_read_byte_data(new_client, LM92_REG_CONFIG);
-	man_id = i2c_smbus_read_word_data(new_client, LM92_REG_MAN_ID);
-
-	if ((config & 0xe0) == 0x00 && man_id == 0x0180)
-		pr_info("lm92: Found National Semiconductor LM92 chip\n");
-	else
-		return -ENODEV;
+	/*
+	 * Register values repeat with multiples of 8.
+	 * Read twice to improve detection accuracy.
+	 */
+	for (i = 0; i < 2; i++) {
+		regval = i2c_smbus_read_word_data(new_client, man_id_addr);
+		if (regval != 0x0180)
+			return -ENODEV;
+		regval = i2c_smbus_read_byte_data(new_client, config_addr);
+		if (regval < 0 || (regval & 0xe0))
+			return -ENODEV;
+		config_addr += 8;
+		man_id_addr += 8;
+	}
 
 	strscpy(info->type, "lm92", I2C_NAME_SIZE);
 
-- 
2.39.2

