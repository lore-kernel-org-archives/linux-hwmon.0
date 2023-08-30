Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455ACC6FA8F
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Aug 2023 20:29:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239281AbjH3U3D (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Aug 2023 16:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239566AbjH3U2y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Aug 2023 16:28:54 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A59873052;
        Wed, 30 Aug 2023 12:33:07 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-792623074edso30088739f.1;
        Wed, 30 Aug 2023 12:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693423937; x=1694028737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=phKhrjG7sXSAjhn653McWF0Xp9kDLF4E5/rGNJ97Y4k=;
        b=iaqimD4gB7qmOLd6a3coQzU+ciA8nwIbWgq+ir17l5uJDP2hFTmBHaqHVUuPZHqg3g
         +kNunaCZrj988vhf+P9ZBR/yoQ+fn09FFzQf/NSbgzKlaBEkrFJ2I2GMR5mIir24M2KX
         8U/TrSr59Ik6bezjgbY6nMQHaFOsCnTr1FnwxHR+XXVRueObfVxAl7YkqJbBHxZLnGkN
         IxDohJkUfDlXOdGX3DsTyw4KKvskSbbDxesDRnU5Cikh/KXzp6sU5tvvYSyjByZObhh/
         sON2tEq2DEwNLxbk1p8EJp9GYI90L+U7nJcF/NWc17fJbeYSEkIpDCABf6M9+JpHIt9e
         viJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693423937; x=1694028737;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phKhrjG7sXSAjhn653McWF0Xp9kDLF4E5/rGNJ97Y4k=;
        b=E7HL6iCX29ETcqp/WZWPy3RgVPD/HVboXPApbXqjAjSbHayriblvv82LH1ggVbM//N
         JP2HKRy2FSTNw3E0qcy5Nlw5CN7vtWPSnlYaxzPPXjm6X8SqcEjBK0Ni89VILxCirIsP
         hhwE7btA93aY3d91ra+noNH7a53URF+4qb0v7ARI2SE452Oib/us866ockymUtdKCg/i
         91uD4e8KR2vQeJJyiG7bJnTfEZtXA9+scBPLW3Gp030oFQ/Yk7t73NR8UC211pd/Arkk
         bA7d7tfXdbFKUHKocQFjElgp+F5iTH87Jh0C44sx20OqUFwZPQ5eR/nKT61FTzRi2Xp8
         tRIA==
X-Gm-Message-State: AOJu0YwFV8PAxX4GITjV2MomyeHPWdDCHJw53jUdVUMQPzNseiAqTn7a
        1+vsd0fAQuwvrOwYDbcaFQx6PpSCNWE=
X-Google-Smtp-Source: AGHT+IE31EKHM80PdXHF58NCuY7SQ8l1WyQLE2oZUZir0KdXHAlu86zL4NC4+NFUHfHufL2C15OPsA==
X-Received: by 2002:a05:6e02:184e:b0:34d:ecbb:9cc4 with SMTP id b14-20020a056e02184e00b0034decbb9cc4mr529528ilv.3.1693423936749;
        Wed, 30 Aug 2023 12:32:16 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ft19-20020a056638661300b0042b0de0b976sm3900085jab.154.2023.08.30.12.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 12:32:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1efe9234-a97f-6df2-c47d-e153dc362599@roeck-us.net>
Date:   Wed, 30 Aug 2023 12:32:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] regulator (max5970): Add hwmon support
Content-Language: en-US
To:     Naresh Solanki <naresh.solanki@9elements.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, zev@bewilderbeest.net,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20230830111319.3882281-1-Naresh.Solanki@9elements.com>
 <0bfbbbb3-6144-fc9a-c8ab-423a8865591b@roeck-us.net>
 <CABqG17ig1VRJYqbrOvPKAYS8iUFwY9J3tYcgYGtnnXw+vrnoRA@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CABqG17ig1VRJYqbrOvPKAYS8iUFwY9J3tYcgYGtnnXw+vrnoRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/30/23 12:14, Naresh Solanki wrote:
> Hi
> 
[ ... ]
>>> +                     /*
>>> +                      * Calculate voltage from ADC value and MON range.
>>> +                      * ddata->mon_rng holds the voltage corresponding to the maximum value the
>>> +                      * 10-bit ADC can measure.
>>> +                      * To obtain the output, multiply the ADC value by the MON range (in
>>> +                      * microvolts) and then divide it by the maximum value of the 10-bit ADC.
>>> +                      */
>>> +                     *val = mul_u64_u32_shr(*val, ddata->mon_rng[channel], 10);
>>
>> Why do you use mul_u64_u32_shr() here but a direct shift above ?
> There is possibility of overflow due to large value of ddata->mon_rng

Does the right shift guarantee that the result fits into 32 bit ?

Thanks,
Guenter

