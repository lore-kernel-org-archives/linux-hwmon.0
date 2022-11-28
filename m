Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04625C433FE
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Nov 2022 22:19:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234547AbiK1WTR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 28 Nov 2022 17:19:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234545AbiK1WTJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Nov 2022 17:19:09 -0500
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 514293057C;
        Mon, 28 Nov 2022 14:19:08 -0800 (PST)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-1433ef3b61fso14812736fac.10;
        Mon, 28 Nov 2022 14:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pu0q+HWxwnLB/rXjaRUFdWxXMpSKVwg7Nrm/lHOYDIk=;
        b=huMNvsvLNpauKzxhlT93lfa2kSazpUtaBVmMGrzgJH2HbHfe+AucVovkDF6ZVJS666
         kc2FeYEIGq3JmGlThXJUhiiYnfWcyTZc1uFx01Wel1Sj9RDf/fwpf1yfivMEyJENGNkW
         emMaqyZo8DV79wdmM2u1zTcsA/h52kXkJwvsrG6fvTYW5KzmftIhX1Bzqpaajb1gFWy3
         9W/ME5EymNu1bVeLO2e0wqb5mWD9HjD+eklJh1xadf2tPt/O7uAQY4QLQTTKeUTqy+Vg
         1QOcNYqMK7KAvithR0rTD/UG4NKcPLY4xZHfLEDkZ78iOI7dlGiAZyZt1LhHdyWyXTgY
         gk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pu0q+HWxwnLB/rXjaRUFdWxXMpSKVwg7Nrm/lHOYDIk=;
        b=JP5lEoq3KTiH1MnAbK36rsO9JvqTPgcar+kTisezEPe/n6xBZrHqK7CdXbsUy0p1x1
         T/Wigw3K9FBahigLccRuFyigJxG7l2Ory7ZQ1iIUrfYtDPR+tIDZlFedKHspIILz4Ipx
         aB7THZPvCYEwDYhGi3LIym1OOVk2FPl62M7DMwazVLNQztNXvh2LujlCWY1FOgJ5Hcqb
         PV99aC2iZWga4QSKpwlbTae6ttrrc0THQ09AZghn97mDmf/rQsxYxsE1lYbJN/IlbJt4
         Cgm/HG31bL78EAogAeV7Yi7PqYD2RQNUm+EW9OpbsqSAagAH3yLUL0IQKyHQFjRf2p8O
         flMQ==
X-Gm-Message-State: ANoB5pm73jmTcVPd8uN4VNMI3cMchNFKI0eX8owupyfmtYeVYpajRsL6
        aOW7j+rcD+ZYa227mdPDl0M=
X-Google-Smtp-Source: AA0mqf4cShUIWxmSfAvWYismzxA0c9l/1WUuAO0i+loxg4tMvHUYBKddzVL75y0dMwJT0BL7Sr/54g==
X-Received: by 2002:a05:6870:5387:b0:143:58c3:e6c5 with SMTP id h7-20020a056870538700b0014358c3e6c5mr12547979oan.182.1669673947690;
        Mon, 28 Nov 2022 14:19:07 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k4-20020a9d1984000000b00661ad8741b4sm5268086otk.24.2022.11.28.14.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 14:19:07 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 28 Nov 2022 14:19:06 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>
Cc:     w_armin@gmx.de, hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, pobrn@protonmail.com
Subject: Re: [PATCH] hwmon: (oxp-sensors) Bugfix pwm reading
Message-ID: <20221128221906.GA1882598@roeck-us.net>
References: <20221128185206.212022-1-samsagax@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221128185206.212022-1-samsagax@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Nov 28, 2022 at 03:52:06PM -0300, Joaquín Ignacio Aramendía wrote:
> PWM reading is only 1 register long.
> 
> Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/oxp-sensors.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> 
> base-commit: 9494c53e1389b120ba461899207ac8a3aab2632c
> 
> diff --git a/drivers/hwmon/oxp-sensors.c b/drivers/hwmon/oxp-sensors.c
> index c04277676b72..f84ec8f8eda9 100644
> --- a/drivers/hwmon/oxp-sensors.c
> +++ b/drivers/hwmon/oxp-sensors.c
> @@ -158,7 +158,7 @@ static int oxp_platform_read(struct device *dev, enum hwmon_sensor_types type,
>  	case hwmon_pwm:
>  		switch (attr) {
>  		case hwmon_pwm_input:
> -			ret = read_from_ec(OXP_SENSOR_PWM_REG, 2, val);
> +			ret = read_from_ec(OXP_SENSOR_PWM_REG, 1, val);
>  			if (ret)
>  				return ret;
>  			if (board == oxp_mini_amd)
