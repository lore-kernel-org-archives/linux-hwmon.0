Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEFAAC4332B
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Mar 2021 19:04:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9675264F68
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Mar 2021 19:04:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232853AbhCRTDm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Mar 2021 15:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232777AbhCRTDW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Mar 2021 15:03:22 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14186C06174A;
        Thu, 18 Mar 2021 12:03:22 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id n140so2069961oig.9;
        Thu, 18 Mar 2021 12:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LTv8zajT4Gx3Tcgla3Y9arc43uZdXFJjG1+KQ/rSYMo=;
        b=hHARP6lYCbJWoi+u2OGp+OK1+GD7d7Hx2jnboi4zoJLqSXHzPHnEaRf3OmFMDHej8Y
         XVGNXIwdeMA+pc9iTmvgF2U9h0wzuIs5HJ71jN5Pgfxuxq/9nWj+Uqx/9cDEBp2Klr6k
         bWVN485sXezRVBGqJDnywXbDFl0af2L4SkKoPmingA2UjEG0dy0Fw+EDY5zGU6I3dDZo
         /KzpvK0y579BYBW1Q4K24wuQYKXu/aVSCX+FtrY7NmAOFeUwtag7jTkRhDFi9UwQB/ZO
         hPJgvjBtQoDqqIOXYfP2NX4T+aJoUeNFQ/UiGyAuRnhP6x9iSoQKNrMb/LL+bnEM0X5f
         SBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=LTv8zajT4Gx3Tcgla3Y9arc43uZdXFJjG1+KQ/rSYMo=;
        b=BcR66jgp5BfPxCVxs3jrPriTMj/Hei7ylY/YV5mL8gYjFVp10AXgBB5SoRylbP3aW5
         dHCalcgpD9npKnV3Rs+NoFrzz7JQdGmPUx0nWkpg6o+kfmBfFuuQSjTWhXv7oYOUn+If
         xqOlWr1+IrZg5XnqEEn/zHDFBxAFI3SE1rrqv47S/O84R+EDnxbArGZnAjcwxkqFv02N
         SpzOmnni2AzZxVoNgUo5ztagEaBIbTdd4LD4O+oFJNCCHkStB80Y5LVMqlyfZRjb0opT
         8S0PY7AKNuYCZ9sEqWxHGrrBATZP3T6/lhxTXeUL6ksu5IEru/3oiYPOWgSoPgqyXMJh
         KzFA==
X-Gm-Message-State: AOAM530hS0x0SCAiPi3ocgm/MGga9gyKeVaVFJ4cbuSkARPMDR0k+VoN
        ifah6LBmtLiyI5uvAqDmV9E=
X-Google-Smtp-Source: ABdhPJzKnQzFPNTmVIIyjX6ngyIv07bl8EiUBvEWfZmMf4DsmDSmTHCMcb0KEvWtVLkmdYJxxrA+og==
X-Received: by 2002:a05:6808:2d2:: with SMTP id a18mr4323470oid.152.1616094201504;
        Thu, 18 Mar 2021 12:03:21 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i3sm750973oov.2.2021.03.18.12.03.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Mar 2021 12:03:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 18 Mar 2021 12:03:19 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     zuoqilin1@163.com
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, zuoqilin <zuoqilin@yulong.com>
Subject: Re: [PATCH] hwmon: Fix spelling typo
Message-ID: <20210318190319.GA207807@roeck-us.net>
References: <20210318124637.1331-1-zuoqilin1@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318124637.1331-1-zuoqilin1@163.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Mar 18, 2021 at 08:46:37PM +0800, zuoqilin1@163.com wrote:
> From: zuoqilin <zuoqilin@yulong.com>
> 
> Change 'revsion' to 'revision'.
> 
> Signed-off-by: zuoqilin <zuoqilin@yulong.com>

Applied. In the future also please list the affected driver
in the subject line.

Thanks,
Guenter

> ---
>  drivers/hwmon/ftsteutates.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/ftsteutates.c b/drivers/hwmon/ftsteutates.c
> index ef88a15..e87aa00 100644
> --- a/drivers/hwmon/ftsteutates.c
> +++ b/drivers/hwmon/ftsteutates.c
> @@ -713,7 +713,7 @@ static int fts_detect(struct i2c_client *client,
>  {
>  	int val;
>  
> -	/* detection works with revsion greater or equal to 0x2b */
> +	/* detection works with revision greater or equal to 0x2b */
>  	val = i2c_smbus_read_byte_data(client, FTS_DEVICE_REVISION_REG);
>  	if (val < 0x2b)
>  		return -ENODEV;
