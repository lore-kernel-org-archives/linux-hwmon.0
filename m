Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 704E3C7EE29
	for <linux-hwmon@archiver.kernel.org>; Sat, 10 Jun 2023 14:15:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233321AbjFJOPx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 10 Jun 2023 10:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjFJOPx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 10 Jun 2023 10:15:53 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D7B63A98;
        Sat, 10 Jun 2023 07:15:51 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-53f7bef98b7so1607542a12.3;
        Sat, 10 Jun 2023 07:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686406551; x=1688998551;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IbaxMrldH2Y+OjhzwwW+0R2JPpL2TfJlxoz2YfbSuA4=;
        b=kW/adLT7unTokikRDdDRJb1/M5cwmrecBlXYCAwwPmDn8HDS4xTuZaooviASS3wY5r
         DN/wQKNUf6Ocbc+HgZg0KDGMIdoS0HULYSla2sph7+hRf4dYiG7YbjrNLfBL0x0cpsM8
         /lRPjBw/miupYny+JedP58S1ghVPfeqs90RjQFLFKN1IrmfANjtDAT+Q9/tOvysHMv57
         Z+mk/+4J/lY8L/HiEOulLvEDHYGusJM7wSYALlI/BljtnEJXiCZEIFeMUUm/t6syQb2U
         6muxtfg8+rPZOmjyX5qrrQSgRfv5f1Om15j2+SFVOFVegV0NUO0dgr0sROG9jdKdzjP6
         54Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686406551; x=1688998551;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbaxMrldH2Y+OjhzwwW+0R2JPpL2TfJlxoz2YfbSuA4=;
        b=Ha4R4Mi66zh2IJE4lSxSSt4GZkUFqf0IdLH5XJUsR399cGGXIO3lXwQcre0H0nmRtW
         ppMP/ncv/XH/KXnlH97fSYYK18qtAYS1Ts1yHSXmm4NqOcViQ/uCxfsZeRdf3t19vet8
         uCwy831pbitNYhQylNgfgHYJGd79GmMsESmSY33UkzSjPlIyTX8e+evHcGprISj2McsN
         A0KmpBxBf1b3Tbs3isJAktjeHWa0nYbwh9hTcYqn9Rrf2uI+zxzf61E2pjnlcPmVWqqI
         YyVhfwgNIEBGjhKIijRYY8R33ftW6rJ73Nv6pEf0nY6bn7sydASl9mz07BW4D4tak6z/
         Expw==
X-Gm-Message-State: AC+VfDza9X9l8pStEjYhVJpTnBeQeSB1oK7qb0t1Reqb8zngBeiNpNMv
        /bxRZxALxeG4zJ2PTrDYGRCfcrAldjM=
X-Google-Smtp-Source: ACHHUZ4l8HqifCojKcc90Yn8EAFdP14sx5HjVL5ZZOd8rRiuWUuQoY745e4B4c9Lci4KlOd0b5CoPw==
X-Received: by 2002:a17:90a:303:b0:256:d4a:ea4c with SMTP id 3-20020a17090a030300b002560d4aea4cmr3905414pje.30.1686406550604;
        Sat, 10 Jun 2023 07:15:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l14-20020a17090aaa8e00b00256dff5f8e3sm1129593pjq.49.2023.06.10.07.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 07:15:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e2c965e9-3bcb-5857-087a-9e457040ab88@roeck-us.net>
Date:   Sat, 10 Jun 2023 07:15:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/5] hwmon: Update single register drivers to use maple
 tree register cache
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>, Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230609-hwmon-maple-v1-0-8edacce86b28@kernel.org>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230609-hwmon-maple-v1-0-8edacce86b28@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/10/23 06:59, Mark Brown wrote:
> A number of hwmon drivers only support single register I/O and therefore
> gain no benefit from using the more modern maple tree register cache
> over the rbtree cache, convert them to maple tree.
> 

"gain no benefit from using the more modern maple tree register cache
over the rbtree cache, convert them to maple tree."

Is that really what you wanted to say ?

Guenter

> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> Mark Brown (5):
>        hwmon: (lm75) Use maple tree register cache
>        hwmon: (lm95245) Use maple tree register cache
>        hwmon: (tmp102) Use maple tree register cache
>        hwmon: (tmp108) Use maple tree register cache
>        hwmon: (tmp464) Use maple tree register cache
> 
>   drivers/hwmon/lm75.c    | 2 +-
>   drivers/hwmon/lm95245.c | 2 +-
>   drivers/hwmon/tmp102.c  | 2 +-
>   drivers/hwmon/tmp108.c  | 2 +-
>   drivers/hwmon/tmp464.c  | 2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)
> ---
> base-commit: 9561de3a55bed6bdd44a12820ba81ec416e705a7
> change-id: 20230609-hwmon-maple-89029163bed2
> 
> Best regards,

