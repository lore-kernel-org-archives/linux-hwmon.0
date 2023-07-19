Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B71EB64DC
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jul 2023 03:00:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbjGSDAH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Jul 2023 23:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbjGSDAG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Jul 2023 23:00:06 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4132C130
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Jul 2023 20:00:04 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-262e81f6154so3255131a91.2
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Jul 2023 20:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689735604; x=1692327604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nt5cG9LsHBDSm179WaWSN0XkcAe53cFiBA5k7HxjP6g=;
        b=E844b9bQNJelEWIAZX08ePhlk4aQRPhodZ+aP9utRPUvKg0brg9n07R8+6EiwXJcet
         WtrBHzDXnXqt++mjzoVFA3Vl0RZgqsme6HERYeGQLp0G+79UQbZzwhEHFZhVqSmGFOQx
         TTLiqxJv9xIdwbjqvIzaEpicjq+CTTNkM1YEDoJe/+n9dlKecwxllxrXd8vALOjud5Xq
         OgoON4+ZjVZDmvV8hlj0Wh9uZH0JpdOrtT5tNw4whJ2JSQlAUBfklS1Jv5MqKIpJe0hZ
         OHvyKB/09SV6WkbAeOQkBcgaR1D5ZF9WUHOeqsqIC1fWQUuNUze7mFCL4oLrGjHss9QX
         +L7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689735604; x=1692327604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nt5cG9LsHBDSm179WaWSN0XkcAe53cFiBA5k7HxjP6g=;
        b=fqEAjmd8VsmLXtvGyeWXdjBHtyn5mUyNljk5+AC4yi+y5L5H+fVcf0d2C1DvoWKeji
         4hx56dNUg6vJK7fhTxVNBG+/0zT4Tl4yDqE6PBSdadXbDIWO6VhHz1zcTMM1RpoUx+Vb
         Q0TkdGdAUzGXDMIuAfQCnsZZjE31aCL3e8OCluin8EGZXqWVAxRqT/veqJTh7wtq7xd9
         zP7ub8pWdCCdrSN/UZRCGpD1JmcZeijs+/705RIdES0PHiv6El/0rNSDr2hOLyXL3jgq
         mkVA3Gr23adbI3gD41/DaYZk/g5eyS32XhTHUQSXLzJ0SH3ML8sOdoK9hLE++1yVM5J4
         6LZg==
X-Gm-Message-State: ABy/qLbyTlLx0BBErD9YPOJuzn43AYPrMrOwrtCpyvNa9JoES6vCo1zL
        VnmwLG3jv8f5U3ONBEw1ol3hROCg6rc=
X-Google-Smtp-Source: APBJJlH0Pz/4QCSHMj/KdA8PpsMGsIPER6KKRO68bmytlO7rdjT2u4U8ADDXnxNMdkwrv9CU0OTePw==
X-Received: by 2002:a17:90b:4b0c:b0:25e:bac2:314c with SMTP id lx12-20020a17090b4b0c00b0025ebac2314cmr14806195pjb.23.1689735603606;
        Tue, 18 Jul 2023 20:00:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l8-20020a17090aec0800b00260cce91d20sm232869pjy.33.2023.07.18.20.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 20:00:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 18 Jul 2023 20:00:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (it87) Add support to detect sensor type
 AMDTSI
Message-ID: <3688aac4-60d6-49e6-9e99-b445be446e82@roeck-us.net>
References: <20230707123005.956415-1-frank@crawford.emu.id.au>
 <20230707123005.956415-4-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707123005.956415-4-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jul 07, 2023 at 10:29:52PM +1000, Frank Crawford wrote:
> Add test for sensor type AMDTSI which is available on certain recent
> chipsets.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

Applied.

Thanks,
Guenter

> ---
> 
> v2:
>  * Split single patch into multi-patch set following review.
> 
> ---
>  drivers/hwmon/it87.c | 35 +++++++++++++++++++++++++++++++----
>  1 file changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index fb62f2a7017a..ba75f33301ce 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -221,6 +221,10 @@ static bool fix_pwm_polarity;
>   * Super-I/O configuration space.
>   */
>  #define IT87_REG_VID           0x0a
> +
> +/* Interface Selection register on other chips */
> +#define IT87_REG_IFSEL         0x0a
> +
>  /*
>   * The IT8705F and IT8712F earlier than revision 0x08 use register 0x0b
>   * for fan divisors. Later IT8712F revisions must use 16-bit tachometer
> @@ -1170,14 +1174,37 @@ static int get_temp_type(struct it87_data *data, int index)
>  	 * 0 = disabled
>  	 */
>  	u8 reg, extra;
> -	int type = 0;
> +	int ttype, type = 0;
> +
> +	/* Detect PECI vs. AMDTSI */
> +	ttype = 6;
> +	if ((has_temp_peci(data, index)) || data->type == it8721 ||
> +	    data->type == it8720) {
> +		extra = it87_read_value(data, IT87_REG_IFSEL);
> +		if ((extra & 0x70) == 0x40)
> +			ttype = 5;
> +	}
>  
> -	reg = data->sensor;	/* In case value is updated while used */
> -	extra = data->extra;
> +	reg = it87_read_value(data, IT87_REG_TEMP_ENABLE);
> +
> +	/* Per chip special detection */
> +	switch (data->type) {
> +	case it8622:
> +		if (!(reg & 0xc0) && index == 3)
> +			type = ttype;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (type || index >= 3)
> +		return type;
> +
> +	extra = it87_read_value(data, IT87_REG_TEMP_EXTRA);
>  
>  	if ((has_temp_peci(data, index) && (reg >> 6 == index + 1)) ||
>  	    (has_temp_old_peci(data, index) && (extra & 0x80)))
> -		type = 6;	/* Intel PECI */
> +		type = ttype;	/* Intel PECI or AMDTSI */
>  	else if (reg & BIT(index))
>  		type = 3;	/* thermal diode */
>  	else if (reg & BIT(index + 3))
