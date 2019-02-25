Return-Path: <SRS0=SUeP=RA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A762C43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Feb 2019 14:37:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 47D9920842
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Feb 2019 14:37:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rEM2bPMZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfBYOhA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Feb 2019 09:37:00 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34671 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726732AbfBYOg7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Feb 2019 09:36:59 -0500
Received: by mail-pl1-f193.google.com with SMTP id d15so4613121plr.1
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Feb 2019 06:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=t97UdUuV8MM+X22KaU1zTrxwLnYLZqqcLqiX4vhMr28=;
        b=rEM2bPMZxF94M+PWogK3IxCLZ+j1cf2xxAmO9MrqnSfXtDu+ziJwkaVo40prTQOBGu
         fsjSF2QvPKTavYJbtD7m1KgjAuHa4B2roL4AM+hBHV0btiQMyqMlnlDdy/oMcRZERMd2
         /94K8F4vkrJxYEibVmMj3dPDWs5oHRw75JuOJYEvv+vnkl4D/BJVVaGfnFTig7+OTHmh
         jVQs+hWpbwBPEp87h2gz6lRlvrm3ipFjUHT5T0KON90pSKp3dLsitdJIWoY5/1N5xCV6
         Z044UxGvGD5ncxuAqA3nXpZxC3IjaYb3zFlw2UJ9L2izg+PmDyxt4fLhxA0IUQ4sH+OT
         Ly2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=t97UdUuV8MM+X22KaU1zTrxwLnYLZqqcLqiX4vhMr28=;
        b=jbJL+NFxPB5bx2y88gqesb1HQYbVQPw2dqPuKviLpdXYrZuIoTEV2qhkm+Jk/zAg9a
         aLtq+ypO59WRQxQoM8Vu+088s8CMxSg6UkIF4TehCktP+b3N15cmXsGDE/ErDvKtWavr
         D8CeKTIh3ZicCdfghj0FrzgD0z/xLuhm29E76YHK6ai4yE+VLvgDx2SAl0vXN5ABTDmc
         qWAwdfIJ35BvbvSKwDLR9hK8YAo//IrqTboIr8RZ7wd2bhTylhaKpfbn5SoWwPBbY3Nv
         fRgqydYFViQSltyQfnjuYo11SNJDjx/IPKtzrg80SaIOYn7CM2sgdRFbtRoXvDMZsq+j
         xZGg==
X-Gm-Message-State: AHQUAuYpzGgcKMj4VUneO+NlzvaHCabUGZ2r76aX1vjHsxlDnkhPazZ0
        HmlODo8d1WlXOPS9MXdZgbE=
X-Google-Smtp-Source: AHgI3IZ1vY66JR4T+NDr/awbgRaFCHOauxTzIAck0sq5hPJPi2WhoettCSfAASDimHAMcB06AxL9ag==
X-Received: by 2002:a17:902:4a0c:: with SMTP id w12mr20336335pld.174.1551105419242;
        Mon, 25 Feb 2019 06:36:59 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p5sm3049035pfn.154.2019.02.25.06.36.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Feb 2019 06:36:58 -0800 (PST)
Date:   Mon, 25 Feb 2019 06:36:57 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (ad7418) Add device tree probing
Message-ID: <20190225143657.GA12447@roeck-us.net>
References: <20190128210637.22323-1-linus.walleij@linaro.org>
 <20190128210637.22323-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190128210637.22323-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jan 28, 2019 at 10:06:37PM +0100, Linus Walleij wrote:
> This adds device tree probing for the AD7418 hwmon sensor.
> When device tree is not enabled, stub functions will kick
> in.
> 
> Tested on the Gateway Cambria GW2358-4.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/ad7418.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/ad7418.c b/drivers/hwmon/ad7418.c
> index 76f0a5c01e8a..ec0f5d8f18c3 100644
> --- a/drivers/hwmon/ad7418.c
> +++ b/drivers/hwmon/ad7418.c
> @@ -19,6 +19,7 @@
>  #include <linux/hwmon-sysfs.h>
>  #include <linux/err.h>
>  #include <linux/mutex.h>
> +#include <linux/of_device.h>
>  #include <linux/delay.h>
>  #include <linux/slab.h>
>  
> @@ -220,7 +221,10 @@ static int ad7418_probe(struct i2c_client *client,
>  
>  	mutex_init(&data->lock);
>  	data->client = client;
> -	data->type = id->driver_data;
> +	if (dev->of_node)
> +		data->type = (enum chips)of_device_get_match_data(dev);
> +	else
> +		data->type = id->driver_data;
>  
>  	switch (data->type) {
>  	case ad7416:
> @@ -258,9 +262,17 @@ static const struct i2c_device_id ad7418_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, ad7418_id);
>  
> +static const struct of_device_id ad7418_dt_ids[] = {
> +	{ .compatible = "adi,ad7416", .data = (void *)ad7416, },
> +	{ .compatible = "adi,ad7417", .data = (void *)ad7417, },
> +	{ .compatible = "adi,ad7418", .data = (void *)ad7418, },
> +};
> +MODULE_DEVICE_TABLE(of, ad7418_dt_ids);
> +
>  static struct i2c_driver ad7418_driver = {
>  	.driver = {
>  		.name	= "ad7418",
> +		.of_match_table = ad7418_dt_ids,
>  	},
>  	.probe		= ad7418_probe,
>  	.id_table	= ad7418_id,
