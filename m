Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F3DC25B6B
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Oct 2023 21:41:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231977AbjJZVlc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Oct 2023 17:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjJZVlb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Oct 2023 17:41:31 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A03810E;
        Thu, 26 Oct 2023 14:41:29 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6cd09663b1cso762111a34.3;
        Thu, 26 Oct 2023 14:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698356488; x=1698961288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gomAqO4bj2B9791xXkIYc1cIC+dNtlMNdhJBjozXv5Q=;
        b=ZmNq33rUS0jpgu8/HqsDXLU79H0FLCT814uXKNoJ1yIt7ptXR4XrGe7P7OKdPyNNdq
         +FJUFtCtvQ13AIvFEA3QMxln29XyaqiPzLoOO5ryZKgPSE3MGYtb14nQidntTMLX06M1
         u99JLLFJs97gQoAk7OXVl+pxYvCrFBhmjPHK94jvbDTCzig4fjbpgh7MNT+kC24cY6MF
         +O7IoCOo2AWyVY+E6DhKhYNvUyYqDUZFUga4MoSUP3vWY05L1vePrsJALYyyx0kgEq09
         qo4BRId0ydR5A4ZawkMVHla1Z0s/xYgxSIMmFMrDHur7SG25AIh6ko9VHKPXNt1oDyx+
         PhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698356488; x=1698961288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gomAqO4bj2B9791xXkIYc1cIC+dNtlMNdhJBjozXv5Q=;
        b=qLKL21o2XlwGnKhh1darQvk3X9lmbm+nZhncrIebsf8yDPWrQ30/fKPP2YCO4vRaea
         x7K6xjxDETPAZqSAfIvS0BXAi4BzKp6nupmrAQypoHrOrx/wYwenbwnqcbAivxmXXiJe
         57+UYXX631g/rIl1TZ96zHxzPEMTAc34ev6TEnShyxFNUOVQrZbnoR2xNQhPaOMJ+6bS
         cl1AAIwwxZLkCOT4qPENQYQd8gi6ruCatpjz/x6HJ381FbFMu9Taq86cXHMYj4fcD6Dn
         8OOWDHj5TV2S5ic1PINqDTemVrKk7TgytzK27LKkGuvq0OPZyPIAYJUdFaaFP5CQjoon
         h8JQ==
X-Gm-Message-State: AOJu0YyYmiIpzTrdXMvcZbwYPnsoDGevRTL6nRRHCylTPPpb8mpr/5Vh
        mm+WbpM9j0J6oSWChfX9mkRktX4RVbk=
X-Google-Smtp-Source: AGHT+IHJfLr1kTMlRQs4DzOWAbFb87UNKalMR2Pwa5v1dtf9nwQFvSK8pOvjqMY5NvkHUYa8LCFJQw==
X-Received: by 2002:a05:6830:4106:b0:6c6:19a6:29bf with SMTP id w6-20020a056830410600b006c619a629bfmr751820ott.7.1698356488262;
        Thu, 26 Oct 2023 14:41:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t3-20020a0dd103000000b005a23fc389d8sm78443ywd.103.2023.10.26.14.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 14:41:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 26 Oct 2023 14:41:25 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Lakshmi Yadlapati <lakshmiy@us.ibm.com>
Cc:     joel@jms.id.au, andrew@aj.id.au, eajames@linux.ibm.com,
        ninad@linux.ibm.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, inux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: (pmbus/max31785) Add delay between bus accesses
Message-ID: <d9f31043-38a1-475a-8d84-6c2ff06c5922@roeck-us.net>
References: <20231026212009.1555534-1-lakshmiy@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026212009.1555534-1-lakshmiy@us.ibm.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 26, 2023 at 04:20:09PM -0500, Lakshmi Yadlapati wrote:
> The MAX31785 has shown erratic behaviour across multiple system
> designs, unexpectedly clock stretching and NAKing transactions.
> 
> Experimentation shows that this seems to be triggered by a register access
> directly back to back with a previous register write. Experimentation also
> shows that inserting a small delay after register writes makes the issue go
> away.
> 
> Use a similar solution to what the max15301 driver does to solve the same
> problem. Create a custom set of bus read and write functions that make sure
> that the delay is added.
> 
> Signed-off-by: Lakshmi Yadlapati <lakshmiy@us.ibm.com>

I didn't really expect this at this point, but checkpatch says:

total: 3 errors, 8 warnings, 0 checks, 272 lines checked

_Please run your patch through checkoatch --strict and fix
what it reports.

> ---
> V2 -> V3: Fixed the commit message
> V1 -> V2: 
> - Changed the max31785_wait macro to a function, following the conventions
>   used in other drivers that had the same issue.
> - Changed the function names from max31785_i2c_smbus* to max31785_i2c_* and
>   from max31785_pmbus_* to _max31785_*, making them more concise.
> 
>  drivers/hwmon/pmbus/max31785.c | 181 +++++++++++++++++++++++++++++----
>  1 file changed, 160 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
> index f9aa576495a5..0e4f9bec542d 100644
> --- a/drivers/hwmon/pmbus/max31785.c
> +++ b/drivers/hwmon/pmbus/max31785.c
> @@ -3,6 +3,7 @@
>   * Copyright (C) 2017 IBM Corp.
>   */
>  
> +#include <linux/delay.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
> @@ -23,19 +24,112 @@ enum max31785_regs {
>  
>  #define MAX31785_NR_PAGES		23
>  #define MAX31785_NR_FAN_PAGES		6
> +#define MAX31785_WAIT_DELAY_US		250
>  
> -static int max31785_read_byte_data(struct i2c_client *client, int page,
> -				   int reg)
> +struct max31785_data {
> +	ktime_t access;			/* Chip access time */
> +	struct pmbus_driver_info info;
> +};
> +
> +#define to_max31785_data(x)  container_of(x, struct max31785_data, info)
> +
> +/*
> + * MAX31785 Driver Workaround
> + *
> + * The MAX31785 fan controller occasionally exhibits communication issues.
> + * These issues are not indicated by the device itself, except for occasional
> + * NACK responses during master transactions. No error bits are set in STATUS_BYTE.
> + *
> + * To address this, we introduce a delay of 250us between consecutive accesses
> + * to the fan controller. This delay helps mitigate communication problems by
> + * allowing sufficient time between accesses.
> + */
> +static inline void max31785_wait(const struct max31785_data *data)
>  {
> -	if (page < MAX31785_NR_PAGES)
> -		return -ENODATA;
> +	s64 delta = ktime_us_delta(ktime_get(), data->access);
> +
> +	if (delta < MAX31785_WAIT_DELAY_US)
> +		udelay(MAX31785_WAIT_DELAY_US - delta);

Sure you want to use udelay() here and not usleep_range()
or maybe fsleep() ?

Thanks,
Guenter
