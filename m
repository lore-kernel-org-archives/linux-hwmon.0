Return-Path: <SRS0=BLaD=4M=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC559C38BFA
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 22:13:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9176B2176D
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 22:13:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vb42nZD4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgBXWNX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Feb 2020 17:13:23 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33155 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbgBXWNX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Feb 2020 17:13:23 -0500
Received: by mail-pf1-f194.google.com with SMTP id n7so6077390pfn.0
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Feb 2020 14:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YCnbU1/edF+qX6XMo7eF8RdF1icrzZlZpN6mtdRpemU=;
        b=vb42nZD4t4M9H28gh/qhPp7xVLoD3+rNIghYH8/msySaXHGXFaWMbgrmtwJBxo7tmV
         2y8K16VJ+J6Vitsxs0aCan3SzFk2q4Uu6NezCpwvxKU2wfH5y9lLxyk6kyYyi6HfmQRw
         6HYW3brH7tePniG/RxuZiipCYPF2Zeo443seRH02kEzE4t1RvEBhc4K3xairnvbof3NE
         LSXnNar2fSsfCpJC4kDvN3O5bU/noVDVlyNhX6p1J/nNDq1bSW+fT3JzF39zylQcdyUP
         KFEgeznIe6XONguIXF+vNjltuFhUMIz/kcR54VTXN/XcWwAeV+RhjU1hNPMqpErVwNhO
         uZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=YCnbU1/edF+qX6XMo7eF8RdF1icrzZlZpN6mtdRpemU=;
        b=Z2oL40WoSrs9P618T6c4DKXn+3FmM3UzioaNd8zh64pPc8JDTwYzhNTRJNZxHy/J5Z
         mPNaBZXl1h4IB+EV0/Dei8l9UJMEEPh10hR5eLO0c+zQexxVtoq3u2szQiX/mILLFxCp
         kDFTookNWoZ14x+XpdDoKYFy4bHgvft0fMRlj2+0fUH5k7dJekYLeaXypl6bAXJH23lt
         j3teMuhKhjO8IW0hEnkeIx778mOdIJbpTnDMX49cpGpHyz05NDL3RGdRIBpqrA4Je6Fi
         g8y/kXp0l2qw6psUul1zveJ+MgZ/fhd3y6bhF7xhrtINzAOBMtSJnJL9qkUyhIzwzJAo
         KAzQ==
X-Gm-Message-State: APjAAAV9blHwOcAQE0Fi+suFqJ+n298WR2asExh8n4PfzbG7HdXvoNnW
        z1S7SwZ31KaS12A1MmOKhFiehO2u
X-Google-Smtp-Source: APXvYqxOExOcECuikJ2XnE8cjfp7/HkzHA5Sc5QPH6EsEJ59OhFcNnWJP7Or1eLUZUEXrXdI+k+w7A==
X-Received: by 2002:a63:5808:: with SMTP id m8mr17945654pgb.252.1582582402406;
        Mon, 24 Feb 2020 14:13:22 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o36sm54925pgl.24.2020.02.24.14.13.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 14:13:21 -0800 (PST)
Date:   Mon, 24 Feb 2020 14:13:20 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [hwmon-next v2] hwmon: (pmbus/xdpe12284) Add callback for vout
 limits conversion
Message-ID: <20200224221320.GA6917@roeck-us.net>
References: <20200224215031.24729-1-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224215031.24729-1-vadimp@mellanox.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Feb 24, 2020 at 11:50:31PM +0200, Vadim Pasternak wrote:
> Provide read_word_data() callback for overvoltage and undervoltage
> output readouts conversion. These registers are presented in
> 'slinear11' format, while default conversion for 'vout' class for the
> devices is 'vid'. It is resulted in wrong conversion in pmbus_reg2data()
> for in{3-4}_lcrit and in{3-4}_crit attributes.
> )
> Fixes: aaafb7c8eb1c ("hwmon: (pmbus) Add support for Infineon Multi-phase xdpe122 family controllers")
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
> v1->v2:
>  Comments pointed out by Guenter:
>  - Drop reg2data() callback, provide conversion through
>    read_word_data() callback instead.
> ---
>  drivers/hwmon/pmbus/xdpe12284.c | 51 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/xdpe12284.c b/drivers/hwmon/pmbus/xdpe12284.c
> index ecd9b65627ec..44b737d0bc24 100644
> --- a/drivers/hwmon/pmbus/xdpe12284.c
> +++ b/drivers/hwmon/pmbus/xdpe12284.c
> @@ -18,6 +18,56 @@
>  #define XDPE122_AMD_625MV		0x10 /* AMD mode 6.25mV */
>  #define XDPE122_PAGE_NUM		2
>  
> +static int xdpe122_read_word_data(struct i2c_client *client, int page,
> +				  int phase, int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	long val;
> +	s16 exponent;
> +	s32 mantissa;
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_VOUT_OV_FAULT_LIMIT:
> +	case PMBUS_VOUT_UV_FAULT_LIMIT:
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* Convert register value to LINEAR11 data. */
> +		exponent = ((s16)ret) >> 11;
> +		mantissa = ((s16)((ret & GENMASK(10, 0)) << 5)) >> 5;
> +		val = mantissa * 1000L;
> +		if (exponent >= 0)
> +			val <<= exponent;
> +		else
> +			val >>= -exponent;
> +
> +		/* Convert data to VID register. */
> +		switch (info->vrm_version[page]) {
> +		case vr13:
> +			if (val >= 500)
> +				return 1 + DIV_ROUND_CLOSEST(val - 500, 10);

			return 0; ?

> +		case vr12:
> +			if (val >= 250)
> +				return 1 + DIV_ROUND_CLOSEST(val - 250, 5);

			return 0; ?

> +		case imvp9:
> +			if (val >= 200)
> +				return 1 + DIV_ROUND_CLOSEST(val - 200, 10);

			return 0; ?
> +		case amd625mv:
> +			if (val >= 200 && val <= 968750)
> +				return DIV_ROUND_CLOSEST((1550 - val) * 100,
> +							 625);
			return 0; ?

Also, are you sure that this calculation is correct ?
1550 - val is almost always negative.

> +		default:
> +			return -EINVAL;
> +		}
> +	default:
> +		return -ENODATA;
> +	}
> +
> +	return 0;
> +}
> +
>  static int xdpe122_identify(struct i2c_client *client,
>  			    struct pmbus_driver_info *info)
>  {
> @@ -70,6 +120,7 @@ static struct pmbus_driver_info xdpe122_info = {
>  		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
>  		PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
>  	.identify = xdpe122_identify,
> +	.read_word_data = xdpe122_read_word_data,
>  };
>  
>  static int xdpe122_probe(struct i2c_client *client,
> -- 
> 2.11.0
> 
