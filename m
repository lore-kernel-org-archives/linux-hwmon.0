Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423EF23743
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Nov 2023 19:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2l4SGkH"
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8619810D0
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Nov 2023 11:20:52 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c54c8934abso65340491fa.0
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Nov 2023 11:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699903250; x=1700508050; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3TjpQPL1RRG4ip2c0Id1s8nGYKu2yF/UokHNvL3bsg=;
        b=Q2l4SGkHXbRMlaV30iPYwmBL2eQpLrPCQa1iGaepNpltkKeHCazN0KSFnJougq7EC6
         ZS7qgwv0klIL727zruBSzMzaITRdJyUroW6B6yx+G9pWz79Us8iTae3703AyLd7Ikx4I
         gJpXUZ/UFpiwXF7iZZM7aDKAeQHjKLRMD+9rtNgBvU/VPRHx9RGJvNHenRahf+g5JrYo
         pfbezMpx/RPDo6F4Y4LZVffb8KGtxYaYQH6Mdm2iAYTyzg/TbiK6CB5LFDUgBw+Z2IWz
         n6IGhg0r25sovzEdAOWpRahwX3O3RPIAXqSrB1TTcSGoc01s5vvqcxl1JZU3Pdxgk/EJ
         9bww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699903250; x=1700508050;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S3TjpQPL1RRG4ip2c0Id1s8nGYKu2yF/UokHNvL3bsg=;
        b=qSTt6k35CLadM7dcXBWosu+n9sVcEGq7+h6TFFvldb81CYO4jCbKFyG7CD3NE2vYTT
         rs5RBUmAA6bBRb2By0bIKbfdcUMogd2fgiMJx2fuV7geRZDEun1l3f3hgMsgWveJ4767
         +5zA/eoqF7TYf/+byRqeYbwZSbszQA5MkfSCHWASPN2jALIta/Ph+bODd1YG89nFWTyg
         CsfNEmdwQz397rOiXdzM5zGuYbuY2FeseBpHmWxi7qw3X0Hgwt/pbjXXR7+qeQgYu4P9
         xOjTZ3iGS5wSZXAsYqXpgzpW1Jg0kv1dKu5dGGq/D+vNSOoW4OTD40SpN9p2kGs8pTXU
         SIDw==
X-Gm-Message-State: AOJu0Yx6f4TGZaPAkIerRZUsEhcjoNLZ8h0zZNvkDltm6u4YCEGocU4M
	slCjkw5005i1BXi/fxy/qzbS5T7Wu/0EDA==
X-Google-Smtp-Source: AGHT+IG5cWd/fnfmi8lUR9Tl6a1L/O65qpTnk+aWf43kWDemH0t9EeO6nUnbXixqdakV8DPL8tLESQ==
X-Received: by 2002:a2e:b5cb:0:b0:2c5:1ea4:4e99 with SMTP id g11-20020a2eb5cb000000b002c51ea44e99mr130541ljn.48.1699903250341;
        Mon, 13 Nov 2023 11:20:50 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e16:fe00:c172:813e:6561:e5e7? (dynamic-2a01-0c22-6e16-fe00-c172-813e-6561-e5e7.c22.pool.telefonica.de. [2a01:c22:6e16:fe00:c172:813e:6561:e5e7])
        by smtp.googlemail.com with ESMTPSA id jx11-20020a170906ca4b00b009e62bb0439bsm4448578ejb.212.2023.11.13.11.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 11:20:50 -0800 (PST)
Message-ID: <23f24d6d-ae79-4014-b4df-dc19ddb88e3f@gmail.com>
Date: Mon, 13 Nov 2023 20:20:49 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] hwmon: jc42: Simplify pm ops handling
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use pm_sleep_ptr/DEFINE_SIMPLE_DEV_PM_OPS to simplify the code.

Note: Apparently conditional compiling based on CONFIG_PM
wasn't optimal, it should have been CONFIG_PM_SLEEP.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/hwmon/jc42.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
index f958e830b..5cd0b8cc6 100644
--- a/drivers/hwmon/jc42.c
+++ b/drivers/hwmon/jc42.c
@@ -570,8 +570,6 @@ static void jc42_remove(struct i2c_client *client)
 	}
 }
 
-#ifdef CONFIG_PM
-
 static int jc42_suspend(struct device *dev)
 {
 	struct jc42_data *data = dev_get_drvdata(dev);
@@ -598,15 +596,7 @@ static int jc42_resume(struct device *dev)
 	return regcache_sync(data->regmap);
 }
 
-static const struct dev_pm_ops jc42_dev_pm_ops = {
-	.suspend = jc42_suspend,
-	.resume = jc42_resume,
-};
-
-#define JC42_DEV_PM_OPS (&jc42_dev_pm_ops)
-#else
-#define JC42_DEV_PM_OPS NULL
-#endif /* CONFIG_PM */
+static DEFINE_SIMPLE_DEV_PM_OPS(jc42_pm_ops, jc42_suspend, jc42_resume);
 
 static const struct i2c_device_id jc42_id[] = {
 	{ "jc42", 0 },
@@ -626,7 +616,7 @@ static struct i2c_driver jc42_driver = {
 	.class		= I2C_CLASS_SPD | I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "jc42",
-		.pm = JC42_DEV_PM_OPS,
+		.pm = pm_sleep_ptr(&jc42_pm_ops),
 		.of_match_table = of_match_ptr(jc42_of_ids),
 	},
 	.probe		= jc42_probe,
-- 
2.42.1

