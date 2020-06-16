Return-Path: <SRS0=PqkE=75=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BD0C433DF
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Jun 2020 02:43:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87BA620739
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Jun 2020 02:43:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tB3zpYtB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbgFPCnc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Jun 2020 22:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbgFPCnb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Jun 2020 22:43:31 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72CBCC061A0E
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Jun 2020 19:43:31 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id b7so624033pju.0
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Jun 2020 19:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+ystURPATVZylNlqnO2YQYdu5Rp0bq0G7jwVo+Y+TDo=;
        b=tB3zpYtBwoiQMzAz9iTlpcowfGAkvLSUCS7Y0CSgQsN+OlssjCtP5o+udRtIhbnEeh
         0TTJ+r/Du1u8pZYkoF9wlDOZak0jqSfZu/If1GbeJ5/oc10y3o5Ze392r7oW5bYqshEe
         TNEBZlpE6r5lwGyRKwmFFPGMt0mmqklxXr8ekwDpGG+gjBjctwlFZ/uuvJdXrmnZRY1z
         ESdWf1DQ+e4GYkSnUVAsiAg+euz4qRfTbcCbTD9szZ5eKPoYQy0nJISzd4ctprrWorAp
         qFBf0e8HK2KPWK9F9tMg4LNKE61O23sHyRbYJUGxpfPc55U1RfsJ1Y9KQ+Nm4VdrEZJs
         CI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=+ystURPATVZylNlqnO2YQYdu5Rp0bq0G7jwVo+Y+TDo=;
        b=ZLZQ96p+iByTM937o4eu1qX4lq0jfyIGYGvoGB1iwVmIHqZcraKvwS6TzQF0eJ3OpK
         cUZUeTE9HppdPQV0UZ5POO+NflesED3xhhqeptEnmOhcK4+cV0GBUJFJXoNCRQBIOf53
         PN01VbIURWaaTd6m3MLTkrExc7XmqGdzqkTLT8lH6vzz2RBzqzfD3uhN6MrT1ddrajNR
         fi4WljF7rZ9lgPa0siTHSAnO+dReJ7lFiSZFPMUVofvJXtzZzP0RD+6K8k7X86Mbaq0/
         niTrzgufGLYsXNx4d3H7asUqENlunLm7wg3RvvIzi4bZwbTQkuDR4l5xMEflf+J+UG9F
         AVCQ==
X-Gm-Message-State: AOAM531T50yuWsP30e6QbTPLIqQfDjFLTAhonvvPwkEzj9jLFfMC7HUV
        er59Wjt6wBjRnjOCx12I+sJM9bpN
X-Google-Smtp-Source: ABdhPJzKwEJ7BA9ies6fnzLSNBWQn/vOx9wNU9yRi0/s/3GXWmANl56cOF0SgM8TvzQAQPETgMs2xA==
X-Received: by 2002:a17:902:fe84:: with SMTP id x4mr220575plm.94.1592275410763;
        Mon, 15 Jun 2020 19:43:30 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q1sm16263381pfk.132.2020.06.15.19.43.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 19:43:29 -0700 (PDT)
