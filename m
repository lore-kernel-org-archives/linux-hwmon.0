Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66CD4C2BA12
	for <linux-hwmon@archiver.kernel.org>; Sat, 16 Sep 2023 18:12:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233268AbjIPSLj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 16 Sep 2023 14:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233902AbjIPSLc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 16 Sep 2023 14:11:32 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0574ACE3
        for <linux-hwmon@vger.kernel.org>; Sat, 16 Sep 2023 11:11:27 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-792623074edso102418039f.1
        for <linux-hwmon@vger.kernel.org>; Sat, 16 Sep 2023 11:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694887886; x=1695492686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qJgnjIgEaiJYkPdbX+E/oDKtI0f/E/sZ5IP7Lav9LqQ=;
        b=G52T3Q+Dv8EtkIuAk1m3AtToewxZAk40TJvZEfDcUP2bpXZ15BulYOONnQKeK04/hJ
         DlmQnVTF1Fpg9DZ4ecIfURa1iPI5aL9FjdDFbzObKT6m7uszcE56YLCCQUnX6qUkR92w
         pzk5YLr7A/YzvlEZ4jZJqMMFjSWSl8PlNhqyfCah69SLFakoE775AbxhA6q/AXvOk4MV
         l6zswj4Thgg8Bj1apknlioPPw+yS9FnoO6c7fyAeYyAXjP3mm/C05eKsJTbsPIptYUED
         H6aQlK59UxN7j89Nu/Vk+Tnde4EjzGoVA2gnAXWlSbqW0iv1MxQiMKkQctvtn1ovBMdv
         eOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694887886; x=1695492686;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJgnjIgEaiJYkPdbX+E/oDKtI0f/E/sZ5IP7Lav9LqQ=;
        b=Hjv+WLTdRwBB39degDESE0OGDBaKaMGYxBGzTWT75bsJWcTw9bTErkNy7qP1VToghC
         JyUbS5rUisWcGlBMkIznUS1aJFQPgG4hrkN1PUM0PEsTwMwLaVjG42p8fODhS156oaBe
         bj+kYjyGbKFoOt9oV0RdRIMjkUwaf3jYNBx2Q484/TOmw9wIKtNHx8wtTE4mY6bBwvY+
         aJp3glOm1tTv0e2d93gc6yuYKc4b+2f7Oq19oCa79yZhJhVCSvhuf6YuDGu8xzjuNjvA
         MDWLklHqgN/vZDOu2FaZpZpKRLVojdOpPW4OkdZp5/fNYGL2Hul+0uKT+FTGQEn+0jh9
         +vfg==
X-Gm-Message-State: AOJu0Yyvxhz1fP4tzOqBBEY9aBR1GgE/r0vuAtU3ihQplPbuTp/olKOP
        wgolzsCVqVbrtzjvGFZJcU4=
X-Google-Smtp-Source: AGHT+IEtAWAUP91acVpcVtI08Z1hhej27mc+4+5J7MSsGeJcrqpbJ+qobOYnvGkaiAGMXVSFZxAK1w==
X-Received: by 2002:a05:6e02:1a2a:b0:34e:29ff:daae with SMTP id g10-20020a056e021a2a00b0034e29ffdaaemr7436256ile.7.1694887886266;
        Sat, 16 Sep 2023 11:11:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ei1-20020a05663829a100b0042b5423f021sm1736845jab.54.2023.09.16.11.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Sep 2023 11:11:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <74740d32-acda-cd89-ab11-270ce8393c12@roeck-us.net>
Date:   Sat, 16 Sep 2023 11:11:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: hwmon: (nct6775) Regression Bisected
Content-Language: en-US
To:     Ahmad Khalifa <ahmad@khalifa.ws>,
        Doug Smythies <dsmythies@telus.net>
Cc:     'Jean Delvare' <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <002101d9e7e0$f67c4490$e374cdb0$@telus.net>
 <1b747280-a1cc-d125-a40d-c3bcce39297e@roeck-us.net>
 <322119da-0de6-ffe4-d2cb-0d7cda1c4a53@khalifa.ws>
 <86148239-9c7d-7a62-33bc-bda9812d719a@roeck-us.net>
 <f8f05448-a4b2-d094-47a0-34bd3be7ae20@khalifa.ws>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <f8f05448-a4b2-d094-47a0-34bd3be7ae20@khalifa.ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/16/23 10:45, Ahmad Khalifa wrote:
> On 16/09/2023 18:04, Guenter Roeck wrote:
> 
>> The proper fix should really be in nct6775_in_is_visible(),
>> which should drop the attribute if there is no alarm bit for it,
>> similar to, for example, nct6775_fan_is_visible().
>> Something like
>>
>>      int nr = index % 5;     /* attribute index */
>>
>>      if (nr == 1 && data->ALARM_BITS[in] == -1)
>>                  return 0;
> 
> Perfect, that's what I looked for but couldn't figure it out in
> a rush. If it's confirmed, I'll convert the fix so it hides the
> attribute instead.
> 

I'd suggest to just send a patch. We can always update it with v2
if a revision is needed.

Thanks,
Guenter

