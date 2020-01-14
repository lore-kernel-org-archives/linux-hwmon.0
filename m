Return-Path: <SRS0=c1px=3D=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A6AC33CB1
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jan 2020 14:06:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6316224672
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jan 2020 14:06:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKppaqZ0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbgANOG7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jan 2020 09:06:59 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44798 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgANOG7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jan 2020 09:06:59 -0500
Received: by mail-pg1-f193.google.com with SMTP id x7so6430943pgl.11;
        Tue, 14 Jan 2020 06:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QldGiquG06Rzqj2V4tCuUeNohwUewSZS1Kvp5BIGaZ8=;
        b=KKppaqZ0O7WLUqSU1NTXkIyo4qxpZN5XDIwzGK6RWHIFxwJUexYIUWy7QFk5F3e0Im
         yVlRoYUy3AcyflbMx711yoCnhxmgI3T6JQFXU0wGcFGKD5eWkd4wRcSEiebCjojRNDMy
         HR4RVLfn/DKdo1mhZbevgJJCjKHze4sU4OHt3KlfFi7wMm1MA/REgIF7AL94FdWzwxNN
         1r43RQgErYOoLm+SEHcmb/gry0qiO7nWolhMuUkeXoEf8wPTFIIJIYCQWdNYheum1Jul
         gBInbE08DdCCCgziXlPieNTts9/8Mw5FrKZjsdIlaCTqJQxaz9ppf2VK6XxPq9d/Iock
         m+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=QldGiquG06Rzqj2V4tCuUeNohwUewSZS1Kvp5BIGaZ8=;
        b=sIBofl2/5b+J1I27i805C5658g2KnMuCy244yiahgXbQyMSpbFW5heJyB4zPwQ/cq2
         bZWw3KKMihs0P1FgbiImMcMf7TsO5NxfUAKu0xbUQ0UpbBRp1iZprBJkcas7//KW/c21
         4M5ou1qwXKscMgZiu9k/+uzGLJIZiR9N5lXKi+lEVnF3uchj9iyGD1KP5exeVkUEXr6R
         4hkzlO7SyXA5WWC/i1Upe2I8HhSmKm6rVBsdDBTij7jDrPX42OX+on8CyrcnAwy47AgH
         IpmGVLE3KON12UGmsaIT0uyetHLo05TfyF9R9eWDdreJQb3VM5X0OK5AlXEke6iAGXZf
         U+1Q==
X-Gm-Message-State: APjAAAUUuaM3SlHBmQOtP12aHPzIm/x2nnSS/Eh839c8PZAc6Z9D5ZV5
        ybKMZmI59iv3OIytWbO188w=
X-Google-Smtp-Source: APXvYqxGfghMJkrnT0qTERCtnzrvYrfkD0cT70PPt3i1BbLbPIjsdFiXhq2/0jOdEQGCCSwcaPeajA==
X-Received: by 2002:a63:5c1c:: with SMTP id q28mr26289660pgb.245.1579010818196;
        Tue, 14 Jan 2020 06:06:58 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k23sm16927172pgg.7.2020.01.14.06.06.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 06:06:57 -0800 (PST)
Date:   Tue, 14 Jan 2020 06:06:56 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     robh+dt@kernel.org, vijaykhemka@fb.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH hwmon-next v1 2/6] hwmon: (pmbus/core) Add support for
 Intel IMVP9 and AMD 6.25mV modes
Message-ID: <20200114140656.GA22468@roeck-us.net>
References: <20200113150841.17670-1-vadimp@mellanox.com>
 <20200113150841.17670-3-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113150841.17670-3-vadimp@mellanox.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jan 13, 2020 at 03:08:37PM +0000, Vadim Pasternak wrote:
> Extend "vrm_version" with the type for Intel IMVP9 and AMD 6.25mV VID
> modes.
> Add calculation for those types.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/pmbus.h      | 2 +-
>  drivers/hwmon/pmbus/pmbus_core.c | 8 ++++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index 2bdebd0ea9c1..a7f90e18119c 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -377,7 +377,7 @@ enum pmbus_sensor_classes {
>  #define PMBUS_PAGE_VIRTUAL	BIT(31)
>  
>  enum pmbus_data_format { linear = 0, direct, vid };
> -enum vrm_version { vr11 = 0, vr12, vr13 };
> +enum vrm_version { vr11 = 0, vr12, vr13, imvp9, amd625mv };
>  
>  struct pmbus_driver_info {
>  	int pages;		/* Total number of pages */
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 98226e84b351..811819e41a72 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -709,6 +709,14 @@ static long pmbus_reg2data_vid(struct pmbus_data *data,
>  		if (val >= 0x01)
>  			rv = 500 + (val - 1) * 10;
>  		break;
> +	case imvp9:
> +		if (val >= 0x01)
> +			rv = 200 + (val - 1) * 10;
> +		break;
> +	case amd625mv:
> +		if (val >= 0x0 && val <= 0xd8)
> +			rv = DIV_ROUND_CLOSEST(155000 - val * 625, 100);
> +		break;
>  	}
>  	return rv;
>  }
