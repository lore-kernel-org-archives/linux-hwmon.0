Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897590;
	b=QC6afUyUxj12FgIo8R0Qytl9x4UzX7HmLqhS/2L/XZ/BFWG0SRG+PnCYrRJR8tz8zy+v
	 V1jMupFKaS9hz30L83e6ynAN01F/0Se8ePMq8WJD2zxAmUit8OKZsLz4dD+iaGMp2WHBV
	 NDlLKKwpA92VicP/nKdioVbV/ZiZDwoiL1PAL73QG7bJHyca1epGHcM2tZAfKrHWmVSI9
	 p2Xe1djTXo/CUF1DmJl6MeuaYztrtj4kw1dyJ4H6rT03FFlGH84tvst0fKyq1NUPEtf7s
	 IM1Lt+0yAtQSJgIKHCwP/g86nf18HmYHsHNnDkKdp1T9Mrz3zBZKcl0YzsyltO4PYNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=hk1wDV3cftNul7hst1bpw8ll7MqO7jC3vQTcFnAfOM0=;
	b=rNF/9SNVRe8lf7l+TZ97qJx2yExRzOsbvt7dY53qWGRtNn5b7mSyFZCqn6a54XGFEUJB
	 gYQkENpFPLMXPZHHqRAvt7IQNB2LsqRpsmJ/3VSp5jWI3hU64ZKZqUVlNrsW1SRATsk1P
	 VQi6xHRHSZuIHTFiDtt5F3roPCTVHq/oMAcxoKqRZfuw6Nn0Y6vtcol/uPtS5dCdB56jN
	 7AQA6iodCD0de3RqKTvE3jyx8Hge8lqJDt/Ys5wrwaeMFTI2200+hBNiOHLCOaA79ehD+
	 3iu2RDmiKFqXTCXvXZUvWcxFeDieGdnm0yfQ8Wm/etVcAR4f5sD8OS8Z63gUe2XPPlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aN8Enjwg;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCB060A262F
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DCB060A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aN8Enjwg
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-369f33df08eso737906eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897590; x=1793502390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hk1wDV3cftNul7hst1bpw8ll7MqO7jC3vQTcFnAfOM0=;
        b=aN8Enjwg1S+wyY45qPIpVzwnmddTQSjnGLzLtTtX5aywM4Ypnn+84EIVjq/0PgRatw
         EW2bv4jFE5sb8kcp5uCn0i2nzz4Lbv92cEE+/4MnZ81zAMZnhifhkHA7hKLbedSe8Q1U
         SEdy2X9nm2FpC/lioHT8oylUbBX6NdkDc/oVXYi58HXnSEqZKwi87QPcliSyH0dvgRRr
         qv3i703MNbkZjIyMMylbY6wZ/qoWm3yrXz1vDUbM6Yhl6Bdb4vHH9oEJ0baK0yIADVuN
         GMq3wNoIR2H0lkJjqzLy1gl1pdunGPz4XmCJhCjaFXZNOQn2BESKmcNdEP6rndAmgxA4
         PJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897590; x=1793502390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hk1wDV3cftNul7hst1bpw8ll7MqO7jC3vQTcFnAfOM0=;
        b=gPoG1YLDcInbzKVAl4b0/1scKP8WIqYfA+sLIuFmBwWJD54I7WcKY8/uDtxtWMieQx
         qsvq5ENHiCsTfMtxZSXy/1Ud09/6pF+JkvboLa8Lp/WssWuoLnPbekU9gJMJLIoSdMx4
         mI4UWCi+NB7y8sz+7W13NPtxo/wmucz9U0lz5KsYY5NTI51FeTYP+GHBN9WbgksPDaW4
         oAj7nucfQNo9fOd4rNlHsP61pH1MQ/H0vaexhnppE3e5Pu+miISWxM6E1qs/BGes/6KM
         kRJ0jZT2D3PcrRgkzFQNA49wfl8CTWdCxAmOPrP+6CKBEC2iqLnlRQ8dvmliRbGRRdU7
         ae3A==
X-Gm-Message-State: AFq9FYIpBuSgtMgjQTngyeE8wFgsYEBpqzVKtEx1sR1IqU2IMESklDrP
	A4zmqtxZNp3DBZaZwfXEg7AoEgWoY9ELFzcFEh6/SdcHvUpk168llnpt
X-Gm-Gg: AYBFou10nmOfVkBzxw0AWxHl5LHt81NnXll/inscmCE4OscK6ei42btqH4TjcyEii44
	XaPyJZf451ZFCrKrdlM5+GkMREzns67JJTqJJv92HtXrz5xaPo7hMm2Uu8LkS3ziUGAwIITuySH
	afUAlApGgiXjHnOkpD8vcWEot5KCx+12AdrtwSDWMNttdildqQ9uOgtkWLyaUSOJWAGpDeWGodC
	QzX1pdeRzE+jOLp0eMu+1ucJgJowo/+PTYynb6OctnyBL/ej9WDhI1QCx+8J/+ZxSMjL4uApfma
	TYYkMg3NdP4cuXxfO1X8P5P7Nox+z0qjIrgP4fIVB1UQO1m4sD8M0oDDs0ZUnOJQCH5PEDrrCOY
	AktgDYYfdi2d3aJxPkuvshwPnL/mAIXv97ZOd5FBifiqAeYU+Et1GHRG/OxNyqrpi/PjD44qvXK
	sVakQ4eiJt937CfzPb0TI4PwKyV2SXAr72DLMCl3xDBzNQnXpwRdCng8xemWwx3tZYcIeun54G5
	KdBAXnnw8Ap8kK0XwjRqoUqM1VO2dENI2rEYxGpaWE9wJTGHDte7hfeSDckS3nJ2y1IS1TCqqab
	edU78h6/ieDgfe1CP65R+t6gWqBpasO5MuZMhvkznFWJ
X-Received: by 2002:a05:7301:b0d:b0:360:e2e6:f849 with SMTP id 5a478bee46e88-369e864c29emr4731675eec.28.1792897589570;
        Sat, 24 Oct 2026 20:06:29 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:28 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:18 -0700
Subject: [PATCH 15/31] hwmon: (pmbus/ir35221) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-15-e81941ad0cd3@gmail.com>
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

Pass the size of the receive buffer to i2c_smbus_read_block_data() in
ir35221_probe().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/ir35221.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/ir35221.c b/drivers/hwmon/pmbus/ir35221.c
index b2120fc76f40..346276efff87 100644
--- a/drivers/hwmon/pmbus/ir35221.c
+++ b/drivers/hwmon/pmbus/ir35221.c
@@ -79,7 +79,8 @@ static int ir35221_probe(struct i2c_client *client)
 				| I2C_FUNC_SMBUS_READ_BLOCK_DATA))
 		return -ENODEV;
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
+					sizeof(buf), buf);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read PMBUS_MFR_ID\n");
 		return ret;
@@ -89,7 +90,8 @@ static int ir35221_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					sizeof(buf), buf);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read PMBUS_MFR_MODEL\n");
 		return ret;

-- 
2.56.0.257.gf7497c7d27-goog

