Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF064A1C
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Dec 2024 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735120467; cv=none; b=AS2jABKo6hv4nF5CNZcIRLFGbi0EsNMN2LXnqHxiBR9ZIYHzcm40Ermo1kYaWV5tNk5RPBNgZCPo6P3NyjjOXxvMO1zMr4IWRPMyepZgp96Vbfex1P7CN7dbKiE3paQLg3CIwJt6rZP9z6XK+jeODEIiC0qYJVsdA1WiFTH2ksY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735120467; c=relaxed/simple;
	bh=oJp+YlkRERUKZHsXNZk5hKV+Us2u8RM/tQcCd0Xa2xI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=aTm/t+vXvPbD/QGtN5OVLoG0f4CPcKdIjuizwwCHwmXsR4bvB8LOWhrWcXoaOYc+aLG5JGFKH6hiXWrv50nCaHgewKwKNx5OuldmvLiezsuj2/bEKp3VjVf2B08VQ8i1oaE8oVPtkCTcgTbQ8ZalzGFEotjBghbUxoVRRXQJcEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=N1o+OejS; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="N1o+OejS"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5161d5b8650so1659030e0c.3
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Dec 2024 01:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1735120463; x=1735725263; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gv05ecMgYX7jcP07dyceD2gzCJTmK4SOG0Cfbe+50cg=;
        b=N1o+OejSyUJ7nCWaOkIbQyNSb8fLcvxqMllG66YGKWxhx7t9xfemWBCJOlX/iKjElN
         P2tX+2iOGGmzezZGUGYYH84FBsY6LsaLed6tIhPwNFAPIcr1Ukypa8WEmQqTU8MEvH+L
         ielQgHszTqVyS7vU14GuTOJXK+zvKLmsqGi5xeHFkw+JneacuuU+J4HPFQ/t55Dw0itq
         xh7cpZpfcPpQaWMx9sDe8mJQSkKs/Bj9KNCfqPF4HwutV1MmCmom4+FeZjbQhJk7Zhby
         xWT5y+y/9N5twwTAEXUnZYI0Y0j+ofYIy1BQc5fxKLOgeOOlvlPAg793uzoizr/FQFrl
         5oJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735120463; x=1735725263;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gv05ecMgYX7jcP07dyceD2gzCJTmK4SOG0Cfbe+50cg=;
        b=dWdoiCKOIXWVtmzU29NdNLzFvwbicbg1S1Ufn14aoBxs+JOdWOQVL8dFJjIVvFeWei
         Q0Qf+OQCGOh5MZegPLtP9OQp/1Ko1mwoL2GtHZ+0cFuYZPC05ZbTIsjDCLiKdAalvk1O
         xvCXS5vn48nnsUQQ9xgmgViCjviU9Yo+IR8SZ7MdCOVXGMwTiuuZW6clyOqmIxIMo2N8
         rGtNDM4cRmTOKyavQ9ICcgfRjytFOdetL7Eu2l+vgNZId1s9zjEXGdf6QYJ+XkjeUv9B
         0mwZ/pGLMOi64ZP1VbBFuBuFbyjl0sryG0w6BWHtY2NMWXpwehah4cBXYECttqBPvEdD
         TVCA==
X-Gm-Message-State: AOJu0Yzf9BSUNfN2RJyxhK7Y8DGPGw7yclXP91iBXBcsbEcVQP+mAvDd
	1Ws4f8xQuwOZ5ul7ubmnf8mx/eylO82AJPFHSBo63DSeMPrAVQZ+yFkLKslAt3j4yRH9UcB3aOZ
	dqJSfQeBxYl8/1reFdEUPIj91T8eRzcy/yygtZ6l0V9rO6jhVY6Y=
X-Gm-Gg: ASbGncuwcQ0oZddmbV27HetiWKjkeAlPmrbMEf4sd0+9NtFiX3enPGLBSqiwdEsSxIa
	OjVWIyKpmYDJ7wJihi2KXBLY0zsNdpFNFb0nmcMY=
X-Google-Smtp-Source: AGHT+IGYJtI6mU27oiuSyuww+BZNplw4oNK5HC4EoOKq8ympM9X2fgEX762rQHNGsXVco9n39bu620zykpT7D5CZYwg=
X-Received: by 2002:a05:6102:5689:b0:4b1:1232:def with SMTP id
 ada2fe7eead31-4b2cc31a411mr16286774137.4.1735120463175; Wed, 25 Dec 2024
 01:54:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?Q2hpYW5nQnJpYW4g5rGf5rOz57e7IFRBTw==?= <chiang.brian@inventec.com>
