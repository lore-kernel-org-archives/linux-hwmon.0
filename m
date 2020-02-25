Return-Path: <SRS0=jMON=4N=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7621AC35E01
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Feb 2020 14:46:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4918C2064A
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Feb 2020 14:46:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PX/tsvjp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730486AbgBYOqI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 25 Feb 2020 09:46:08 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36437 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728065AbgBYOqH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Feb 2020 09:46:07 -0500
Received: by mail-pl1-f194.google.com with SMTP id a6so5586074plm.3
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Feb 2020 06:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=W+xx+BCrJ6YH623ezz5HJsKYD6T7FD8Bt0zoDqNSilg=;
        b=PX/tsvjp5wXSzpRGRobTqg4q4tjyTi+DK6oiuzjqKeHf1oUgJoY3eYvU+aFU+taaWl
         Ulrkj165D5i5ugq3LzYJkAKVklC/RF/yzE8q4pqD+1SBJh/6v1MegEEgelgGjWpKVkl0
         xUQD++1+3DFrgYAA/JPOqs4yjPdJilFRxMxp2yVIs5lRf5BGC+wnsgDrZCZlnP0vCfp4
         03vfa28sTvrNZXUGIDkejRj4nbRVOLM3juL2bfqmpDP4AbT42ZF1b7p3VbyEpjtJ7QZP
         RTdl4ESx2H+AtlsHhL64GmDcD+5p09EicxYTZCMFi4cSiO6tizv1FYhjgbJTZRwJFxez
         Kjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=W+xx+BCrJ6YH623ezz5HJsKYD6T7FD8Bt0zoDqNSilg=;
        b=QpR3aLNzHtKAXWdzJO2/HzRBZByiXY/ReJFJQ6GM7ufz+MY4KujaPJtTm0QFJ5TULd
         cKC4BLuz+t/2VqZTDI3uA+XyOZj9rYQm3pT8HsXX7+LOUju4FR5X9vZ+XspDAEbcHhdz
         EML9RXv2+ZeQmbwxS9G5kSy1oiihcTHujyXaTNpxmHolxaTan6SpJr0VmtLx2MtneQQc
         l+lk08wNA/WIaRfNkuu7F/vURQ3gueQ3zgwKMxqmEKIfizI+yymb5FTghLHd8LLjDN7z
         NQQRYKXWAp2Abf90rksGqM72CpuQTOFFMNInEVFi+cvEjptrWsYrsMtmog/UmMoujtwX
         vV1g==
X-Gm-Message-State: APjAAAUlW9EL2TfaR3M2ZfiVbI45QO/iGK/huPb+6e3txwiDBmQ4xpSb
        qcAgT77Srn6c3i6aBcaNtRMBZ6Gj
X-Google-Smtp-Source: APXvYqzXSSIKZGfCi16WkCChGSmKT6NZpEZ6/DS94UfkqCwJZMSqJ2NkzwgibM0+dz54yCELj7CjNA==
X-Received: by 2002:a17:902:b116:: with SMTP id q22mr57182781plr.324.1582641967255;
        Tue, 25 Feb 2020 06:46:07 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k3sm12027301pgh.34.2020.02.25.06.46.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 06:46:06 -0800 (PST)
Date:   Tue, 25 Feb 2020 06:46:05 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [hwmon-next v3] hwmon: (pmbus/xdpe12284) Add callback for vout
 limits conversion
Message-ID: <20200225144605.GA2183@roeck-us.net>
References: <20200224225202.19576-1-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224225202.19576-1-vadimp@mellanox.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Feb 25, 2020 at 12:52:02AM +0200, Vadim Pasternak wrote:
> Provide read_word_data() callback for overvoltage and undervoltage
> output readouts conversion. These registers are presented in
> 'slinear11' format, while default conversion for 'vout' class for the
> devices is 'vid'. It is resulted in wrong conversion in pmbus_reg2data()
> for in{3-4}_lcrit and in{3-4}_crit attributes.
> )
> Fixes: aaafb7c8eb1c ("hwmon: (pmbus) Add support for Infineon Multi-phase xdpe122 family controllers")
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>

Applied (to hwmon, not to hwmon-next - we'll want to have this fixed
in v5.6 and not wait for 5.7).

Thanks,
Guenter

> ---
> v1->v2:
>  Comments pointed out by Guenter:
>  - Drop reg2data() callback, provide conversion through
>    read_word_data() callback instead.
> v2->v3:
>  Comments pointed out by Guenter:
>  - Fix wrong conversion.
>  - Add missed returns.
> ---
>  drivers/hwmon/pmbus/xdpe12284.c | 55 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/xdpe12284.c b/drivers/hwmon/pmbus/xdpe12284.c
> index ecd9b65627ec..d5103fc9e269 100644
> --- a/drivers/hwmon/pmbus/xdpe12284.c
> +++ b/drivers/hwmon/pmbus/xdpe12284.c
> @@ -18,6 +18,60 @@
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
> +			return 0;
> +		case vr12:
> +			if (val >= 250)
> +				return 1 + DIV_ROUND_CLOSEST(val - 250, 5);
> +			return 0;
> +		case imvp9:
> +			if (val >= 200)
> +				return 1 + DIV_ROUND_CLOSEST(val - 200, 10);
> +			return 0;
> +		case amd625mv:
> +			if (val >= 200 && val <= 1550)
> +				return DIV_ROUND_CLOSEST((1550 - val) * 100,
> +							 625);
> +			return 0;
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
> @@ -70,6 +124,7 @@ static struct pmbus_driver_info xdpe122_info = {
>  		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
>  		PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
>  	.identify = xdpe122_identify,
> +	.read_word_data = xdpe122_read_word_data,
>  };
>  
>  static int xdpe122_probe(struct i2c_client *client,
