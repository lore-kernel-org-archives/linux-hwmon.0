Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5107CC678D5
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Mar 2023 10:37:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbjCHKhI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 8 Mar 2023 05:37:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbjCHKhB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Mar 2023 05:37:01 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C47721C325
        for <linux-hwmon@vger.kernel.org>; Wed,  8 Mar 2023 02:36:38 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id u9so63885197edd.2
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Mar 2023 02:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678271791;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VG+RlrvK7dZWuzlwZ1EYIzr+/GC/6ow/DPfTqBZGod4=;
        b=LEii19fZHdyPtUtrIbxlgmS8ZY8i5KnQZi6X3CkZvve17XFtkFB1QTXGNSLxzX/YSV
         Eql3hZ5/oMgUfyTQtsgiWcTKuQ22bwtycmZSddNcGS+Pz84h+SjX06d8ZRaAyoypdiEF
         kZwTsrAv2Y6Uiu2tSqwjdKWNMraWGE40vSv67fl/aAPZFrmC1M0aaHIDNX92fi0PzonY
         LwQMz4y+MjUhTedroJ9LgFj0+5thiYgrgVxNNxP4zB5abDy3p6asS6E3eYkbMbZqrNxp
         9+38WdnNKm02t1i5vnATS0FBgPxHtc104iqJLuWbpJRugxNrjnVdwBF0fz9NI97X+eac
         VJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678271791;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VG+RlrvK7dZWuzlwZ1EYIzr+/GC/6ow/DPfTqBZGod4=;
        b=ufWfffKTTZGikg6M1JDqR3RanCDknacx5JIgRbsTvhbN28md+po4aytRzaeVg/A1W1
         qFpZPIJ4tyJK43AYhofTqZiazqKB8JRHAWT/9GwGWQ+jFg9iULZDdnUIaRWeYflvztUo
         0aUv5N+1ExnkVXNMd05qt5RRz1JT+3CcGOcsfrAH2wy+RdW2v7GJSi2yZTl/znqnhKmE
         aw3oGIa1X6+gOS7+jdsbGAlLx9VdoajUToXmcK4tQsrncAniogM/9asQo9tU0esLEvIw
         +YdT8PpxiG6wjHd/CYFyGVnT00wBXxobNk9vI3Bp+d+zrbogAhmcNwPBthxtjhgy2IYf
         JFcQ==
X-Gm-Message-State: AO0yUKXeCCSZY+SsNTSviFbfchrlWWQKjxEfIDZsE2oM64G1aHShZSue
        EH+0HnzuyOCvSP6ULcZJs35jUAkI7CJUjDI7X0g=
X-Google-Smtp-Source: AK7set+XBkFvOC4Zw1V00sJcba/mjbhIsdM76P8x5GoJIkuLsllH0XcGs1KzVG/UTXiT1PAi0vj+XQ==
X-Received: by 2002:a17:906:bc57:b0:874:e17e:2526 with SMTP id s23-20020a170906bc5700b00874e17e2526mr16260378ejv.72.1678271790829;
        Wed, 08 Mar 2023 02:36:30 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id ga2-20020a170906b84200b00882f9130eafsm7253599ejb.26.2023.03.08.02.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 02:36:30 -0800 (PST)
Message-ID: <52f951e6-1b14-1a47-0a62-4203978be024@linaro.org>
Date:   Wed, 8 Mar 2023 11:36:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 1/2] dt-bindings: hwmon: ina2xx: add supply property
Content-Language: en-US
To:     Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230308094024.14115-1-clamor95@gmail.com>
 <20230308094024.14115-2-clamor95@gmail.com>
 <559c2588-e586-b4fb-97f8-5fe25bb79607@linaro.org>
 <CAPVz0n38LtyAqBP4GfC003xzaW78FaZ91zjdTNe46ormL5RY=Q@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAPVz0n38LtyAqBP4GfC003xzaW78FaZ91zjdTNe46ormL5RY=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 08/03/2023 11:32, Svyatoslav Ryhel wrote:
> ср, 8 бер. 2023 р. о 12:27 Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> пише:
>>
>> On 08/03/2023 10:40, Svyatoslav Ryhel wrote:
>>> Add supply property.
>>
>> You have entire commit msg to explain and give background, but instead
>> there is just sentence duplicating subject. And since you did not
>> explain anything, we have questions... like: INA238 does not have VDD,
>> so this does not look correct.
>>
> 
> This is why a regulator is not mandatory. If ina238 does not have vdd
> then one who needs ina238 may omit this prop. How about looking from
> this perspective?

Not required means "optional", not "not existing" or "totally invalid".

Best regards,
Krzysztof

