Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FA01CFEB8
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 20:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728677077; cv=none; b=oBYcwU0iOab5/qWUPgQ95dGKXBQSIr5z8PyTOaLq0szBwwn6JYWE4FOe0t69RfK0sHHDpZFUir11h7/XAefVHcBC5n16uEJZNyX176yA3jjmcQ6MYLRkogEurYFhiB+WA6CWrd7MsJ9JfSca6pGVw1U1v7ETPGujO5tn6jMdBts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728677077; c=relaxed/simple;
	bh=14QfitH73aZqjSr2FWvNeZ8QDiUgaGRlyjP+8K5KKro=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PLMeNKoO9Viy7rqSmh7FkylfCNb+qUfe37IjjybB1Om2/yuLddaixLYh3B8LdmSoUINjGdNrX9tK6PuuDZ9F8MF6n7vtg5QkXfKlX2yHVdcQThR+8YVgJ+i5ce+b4WQJ+QfceFAgNYIpyiVPtyWtZr7bS9/MG7YHFNk6QfIA6QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ALw4G/cy; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ALw4G/cy"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fad5024b8dso28205411fa.1
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 13:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728677074; x=1729281874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IH03J0HFNDP/Jl0w2VxxzQlRmOuL3kJdY0NGhLlQEI0=;
        b=ALw4G/cywJRBJkaGML/HrH0+xTBlzeKudlijhN1fa2B7W2etvAqhPrX6plH0NxQ1mZ
         fomvryAK/ttxfUtWEtmBx+78oZ3AOhwIqEec/gveJNq5wWfexDo+R3qWTOlD7gZnL8/p
         Ko4FPHpsHbolt6nXD51UQQPWCjr3XhHsXhD34r+DxEfwXdpwzpnuYhrFAfKmnYy2MjqW
         Zu40tDrLsYovFEpxH9Pq4aQhwRdo/5hCLSmMwbjkxzTn1mSo2Kx24ftt+svmHAxDCS4d
         OOqpbFfZewkEhi63sUXcBvtHCJ0r27fbZbqM5QpRWjOLDutxRdWFFaSPp5PaUo3AcnCC
         Uk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728677074; x=1729281874;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IH03J0HFNDP/Jl0w2VxxzQlRmOuL3kJdY0NGhLlQEI0=;
        b=Zu0X5L9YRPiIZ7B+wN1KUSYKiZFJUm9ystmMaJx2POoFbWJCutjTGnuxFDrxJCmUxE
         8SviOfp14X+csyhG2RdWpB0+jOFqk8wABjFbHqUPqI7FrWK+H70i2yJ1yoFFInK+euSY
         i3vkL7SKf47vGSC6eohrAgkKz/Lp3RPXc6BIkg73Gt1osHTrEYXfB5hqWMWpBWiGCFAQ
         KMOZXNMcS2zEvirHwyu3GGbvgWRDvNgOL/yhg1saPDpPGO2/Vnk325aZUjnSd0XOIqc4
         e/cpohuDvBAwGNOJAijLFdB4mlGYLUXdR/Nae/BITDhgLP1K9cxp03ETKvJSIm3GDYD0
         p8Cg==
X-Gm-Message-State: AOJu0YymFKvxw6faLxk8BLnyZCF8joyI5eOA0ZVd18S4XH+DiescNzwH
	n8TxhJIcfpw6HfifA1mAu465/XO3CC1j9vPQAouwIzPZBiHnEJppG3ZSIQ==
X-Google-Smtp-Source: AGHT+IEUvE63MGsu4ANz2jqqOJTaOtOe4BTOVn99rCtptmpAWS2KpH1QlW5/V2wkhD01gSg3WYn4rA==
X-Received: by 2002:a05:651c:19a5:b0:2f7:65b0:ff29 with SMTP id 38308e7fff4ca-2fb32ae7e0fmr20018321fa.38.1728677073907;
        Fri, 11 Oct 2024 13:04:33 -0700 (PDT)
Received: from ?IPV6:2a02:3100:afd7:9a00:94ac:542a:1cd2:c9ce? (dynamic-2a02-3100-afd7-9a00-94ac-542a-1cd2-c9ce.310.pool.telefonica.de. [2a02:3100:afd7:9a00:94ac:542a:1cd2:c9ce])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5c937153a6asm2232626a12.49.2024.10.11.13.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 13:04:32 -0700 (PDT)
Message-ID: <1ac2be2d-df4f-455a-900d-821fc7bd12c4@gmail.com>
Date: Fri, 11 Oct 2024 22:04:31 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 8/8] hwmon: nzxt-kraken2: Simplify specifying static
 visibility attribute
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonas Malaco <jonas@protocubo.io>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <6f43a3e1-3622-4595-a1ec-2b3ad94bdf5b@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <6f43a3e1-3622-4595-a1ec-2b3ad94bdf5b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use new member visible of struct hwmon_ops to simplify specifying
the static attribute visibility.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/hwmon/nzxt-kraken2.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/hwmon/nzxt-kraken2.c b/drivers/hwmon/nzxt-kraken2.c
index ed38645a1..034698232 100644
--- a/drivers/hwmon/nzxt-kraken2.c
+++ b/drivers/hwmon/nzxt-kraken2.c
@@ -35,13 +35,6 @@ struct kraken2_priv_data {
 	unsigned long updated; /* jiffies */
 };
 
-static umode_t kraken2_is_visible(const void *data,
-				  enum hwmon_sensor_types type,
-				  u32 attr, int channel)
-{
-	return 0444;
-}
-
 static int kraken2_read(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long *val)
 {
@@ -81,7 +74,7 @@ static int kraken2_read_string(struct device *dev, enum hwmon_sensor_types type,
 }
 
 static const struct hwmon_ops kraken2_hwmon_ops = {
-	.is_visible = kraken2_is_visible,
+	.visible = 0444,
 	.read = kraken2_read,
 	.read_string = kraken2_read_string,
 };
-- 
2.47.0


