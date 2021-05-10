Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEDCC433ED
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 May 2021 16:48:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC9D16115C
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 May 2021 16:48:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbhEJQt0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 May 2021 12:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbhEJQtX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 May 2021 12:49:23 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80691C061574;
        Mon, 10 May 2021 09:48:18 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so15002779otp.11;
        Mon, 10 May 2021 09:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P2HEZ75e+lZ1ispunoMvDeRLz/uth+i6u9sIHIvo2CM=;
        b=RQxRiIWS6BHQqxDvFPrgw0k60h1rzjjlTJa1WjR8jdfp7V+iN9uABo8Wf2kYvG+aqN
         5KGPbZoO+te5wt7YYJaMecacxG08SKEbUmlUusZYhgPD8zVXYhQFKhZPG1MbK8Wgg3sX
         mUq/rWn3ttM/euM9JLetpHqakiPOugl3USlxltddUhpgNpsRYy1wJA9TynQSFUL7fHRo
         pgRdGoDp2ZJwKpZ2lPiAznXu+No6QAxQof/ESgdzqASUwHh5GXtMuQt1nYNOnyJ7a03g
         I0OnWBqPTPspWI+ayGYSEe8XMMDm/hHiLcRb6vbDOMWw/rhJoY+HrfrG+6Pu5mXocFT5
         mxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=P2HEZ75e+lZ1ispunoMvDeRLz/uth+i6u9sIHIvo2CM=;
        b=gka7PQ0K6DnNw2322ZTMbmPiXqh0RHku1hLJutLzAhgOY29UO3QtLnUOfHVm2fvkO9
         IcwATKllbsUnfwJfQH1uZlXs1IkEMSXgXxwRWQGimdNZUAAxVbtOBkB/5R8J3wD+F3+0
         LK06MJhAYuvyW8spb0hGY87dIjPCq5zWzQteKO4ohAvVfeQwIyPgz+l08L0Ydhz55BW+
         CW6h3uFcv/N57978m0OTpIvYKBh/M5BX816sT9EbJ192pL5MSQNvlMlIMjarXTATMAZk
         CJwAK6DOgtCib2lmFW9nhn+X47+bjndhpbWXrggKVwMABHuhis5JuAjj35i74X+LDWrb
         ga2A==
X-Gm-Message-State: AOAM531nYhFBsbk1rjbdvLcFd6WeUcjKXYbCTQvoz9vdPlawNwiTRUCA
        Kf8SYbsqUQTy5EGqRrGywVk/QdQr+1A=
X-Google-Smtp-Source: ABdhPJwvLaAVlS65cGGsLO2Wr+CSWtbJ/N7ZeelXzj6ujb1hHFy/FDH3IygASnM0yZkGBF13ORircA==
X-Received: by 2002:a05:6830:1311:: with SMTP id p17mr8166388otq.224.1620665297859;
        Mon, 10 May 2021 09:48:17 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y191sm1797399oia.50.2021.05.10.09.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 09:48:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 10 May 2021 09:48:16 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     robh+dt@kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH hwmon-next v6 2/3] hwmon: (pmbus) Add support for MPS
 Multi-phase mp2888 controller
Message-ID: <20210510164816.GA882936@roeck-us.net>
References: <20210507171421.425817-1-vadimp@nvidia.com>
 <20210507171421.425817-3-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210507171421.425817-3-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, May 07, 2021 at 08:14:20PM +0300, Vadim Pasternak wrote:
