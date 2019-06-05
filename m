Return-Path: <SRS0=Rv8n=UE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74EDAC28CC5
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jun 2019 16:48:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 470C320866
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jun 2019 16:48:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XE15uUF4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728731AbfFEQsz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Jun 2019 12:48:55 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39979 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728693AbfFEQsy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Jun 2019 12:48:54 -0400
Received: by mail-pl1-f196.google.com with SMTP id a93so328916pla.7
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Jun 2019 09:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VxyPJWv2zFm4RK8IPFhJ4ohN/goRlO9bU3zXz8jKC5w=;
        b=XE15uUF4n8BnM5s7iOAywL2OAwHEA/t4C+wpbFhyCwbLXK7kyqQZyKfw3EdlM5cYp6
         M8K3s7+x1Yy5hyPmmR9QfSH9lkuWYXFmhSTaqiVLggQkBeQJG0JP9rJFnD6eKCsEL4Yx
         2wgdQLYcmHzz3Cqw+5yZUvdtJdBkTwNKzcWXKz10nifaMdnPhXL1p18NKL8tZdblmxl4
         4btXafC1req1bOIunj4DWMEsLEshGcFAIhZA51VP1EPGdfdibBlxamoHK6eyZ4XQ+VbM
         iG78ccUHk9ZV4UvgbhHtVRciQQwTtUy4AhZQck7paOoV23ZeORzZ9CLhbi3Z+e4jRWjl
         Bcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=VxyPJWv2zFm4RK8IPFhJ4ohN/goRlO9bU3zXz8jKC5w=;
        b=XwWnKFzuvqIkdw3uhM0c997DddSAzN4u0vmd37Osaf6VRy021qvaBS02hrR+NqRNBw
         zPUdDAsdz4DNCl+bU5ZqSrfdKTsrFUg56/XJ6D7f395BayEDHa+W5xR/AnGfdp7h23KJ
         u9/91/+ijz4IXfbs/xE9U6HlfCcoCPecjmXxh0pzel12D5rlSqJOFt9jnqpfyqep5WcV
         TrFtYEYgv7mPueIvbUmkkIM+J74cwf550RP17IdmLxn7ZSCh+Yyef42C84h4MOWU+qsC
         dom8CSeQ88U5UXfAzg7cmgtRz3hjs/uqZ6humnAv/5iqhOaApjlnrc/tsOkFXJfG/bMm
         ZMeg==
X-Gm-Message-State: APjAAAXcZJ7aPhSD605o4ymc90j9Z7s165Fs49OYlxVbjLzY3gmyj3XW
        OeRYwzwPGXvtOWqvE0fuSdVGRF7N
X-Google-Smtp-Source: APXvYqx2J+Q7LBxgdsinnUeiq6f1ypxvYguSogL6B2nMFphU0jFNrP4wM7TC/MQ5dDBOUlri0wNgfw==
X-Received: by 2002:a17:902:1e2:: with SMTP id b89mr23498506plb.7.1559753334172;
        Wed, 05 Jun 2019 09:48:54 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s2sm22015980pfe.105.2019.06.05.09.48.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 09:48:53 -0700 (PDT)
Date:   Wed, 5 Jun 2019 09:48:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Robert Hancock <hancock@sedsystems.ca>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH 1/3] hwmon: (pmbus) Add paged support for VIN, IIN, PIN
 parameters
Message-ID: <20190605164852.GB32657@roeck-us.net>
References: <1559751434-19879-1-git-send-email-hancock@sedsystems.ca>
 <1559751434-19879-2-git-send-email-hancock@sedsystems.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559751434-19879-2-git-send-email-hancock@sedsystems.ca>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jun 05, 2019 at 10:17:12AM -0600, Robert Hancock wrote:
> Previously the VIN, IIN and PIN parameters were marked as non-paged,
> however on the IRPS5401 these parameters are present on multiple pages.
> Add the paged flag for these parameters so they can be detected properly
> on such chips.
> 

Have you tested the impact of this change on other chips where the
registers are non-paged ?

To reduce risk due to potentially mis-detecting support on other chips,
it may be better to add a separate backend driver for this chip. This
would also enable support for the MFR_VOUT_PEAK, MFR_IOUT_PEAK, and
MFR_TEMPERATURE_PEAK registers which is otherwise unavailable.

Thanks,
Guenter

> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index ef7ee90..6e3aaf1 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -1395,6 +1395,7 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
>  		.reg = PMBUS_READ_VIN,
>  		.class = PSC_VOLTAGE_IN,
>  		.label = "vin",
> +		.paged = true,
>  		.func = PMBUS_HAVE_VIN,
>  		.sfunc = PMBUS_HAVE_STATUS_INPUT,
>  		.sbase = PB_STATUS_INPUT_BASE,
> @@ -1499,6 +1500,7 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
>  		.reg = PMBUS_READ_IIN,
>  		.class = PSC_CURRENT_IN,
>  		.label = "iin",
> +		.paged = true,
>  		.func = PMBUS_HAVE_IIN,
>  		.sfunc = PMBUS_HAVE_STATUS_INPUT,
>  		.sbase = PB_STATUS_INPUT_BASE,
> @@ -1584,6 +1586,7 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
>  		.reg = PMBUS_READ_PIN,
>  		.class = PSC_POWER,
>  		.label = "pin",
> +		.paged = true,
>  		.func = PMBUS_HAVE_PIN,
>  		.sfunc = PMBUS_HAVE_STATUS_INPUT,
>  		.sbase = PB_STATUS_INPUT_BASE,
> -- 
> 1.8.3.1
> 
