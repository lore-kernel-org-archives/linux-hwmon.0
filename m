Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AD7EB64DC
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jul 2023 02:56:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbjGSC4Q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Jul 2023 22:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbjGSC4O (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Jul 2023 22:56:14 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD4731FDC
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Jul 2023 19:56:02 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b852785a65so2483975ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Jul 2023 19:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689735362; x=1692327362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n2XWIu0CK8Z/WHU36RcQ/T7WdL6vbQZwkoKcPVVvkbg=;
        b=FLYU6HQAeKx0u5H/VbwHDWKOMOP8FH8/MYqv3tH4i7qD31qUbSMkJW9ZGdjw6vSw7+
         d5zYiqnpgpOXgJo/3tjWbfrmiHKQ+83uQnTZ8kAUGwUDfhJ+MwAJ1Gj+62C2/bJd9YVT
         u9eMVEweo2K9DVceub8ufr6buNnwap9uGlXIYKaUVHNp6zfVIvuyydptVymRP4FPMoGU
         ZjQ5HG1EyInDwrETU/KiGYeRdkVm0gr7+Je9ST1NxrZUeUGb4+dXt+NdILqzI0zxmAq+
         jRUPmeXbtbvN74ZxYuQN7hdSKu7RHIn5/Pmy5Gj8rOXyQQhi8n16QfgWm/2XF2PK5VKz
         RyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689735362; x=1692327362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2XWIu0CK8Z/WHU36RcQ/T7WdL6vbQZwkoKcPVVvkbg=;
        b=WqTUuEjHWciRxpV6R7lL8+oTGtqCn7Lg9D7XdnN0LHnSG/M7Jg0usbKD6aptILoZjb
         Cgcdoik39wwwypIjT1+HlgFNYT56A745TOCJmWi9uYJBuDr+hwsUlam1ZGAqt5EODThn
         4m5Df7ImyaZN330S9Ev8F5cWreM1NRANNyTE5AYbXc75SOvUOwi5XCToI9e0vM5GSe79
         8d21Jeo4dYZvd22nHiHfCz06W1JY13UkbDpZY5egmvgEfVy72ESbGK1/rVGShLTguzIY
         1nglGVstn/wLpjOVNKUqsvKGaTMbugZIl9+xKcmruThIOA0JsGRYg194ooyAszBWtbQQ
         PaCA==
X-Gm-Message-State: ABy/qLaNCqyAEFWGVUFRNF1h1C2VQEK8q8l+0+V/15KFFCOhy3uxElwg
        oYZW9yt7vQAoGYA8iw2Sljvv9XLuSqg=
X-Google-Smtp-Source: APBJJlG3lBTyLgU4euFGENGvPGkPC3dqzwyc0DQ3zKa9Z+dNj93Ah/+EfXeevpjKKW2jzp6L1enxOg==
X-Received: by 2002:a17:902:6546:b0:1b8:1636:b26 with SMTP id d6-20020a170902654600b001b816360b26mr1066180pln.3.1689735362083;
        Tue, 18 Jul 2023 19:56:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p8-20020a170902e74800b001b8a1a25e6asm2588638plf.128.2023.07.18.19.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 19:56:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 18 Jul 2023 19:56:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: (it87) Improve temperature reporting
 support
Message-ID: <f5e10683-0ea5-4050-a13d-664fd0545809@roeck-us.net>
References: <20230707123005.956415-1-frank@crawford.emu.id.au>
 <20230707123005.956415-3-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707123005.956415-3-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jul 07, 2023 at 10:29:51PM +1000, Frank Crawford wrote:
> Add test if thermistor sensor type attribute should be visible, i.e.
> test if the attribute is defined.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> ---
> 
> v2:
>  * Split single patch into multi-patch set following review.
> 
> ---
>  drivers/hwmon/it87.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 7a1224ddc8b1..fb62f2a7017a 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -2330,6 +2330,14 @@ static umode_t it87_temp_is_visible(struct kobject *kobj,
>  	if (!(data->has_temp & BIT(i)))
>  		return 0;
>  
> +	if (a == 3) {
> +		int type = get_temp_type(data, i);
> +
> +		if (type == 0)
> +			return 0;

Applied. Again, I dropped the unnecessary 'type' variable.

Thanks,
Guenter

> +		return attr->mode;
> +	}
> +
>  	if (a == 5 && !has_temp_offset(data))
>  		return 0;
>  
