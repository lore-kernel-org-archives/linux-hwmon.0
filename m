Return-Path: <SRS0=8uXM=RO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F51C43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Mar 2019 13:12:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D7E4F20657
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Mar 2019 13:12:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjgY7xSg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfCKNM1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Mar 2019 09:12:27 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40777 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbfCKNM1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Mar 2019 09:12:27 -0400
Received: by mail-pg1-f194.google.com with SMTP id u9so4007660pgo.7
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Mar 2019 06:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZHtyv0mi+627Ica6we6/m0kgX6WByLgMUL9ZtLIYupg=;
        b=UjgY7xSgE4YfcQp09T9I3xyPqRdUrQDa5FWwl3YfztOWbuSkjTQKY42QVvY2HsEHEJ
         4d24QD4KlzmOgAmFRwN4bGgHzSwpDdx4ekZhCreCwSnDiQ2VEyPxeMJSu9qRL8B3vJcR
         E6QGXYRRQroqRkvHy1dvEtj86lC578yYFtvywqruAuIHBLP8cJ2b6o0A/+u0/YaXZB4I
         QwpZoanpBH28r3hjEegrGcqBXkQPLriGfQ744bs5HE7wJEEoOO0Pj/gF4pUA203t9L83
         wU07naLCYNmOUvy3W9mHRwlXI5dUyvI+5RWH3BMMMAiyjuWZVPC6em3iyibGFg+LQ6ze
         4NWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZHtyv0mi+627Ica6we6/m0kgX6WByLgMUL9ZtLIYupg=;
        b=scmeW6+LhQwbH1/hrcHowOjmHU4po6/fqwMH2QuRZQGtA5ItGsqop7LKCDSNDMXTJE
         DVhbAhrPaQAprW5WAAWNMkn3aXi+8IJOl9nPTxoT+pyvt5mYBIS0CXkBtaxfHIHzXhLN
         hu3ZSObS3vewfQcjwqIFIijd7MXKwcv09SlwZSqQfIffkCjHnOg7BoKJFOTGY21fp5oK
         imnqITn5tn6zUoeEErE5PZP0Ajbc4wrncGzvSCTPt2AD9ZvFb2ensp++MIS+LB0NbiAc
         KqGC+Y/zz0mZe0StY9E1tQWOM+xbuzyNTCZJAElv3yxwpNy+qHKHQ4AiRNLXM5ENaFPS
         rPwg==
X-Gm-Message-State: APjAAAU4pyCqySCQ9eus+lFxM+o++YG2NBIMFVnMEVaRCP8lQtQk9Awr
        dHSxf5d3+Zsuv5kLvrv3TOs=
X-Google-Smtp-Source: APXvYqzkw3ji4WE3y9nWR+YDU9z+EkNuGj2oKu3a51gDgvytzL1+tTOdUlC7lez7/LVbUKgPx3JsIg==
X-Received: by 2002:a63:1318:: with SMTP id i24mr17871146pgl.163.1552309946631;
        Mon, 11 Mar 2019 06:12:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 195sm16140767pfc.50.2019.03.11.06.12.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2019 06:12:25 -0700 (PDT)
Date:   Mon, 11 Mar 2019 06:12:24 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Axel Lin <axel.lin@ingics.com>
Cc:     Lei YU <mine260309@gmail.com>, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (w83773g) Select REGMAP_I2C to fix build error
Message-ID: <20190311131224.GA27286@roeck-us.net>
References: <20190311095730.3288-1-axel.lin@ingics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190311095730.3288-1-axel.lin@ingics.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Mar 11, 2019 at 05:57:30PM +0800, Axel Lin wrote:
> Select REGMAP_I2C to avoid below build error:
> ERROR: "__devm_regmap_init_i2c" [drivers/hwmon/w83773g.ko] undefined!
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 6f929bfa9fcd..d0f1dfe2bcbb 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1759,6 +1759,7 @@ config SENSORS_VT8231
>  config SENSORS_W83773G
>  	tristate "Nuvoton W83773G"
>  	depends on I2C
> +	select REGMAP_I2C
>  	help
>  	  If you say yes here you get support for the Nuvoton W83773G hardware
>  	  monitoring chip.
