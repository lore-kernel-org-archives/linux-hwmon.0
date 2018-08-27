Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:44290 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727274AbeH0W4k (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 27 Aug 2018 18:56:40 -0400
Received: by mail-oi0-f68.google.com with SMTP id l82-v6so24718oih.11
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Aug 2018 12:08:48 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 27 Aug 2018 16:08:47 -0300
Message-ID: <CAOMZO5B5CdyGosPduP0uje_wNhiJDcH5NsumENAdQKjLBWFM0g@mail.gmail.com>
Subject: Reading from the MC13892 ADC channels causes shutdown
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?=
        <u.kleine-koenig@pengutronix.de>,
        David Jander <david.jander@protonic.nl>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>
Cc: linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi,

Has anyone managed to read ADC values from the MC13892 ADC recently?

I am running 4.19-rc1 on a imx51-babbage board and after trying to
read a channel:

# cat /sys/class/hwmon/hwmon0/device/in7_input

the PMIC shuts down completely, which causes the entire board to die.

I don't know if this is a regression or not. I can try to run a
bisect, but I would be interested to know if anyone knows if MC13892
ADC readings worked at some point in the past.

Also noticed that the shutdow happens after writing to the ADC1 register.

Removing the line below  makes the ADC reading to timeout, but at
least the PMIC does not shut down:

--- a/drivers/mfd/mc13xxx-core.c
+++ b/drivers/mfd/mc13xxx-core.c
@@ -327,7 +327,6 @@ int mc13xxx_adc_do_conversion(struct mc13xxx
*mc13xxx, unsigned int mode,
                        mc13xxx_handler_adcdone, __func__, &adcdone_data);

        mc13xxx_reg_write(mc13xxx, MC13XXX_ADC0, adc0);
-       mc13xxx_reg_write(mc13xxx, MC13XXX_ADC1, adc1);

        mc13xxx_unlock(mc13xxx);

Any ideas are welcome.

Thanks,

Fabio Estevam
