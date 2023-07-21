Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE76EB64DC
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Jul 2023 16:58:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbjGUQ6B (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Jul 2023 12:58:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231166AbjGUQ6A (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Jul 2023 12:58:00 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E07010CB
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Jul 2023 09:57:59 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-783544a1c90so97103339f.1
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Jul 2023 09:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689958678; x=1690563478;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CdH8VSMFo0UgRZDEcoPj7HS6o9NlwMN/4dtypIKe9qQ=;
        b=k5YLBBcMQwsjnO3nyecIzfv2s0+PyQYuzTtjnH5Q2bzNXag6+xepGuy7WPMZrtU/ar
         LE+aBNyXAdkZExkhHaMSj0Kla7+VlC5xcz32h164G5rZU3BM17SP2se/5+msY9tY3wAq
         RmalOXMuIN/oY4qv8D2QzIxO6GXAP6dG8wf/uWZnejkQXMuCZoKjRQiFyz0miYVwaNlW
         eAVHYGHHWGc+moHAFru9XrKGCPAevidXTM0agys9Pco2l/M+o1pHxwG155rCWwiU+Dgy
         ioRRUv49vZwu8gqzoGG+lmCEHwSqw6liKaAIpC3YBxqwJWNsVhWWrWgE0bpgkZAko8te
         DEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689958678; x=1690563478;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdH8VSMFo0UgRZDEcoPj7HS6o9NlwMN/4dtypIKe9qQ=;
        b=N+/JEKk+glrPQUk3Fzh64eF5zd5DxtaxCmQWgKIwfNXoDApfVviMHbanDD3inR+6Rv
         d78XKZVE/nsBcF9fuDmkKgvG9vzEikKcO2hW8PU/60nmviyJ9ond+FbfPwwfpqzuQWg+
         psM5EqyYMUdNHpwonGaC/m/1m3jK6jg6NZJr7ThYxfXeY/KBM9woscSeoMVI/XmHioTE
         Qc9JuxVj6yWynjHUMyEGk+51oDzD/fyKrSSdgw0soP2AaQIU+XReSRESY+BQbIZwJPKR
         KfuK2RCOsL+9SVajbgBTpU7fntIvvPGFV0JApGmKncJCVgJ4nR5y5lW5yPOrnDEIrB7u
         FIXA==
X-Gm-Message-State: ABy/qLbfSzqNOvRTCfdOaRdQomDbwJ9frFYulZuTrHgXalRmFMdZx8nc
        bx5IkHAhJBOUeyQso2N2wtSVniFaTcw=
X-Google-Smtp-Source: APBJJlH8XnuJcIdlLgGD3Q9DyWD+tQzOZ5EQYBWTsYprqNRTl4kL7ffFtzvCY4Dvp3symUS+y1txCg==
X-Received: by 2002:a05:6e02:1290:b0:346:66f6:4da2 with SMTP id y16-20020a056e02129000b0034666f64da2mr467346ilq.10.1689958678665;
        Fri, 21 Jul 2023 09:57:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c8-20020a92cf48000000b00345fcbce508sm1065939ilr.39.2023.07.21.09.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 09:57:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a48496be-52d7-4472-3110-de99de82d3d2@roeck-us.net>
Date:   Fri, 21 Jul 2023 09:57:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/1] hwmon: nct7802: Fix for temp6 (PECI1) processed even
 if PECI1 disabled
Content-Language: en-US
To:     Gilles BULOZ <gilles.buloz@kontron.com>
Cc:     linux-hwmon@vger.kernel.org
References: <dc61a61e-5c34-1216-b841-347f65221de3@kontron.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <dc61a61e-5c34-1216-b841-347f65221de3@kontron.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/21/23 09:38, Gilles BULOZ wrote:
> Fix for temp6 (PECI1) processed even if PECI1 disabled
> 
You should describe the problem here.

Guenter

> Signed-off-by: Gilles Buloz <gilles.buloz@kontron.com>
> ---
>   drivers/hwmon/nct7802.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/nct7802.c b/drivers/hwmon/nct7802.c
> index 9339bfc..024cff1 100644
> --- a/drivers/hwmon/nct7802.c
> +++ b/drivers/hwmon/nct7802.c
> @@ -725,7 +725,7 @@ static umode_t nct7802_temp_is_visible(struct kobject *kobj,
>       if (index >= 38 && index < 46 && !(reg & 0x01))        /* PECI 0 */
>           return 0;
> 
> -    if (index >= 0x46 && (!(reg & 0x02)))  /* PECI 1 */
> +    if (index >= 46 && !(reg & 0x02))            /* PECI 1 */
>           return 0;
> 
>       return attr->mode;