Date:   Mon, 15 Jun 2020 19:43:28 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ugur Usug <Ugur.Usug@maximintegrated.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 1/2] hwmon (pmbus/max20730): add max20710 support
Message-ID: <20200616024328.GA115437@roeck-us.net>
References: <BYAPR11MB317423C13909AE6F1913BBD7FD9C0@BYAPR11MB3174.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR11MB317423C13909AE6F1913BBD7FD9C0@BYAPR11MB3174.namprd11.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jun 15, 2020 at 11:49:14PM +0000, Ugur Usug wrote:
> add support for max20710 into the existing max20730 driver.
> 
> Signed-off-by: Ugur Usug <ugur.usug@maximintegrated.com>
> ---
>  Documentation/hwmon/max20730.rst | 10 ++++++-
>  drivers/hwmon/pmbus/Kconfig      |  4 +--
>  drivers/hwmon/pmbus/max20730.c   | 57 ++++++++++++++++++++++++++++++++++------
>  3 files changed, 60 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/hwmon/max20730.rst b/Documentation/hwmon/max20730.rst
> index cea7ae5..cb0c95b 100644
> --- a/Documentation/hwmon/max20730.rst
> +++ b/Documentation/hwmon/max20730.rst
> @@ -5,6 +5,14 @@ Kernel driver max20730
>  
>  Supported chips:
>  
> +  * Maxim MAX20710
> +
> +    Prefix: 'max20710'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX20710.pdf
> +
>    * Maxim MAX20730
>  
>      Prefix: 'max20730'
> @@ -35,7 +43,7 @@ Author: Guenter Roeck <linux@roeck-us.net>
>  Description
>  -----------
>  
> -This driver implements support for Maxim MAX20730, MAX20734, and MAX20743
> +This driver implements support for Maxim MAX20710, MAX20730, MAX20734, and MAX20743
>  Integrated, Step-Down Switching Regulators with PMBus support.
>  
>  The driver is a client driver to the core PMBus driver.
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index a337195..3ad97fd 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -156,10 +156,10 @@ config SENSORS_MAX16601
>  	  be called max16601.
>  
>  config SENSORS_MAX20730
> -	tristate "Maxim MAX20730, MAX20734, MAX20743"
> +	tristate "Maxim MAX20710, MAX20730, MAX20734, MAX20743"
>  	help
>  	  If you say yes here you get hardware monitoring support for Maxim
> -	  MAX20730, MAX20734, and MAX20743.
> +	  MAX20710, MAX20730, MAX20734, and MAX20743.
>  
>  	  This driver can also be built as a module. If so, the module will
>  	  be called max20730.
> diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
> index c0bb054..3ddc19b 100644
> --- a/drivers/hwmon/pmbus/max20730.c
> +++ b/drivers/hwmon/pmbus/max20730.c
> @@ -1,9 +1,10 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - * Driver for MAX20730, MAX20734, and MAX20743 Integrated, Step-Down
> - * Switching Regulators
> + * Driver for MAX20710, MAX20730, MAX20734, and MAX20743 Integrated, 
> + * Step-Down Switching Regulators
>   *
>   * Copyright 2019 Google LLC.
> + * Copyright 2020 Maxim Integrated
>   */
>  
>  #include <linux/bits.h>
> @@ -19,6 +20,7 @@
>  #include "pmbus.h"
>  
>  enum chips {
> +	max20710,
>  	max20730,
>  	max20734,
>  	max20743
> @@ -80,6 +82,7 @@ static long direct_to_val(u16 w, enum pmbus_sensor_classes class,
>  }
>  
>  static u32 max_current[][5] = {
> +	[max20710] = { 6200, 8000, 9700, 11600 },
>  	[max20730] = { 13000, 16600, 20100, 23600 },
>  	[max20734] = { 21000, 27000, 32000, 38000 },
>  	[max20743] = { 18900, 24100, 29200, 34100 },
> @@ -164,6 +167,35 @@ static int max20730_write_word_data(struct i2c_client *client, int page,
>  }
>  
>  static const struct pmbus_driver_info max20730_info[] = {
> +	[max20710] = {
> +		.pages = 1,
> +		.read_word_data = max20730_read_word_data,
> +		.write_word_data = max20730_write_word_data,
> +
> +		/* Source : Maxim AN6140 and AN6042 */
> +		.format[PSC_TEMPERATURE] = direct,
> +		.m[PSC_TEMPERATURE] = 21,
> +		.b[PSC_TEMPERATURE] = 5887,
> +		.R[PSC_TEMPERATURE] = -1,
> +
> +		.format[PSC_VOLTAGE_IN] = direct,
> +		.m[PSC_VOLTAGE_IN] = 3609,
> +		.b[PSC_VOLTAGE_IN] = 0,
> +		.R[PSC_VOLTAGE_IN] = -2,
> +
> +		.format[PSC_CURRENT_OUT] = direct,
> +		.m[PSC_CURRENT_OUT] = 153,
> +		.b[PSC_CURRENT_OUT] = 4976,
> +		.R[PSC_CURRENT_OUT] = -1,
> +
> +		.format[PSC_VOLTAGE_OUT] = linear,
> +
> +		.func[0] = PMBUS_HAVE_VIN |
> +			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +			PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> +			PMBUS_HAVE_STATUS_INPUT,
> +	},
>  	[max20730] = {
>  		.pages = 1,
>  		.read_word_data = max20730_read_word_data,
> @@ -200,7 +232,8 @@ static const struct pmbus_driver_info max20730_info[] = {
>  		.func[0] = PMBUS_HAVE_VIN |
>  			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
>  			PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> -			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
> +			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> +			PMBUS_HAVE_STATUS_INPUT,

unrelated and undocumented change, should be done in a separate patch.

>  	},
>  	[max20734] = {
>  		.pages = 1,
> @@ -228,7 +261,8 @@ static const struct pmbus_driver_info max20730_info[] = {
>  		.func[0] = PMBUS_HAVE_VIN |
>  			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
>  			PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> -			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
> +			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> +			PMBUS_HAVE_STATUS_INPUT,

unrelated and undocumented change, should be done in a separate patch.

>  	},
>  	[max20743] = {
>  		.pages = 1,
> @@ -256,7 +290,8 @@ static const struct pmbus_driver_info max20730_info[] = {
>  		.func[0] = PMBUS_HAVE_VIN |
>  			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
>  			PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> -			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
> +			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> +			PMBUS_HAVE_STATUS_INPUT,

unrelated and undocumented change, should be done in a separate patch.

>  	},
>  };
>  
> @@ -274,7 +309,7 @@ static int max20730_probe(struct i2c_client *client,
>  				     I2C_FUNC_SMBUS_READ_WORD_DATA |
>  				     I2C_FUNC_SMBUS_BLOCK_DATA))
>  		return -ENODEV;
> -
> +	

Whitespace change and bug (do not insert empty tab)

>  	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
>  	if (ret < 0) {
>  		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
> @@ -335,10 +370,15 @@ static int max20730_probe(struct i2c_client *client,
>  		return ret;
>  	data->mfr_devset1 = ret;
>  
> -	return pmbus_do_probe(client, id, &data->info);
> +	ret = pmbus_do_probe(client, id, &data->info);
> +	if (ret < 0)
> +		return ret;
> +	
> +	return 0;

Unnecessary change. Please drop.

>  }
>  
>  static const struct i2c_device_id max20730_id[] = {
> +	{ "max20710", max20710 },
>  	{ "max20730", max20730 },
>  	{ "max20734", max20734 },
>  	{ "max20743", max20743 },
> @@ -348,6 +388,7 @@ static const struct i2c_device_id max20730_id[] = {
>  MODULE_DEVICE_TABLE(i2c, max20730_id);
>  
>  static const struct of_device_id max20730_of_match[] = {
> +	{ .compatible = "maxim,max20710", .data = (void *)max20710 },
>  	{ .compatible = "maxim,max20730", .data = (void *)max20730 },
>  	{ .compatible = "maxim,max20734", .data = (void *)max20734 },
>  	{ .compatible = "maxim,max20743", .data = (void *)max20743 },
> @@ -369,5 +410,5 @@ static struct i2c_driver max20730_driver = {
>  module_i2c_driver(max20730_driver);
>  
>  MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
> -MODULE_DESCRIPTION("PMBus driver for Maxim MAX20730 / MAX20734 / MAX20743");
> +MODULE_DESCRIPTION("PMBus driver for Maxim MAX20710 / MAX20730 / MAX20734 / MAX20743");
>  MODULE_LICENSE("GPL");
> -- 
> 2.7.4
