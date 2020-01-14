Return-Path: <SRS0=c1px=3D=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED18C33CB1
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jan 2020 14:07:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE0CB24672
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jan 2020 14:07:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyS1kaNy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbgANOHV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jan 2020 09:07:21 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42492 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgANOHV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jan 2020 09:07:21 -0500
Received: by mail-pg1-f196.google.com with SMTP id s64so6436108pgb.9;
        Tue, 14 Jan 2020 06:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MXtqkO1dDJfeO67YPysiyS6dQCmc2YXDGOZ28v/f9bg=;
        b=QyS1kaNyMl2x2crXNmIOY9pcUXkqIrHPgJ4JdVX4Lgf1hN1bbRZ/VRIYxyxCRqbgBp
         QUxg9MeAus5EFcEJCfxiWij3XC/7YxPy8f3Doj0dqoqOGvFu2slEZ+EPmQfTJfHR2ZUe
         1bLdMedOSn40YduvWDUcOT/8ycICb06sWKpPu6YMOrm3GRGR/W1CUj3JivRFLmMBc5ZM
         yX9CzpZIVGHzmG4s5t8FdbwgjPTcfgcF/Dzy0H1kj18szNEiO0lkjwc5ewJTKOwy+LRo
         V1Uf7Bn8nlQgg7Hh/jUkSA2dO7heu6Rx8FlXxeugiUc+ddLQ7J0yjutI0HGgqSv+Q80a
         x4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=MXtqkO1dDJfeO67YPysiyS6dQCmc2YXDGOZ28v/f9bg=;
        b=Pw0qBYljEzVMHN07bY3vPNgI+IQjCfaDp8ui3TzvQTICWx2Aea/BUPCZDZSF0qQyVS
         SDAG/VngY3bOOCjDjtFqT/3jZLmCY4OZ4wPrqGRuzLM7l4GsRg6civ7XshH051tOCFZT
         HdQ0/UsJr+eIom1Ao63bY2D7xETXWoa9EF7NXtjIp9og64Q5IrCPWw6EK93B8P/MUOW8
         Ez/lwlFLGN/etMcG7awooAw11tgh8QCbLBklNK2P21BXswd8qOZ86q+2ymw8P+KVBufG
         t78bHmVlLPIpkLxrYTH4R/u6dXdPm4y/FhrNJgOPniPXW27Ne8PhY2mKC0pZ6X22PMem
         KMcQ==
X-Gm-Message-State: APjAAAUrYD0Rn89G+frM3kLe9vm1zq+L93wIIAhoOhG8089KX31pgVcY
        MtNFRdIMyKiyd0h13byYpuA=
X-Google-Smtp-Source: APXvYqz/UEOKISZb7tAS02Y9AZ9F98yLLgjVfOAp2V1D0QaVpO6b07+LWJcILn2lRBxkxzu2+pTiXA==
X-Received: by 2002:a63:eb02:: with SMTP id t2mr27124259pgh.289.1579010840252;
        Tue, 14 Jan 2020 06:07:20 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b65sm18292144pgc.18.2020.01.14.06.07.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 06:07:19 -0800 (PST)
Date:   Tue, 14 Jan 2020 06:07:18 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     robh+dt@kernel.org, vijaykhemka@fb.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH hwmon-next v1 3/6] hwmon: (pmbus/tps53679) Extend device
 list supported by driver
Message-ID: <20200114140718.GA16519@roeck-us.net>
References: <20200113150841.17670-1-vadimp@mellanox.com>
 <20200113150841.17670-4-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113150841.17670-4-vadimp@mellanox.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jan 13, 2020 at 03:08:38PM +0000, Vadim Pasternak wrote:
> Extends driver with support of the additional devices:
> Texas Instruments Dual channel DCAP+ multiphase controllers: TPS53688.
> 
> Extend Kconfig with added device.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/Kconfig    | 4 ++--
>  drivers/hwmon/pmbus/tps53679.c | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 59859979571d..0dd30b07bf18 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -200,10 +200,10 @@ config SENSORS_TPS40422
>  	  be called tps40422.
>  
>  config SENSORS_TPS53679
> -	tristate "TI TPS53679"
> +	tristate "TI TPS53679, TPS53688"
>  	help
>  	  If you say yes here you get hardware monitoring support for TI
> -	  TPS53679.
> +	  TPS53679, TPS53688
>  
>  	  This driver can also be built as a module. If so, the module will
>  	  be called tps53679.
> diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
> index 163e8c6aaa8e..9c22e9013dd7 100644
> --- a/drivers/hwmon/pmbus/tps53679.c
> +++ b/drivers/hwmon/pmbus/tps53679.c
> @@ -85,6 +85,7 @@ static int tps53679_probe(struct i2c_client *client,
>  
>  static const struct i2c_device_id tps53679_id[] = {
>  	{"tps53679", 0},
> +	{"tps53688", 0},
>  	{}
>  };
>  
> @@ -92,6 +93,7 @@ MODULE_DEVICE_TABLE(i2c, tps53679_id);
>  
>  static const struct of_device_id __maybe_unused tps53679_of_match[] = {
>  	{.compatible = "ti,tps53679"},
> +	{.compatible = "ti,tps53688"},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, tps53679_of_match);