> Add support for mp2888 device from Monolithic Power Systems, Inc. (MPS)
> vendor. This is a digital, multi-phase, pulse-width modulation
> controller.
> 
> This device supports:
> - One power rail.
> - Programmable Multi-Phase up to 10 Phases.
> - PWM-VID Interface
> - One pages 0 for telemetry.
> - Programmable pins for PMBus Address.
> - Built-In EEPROM to Store Custom Configurations.
> - Can configured VOUT readout in direct or VID format and allows
>   setting of different formats on rails 1 and 2. For VID the following
>   protocols are available: VR13 mode with 5-mV DAC; VR13 mode with
>   10-mV DAC, IMVP9 mode with 5-mV DAC.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
> v5->v6
>  Comments pointed out by Guenter:
>  - Fix comments for limits in mp2888_read_word_data().
>  - Remove unnecessary typecasts from mp2888_write_word_data().
> 
> v4->v5
>  Comments pointed out by Guenter:
>  - Fix calculation of PMBUS_READ_VIN.
>  - Add mp2888_write_word_data() for limits setting.
>  - Treat PMBUS_POUT_OP_WARN_LIMIT in separate case.
>  - Drop tuning of "m[PSC_POWER]" and "m[PSC_CURRENT_OUT]" from probing
>    routine.
>  Fixes from Vadim:
>  - Treat PMBUS_IOUT_OC_WARN_LIMIT in separate case.
> 
> v3->v4
>  Comments pointed out by Guenter:
>   - Fix PMBUS_READ_VIN and limits calculations.
>   - Add comment for PMBUS_OT_WARN_LIMIT scaling.
>   - Fix PMBUS_READ_IOUT, PMBUS_READ_POUT, PMBUS_READ_PIN calculations.
>   - Enable PMBUS_IOUT_OC_WARN_LIMIT and PMBUS_POUT_OP_WARN_LIMIT.
>  Fixes from Vadim:
>   - Disable PMBUS_POUT_MAX. Device uses this register for different
>     purpose.
>   - Disable PMBUS_MFR_VOU_MIN. Device doe not implement this register.
>   - Update documentation file.
> 
> v2->v3
>  Comments pointed out by Guenter:
>  - Fix precision for PMBUS_READ_VIN (it requires adding scale for
>    PMBUS_VIN_OV_FAULT_LIMIT and PMBUS_VIN_UV_WARN_LIMIT.
>  - Fix precision for PMBUS_READ_TEMPERATURE_1 (it requires adding
>    scale for PMBUS_OT_WARN_LIMIT).
>  - Use DIV_ROUND_CLOSEST_ULL for scaling PMBUS_READ_POUT,
>    PMBUS_READ_PIN readouts.
>  Notes and fixes from Vadim:
>   - READ_IOUT in linear11 does not give write calculation (tested with
>     external load), while in direct format readouts are correct.
>   - Disable non-configured phases in mp2888_identify_multiphase().
> 
> v1->v2:
>  Comments pointed out by Guenter:
>   - Use standard access for getting PMBUS_OT_WARN_LIMIT,
>     PMBUS_VIN_OV_FAULT_LIMIT, PMBUS_VIN_UV_WARN_LIMIT.
>   - Use linear11 conversion for PMBUS_READ_VIN, PMBUS_READ_POUT,
>     PMBUS_READ_PIN, PMBUS_READ_TEMPERATURE_1 and adjust coefficients.
>   - Add reading phases current from the dedicated registers.
>   - Add comment for not implemented or implemented not according to the
> 	spec registers, for which "ENXIO" code is returned.
>   - Set PMBUS_HAVE_IOUT" statically.
>   Notes from Vadim:
>   - READ_IOUT uses direct format, so I did not adjust it like the below
>     registers.
> ---

[ ... ]

> +
> +static int mp2888_write_word_data(struct i2c_client *client, int page, int reg, u16 word)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct mp2888_data *data = to_mp2888_data(info);
> +
> +	switch (reg) {
> +	case PMBUS_OT_WARN_LIMIT:
> +		word = DIV_ROUND_CLOSEST((int)word, MP2888_TEMP_UNIT);

Sorry if I am missing something, but why those typecasts here and below ?

> +		/* Drop unused bits 15:8. */
> +		word = clamp_val(word, 0, GENMASK(7, 0));
> +		break;
> +	case PMBUS_IOUT_OC_WARN_LIMIT:
> +		/* Fix limit according to total curent resolution. */
> +		word = data->total_curr_resolution ? DIV_ROUND_CLOSEST((int)word, 8) :
> +		       DIV_ROUND_CLOSEST((int)word, 4);
> +		/* Drop unused bits 15:10. */
> +		word = clamp_val(word, 0, GENMASK(9, 0));
> +		break;
> +	case PMBUS_POUT_OP_WARN_LIMIT:
> +		/* Fix limit according to total curent resolution. */
> +		word = data->total_curr_resolution ? DIV_ROUND_CLOSEST((int)word, 4) :
> +		       DIV_ROUND_CLOSEST((int)word, 2);
> +		/* Drop unused bits 15:10. */
> +		word = clamp_val(word, 0, GENMASK(9, 0));
> +		break;
> +	default:
> +		return -ENODATA;
> +	}
> +	return pmbus_write_word_data(client, page, reg, word);
> +}
> +
> +static int
> +mp2888_identify_multiphase(struct i2c_client *client, struct mp2888_data *data,
> +			   struct pmbus_driver_info *info)
> +{
> +	int i, ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Identify multiphase number - could be from 1 to 10. */
> +	ret = i2c_smbus_read_word_data(client, MP2888_MFR_VR_CONFIG1);
> +	if (ret <= 0)
> +		return ret;
> +
> +	info->phases[0] = ret & GENMASK(3, 0);
> +
> +	/*
> +	 * The device provides a total of 10 PWM pins, and can be configured to different phase
> +	 * count applications for rail.
> +	 */
> +	if (info->phases[0] > MP2888_MAX_PHASE)
> +		return -EINVAL;
> +
> +	/* Disable non-configured phases. */
> +	for (i = info->phases[0]; i < MP2888_MAX_PHASE; i++)
> +		info->pfunc[i] = 0;

Not that it matters much, but this is unnecessary since the pmbus core
won't look at phase data beyond info->phases[].

Guenter
