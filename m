Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3684C43334
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Jun 2022 15:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241427AbiFTPVR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 20 Jun 2022 11:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244034AbiFTPUH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Jun 2022 11:20:07 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B076D1EAD1
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jun 2022 08:13:22 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id f16so9113663pjj.1
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jun 2022 08:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=sz5ueT887s3BQafZuZ9V5fBzrdQFEko/KH2JFNgmcvo=;
        b=DOZoK4QBH8I3LuD9aE/0KkE5vndQ0mCo3sp5VB2PA8y+uftSfogw0/W4vKCmgihMxF
         4Nxid3zTlJqui1zzkYgJ+KsF8D4sTQcBKS3iEATLgvGo1ixBwGK4Z3xGsUUJ9iGw0eT8
         JKEVO23gOCHXHR3uig7hF+tyacS1HS/Q0JmCByJe+Y2Pw/1GZrokpMpelLhb6gDj5x+R
         DIvdyAPp1/4m5xVlirAeZkdpsu/jIQmFTpN917Ne8hr5TD4Luwc1uUbCaWzubOP3T3hN
         fGuzxskwZtzH5dO7IK+kC6nLgDsBmXXUbgdha8WgJ3CAg2yXLliitGITdN3Kb+hWVjiO
         EjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=sz5ueT887s3BQafZuZ9V5fBzrdQFEko/KH2JFNgmcvo=;
        b=RMOAsesguDansjIJgSiJO07Ez28f16bLbURlBiG87udS6uiJUu4yzXOBfDzN3OcfaD
         xfy+b+mU4zcstkMLfon7ZXLS/d/o6k5MEoS50ZitNZ22R+b7poa8FxtEaMMHO/f9KLck
         Mpn4EUQGSz47maZ7Tl3AzBBaxn3MjOyFxIio8uHkw/qqJtwnPYgz0VPjaOR+ooERRyZl
         DxlJHMqFaXa06NuO+ctbCkOaQHeKyWM3nHu+ItpgmVLmYrgb5XvKNsGxzvFhFppcVX7/
         Ln94zgVd0U3itpJ9iy9UQDui4KeJOcKawCxoXtLUzRY+qWWd/iZs1bxJwjTK5HjIbIqn
         bk5g==
X-Gm-Message-State: AJIora+l7IAOZmYHecoeHTfPie+YCW5PP7mvFJBBtsI6GJZB4UyrSeil
        ighF59xuhW4zDwGaaksXExo=
X-Google-Smtp-Source: AGRyM1sJk5Np3BJ2nemtdmmezXp/hP4qsBnkmBkhEZ11V8CA/mg7XoPaekqDjxE0bhUGU5aprE+Vhw==
X-Received: by 2002:a17:903:234e:b0:16a:2d02:add7 with SMTP id c14-20020a170903234e00b0016a2d02add7mr2682173plh.10.1655738002171;
        Mon, 20 Jun 2022 08:13:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902c24200b0016a2a8c7e8fsm1673989plg.143.2022.06.20.08.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 08:13:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 20 Jun 2022 08:13:19 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?M=E5rten?= Lindahl <marten.lindahl@axis.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH v3 1/3] hwmon: (pmbus) Introduce and use cached vout
 margins
Message-ID: <20220620151319.GA2571185@roeck-us.net>
References: <20220614093856.3470672-1-marten.lindahl@axis.com>
 <20220614093856.3470672-2-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220614093856.3470672-2-marten.lindahl@axis.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jun 14, 2022 at 11:38:54AM +0200, Mårten Lindahl wrote:
