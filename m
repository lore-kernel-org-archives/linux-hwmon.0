Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F028C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Oct 2021 22:50:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0841C60F9E
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Oct 2021 22:50:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243395AbhJOWwI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 Oct 2021 18:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233190AbhJOWwI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Oct 2021 18:52:08 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54040C061570;
        Fri, 15 Oct 2021 15:50:01 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id d21-20020a9d4f15000000b0054e677e0ac5so8489otl.11;
        Fri, 15 Oct 2021 15:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EJ609syOXwzZkpM5B07tyq4Zn1fxsUT9UgpB4yHJfQ0=;
        b=m2wfWLhLhLHsBHDdqpREG4Znd+9NoDTJlu5agTkOe9zCwJADsHW2yscS1EoXo3/i9/
         +cmKx9mwQbc719R1KYfTzG8cL2GNYKFmA5y2F/I2Vg9Yp5DnVCGFVPSR4rc/+Wc7owpB
         QwOevIIoa1OWLWq8MdSb703NK9GH0uElxCLpF3u/GRym5Vz9SP2mUK3h4+r5tqsCFsuR
         E9rPoU8/r36PKhqCjiSWrUwM3ZLV85ec+0XaC9zyJs6d6vItqCmMRhhtFjL7n59YNEuV
         ALH64qrHipgZT9i4Qw0GYqMk3kSOJg6MHltR/XdzNO2NCiunbw84MP9W/LQQUomhLkUV
         qskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=EJ609syOXwzZkpM5B07tyq4Zn1fxsUT9UgpB4yHJfQ0=;
        b=y2dpDAdI2AMtgWfzwnM/RyKT2ls1zyuREH9O4l9R3NlIAZT3qcuz5mCkGKrtDr7rop
         unBX/gCEeV2HPMzUcqTJAmzt297kuEFhmy96/gszkInheHuNUIDrGUWFLmFREHavjeyT
         G/uTJiv991DkEQlRhfRSdsurAhGlO27w2k5huvqA3nx1Dz5N/n1aaMSJUknYR0zvM/+m
         vVQTMutDO2x8ujprBb918JYR4ENLMIAGcdosUJ4EdS0lzGTSK0A3nxyCiaPe9Zrtfjgb
         i6v7pl00fZDadeCc6bm3kEKGR4jc8RxuZIQ2GtTaC4VSc+QSxO9pYVaEAbECt2gASlNT
         2iyg==
X-Gm-Message-State: AOAM530JSYLAOd+VjKIfYmhiXIEj7H75DYbrZotpab3rV5z72qyWhXN0
        ycdZbLHCxPSGdXZ8LgKz0FQ=
X-Google-Smtp-Source: ABdhPJyqJ/kR05EHdclLBjVPx0dsXEuAGuCYh0hcU9gzDXpbu+Q0ZiT1Y6iMFqTm9QBiCsxN8cgX8A==
X-Received: by 2002:a9d:60cf:: with SMTP id b15mr10332906otk.282.1634338200749;
        Fri, 15 Oct 2021 15:50:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e1sm1620247oiw.16.2021.10.15.15.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:50:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 15 Oct 2021 15:49:59 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 4/9] hwmon: (tmp421) support specifying n-factor via DT
Message-ID: <20211015224959.GA1484958@roeck-us.net>
References: <cover.1634206677.git.krzysztof.adamski@nokia.com>
 <69d0bfcc5ba27c67f21d3eabfb100656a14c75b9.1634206677.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69d0bfcc5ba27c67f21d3eabfb100656a14c75b9.1634206677.git.krzysztof.adamski@nokia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 14, 2021 at 03:01:28PM +0200, Krzysztof Adamski wrote:
> Previous patches added a way to specify some channel specific parameters
> in DT and n-factor is definitely one of them. This calibration mechanism
> is board specific as its value depends on the diodes/transistors being
> connected to the sensor and thus the DT seems like a right fit for that
> information. It is very similar to the value of shunt resistor that some
> drivers allows specifying in DT.
> 
> This patch adds a possibility to set n-factor for each channel via
> "n-factor" DT property in each channel subnode.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>

Applied, after "s/^  / /"

Guenter

> ---
>  drivers/hwmon/tmp421.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index af08bc985a13..606914f20910 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -34,6 +34,7 @@ enum chips { tmp421, tmp422, tmp423, tmp441, tmp442 };
>  #define TMP421_STATUS_REG			0x08
>  #define TMP421_CONFIG_REG_1			0x09
>  #define TMP421_CONVERSION_RATE_REG		0x0B
> +#define TMP421_N_FACTOR_REG_1			0x21
>  #define TMP421_MANUFACTURER_ID_REG		0xFE
>  #define TMP421_DEVICE_ID_REG			0xFF
>  
> @@ -310,6 +311,7 @@ static int tmp421_probe_child_from_dt(struct i2c_client *client,
>  {
>  	struct device *dev = &client->dev;
>  	u32 i;
> +	s32 val;
>  	int err;
>  
>  	err = of_property_read_u32(child, "reg", &i);
> @@ -329,6 +331,22 @@ static int tmp421_probe_child_from_dt(struct i2c_client *client,
>  
>  	data->channel[i].enabled = of_device_is_available(child);
>  
> +	err = of_property_read_s32(child, "ti,n-factor", &val);
> +	if (!err) {
> +		if (i == 0) {
> +			dev_err(dev, "n-factor can't be set for internal channel\n");
> +			return -EINVAL;
> +		}
> +
> +		if (val > 127 || val < -128) {
> +			dev_err(dev, "n-factor for channel %d invalid (%d)\n",
> +				i, val);
> +			return -EINVAL;
> +		}
> +		i2c_smbus_write_byte_data(client, TMP421_N_FACTOR_REG_1 + i - 1,
> +						  val);
> +	}
> +
>  	return 0;
>  }
>  
