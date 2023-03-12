Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0BAC6FD19
	for <linux-hwmon@archiver.kernel.org>; Sun, 12 Mar 2023 18:47:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbjCLSrV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 12 Mar 2023 14:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbjCLSrT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Mar 2023 14:47:19 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7472CCA11
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Mar 2023 11:47:12 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id da10so40410960edb.3
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Mar 2023 11:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678646830;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZQyFHU+PDg5rIzHHbKNfiNiaCBRfg6+xiVlzWocsZCk=;
        b=wd+gayo0Tp6kcFcYQ88SP3+G6Ic9gnT1f0jC0pb6LbxTVAV9e+9Tpymux0UPJuu3ad
         g76AmrGs9NxNIQjXusVz2njbItT8EFNvyhak2YM0M4G3vJ7s4aqnxGpFHCLmtsBtTw4W
         uzWX9KGI3S5vQwMdf3zYQVNXLiohV72kVnwoO9ia9GIR4KzJ4fBRXaS410j3uWTNvFMX
         HPLHzokRvSiJFZOngeFNL32lh7pqUdOtCbGF2ll5nLb90i1ItuFFfapxgTY9kx+I+65C
         MvntuiaomvgPTNq4baitA0CHnQMQO9r8NB4Ueow32iv6SWGYd/sauur9rDG2JIFQPcWJ
         KJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678646830;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQyFHU+PDg5rIzHHbKNfiNiaCBRfg6+xiVlzWocsZCk=;
        b=lc+uRAHS4e95k3or2+NPFyY4i8wpcAyjOYnU4H1/fD8Dxv+OAoQt2y6j1BJoheyUf+
         FI2atpNX8L826heyB7q4WVdJIeZj9hWJHjtWBzwz3lmJdyr/gRh5YMMNxbvJVYw+/bY7
         zV4wjXRxMDo1QAmujP/vz7cFllp+rhls0EOfwLzYrpE+ACvOSYbcVDB+kQd/e4zjZj+R
         WnEMP2PMoB4v/vlxsoXjq6GKs1knzh4dGFO6xCsg4aDcqRgrjCUYaow2wklWcfAmn9Db
         9ASlyjn4EsOvE0hyIlGVaCvGWDfWrjrtsmhhy5iiqVNYZ+PhmFXA0kRNFHf7prOczMRo
         JucQ==
X-Gm-Message-State: AO0yUKWMGv0vA65wn5NexXqWl1pPWQmvnM2qTL850vl2Z5fm4ggGAgUX
        oDGWLTIKKleg7GwrkOT7cro2pmEx+Io8FVItEFI=
X-Google-Smtp-Source: AK7set8GMUxrCVnfjDOZ40HQQuFO9Inwtw5gLPjZu0jDjgvT6N+rgZdrXrtrOdJjw76bWjY2yz03Rg==
X-Received: by 2002:a17:907:a581:b0:913:f170:c0e with SMTP id vs1-20020a170907a58100b00913f1700c0emr23363397ejc.20.1678644492712;
        Sun, 12 Mar 2023 11:08:12 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id sb26-20020a170906edda00b008d02b6f3f41sm2446028ejb.211.2023.03.12.11.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 11:08:12 -0700 (PDT)
Message-ID: <48b6689e-f045-5e24-ead7-f6da5b8fe454@linaro.org>
Date:   Sun, 12 Mar 2023 19:08:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] hwmon: gpio-fan: mark OF related data as maybe unused
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Eric Tremblay <etremblay@distech-controls.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230311111610.251774-1-krzysztof.kozlowski@linaro.org>
 <cd9067c7-0b99-4d62-9d5a-cdc028f33ba5@roeck-us.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cd9067c7-0b99-4d62-9d5a-cdc028f33ba5@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/03/2023 19:06, Guenter Roeck wrote:
> On Sat, Mar 11, 2023 at 12:16:09PM +0100, Krzysztof Kozlowski wrote:
>> The driver can be compile tested with !CONFIG_OF making certain data
>> unused:
>>
>>   drivers/hwmon/gpio-fan.c:484:34: error: ‘of_gpio_fan_match’ defined but not used [-Werror=unused-const-variable=]
>>
> 
> How do you trigger that ? The driver depends on OF_GPIO which
> in turn depends on OF. Arguably that means that of_match_ptr()
> doesnot really make sense, but still I don't see how you can
> trigger the above error message.

I can drop of_match_ptr, it's indeed in many cases not needed.

I just build x86_64 allyesconfig minus OF, with W=1.

Do you want to me to drop of_match_ptr?

Best regards,
Krzysztof

