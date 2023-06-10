Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59DDC7EE29
	for <linux-hwmon@archiver.kernel.org>; Sat, 10 Jun 2023 14:36:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233213AbjFJOgF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 10 Jun 2023 10:36:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjFJOgF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 10 Jun 2023 10:36:05 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A817C2717;
        Sat, 10 Jun 2023 07:36:03 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b3b974fffeso488435ad.1;
        Sat, 10 Jun 2023 07:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686407763; x=1688999763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6KOquPPmsyPpqOyBPjYxm5Eg80o3r5F4SIEOnTZ5oww=;
        b=RumrAgh1XvW5y71wNVUogVxTq0/m/CKGpxLTCkh7oEiV6vZ0ZCH3WhU363lLnQTVul
         k+WSIDpTYEZ4YPGmaBlB6T2HMkGDf+ip8By0kif4Y8HWvYN1vJQbXKdVN0BtAPa9nFmu
         rI9OF8Wut2hG1WJcNsS+9NVoqv1JyRl5rrFm5uP/MAzcyDa04X+iBbujg67IKZsSRU8m
         siTFQOntN71LfMhNl0ZgAxQapCjFOKcuHZmtJsIsQdchN9+i0EeYynphAQw2BR/FcxlT
         4zIrE+UBcYaMAc4Q6Zh62xaXXY0kF9FPLnpUSEVhoPWSnAKHf/ijkv3rExRafrK8SgqP
         tnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686407763; x=1688999763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KOquPPmsyPpqOyBPjYxm5Eg80o3r5F4SIEOnTZ5oww=;
        b=kyfmqEM7k/IiZ6neE26YJ4l9s1+5HeFqQY1xr61bulsw7g1rR9UmHBqCFooqYkBox8
         y1uO6x3OUbLJ1dsd5E7nTowtd71odkf1a1rfMrylqbpuBCbQOvLXJixnbo0ZLumOD2Tk
         9PxZ6m+A77m7A6ZU9PUTs4rHRhQZyuwOstX7s2uB9fBqsgZUCY1jmXDa4dzXjuySZU5f
         RYzq/lHXa+CmTYGCRCiBYwpkmWU10ug+yDpsm4C4GDACqRCMHFwBOTCArla1/y/fJlXw
         MX0c2XFnDSvYX3yPE5WbXUxuxAObKIh3tr3nPOqOWsVBk96rWw2xx15CRmJGQiNCDZER
         F4Kg==
X-Gm-Message-State: AC+VfDwg4z//ArvPmvcO3Jx6qAGcXyUfNzWmSfzEK0VlGt1eLdQEA7Zj
        MpXkbKezq0vvhoqnS8/+ZzE=
X-Google-Smtp-Source: ACHHUZ5AfANCtQlaB3VU7G7Eks58LzSfqP5IbJa/5Pc6nljepjKZ+nrJNxHX/UiGfHSH7tMc2XDBNg==
X-Received: by 2002:a17:902:76c6:b0:1b3:b6e9:b9fc with SMTP id j6-20020a17090276c600b001b3b6e9b9fcmr523314plt.64.1686407763121;
        Sat, 10 Jun 2023 07:36:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x21-20020a17090300d500b001aafa2e212esm5097691plc.52.2023.06.10.07.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 07:36:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4762a3fb-0e17-1d56-6c6a-4db9053b5c8f@roeck-us.net>
Date:   Sat, 10 Jun 2023 07:36:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/5] hwmon: Update single register drivers to use maple
 tree register cache
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230609-hwmon-maple-v1-0-8edacce86b28@kernel.org>
 <e2c965e9-3bcb-5857-087a-9e457040ab88@roeck-us.net>
 <da6696d1-7b3f-4366-a0a4-e2f7bafe8cbf@sirena.org.uk>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <da6696d1-7b3f-4366-a0a4-e2f7bafe8cbf@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/10/23 07:24, Mark Brown wrote:
> On Sat, Jun 10, 2023 at 07:15:48AM -0700, Guenter Roeck wrote:
>> On 6/10/23 06:59, Mark Brown wrote:
>>> A number of hwmon drivers only support single register I/O and therefore
>>> gain no benefit from using the more modern maple tree register cache
>>> over the rbtree cache, convert them to maple tree.
> 
>> "gain no benefit from using the more modern maple tree register cache
>> over the rbtree cache, convert them to maple tree."
> 
>> Is that really what you wanted to say ?
> 
> Sorry, other way around - gain no benefit from using rbtree over maple
> tree.

That makes (much) more sense. I'll apply the series.

Thanks,
Guenter

