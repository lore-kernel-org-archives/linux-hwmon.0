Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3A6C433DB
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Jan 2021 02:01:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B9CC60C3D
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Jan 2021 02:01:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbhA1CAp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Jan 2021 21:00:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbhA1CAm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Jan 2021 21:00:42 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D21DC061574
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Jan 2021 18:00:02 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id a109so3781040otc.1
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Jan 2021 18:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VJn+EdoWQfSq6pSzw21//Vg4E2z21DG9c+ucxD91YFw=;
        b=jr0+4EvK91lqAJjyzECCNMmyRftiUXOs0It8alhpT1/9vr2zN00ywBhAbJTi4pTMS8
         ZrdylYZ3DtKq90YM7MQ97ZtKq/fjHsVY3Ap6qJ/5TU2+BKoRTqFibUvxc1N87u6M8geC
         bP+xGJWd4fUdoD9tl+Su7OQUbXivElfGVofGwup/MjkN4ab0s7JPGjMDpfBIjuZkYakG
         dHMS9y1H77ZsDzjbvK5+RMybtDB3YbYOYYDTT6lU94I2aylq04ozp3cCymIdnNs5XwU3
         Eou4mWSZy5/IeX28Cfv7yug3q6M664O564WjNSgtA41l+uYBgJbCmnGmcOm96juZLBPZ
         mfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=VJn+EdoWQfSq6pSzw21//Vg4E2z21DG9c+ucxD91YFw=;
        b=I+5ZMay9lN8a0dNgLhCUbnvg11r3ZIqpoF6XfEcfpe7xA8sc8F+CZO/9+GLkX6WNm5
         UcxwotxfgoZiYpIxP5Tk3pO2H7ju+HiRTm59VZy+/Gug5W/ak/is+i7BUS81XI6iUCAy
         iGB6P8c3P75Mev9Fa1NCLtRms87Cc9WKsV3AtIJLDCczqCnCnDQEg0ByR6KPGo7f953p
         PaCOc6XJvwXbDU1MjtHcoiOZqdhEPyBkdfhNClszl5Geh7NbbiuqtL7LxAoL2lmryafA
         bK2oOylFe9m44mS3dPVktqAv4qhY9eA8beFsE2DK5Jd/r2IuaLmYNp/3OykpqQvRG9iQ
         pDoQ==
X-Gm-Message-State: AOAM531HnN7E7irVxRGwAHFwUTOZL8u9DDfMV9h4LKCOTzfQfxd2o7hq
        EdpKzyyMFAgPFDr/JguoYVg=
X-Google-Smtp-Source: ABdhPJzw3dJhcE6YYrVIqZt0NvWK4aqH6MbEOZz8yaYbbj/c4tE2s+BrM1WYhnmYwGzdSz7RQyULMg==
X-Received: by 2002:a9d:6f08:: with SMTP id n8mr9633382otq.137.1611799201776;
        Wed, 27 Jan 2021 18:00:01 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q195sm61238oic.15.2021.01.27.18.00.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jan 2021 18:00:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 27 Jan 2021 17:59:59 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Alex Qiu <xqiu@google.com>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Ugur Usug <Ugur.Usug@maximintegrated.com>
Subject: Re: [PATCH 2/2] RFT: hwmon: (pmbus/max16601) Add support for MAX16508
Message-ID: <20210128015959.GA164016@roeck-us.net>
References: <20210125185327.93282-1-linux@roeck-us.net>
 <20210125185327.93282-2-linux@roeck-us.net>
 <CAA_a9xJ-ZeNLzC4+B4TBcbLCu6RNKa4nT0a773B=88pcW_mVkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA_a9xJ-ZeNLzC4+B4TBcbLCu6RNKa4nT0a773B=88pcW_mVkA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jan 25, 2021 at 02:51:57PM -0800, Alex Qiu wrote:
> Tested: No obvious hwmon directory entry or value reading changes
> after applying the patch 2 on MAX16601. Had to work around the
> pmbus_do_probe() in order to apply to the 5.1 kernel on my hand
> though.
> 
> Thx!
> 
Thanks a lot for testing!

Guenter

