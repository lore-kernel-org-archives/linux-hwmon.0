Return-Path: <SRS0=CEvc=64=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD1BC433E1
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 May 2020 15:23:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E475206A5
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 May 2020 15:23:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwTlBu2O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgENPXd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 May 2020 11:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbgENPXd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 May 2020 11:23:33 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 611E6C061A0C
        for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2020 08:23:33 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id p21so1359542pgm.13
        for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2020 08:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+E96Qxu+WiBQbXKc/mdqIaSMjibnLc2d/M/snPVQPP4=;
        b=UwTlBu2OFNYEXG5q6MoRPZq0Tqycto/7vnI89mQIBGnyXCHU+Z2kAdtc3J+VDTDZQt
         WojO9L7nxOOc3Oz5EOMNO7Io0J8qho5tHfNB/nNaDY9uTXT8ROECaRMJ7RWI5Oj1yi0S
         DnwY99rtkR/AHHOxROERet5xTV0CEfhUYmmYidF5rQAw6j2jJLhkEEL5XcLdEucwU27x
         EMHa3JCGrb8XXg1ItiBDJwDzEiXIM43MlReLf1zjPbNX0/pClWBeyyCSuqTHmwdLLlVb
         8kiDQAJv2Kwj/7R1nS1CXjL+DAlkEMrVBjPOZEiJw8T+lvIKMaS1D0DvAH4YbkROtIew
         POiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=+E96Qxu+WiBQbXKc/mdqIaSMjibnLc2d/M/snPVQPP4=;
        b=hh+IZ7/fmSO4LrVcR+IZyb76NOKk9klZHBacf8qI8tH8kC+m5UYduhcnWmlFv7bANw
         xCIEoIEhrjGvKITYhXP3u1yD74LFq5J7b2BF7P531mLRZcgqZkDnet9hpLAFNXLjnCai
         KoJuuSaVTtlUGvbZ030ULHuly33jk3Ilb6WEEVgqhyG0tfML/cEvDtflyyNJ+Ch7jWOf
         CATSGGLuIbdxe03XLGR/tRSFqRWAjkDHLTP50F8of0uA4gObmaz1OeIIWUYwYHw8ocmF
         Oa2QTs9dFZFtU+qO0CQA236RZw/ZxvlsRpC55ZhD/DJdeJZzQZOl0P4/IpZSAAnMQp7k
         sc2A==
X-Gm-Message-State: AOAM53105dUaQyTGY706pM7KnkKvShkbOBJy3SHTAhm25HRUJaSMutEE
        GaBOfUQ+fbFOHliLEVrh88RjbGC0
X-Google-Smtp-Source: ABdhPJyjG42prPB7U8t0o/npByZSXPQSpZM2q/bUayildBhZ9DhA5Pu8qu+Xsd/Fb2nU9WcSE8Dp2w==
X-Received: by 2002:a63:747:: with SMTP id 68mr4242334pgh.273.1589469812819;
        Thu, 14 May 2020 08:23:32 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 62sm1523706pfc.204.2020.05.14.08.23.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 08:23:32 -0700 (PDT)
Date:   Thu, 14 May 2020 08:23:31 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Josh Lehan <krellan@google.com>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH] hwmon: (lm90) Add max6654 support to lm90 driver
Message-ID: <20200514152331.GA211957@roeck-us.net>
References: <20200513184248.145765-1-krellan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513184248.145765-1-krellan@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, May 13, 2020 at 11:42:48AM -0700, Josh Lehan wrote:
> Add support for the Maxim MAX6654 to the lm90 driver.
> 
> The MAX6654 is a temperature sensor, similar to the others,
> but with some differences regarding the configuration
> register, and the sampling rate at which extended resolution
> becomes possible.
> 
> Signed-off-by: Josh Lehan <krellan@google.com>

Applied.

Thanks,
Guenter

