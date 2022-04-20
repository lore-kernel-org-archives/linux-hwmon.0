Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F22C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Apr 2022 13:56:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379234AbiDTN6t (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 20 Apr 2022 09:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379238AbiDTN6m (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 Apr 2022 09:58:42 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910503BBDD;
        Wed, 20 Apr 2022 06:55:55 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id w127so2078932oig.10;
        Wed, 20 Apr 2022 06:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IRy0yxXRNyzDR7SN7n1UYbDK9PkCvcJTLmCT9iysKEs=;
        b=R0q20o3vnEjtV7LFMdjT/uR5WN99pmqfuPaVmdmUWRBRzFpgaw3MPrYc2YeIWxaBam
         9CyHCKX/pCav32Cv1yqHl+L7EYxILoIoywLLR+9P2HAqvvYkcJfy3UzE/EGBSRT5vNUC
         830hDYQCs4669/zSIl+9kn1OOq9kPp+Db1fj7jcrnn3qSRl5F2Y6W0BL4WN1TH37rw7k
         tIhRMoM6rrxdsMUUiYZuL0HlysAclqSpsiz8O4asO/agxWNVn3ZPyK8CQtKmgYcvOadT
         pqhvSb8zOejcJ6VlapGJa1343ZCIO8or5dCfezVNUvb6D93oZG90s2V8D6cM3C4zxhVm
         3uNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IRy0yxXRNyzDR7SN7n1UYbDK9PkCvcJTLmCT9iysKEs=;
        b=P+AOphCru9DCJQHtf2jxlsFdEsmYhKIIGNwHT+GlZnTPkPYD4fnnpbKRmKjKTkjA6R
         rZ+znB6pY3EgvqNwVdG4ZcleMClXvEUxLBsDvPST+ToEsVa6ZKhyLsjGEwzZxng0NRNh
         bUr7iMPbXIjoO1m+bAU0yQDktDZ2FLMM3HUUdVWgqw4gAgT4xKU+wIBccPts5GEXVltw
         LN9ciAw2h7MaL7IKUU//k7mLjm9VOzLWiHAoT5clo7SoPCCWuGU2ddYa1VPdQKUwZ8Ji
         RWeWZ01oCADIw4Ku2KrAaV9+MEuYg9VOwvBJXjlSVNLxRnGPzR502oEksGyMh8sBQcKd
         ghYA==
X-Gm-Message-State: AOAM5303WxTiNrwrOwDQ8yhSIESlonxeFqB/1qEA5Buri2qPImU7WmCE
        el+SwsICHTef2/iUZPGFU1mXH3ITSDg=
X-Google-Smtp-Source: ABdhPJyqMBsqrzfPhavBjk3nE6MEQivYtQbx/Yc7Oo2SCkIpY02gW+eXfx+CNliYPc7yCR18/sc0Bw==
X-Received: by 2002:a05:6808:d51:b0:2ec:b129:1197 with SMTP id w17-20020a0568080d5100b002ecb1291197mr1867059oik.12.1650462954913;
        Wed, 20 Apr 2022 06:55:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z13-20020a9d62cd000000b006056f8657ccsm109569otk.10.2022.04.20.06.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 06:55:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3da420df-234e-4701-2182-1f043b9ccc56@roeck-us.net>
Date:   Wed, 20 Apr 2022 06:55:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] hwmod: (pmbus) disable PEC if not enabled
Content-Language: en-US
To:     Adam Wujek <dev_public@wujek.eu>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220419205228.303952-1-dev_public@wujek.eu>
 <d2d09fe1-dada-e844-cafa-da48424855a4@roeck-us.net>
 <20220420125421.415716-1-dev_public@wujek.eu>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220420125421.415716-1-dev_public@wujek.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/20/22 05:54, Adam Wujek wrote:
> Explicitly disable PEC when the client does not support it.
> The problematic scenario is the following. A device with enabled PEC
> support is up and running, a kernel driver loaded.
> Then the driver is unloaded (or device unbound), the HW device
> is reconfigured externally (e.g. by i2cset) to advertise itself as not
> supporting PEC. Without a new code, at the second load of the driver
> (or bind) the "flags" variable is not updated to avoid PEC usage. As a
> consequence the further communication with the device is done with
> the PEC enabled, which is wrong.
> 
> Signed-off-by: Adam Wujek <dev_public@wujek.eu>

Subject should start with hwmon:. Please version your patches,
and provide change logs.

> ---
>   drivers/hwmon/pmbus/pmbus_core.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index b2618b1d529e..0af7a3d74f47 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2334,7 +2334,8 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
>   				client->flags |= I2C_CLIENT_PEC;
>   			}
>   		}
> -	}
> +	} else
> +		client->flags &= ~I2C_CLIENT_PEC;

Since if() is in {}, else should be in {} as well.

Guenter

> 
>   	/*
>   	 * Check if the chip is write protected. If it is, we can not clear
> --
> 2.25.1
> 
> 