> When setting a new voltage the voltage boundaries are read every time to
> check that the new voltage is within the proper range. Checking these
> voltage boundaries consists of reading one of PMBUS_MFR_VOUT_MIN/
> PMBUS_VOUT_MARGIN_LOW registers and then PMBUS_MFR_VOUT_MAX/
> PMBUS_VOUT_MARGIN_HIGH together with writing the PMBUS_CLEAR_FAULTS
> register.
> 
> Since these boundaries are never being changed, it can be cached and
> thus saving unnecessary smbus transmissions.
> 
> Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 78 +++++++++++++++++++++++++-------
>  1 file changed, 61 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 02912022853d..5e0d16512fa6 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -104,6 +104,9 @@ struct pmbus_data {
>  
>  	s16 currpage;	/* current page, -1 for unknown/unset */
>  	s16 currphase;	/* current phase, 0xff for all, -1 for unknown/unset */
> +
> +	int vout_low[PMBUS_PAGES];	/* voltage low margin */
> +	int vout_high[PMBUS_PAGES];	/* voltage high margin */
>  };
>  
>  struct pmbus_debugfs_entry {
> @@ -2636,6 +2639,58 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
>  	return 0;
>  }
>  
> +static int pmbus_regulator_get_low_margin(struct i2c_client *client, int page)
> +{
> +	struct pmbus_data *data = i2c_get_clientdata(client);
> +	struct pmbus_sensor s = {
> +		.page = page,
> +		.class = PSC_VOLTAGE_OUT,
> +		.convert = true,
> +		.data = -1,
> +	};
> +
> +	if (!data->vout_low[page]) {
> +		if (pmbus_check_word_register(client, page, PMBUS_MFR_VOUT_MIN))
> +			s.data = _pmbus_read_word_data(client, page, 0xff,
> +						       PMBUS_MFR_VOUT_MIN);
> +		if (s.data < 0) {
> +			s.data = _pmbus_read_word_data(client, page, 0xff,
> +						       PMBUS_VOUT_MARGIN_LOW);
> +			if (s.data < 0)
> +				return s.data;
> +		}
> +		data->vout_low[page] = pmbus_reg2data(data, &s);
> +	}
> +
> +	return data->vout_low[page];
> +}
> +
> +static int pmbus_regulator_get_high_margin(struct i2c_client *client, int page)
> +{
> +	struct pmbus_data *data = i2c_get_clientdata(client);
> +	struct pmbus_sensor s = {
> +		.page = page,
> +		.class = PSC_VOLTAGE_OUT,
> +		.convert = true,
> +		.data = -1,
> +	};
> +
> +	if (!data->vout_high[page]) {
> +		if (pmbus_check_word_register(client, page, PMBUS_MFR_VOUT_MAX))
> +			s.data = _pmbus_read_word_data(client, page, 0xff,
> +						       PMBUS_MFR_VOUT_MAX);
> +		if (s.data < 0) {
> +			s.data = _pmbus_read_word_data(client, page, 0xff,
> +						       PMBUS_VOUT_MARGIN_HIGH);
> +			if (s.data < 0)
> +				return s.data;
> +		}
> +		data->vout_high[page] = pmbus_reg2data(data, &s);
> +	}
> +
> +	return data->vout_high[page];
> +}
> +
>  static int pmbus_regulator_get_voltage(struct regulator_dev *rdev)
>  {
>  	struct device *dev = rdev_get_dev(rdev);
> @@ -2671,24 +2726,13 @@ static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
>  
>  	*selector = 0;
>  
> -	if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MIN))
> -		s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_MFR_VOUT_MIN);
> -	if (s.data < 0) {
> -		s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_VOUT_MARGIN_LOW);
> -		if (s.data < 0)
> -			return s.data;
> -	}
> -	low = pmbus_reg2data(data, &s);
> +	low = pmbus_regulator_get_low_margin(client, s.page);
> +	if (low < 0)
> +		return low;
>  
> -	s.data = -1;
> -	if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MAX))
> -		s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_MFR_VOUT_MAX);
> -	if (s.data < 0) {
> -		s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_VOUT_MARGIN_HIGH);
> -		if (s.data < 0)
> -			return s.data;
> -	}
> -	high = pmbus_reg2data(data, &s);
> +	high = pmbus_regulator_get_high_margin(client, s.page);
> +	if (high < 0)
> +		return high;
>  
>  	/* Make sure we are within margins */
>  	if (low > val)