> - Alex Qiu
> 
> On Mon, Jan 25, 2021 at 10:53 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > MAX16508 is quite similar to MAX16601, except that it does not support
> > the DEFAULT_NUM_POP register and we thus can not dynamically determine
> > the number of populated phases.
> >
> > Cc: Alex Qiu <xqiu@google.com>
> > Cc: Ugur Usug <Ugur.Usug@maximintegrated.com>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Alex Qiu <xqiu@google.com>
> Tested-by: Alex Qiu <xqiu@google.com>
> > ---
> > Tested with MAX16601 to ensure that it doesn't break existing support,
> > but untested on MAX16508.
> >
> > The most likely cause of failure is the chip detection string: The
> > datasheet suggests that it is "MAX16500" for all chips in the MAX165xx
> > series, but without hardware that is all but impossible to confirm.
> >
> > It should also be confirmed that REG_DEFAULT_NUM_POP (the expected
> > number of populated phases) is indeed not supported on MAX16508.
> >
> >  Documentation/hwmon/max16601.rst | 12 +++++-
> >  drivers/hwmon/pmbus/Kconfig      |  4 +-
> >  drivers/hwmon/pmbus/max16601.c   | 74 +++++++++++++++++++++++---------
> >  3 files changed, 66 insertions(+), 24 deletions(-)
> >
> > diff --git a/Documentation/hwmon/max16601.rst b/Documentation/hwmon/max16601.rst
> > index 93d25dfa028e..d16792be7533 100644
> > --- a/Documentation/hwmon/max16601.rst
> > +++ b/Documentation/hwmon/max16601.rst
> > @@ -5,6 +5,14 @@ Kernel driver max16601
> >
> >  Supported chips:
> >
> > +  * Maxim MAX16508
> > +
> > +    Prefix: 'max16508'
> > +
> > +    Addresses scanned: -
> > +
> > +    Datasheet: Not published
> > +
> >    * Maxim MAX16601
> >
> >      Prefix: 'max16601'
> > @@ -19,8 +27,8 @@ Author: Guenter Roeck <linux@roeck-us.net>
> >  Description
> >  -----------
> >
> > -This driver supports the MAX16601 VR13.HC Dual-Output Voltage Regulator
> > -Chipset.
> > +This driver supports the MAX16508 VR13 Dual-Output Voltage Regulator
> > +as well as the MAX16601 VR13.HC Dual-Output Voltage Regulator chipsets.
> >
> >  The driver is a client driver to the core PMBus driver.
> >  Please see Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
> > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> > index 03606d4298a4..32d2fc850621 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -158,10 +158,10 @@ config SENSORS_MAX16064
> >           be called max16064.
> >
> >  config SENSORS_MAX16601
> > -       tristate "Maxim MAX16601"
> > +       tristate "Maxim MAX16508, MAX16601"
> >         help
> >           If you say yes here you get hardware monitoring support for Maxim
> > -         MAX16601.
> > +         MAX16508 and MAX16601.
> >
> >           This driver can also be built as a module. If so, the module will
> >           be called max16601.
> > diff --git a/drivers/hwmon/pmbus/max16601.c b/drivers/hwmon/pmbus/max16601.c
> > index efe6da3bc8d0..0d1204c2dd54 100644
> > --- a/drivers/hwmon/pmbus/max16601.c
> > +++ b/drivers/hwmon/pmbus/max16601.c
> > @@ -1,11 +1,11 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  /*
> > - * Hardware monitoring driver for Maxim MAX16601
> > + * Hardware monitoring driver for Maxim MAX16508 and MAX16601.
> >   *
> >   * Implementation notes:
> >   *
> > - * Ths chip supports two rails, VCORE and VSA. Telemetry information for the
> > - * two rails is reported in two subsequent I2C addresses. The driver
> > + * This chip series supports two rails, VCORE and VSA. Telemetry information
> > + * for the two rails is reported in two subsequent I2C addresses. The driver
> >   * instantiates a dummy I2C client at the second I2C address to report
> >   * information for the VSA rail in a single instance of the driver.
> >   * Telemetry for the VSA rail is reported to the PMBus core in PMBus page 2.
> > @@ -31,6 +31,8 @@
> >
> >  #include "pmbus.h"
> >
> > +enum chips { max16508, max16601 };
> > +
> >  #define REG_DEFAULT_NUM_POP    0xc4
> >  #define REG_SETPT_DVID         0xd1
> >  #define  DAC_10MV_MODE         BIT(4)
> > @@ -44,6 +46,7 @@
> >  #define MAX16601_NUM_PHASES    8
> >
> >  struct max16601_data {
> > +       enum chips id;
> >         struct pmbus_driver_info info;
> >         struct i2c_client *vsa;
> >         int iout_avg_pkg;
> > @@ -188,6 +191,7 @@ static int max16601_write_word(struct i2c_client *client, int page, int reg,
> >  static int max16601_identify(struct i2c_client *client,
> >                              struct pmbus_driver_info *info)
> >  {
> > +       struct max16601_data *data = to_max16601_data(info);
> >         int reg;
> >
> >         reg = i2c_smbus_read_byte_data(client, REG_SETPT_DVID);
> > @@ -198,6 +202,9 @@ static int max16601_identify(struct i2c_client *client,
> >         else
> >                 info->vrm_version[0] = vr12;
> >
> > +       if (data->id != max16601)
> > +               return 0;
> > +
> >         reg = i2c_smbus_read_byte_data(client, REG_DEFAULT_NUM_POP);
> >         if (reg < 0)
> >                 return reg;
> > @@ -254,28 +261,61 @@ static void max16601_remove(void *_data)
> >         i2c_unregister_device(data->vsa);
> >  }
> >
> > -static int max16601_probe(struct i2c_client *client)
> > +static const struct i2c_device_id max16601_id[] = {
> > +       {"max16508", max16508},
> > +       {"max16601", max16601},
> > +       {}
> > +};
> > +MODULE_DEVICE_TABLE(i2c, max16601_id);
> > +
> > +static int max16601_get_id(struct i2c_client *client)
> >  {
> >         struct device *dev = &client->dev;
> >         u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
> > -       struct max16601_data *data;
> > +       enum chips id;
> >         int ret;
> >
> > -       if (!i2c_check_functionality(client->adapter,
> > -                                    I2C_FUNC_SMBUS_READ_BYTE_DATA |
> > -                                    I2C_FUNC_SMBUS_READ_BLOCK_DATA))
> > -               return -ENODEV;
> > -
> >         ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
> > -       if (ret < 0)
> > +       if (ret < 0 || ret < 11)
> >                 return -ENODEV;
> >
> > -       /* PMBUS_IC_DEVICE_ID is expected to return "MAX16601y.xx" */
> > -       if (ret < 11 || strncmp(buf, "MAX16601", 8)) {
> > +       /*
> > +        * PMBUS_IC_DEVICE_ID is expected to return "MAX16601y.xx"
> > +        * or "MAX16500y.xx".
> > +        */
> > +       if (!strncmp(buf, "MAX16500", 8)) {
> > +               id = max16508;
> > +       } else if (!strncmp(buf, "MAX16601", 8)) {
> > +               id = max16601;
> > +       } else {
> >                 buf[ret] = '\0';
> >                 dev_err(dev, "Unsupported chip '%s'\n", buf);
> >                 return -ENODEV;
> >         }
> > +       return id;
> > +}
> > +
> > +static int max16601_probe(struct i2c_client *client)
> > +{
> > +       struct device *dev = &client->dev;
> > +       const struct i2c_device_id *id;
> > +       struct max16601_data *data;
> > +       int ret, chip_id;
> > +
> > +       if (!i2c_check_functionality(client->adapter,
> > +                                    I2C_FUNC_SMBUS_READ_BYTE_DATA |
> > +                                    I2C_FUNC_SMBUS_READ_BLOCK_DATA))
> > +               return -ENODEV;
> > +
> > +       chip_id = max16601_get_id(client);
> > +       if (chip_id < 0)
> > +               return chip_id;
> > +
> > +       id = i2c_match_id(max16601_id, client);
> > +       if (chip_id != id->driver_data)
> > +               dev_warn(&client->dev,
> > +                        "Device mismatch: Configured %s (%d), detected %d\n",
> > +                        id->name, (int) id->driver_data, chip_id);
> >
> >         ret = i2c_smbus_read_byte_data(client, REG_PHASE_ID);
> >         if (ret < 0)
> > @@ -290,6 +330,7 @@ static int max16601_probe(struct i2c_client *client)
> >         if (!data)
> >                 return -ENOMEM;
> >
> > +       data->id = chip_id;
> >         data->iout_avg_pkg = 0xfc00;
> >         data->vsa = i2c_new_dummy_device(client->adapter, client->addr + 1);
> >         if (IS_ERR(data->vsa)) {
> > @@ -305,13 +346,6 @@ static int max16601_probe(struct i2c_client *client)
> >         return pmbus_do_probe(client, &data->info);
> >  }
> >
> > -static const struct i2c_device_id max16601_id[] = {
> > -       {"max16601", 0},
> > -       {}
> > -};
> > -
> > -MODULE_DEVICE_TABLE(i2c, max16601_id);
> > -
> >  static struct i2c_driver max16601_driver = {
> >         .driver = {
> >                    .name = "max16601",
> > --
> > 2.17.1
> >
