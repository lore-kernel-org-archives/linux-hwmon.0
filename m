Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121D5C433F5
	for <linux-hwmon@archiver.kernel.org>; Sun,  2 Oct 2022 15:07:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiJBPHt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 2 Oct 2022 11:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbiJBPHs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Oct 2022 11:07:48 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5723303C0
        for <linux-hwmon@vger.kernel.org>; Sun,  2 Oct 2022 08:07:47 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id l1-20020a17090a72c100b0020a6949a66aso3478027pjk.1
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Oct 2022 08:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date;
        bh=uKeVm+M+zpLWzLK3mw/d5sixxjQfDI/96vmATwhLr7o=;
        b=IqGky4/w6+3gUqE20J8k5ic8SfNnbj67zfoXlIzA+TaTRaSYHe6LeIA0PWEEQ3hNas
         yThHidUM12lyBCbsiuz8CrytYBcgq8cea9l/2WQ93L7CZvUZMovnlsQ7Ojm6xwPW7n5t
         10eQTM4bJsK1pyXGT20JJtqlVQrj5dUbhm0Z4MUuhTvRj3o9TZU0T6P6fOJHLfEc89JR
         VqO0qNInlB4IIHH0ymK9xHfAup2m829zhbuyF5EEiIqp+Km9zsyPSaRsYSk/VJoLDLNK
         Q2yLexWfEVOgFKktyv44S4Lvkr/ZsYm19NxkMOftzCNYyScZgAdvW+sXLYiEruTl8tPy
         11MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=uKeVm+M+zpLWzLK3mw/d5sixxjQfDI/96vmATwhLr7o=;
        b=hX50vrebxcx2CPata0Zx7g6S1caD5ZSpwicPkilhy76+00T1tM3dMCu1zrX7wgvlQ1
         fdyI9NBmx52X76/KRmSx3VoXz+LvkZ3ZwOa395Yn3j9aoxWRalX3md8w/aXFyg3yrqBK
         6++271lIw4N+gZf2JvKnFwCKny8kTouZmyn9P05Q0OJyBwieZdASOieaY3CWw313iAei
         eNsMaJOWa1F20S9y2ApY9FTcDs+hmljPZsABYJtHptyjmRiPGJd/dppl0PNizgC+ixN7
         l7+iyjiRRpMjdM8A+hA0CnOmehjpmp+f/aereZt/w04x5i/j9NWSKSUFglH1lkmTqbvN
         JQBg==
X-Gm-Message-State: ACrzQf0W+cSCugfubo5o1QOG18I8rcA17EqBr9cG7AKaB+CpNtLIxNgU
        Fl38W+aQuu6aWDbJCfwe6GjSXSAfHgi4BQ==
X-Google-Smtp-Source: AMsMyM6xZnLXwfTcDLSgeRt8VIDOauou/r1lARJHcINpmrLElTDtxPQq7frabO71/NN+K8UZwYMEKg==
X-Received: by 2002:a17:902:da8b:b0:178:3980:4597 with SMTP id j11-20020a170902da8b00b0017839804597mr18580838plx.113.1664723267424;
        Sun, 02 Oct 2022 08:07:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y5-20020a17090a154500b0020a71ca2cb8sm2741981pja.56.2022.10.02.08.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 08:07:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 2 Oct 2022 08:07:45 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Oleksandr Shamray <oleksandrs@nvidia.com>
Cc:     linux-hwmon@vger.kernel.org, vadimp@nvidia.com
Subject: Re: [PATCH hwmon 1/1] hwmon: (pmbus) Fix sensors readouts for MPS
 Multi-phase mp2888 controller
Message-ID: <20221002150745.GA2896604@roeck-us.net>
References: <20220929121642.63051-1-oleksandrs@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220929121642.63051-1-oleksandrs@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 29, 2022 at 03:16:42PM +0300, Oleksandr Shamray wrote:
> Fix scale factors for reading MPS Multi-phase mp2888 controller.
> Fixed sensors:
>     - PIN/POUT: based on vendor documentation, set bscale factor 0.5W/LSB
>     - IOUT: based on vendor documentation, set scale factor 0.25 A/LSB
> 
> Fixes: e4db7719d037 ("hwmon: (pmbus) Add support for MPS Multi-phase mp2888 controller")
> Signed-off-by: Oleksandr Shamray <oleksandrs@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/mp2888.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/mp2888.c b/drivers/hwmon/pmbus/mp2888.c
> index 8ecd4adfef40..529eb3c95bb6 100644
> --- a/drivers/hwmon/pmbus/mp2888.c
> +++ b/drivers/hwmon/pmbus/mp2888.c
> @@ -109,7 +109,7 @@ mp2888_read_phase(struct i2c_client *client, struct mp2888_data *data, int page,
>  	 * - Kcs is the DrMOS current sense gain of power stage, which is obtained from the
>  	 *   register MP2888_MFR_VR_CONFIG1, bits 13-12 with the following selection of DrMOS
>  	 *   (data->curr_sense_gain):
> -	 *   00b - 5µA/A, 01b - 8.5µA/A, 10b - 9.7µA/A, 11b - 10µA/A.
> +	 *   00b - 8.5µA/A, 01b - 9.7µA/A, 1b - 10µA/A, 11b - 5µA/A.
>  	 * - Rcs is the internal phase current sense resistor. This parameter depends on hardware
>  	 *   assembly. By default it is set to 1kΩ. In case of different assembly, user should
>  	 *   scale this parameter by dividing it by Rcs.
> @@ -118,10 +118,9 @@ mp2888_read_phase(struct i2c_client *client, struct mp2888_data *data, int page,
>  	 * because sampling of current occurrence of bit weight has a big deviation, especially for
>  	 * light load.
>  	 */
> -	ret = DIV_ROUND_CLOSEST(ret * 100 - 9800, data->curr_sense_gain);
> -	ret = (data->phase_curr_resolution) ? ret * 2 : ret;
> +	ret = DIV_ROUND_CLOSEST(ret * 200 - 19600, data->curr_sense_gain);
>  	/* Scale according to total current resolution. */
> -	ret = (data->total_curr_resolution) ? ret * 8 : ret * 4;
> +	ret = (data->total_curr_resolution) ? ret * 2 : ret;
>  	return ret;
>  }
>  
> @@ -212,7 +211,7 @@ static int mp2888_read_word_data(struct i2c_client *client, int page, int phase,
>  		ret = pmbus_read_word_data(client, page, phase, reg);
>  		if (ret < 0)
>  			return ret;
> -		ret = data->total_curr_resolution ? ret * 2 : ret;
> +		ret = data->total_curr_resolution ? ret  : DIV_ROUND_CLOSEST(ret, 2);
>  		break;
>  	case PMBUS_POUT_OP_WARN_LIMIT:
>  		ret = pmbus_read_word_data(client, page, phase, reg);
> @@ -223,7 +222,7 @@ static int mp2888_read_word_data(struct i2c_client *client, int page, int phase,
>  		 * set 1. Actual power is reported with 0.5W or 1W respectively resolution. Scaling
>  		 * is needed to match both.
>  		 */
> -		ret = data->total_curr_resolution ? ret * 4 : ret * 2;
> +		ret = data->total_curr_resolution ? ret * 2 : ret;
>  		break;
>  	/*
>  	 * The below registers are not implemented by device or implemented not according to the
