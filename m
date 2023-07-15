Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD0FC001B0
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jul 2023 16:10:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbjGOQKB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Jul 2023 12:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjGOQKB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jul 2023 12:10:01 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3090D2D51
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 09:10:00 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1bb119be881so16998255ad.3
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 09:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689437399; x=1692029399;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dlXfOddrFtSbk3KLsUxX/cQAfM6YvXsCC3tzuC8JtIA=;
        b=ju/UcbxTUdXloUSe2awGZTeWdiKoG9GE1v/Om1Ghyy/Q6qbUVoCFFtk31gLEdjDB1P
         EgccdhYPJSCUE0F71Y3WTOV6fDQA7e2xOiOe8GKagk/OZoqGC5sLuA2zmOqpPOegL7pN
         /ZA901PgHOfmizBDoJO2G1fxYZnmYE3/1qHrGmSicaD0OThw8agHdLQI/6H2TEeIjERG
         slJ8FP2ojoxKrJmeLOg9fYp2eXFJ1JDtVZ4kN185SDocBQ+rSeJV1jdgE3ytvgjvEnLy
         bK9RZ/hAh/2e4RM8qSCKK2b9lBn7cB3CGBpFvvzQaS1lOfbUFBxw2cOohj9It22C3NmX
         aXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689437399; x=1692029399;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dlXfOddrFtSbk3KLsUxX/cQAfM6YvXsCC3tzuC8JtIA=;
        b=aeHA1WvTlwxVecCCAdq5S+KbqYVAZIsqsHaCYGeORHKWsQq7p229TXdEk+UyUBXr0Q
         5bLECBizyj24KQy3Y8hIP+6J6exkIiBQPq2Bt8KmUlQIom//jtgqrjFWKywZOGJ28qQg
         ZGy5fs7zX6slr7YLvpqWfBDzG6//YqkHn9gyzoSekt4u9gLzdeX+9eHk0lfYkECMf1Im
         4L5a/zlUtzOp3+RrWGw7NH5jTn1yK+0OMOs2t/stauLuDCgnA8l09a9XTlWMcYaRQaC8
         1eqBQYKUGXt+LaBnf6SwsjxOrI5eICqOs7Nou9uYWQo05bHb6vPTjSlpJBAAHhCBiCyt
         hauQ==
X-Gm-Message-State: ABy/qLZ8EXYkXCyIrrok/bw+W/haySI4//Gs3JLsZxGg0PkpOCtlKB14
        C6ZfxuIPSqPq7EFaDPZQMSKkh6Iz2z8=
X-Google-Smtp-Source: APBJJlFhtpjyo08Pv6JCehOB3gccTNPCNXk6AUs7M2eSJviOEAVZE5J+e3udFR8AMQocjUrapkB0Rg==
X-Received: by 2002:a17:902:9a83:b0:1b8:b285:ec96 with SMTP id w3-20020a1709029a8300b001b8b285ec96mr7043533plp.23.1689437399508;
        Sat, 15 Jul 2023 09:09:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g12-20020a1709026b4c00b001b7ffca7dbcsm9645016plt.148.2023.07.15.09.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 09:09:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fbd3724f-2c89-cdf6-5fcf-3ddbbffd8aec@roeck-us.net>
Date:   Sat, 15 Jul 2023 09:09:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Ahmad Khalifa <ahmad@khalifa.ws>, linux-hwmon@vger.kernel.org
References: <20230715152931.1307087-1-ahmad@khalifa.ws>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (nct6775) Change labels for nct6799
In-Reply-To: <20230715152931.1307087-1-ahmad@khalifa.ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/15/23 08:29, Ahmad Khalifa wrote:
> nct6799d-r and nct6796d-s seem to be revisions where the former
> appears on ASUS boards and the latter on ASRock.
> 
> The datasheet for nct6796d-s (dated 2022) has several updates
> over the datasheet for nct6796d (dated 2017) so we know it's
> closer to the nct6799d-r (though have some minor diversions).
> 
> Since both will be detected by the driver anyway due to the
> chipid mask, they should be labeled together for dmesg msg.
> 
> Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>
> ---
>   drivers/hwmon/nct6775-core.c     | 5 ++++-
>   drivers/hwmon/nct6775-platform.c | 2 +-
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
> index 236dc97f4d22..7163a2473fa0 100644
> --- a/drivers/hwmon/nct6775-core.c
> +++ b/drivers/hwmon/nct6775-core.c
> @@ -33,10 +33,13 @@
>    *                                           (0xd451)
>    * nct6798d    14      7       7       2+6    0xd428 0xc1    0x5ca3
>    *                                           (0xd429)
> - * nct6799d    14      7       7       2+6    0xd802 0xc1    0x5ca3
> + * nct6796d-s  18      7       7       6+2    0xd801 0xc1    0x5ca3 (*)
> + * nct6799d-r  18      7       7       6+2    0xd802 0xc1    0x5ca3
>    *
>    * #temp lists the number of monitored temperature sources (first value) plus
>    * the number of directly connectable temperature sensors (second value).
> + *
> + * (*) nct6799d-r based on nct6796d-s and both quite different to nct6796d

We should not say "based on" without evidence (that is, someone from Nuvoton confirming
that this is the case), and "both quite different to nct6796d" is just confusing.
nct6799d is _expected_ to be different to nct6796d. This should say something like
"nct6796d-s is similar to nct6799d-r with minor differences which do not affect the
driver".

Apparently there are also NCT6796D-E (Nuvoton's web site) and NCT6796D-R
(LibreHardwareMonitor). Do you know anything about those chips ? Based on the
chip ID, NCT6796-R seems to be a variant of NCT6798D with chip ID 0xd42a.

Any chance you can share the datasheet for NCT6796D-S ?

>    */
>   
>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
> index a409d7a0b813..e8298befb77f 100644
> --- a/drivers/hwmon/nct6775-platform.c
> +++ b/drivers/hwmon/nct6775-platform.c
> @@ -35,7 +35,7 @@ static const char * const nct6775_sio_names[] __initconst = {
>   	"NCT6796D",
>   	"NCT6797D",
>   	"NCT6798D",
> -	"NCT6799D",
> +	"NCT6799D-R/NCT6796D-S",

Alphabetic order, please ("NCT6796D-S/NCT6799D-R").

Thanks,
Guenter

>   };
>   
>   static unsigned short force_id;
> 
> base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
> prerequisite-patch-id: 36e3467bd9ea72cb3ad2bef638a8389a9537d111

