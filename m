Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6E2CE7A88
	for <linux-hwmon@archiver.kernel.org>; Sun, 24 Sep 2023 03:18:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjIXDSh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 23 Sep 2023 23:18:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjIXDSh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 23 Sep 2023 23:18:37 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEE41124
        for <linux-hwmon@vger.kernel.org>; Sat, 23 Sep 2023 20:18:30 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3ae0b0e9a0bso2580512b6e.3
        for <linux-hwmon@vger.kernel.org>; Sat, 23 Sep 2023 20:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695525510; x=1696130310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/AAy6PIqi8JA3SHRERLqm80k0JlOd55TNJFXlfS2oUI=;
        b=cQRKnkvKqAcSOxrzVTzpuX1OW1olQi4qtyFfDQJ2NOkgjZz5mZtiS8AjbSeNtQpAnH
         ns30oW41LWWtF9+TkxVPbaggze7+De9BppNUgKVAJ4e3R1C5VT2T/eMcCl/D//M5V2pr
         hOzOOBl0nq4GXkTBkk8FS4TDctBsrJ3nvEM7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695525510; x=1696130310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AAy6PIqi8JA3SHRERLqm80k0JlOd55TNJFXlfS2oUI=;
        b=CTBjsZ2q+/xSzBLwbfUtqLPCJoqFSyU6Mw9fuGewTcellQVqgEObItzXkkuPg+OWtJ
         gtk1yhT0tFLsAtUzwmtml3GJhv1NY3xi+U1fJOejrmZD4DFeAJBniWg4xeBfwM4ijS7+
         bGXbnl/rAdAsWJz1D+1bC+4oiXwFgaQXjaU/ycb6UX2OINw413xWBKljUtQo6L7j+n9y
         DjK41aA3FCPFgCNKn2VRlUdNFZr5D830KlHZ288JIdJ3LQWUpRLBuaLf+QTEdAIDbLyO
         5qs/P1JbQufKKTzTgp8ezNUXZzC6wqRSRpfMMHWdrkVvdvpB8mVre8RymAEm94EclcjC
         +3dQ==
X-Gm-Message-State: AOJu0YyFErPkT2UELXVuDeuZc9UjDA1s3M2ZrxkW1AcKZYp9FlLGqNEs
        SVInffFCBIssoLDmoCU/VqCO0g==
X-Google-Smtp-Source: AGHT+IHxl8ow6piO8ZdhDMa7DDNx9sc75pSwTQukBg+zX/9NFg883HTo7pR+R2tuQSXm/f8dneJfjA==
X-Received: by 2002:a05:6808:bd0:b0:3a4:633:44d2 with SMTP id o16-20020a0568080bd000b003a4063344d2mr6364418oik.18.1695525510212;
        Sat, 23 Sep 2023 20:18:30 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id f9-20020a170902ce8900b001b86492d724sm6053970plg.223.2023.09.23.20.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 20:18:29 -0700 (PDT)
Date:   Sat, 23 Sep 2023 20:18:29 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Justin Stitt <justinstitt@google.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: refactor deprecated strncpy
Message-ID: <202309232016.6D6E70983B@keescook>
References: <20230921-strncpy-drivers-hwmon-acpi_power_meter-c-v3-1-307552c6ec3f@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921-strncpy-drivers-hwmon-acpi_power_meter-c-v3-1-307552c6ec3f@google.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 21, 2023 at 05:41:46AM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> Let's refactor this kcalloc() + strncpy() into a kmemdup_nul() which has
> more obvious behavior and is less error prone.
> 
> To avoid truncating the last byte supply `...length + 1` to
> kmemdup_nul() as `element->string.length` does not account for the
> trailing null as made obvious from it's definition (and associated
> comment):
> |       u32 length;	/* # of bytes in string, excluding trailing null */
> 
> ... this is precisely what the original kcalloc invocation did as well.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Changes in v3:
> - refactor to use kmemdup_nul() (thanks Thomas and Kees)
> - change commit msg to reflect ^
> - rebase onto 2cf0f71562387282
> - Link to v2: https://lore.kernel.org/r/20230919-strncpy-drivers-hwmon-acpi_power_meter-c-v2-1-8348432d6442@google.com
> 
> Changes in v2:
> - use memcpy over strscpy (thanks Kees)
> - Link to v1: https://lore.kernel.org/r/20230914-strncpy-drivers-hwmon-acpi_power_meter-c-v1-1-905297479fe8@google.com
> ---
>  drivers/hwmon/acpi_power_meter.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
> index fa28d447f0df..146c4f09c897 100644
> --- a/drivers/hwmon/acpi_power_meter.c
> +++ b/drivers/hwmon/acpi_power_meter.c
> @@ -796,14 +796,13 @@ static int read_capabilities(struct acpi_power_meter_resource *resource)
>  			goto error;
>  		}
>  
> -		*str = kcalloc(element->string.length + 1, sizeof(u8),
> -			       GFP_KERNEL);
> +		*str = kmemdup_nul(element->string.pointer, element->string.length + 1,
> +						 GFP_KERNEL);

kmemdup_nul() already adds the "+ 1", so it's not needed here.

For v4, please improve the Subject along the lines of "...: Replace
open-coded kmemdup_nul"

-Kees

>  		if (!*str) {
>  			res = -ENOMEM;
>  			goto error;
>  		}
>  
> -		strncpy(*str, element->string.pointer, element->string.length);
>  		str++;
>  	}
>  
> 
> ---
> base-commit: 2cf0f715623872823a72e451243bbf555d10d032
> change-id: 20230914-strncpy-drivers-hwmon-acpi_power_meter-c-c9f2d8053bef
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 

-- 
Kees Cook