Date: Wed, 25 Dec 2024 17:54:12 +0800
Message-ID: <CAJCfHmVy3O4-nz2_PKF7TcXYr+HqTte1-bdUWLBmV7JOS7He1g@mail.gmail.com>
Subject: [PATCH v1] Support the TI TPS53685 driver
To: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Brian Chiang<chiang.brian@inventec.com>

As the driver is not supported, TPS53685 reading is added based on the
datasheet.

Signed-off-by: Brian Chiang<chiang.brian@inventec.com>
---
 drivers/hwmon/pmbus/tps53679.c | 58 ++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index 81b9d813655a..89753f004edb 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -16,7 +16,7 @@
 #include "pmbus.h"

 enum chips {
-   tps53647, tps53667, tps53676, tps53679, tps53681, tps53688
+   tps53647, tps53667, tps53676, tps53679, tps53681, tps53688, tps53685
 };

 #define TPS53647_PAGE_NUM      1
@@ -109,6 +109,31 @@ static int tps53679_identify_chip(struct
i2c_client *client,
    return 0;
 }

+static int tps53685_identify_chip(struct i2c_client *client,
+                 u8 revision)
+{
+   u8 buf[I2C_SMBUS_BLOCK_MAX];
+   int ret;
+
+   ret = pmbus_read_byte_data(client, 0, PMBUS_REVISION);
+   if (ret < 0)
+       return ret;
+   if (ret != revision) {
+       dev_err(&client->dev, "Unexpected PMBus revision 0x%x\n", ret);
+       return -ENODEV;
+   }
+
+   ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
+   if (ret < 0)
+       return ret;
+
+   if (strncmp("\x54\x49\x53\x68\x50\x00", buf, 6)) {
+       dev_err(&client->dev, "Unexpected device ID: %s\n", buf);
+       return -ENODEV;
+   }
+   return 0;
+}
+
 /*
  * Common identification function for chips with multi-phase support.
  * Since those chips have special configuration registers, we want to have
@@ -132,12 +157,33 @@ static int tps53679_identify_multiphase(struct
i2c_client *client,
    return tps53679_identify_phases(client, info);
 }

+static int tps53685_identify_multiphase(struct i2c_client *client,
+                   struct pmbus_driver_info *info,
+                   int pmbus_rev)
+{
+   int ret;
+   ret = tps53685_identify_chip(client, pmbus_rev);
+   if (ret < 0)
+       return ret;
+
+   info->format[PSC_VOLTAGE_OUT] = linear;
+
+   return 0;
+}
+
 static int tps53679_identify(struct i2c_client *client,
                 struct pmbus_driver_info *info)
 {
    return tps53679_identify_mode(client, info);
 }

+static int tps53685_identify(struct i2c_client *client,
+                struct pmbus_driver_info *info)
+{
+   return tps53685_identify_multiphase(client, info,
+                       TPS53681_PMBUS_REVISION);
+}
+
 static int tps53681_identify(struct i2c_client *client,
                 struct pmbus_driver_info *info)
 {
@@ -215,7 +261,9 @@ static struct pmbus_driver_info tps53679_info = {
        PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
        PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
        PMBUS_HAVE_POUT,
-   .func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+   .func[1] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
+       PMBUS_HAVE_STATUS_INPUT |
+       PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
        PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
        PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
        PMBUS_HAVE_POUT,
@@ -263,6 +311,10 @@ static int tps53679_probe(struct i2c_client *client)
        info->identify = tps53681_identify;
        info->read_word_data = tps53681_read_word_data;
        break;
+   case tps53685:
+       info->pages = 2;
+       info->identify = tps53685_identify;
+       break;
    default:
        return -ENODEV;
    }
@@ -278,6 +330,7 @@ static const struct i2c_device_id tps53679_id[] = {
    {"tps53679", tps53679},
    {"tps53681", tps53681},
    {"tps53688", tps53688},
+   {"tps53685", tps53685},
    {}
 };

@@ -290,6 +343,7 @@ static const struct of_device_id __maybe_unused
tps53679_of_match[] = {
    {.compatible = "ti,tps53679", .data = (void *)tps53679},
    {.compatible = "ti,tps53681", .data = (void *)tps53681},
    {.compatible = "ti,tps53688", .data = (void *)tps53688},
+   {.compatible = "ti,tps53685", .data = (void *)tps53685},
    {}
 };
 MODULE_DEVICE_TABLE(of, tps53679_of_match);
-- 
2.40.1