> ---
>  Documentation/hwmon/lm90.rst | 23 ++++++++++++++++--
>  drivers/hwmon/Kconfig        |  9 ++++----
>  drivers/hwmon/lm90.c         | 45 ++++++++++++++++++++++++++++++++----
>  3 files changed, 67 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/hwmon/lm90.rst b/Documentation/hwmon/lm90.rst
> index 953315987c06..78dfc01b47a2 100644
> --- a/Documentation/hwmon/lm90.rst
> +++ b/Documentation/hwmon/lm90.rst
> @@ -123,6 +123,18 @@ Supported chips:
>  
>  	       http://www.maxim-ic.com/quick_view2.cfm/qv_pk/3497
>  
> +  * Maxim MAX6654
> +
> +    Prefix: 'max6654'
> +
> +    Addresses scanned: I2C 0x18, 0x19, 0x1a, 0x29, 0x2a, 0x2b,
> +
> +			   0x4c, 0x4d and 0x4e
> +
> +    Datasheet: Publicly available at the Maxim website
> +
> +	       https://www.maximintegrated.com/en/products/sensors/MAX6654.html
> +
>    * Maxim MAX6657
>  
>      Prefix: 'max6657'
> @@ -301,6 +313,13 @@ ADT7461, ADT7461A, NCT1008:
>    * Extended temperature range (breaks compatibility)
>    * Lower resolution for remote temperature
>  
> +MAX6654:
> +  * Better local resolution
> +  * Selectable address
> +  * Remote sensor type selection
> +  * Extended temperature range
> +  * Extended resolution only available when conversion rate <= 1 Hz
> +
>  MAX6657 and MAX6658:
>    * Better local resolution
>    * Remote sensor type selection
> @@ -336,8 +355,8 @@ SA56004X:
>  
>  All temperature values are given in degrees Celsius. Resolution
>  is 1.0 degree for the local temperature, 0.125 degree for the remote
> -temperature, except for the MAX6657, MAX6658 and MAX6659 which have a
> -resolution of 0.125 degree for both temperatures.
> +temperature, except for the MAX6654, MAX6657, MAX6658 and MAX6659 which have
> +a resolution of 0.125 degree for both temperatures.
>  
>  Each sensor has its own high and low limits, plus a critical limit.
>  Additionally, there is a relative hysteresis value common to both critical
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 4c62f900bf7e..e950d1f3e110 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1198,10 +1198,11 @@ config SENSORS_LM90
>  	help
>  	  If you say yes here you get support for National Semiconductor LM90,
>  	  LM86, LM89 and LM99, Analog Devices ADM1032, ADT7461, and ADT7461A,
> -	  Maxim MAX6646, MAX6647, MAX6648, MAX6649, MAX6657, MAX6658, MAX6659,
> -	  MAX6680, MAX6681, MAX6692, MAX6695, MAX6696, ON Semiconductor NCT1008,
> -	  Winbond/Nuvoton W83L771W/G/AWG/ASG, Philips SA56004, GMT G781, and
> -	  Texas Instruments TMP451 sensor chips.
> +	  Maxim MAX6646, MAX6647, MAX6648, MAX6649, MAX6654, MAX6657, MAX6658,
> +	  MAX6659, MAX6680, MAX6681, MAX6692, MAX6695, MAX6696,
> +	  ON Semiconductor NCT1008, Winbond/Nuvoton W83L771W/G/AWG/ASG,
> +	  Philips SA56004, GMT G781, and Texas Instruments TMP451
> +	  sensor chips.
>  
>  	  This driver can also be built as a module. If so, the module
>  	  will be called lm90.
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 9b3c9f390ef8..7bdc664af55b 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -35,6 +35,14 @@
>   * explicitly as max6659, or if its address is not 0x4c.
>   * These chips lack the remote temperature offset feature.
>   *
> + * This driver also supports the MAX6654 chip made by Maxim. This chip can
> + * be at 9 different addresses, similar to MAX6680/MAX6681. The MAX6654 is
> + * otherwise similar to MAX6657/MAX6658/MAX6659. Extended range is available
> + * by setting the configuration register accordingly, and is done during
> + * initialization. Extended precision is only available at conversion rates
> + * of 1 Hz and slower. Note that extended precision is not enabled by
> + * default, as this driver initializes all chips to 2 Hz by design.
> + *
>   * This driver also supports the MAX6646, MAX6647, MAX6648, MAX6649 and
>   * MAX6692 chips made by Maxim.  These are again similar to the LM86,
>   * but they use unsigned temperature values and can report temperatures
> @@ -94,8 +102,8 @@
>   * have address 0x4d.
>   * MAX6647 has address 0x4e.
>   * MAX6659 can have address 0x4c, 0x4d or 0x4e.
> - * MAX6680 and MAX6681 can have address 0x18, 0x19, 0x1a, 0x29, 0x2a, 0x2b,
> - * 0x4c, 0x4d or 0x4e.
> + * MAX6654, MAX6680, and MAX6681 can have address 0x18, 0x19, 0x1a, 0x29,
> + * 0x2a, 0x2b, 0x4c, 0x4d or 0x4e.
>   * SA56004 can have address 0x48 through 0x4F.
>   */
>  
> @@ -104,7 +112,7 @@ static const unsigned short normal_i2c[] = {
>  	0x4d, 0x4e, 0x4f, I2C_CLIENT_END };
>  
>  enum chips { lm90, adm1032, lm99, lm86, max6657, max6659, adt7461, max6680,
> -	max6646, w83l771, max6696, sa56004, g781, tmp451 };
> +	max6646, w83l771, max6696, sa56004, g781, tmp451, max6654 };
>  
>  /*
>   * The LM90 registers
> @@ -145,7 +153,7 @@ enum chips { lm90, adm1032, lm99, lm86, max6657, max6659, adt7461, max6680,
>  #define LM90_REG_R_TCRIT_HYST		0x21
>  #define LM90_REG_W_TCRIT_HYST		0x21
>  
> -/* MAX6646/6647/6649/6657/6658/6659/6695/6696 registers */
> +/* MAX6646/6647/6649/6654/6657/6658/6659/6695/6696 registers */
>  
>  #define MAX6657_REG_R_LOCAL_TEMPL	0x11
>  #define MAX6696_REG_R_STATUS2		0x12
> @@ -209,6 +217,7 @@ static const struct i2c_device_id lm90_id[] = {
>  	{ "max6646", max6646 },
>  	{ "max6647", max6646 },
>  	{ "max6649", max6646 },
> +	{ "max6654", max6654 },
>  	{ "max6657", max6657 },
>  	{ "max6658", max6657 },
>  	{ "max6659", max6659 },
> @@ -269,6 +278,10 @@ static const struct of_device_id __maybe_unused lm90_of_match[] = {
>  		.compatible = "dallas,max6649",
>  		.data = (void *)max6646
>  	},
> +	{
> +		.compatible = "dallas,max6654",
> +		.data = (void *)max6654
> +	},
>  	{
>  		.compatible = "dallas,max6657",
>  		.data = (void *)max6657
> @@ -367,6 +380,11 @@ static const struct lm90_params lm90_params[] = {
>  		.max_convrate = 6,
>  		.reg_local_ext = MAX6657_REG_R_LOCAL_TEMPL,
>  	},
> +	[max6654] = {
> +		.alert_alarms = 0x7c,
> +		.max_convrate = 7,
> +		.reg_local_ext = MAX6657_REG_R_LOCAL_TEMPL,
> +	},
>  	[max6657] = {
>  		.flags = LM90_PAUSE_FOR_CONFIG,
>  		.alert_alarms = 0x7c,
> @@ -1557,6 +1575,16 @@ static int lm90_detect(struct i2c_client *client,
>  		 && (config1 & 0x3f) == 0x00
>  		 && convrate <= 0x07) {
>  			name = "max6646";
> +		} else
> +		/*
> +		 * The chip_id of the MAX6654 holds the revision of the chip.
> +		 * The lowest 3 bits of the config1 register are unused and
> +		 * should return zero when read.
> +		 */
> +		if (chip_id == 0x08
> +		 && (config1 & 0x07) == 0x00
> +		 && convrate <= 0x07) {
> +			name = "max6654";
>  		}
>  	} else
>  	if (address == 0x4C
> @@ -1660,6 +1688,15 @@ static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
>  	if (data->kind == max6680)
>  		config |= 0x18;
>  
> +	/*
> +	 * Put MAX6654 into extended range (0x20, extend minimum range from
> +	 * 0 degrees to -64 degrees). Note that extended resolution is not
> +	 * possible on the MAX6654 unless conversion rate is set to 1 Hz or
> +	 * slower, which is intentionally not done by default.
> +	 */
> +	if (data->kind == max6654)
> +		config |= 0x20;
> +
>  	/*
>  	 * Select external channel 0 for max6695/96
>  	 */
