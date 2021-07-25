Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F43FC4338F
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Jul 2021 03:21:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5587F60E8C
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Jul 2021 03:21:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbhGYCkk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 24 Jul 2021 22:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhGYCkk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 24 Jul 2021 22:40:40 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F157C061757
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Jul 2021 20:21:10 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id v8-20020a0568301bc8b02904d5b4e5ca3aso5528548ota.13
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Jul 2021 20:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WAj+3AGzADVS9UyBtij09Oj1eiOYd4mlGYAyhsLZKms=;
        b=DPId0KqCKbSFaCZ/j1Rsr371QVhj6U2huBELsTV64S+EAX7SBlpOe5n2FBE8V/6hjh
         oDC1H6JpraJCzrbwfaQMgznmZLwrXUXwQUsVceo5pCUxieHyWkkzgR3B5/Tmn6B6InqV
         kStLT5S0e244lQjPA/q+nL1r/2sAf/wdysSYs+bUSi/ily8Y97zx0MipkpV0dyczp2Yc
         yc3UVCK02yPvBlxVG6wzW3oWtom2ieof7qM4sYQBFr6iPBA8Z7ojKskSnNXsRDVmL7jN
         dCu5iObSEXtGFIx7PNe/XS3on7E7BQGqlJqBdtcVeedVx8DoAL/8Tt4U9V/MGf6NBeym
         Bpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=WAj+3AGzADVS9UyBtij09Oj1eiOYd4mlGYAyhsLZKms=;
        b=JaxD2bIw+YRPwjsERtBLTwGJk/KB2Df3XVBAO9mwm54gfFz+qhZxy+IpwLX40zeuC5
         ROdsEV39dI360Ps/RXSAe/M2u7vMGFxlmp1tfWRnUhjtdqQpWd07LDMQTXqamBn5/CAh
         1nu/os1+yeIKpeT8r749XzEugY8gk7w0CL+RGvZ9dHLwnzom4beAfm8LB3N6J4S4GRVg
         jJr4UIJcV8vPye9JWCvIS6vtyqOKPXVMRRaknR7DrgnRNubizeqIn+0LiMQaVygOplK+
         PMknKiCXDZ9niPi2XJoNNM2ZCWJJ784aqw/6EPtY32udxzwqnq63Qp42s3YTnhhEhBWu
         EpDw==
X-Gm-Message-State: AOAM532iVvknEKGUfFK2L8xyJtkgeotdoiK0erHRo4mZxRgpiUJI3Gat
        Dafrffycm70ZxwxlxlXLxek=
X-Google-Smtp-Source: ABdhPJw0IkSNpCcyr35/nMDKOvKRThu1yZgGu9jWIGm38M9jGmL10NlK6+rH7DgyAa9AOXW7QnR1fQ==
X-Received: by 2002:a9d:2c61:: with SMTP id f88mr7849582otb.62.1627183269575;
        Sat, 24 Jul 2021 20:21:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t207sm6979095oif.27.2021.07.24.20.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 20:21:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 24 Jul 2021 20:21:07 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     W_Armin@gmx.de
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (w83627ehf) Make DEVICE_ATTR_RO static
Message-ID: <20210725032107.GA2294115@roeck-us.net>
References: <20210724154817.18796-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724154817.18796-1-W_Armin@gmx.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Jul 24, 2021 at 05:48:17PM +0200, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Make DEVICE_ATTR_RO static to fix sparse warning:
> warning: symbol 'dev_attr_cpu0_vid' was not declared. Should it be static?
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/w83627ehf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --
> 2.20.1
> 
> diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
> index 3cea66c58c25..705a59663d42 100644
> --- a/drivers/hwmon/w83627ehf.c
> +++ b/drivers/hwmon/w83627ehf.c
> @@ -1081,7 +1081,7 @@ cpu0_vid_show(struct device *dev, struct device_attribute *attr, char *buf)
>  	struct w83627ehf_data *data = dev_get_drvdata(dev);
>  	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
>  }
> -DEVICE_ATTR_RO(cpu0_vid);
> +static DEVICE_ATTR_RO(cpu0_vid);
> 
> 
>  /* Case open detection */
