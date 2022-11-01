Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB9EC433FE
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Nov 2022 19:22:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbiKATW5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Nov 2022 15:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbiKATW4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 Nov 2022 15:22:56 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D0F01EC6F
        for <linux-hwmon@vger.kernel.org>; Tue,  1 Nov 2022 12:22:54 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 20so14271457pgc.5
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Nov 2022 12:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eEtZo/a1sd1wcSWZKkoCrX1avRUJt1UjkNS0NlZQL/4=;
        b=QEA1iXc37I5rzSs5hKflQbAc2y8xw0vwFh2PE/vObyapp49iv5wDtqXSZ2s+okrFcV
         gyuGIG29rF1qYFGN9vB0i4BdahCR4D2AZVB7MZ+X+lYggJKjfOHgIvLd9JTq0BZfG10i
         17xgpZAPG3HAGMGnDSlqeQ/+LzNSazkJFQCdTxWpKfNqFH9WIgLM1OYC2zXERuVLJYlb
         O+Om0cNyMMG6jo0GcspPvpvx7bXKxcA9lUqnqKJUKnXHMEXZatGjrTR/bbNe2dq58cpJ
         0o8ka+lGLBr4d8Uj2uC3kp4phufIRlupcic3UfKS5rjfLf26UbkerewjEr84Y/tCa/g6
         nRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eEtZo/a1sd1wcSWZKkoCrX1avRUJt1UjkNS0NlZQL/4=;
        b=ctrjN3DLCPNfaEWa4lwkrhkXPynvmmZ32PEqXH/9mUYB/OrZB/OnrJTwrhzcLMXmH+
         qsJrzuNuRUbRQ9dz9GinsBLM6JA5Hk+98S+kmNFB6UYfo4EEDRryZb99BHpK+RrRJOk4
         BU5K2GsmjS45nsbwmYyWPF2eOHR7Kqz9QLkPtzlOHya0QbdLXNdqYQLX+Z/f3XO8tSE1
         EUniKxcBYtJvoe8rOtoQij0fBTdqN3fuLxt+yddaVMbjngcWIR8WQCnEfUsaYaTFVskJ
         qQ9SHQckSC3M+Sc0VbsImDMdt/amel582elgnadCI+JTTakM0AgXlRI9BaQIL5I5VNEA
         h0SQ==
X-Gm-Message-State: ACrzQf1lQbWWWDmqR2ogGI7uTk99tiwkO9exAhaTvJQbbblEH/GbYHXi
        ZBWa495Q5lCyjSEjToUnuTzN4w==
X-Google-Smtp-Source: AMsMyM4uxb/DbCv9KgzTqU7n0Ij38fHEqA9N+MdGN8qw+d1O/PEts1FOLgUcQX0ndANjcIiYy+nd3w==
X-Received: by 2002:a05:6a00:810:b0:56c:df84:1b2d with SMTP id m16-20020a056a00081000b0056cdf841b2dmr21622827pfk.66.1667330573898;
        Tue, 01 Nov 2022 12:22:53 -0700 (PDT)
Received: from ?IPV6:2405:201:d02f:da6a:d4a2:1253:adfc:370? ([2405:201:d02f:da6a:d4a2:1253:adfc:370])
        by smtp.gmail.com with ESMTPSA id m14-20020a63fd4e000000b00460c67afbd5sm6279892pgj.7.2022.11.01.12.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 12:22:53 -0700 (PDT)
Message-ID: <2cad1cb4-b16f-201e-0593-2599ec8abf8f@9elements.com>
Date:   Wed, 2 Nov 2022 00:52:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: fan: Add fan binding to schema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>
References: <20221013094838.1529153-1-Naresh.Solanki@9elements.com>
 <20221013094838.1529153-2-Naresh.Solanki@9elements.com>
 <20221024161806.GA1855651-robh@kernel.org>
 <dcd22f70-e51c-290e-c11f-9a5ce32748c1@9elements.com>
 <CAL_JsqKT52ULEZjKo9emEAt74nH2OpMO8ymLLKM_T-NzAwqGog@mail.gmail.com>
 <3152c290-8aca-b91a-df20-335c33395835@9elements.com>
 <20221101184402.GA1884153-robh@kernel.org>
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <20221101184402.GA1884153-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Rob,

On 02-11-2022 12:14 am, Rob Herring wrote:
> Does turning off fw_devlink help (fw_devlink=off)?
This didn't bring any difference for the error.
Failing due to same consumer & supplier.
Returning from here:
https://github.com/torvalds/linux/blob/master/drivers/base/core.c#L702
Also this can cause return:
https://github.com/torvalds/linux/blob/master/drivers/base/core.c#L732

Regards,
Naresh
