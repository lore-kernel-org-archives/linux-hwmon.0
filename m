Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA20C001B0
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 Jul 2023 12:25:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbjGZMZO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 Jul 2023 08:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbjGZMZN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Jul 2023 08:25:13 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 805A1E69
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Jul 2023 05:25:12 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-992f15c36fcso1120742566b.3
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Jul 2023 05:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690374311; x=1690979111;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZlhtyM+OrTTctRIsKX8V1gw7veM/quE3CQ/8xqXe/V4=;
        b=jBXnauaEBV4Ci/AfNaTw9YyCnVwegJCt/Lkk1yJiBLu1VjfJfv3Ug8jDCtfAwfu6+5
         v2ijcvGGrm39P/7eCGiLUG7RQYoGdGfPTLU85thv+RFUXliYEgJbOfNABzsWvKvmtcnn
         iaA4fTSTv9XrO9yQnpnsq5r+D6H5EOpC+VKlrA0jsf9qSYp01GrbzQI7qf2NRbqD+2KH
         LT54lGXhNOzeZXFJUDi4BxLrv3y04D2b5ls0ejbRkXuUIq2Wzr6sQzpFQQllzkLorges
         S5dkmsg/Qr0GPdwUgPq46ffe9SFaqZelXiyQkkWFbNgLNTkTa3Q59X6G3ZGzwk3/uciZ
         vM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690374311; x=1690979111;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlhtyM+OrTTctRIsKX8V1gw7veM/quE3CQ/8xqXe/V4=;
        b=I3R6/shvQvmnr0eLXX7STcMTONA7qKd2zhtTXJ52CBOB89A3xaQ7OYNf8eIxejsIgf
         pwsCSUFE2aW1e9jVWWFb2pEC/Y/aPltbPd1iW97ydDW5PZYsDzQvne2bs2wT38tTh2j3
         zHyf6S5nSSS7E7AVqkUs46S+WdhT/sMiABcrLW/h68TwmV2+piWkIcc1tiLzGiYVrMcH
         pV9j9B0zTS6m/qXfm+GpsoEgW1/5InujIrevwKqBxO/V/Ankk7hCt7fUuO/nguUGCI7t
         uvOFlMYP3kYxgYzTiFk1jnY6ekX9Ss64DMtl9IW6U2K6JWWqQmGDiNaxd5uqYeZPK3zm
         QBvw==
X-Gm-Message-State: ABy/qLZ5k15BmRxktNSCWeVCyl/T8OVuHDnZ4/ZGeIu4kJOQWWdWHsS4
        DCFa9p5Uo2JIlYXCO4li6WBt1Q==
X-Google-Smtp-Source: APBJJlFGA4XUY2FqvE0YIn/1R8i6M97EGxmz0JJ77jnidALchE4QpWT5FXR5ELobtg5JlZKYU5LwgA==
X-Received: by 2002:a17:907:7883:b0:993:eddd:6df4 with SMTP id ku3-20020a170907788300b00993eddd6df4mr1660612ejc.10.1690374310935;
        Wed, 26 Jul 2023 05:25:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id qh1-20020a170906eca100b0099bc8bd9066sm661019ejb.150.2023.07.26.05.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 05:25:10 -0700 (PDT)
Message-ID: <71e859aa-ba01-eb3b-8272-fa9993318b34@linaro.org>
Date:   Wed, 26 Jul 2023 14:25:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] hwmon: (hs3001) Fix unused variable compiler warning
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     werneazc@gmail.com, jdelvare@suse.com, linux@roeck-us.net,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andre Werner <andre.werner@systec-electronic.com>,
        kernel test robot <lkp@intel.com>
References: <20230726113605.13966-1-andre.werner@systec-electronic.com>
 <11620112-ffe4-8df1-6b38-0f3082c5d16f@linaro.org>
In-Reply-To: <11620112-ffe4-8df1-6b38-0f3082c5d16f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 26/07/2023 14:20, Krzysztof Kozlowski wrote:
> On 26/07/2023 13:36, werneazc@gmail.com wrote:
>> From: Andre Werner <andre.werner@systec-electronic.com>
>>
>> Delete unused variable in drivers probe function.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202307261819.VMDuxZOM-lkp@intel.com/
>>
> No blank lines between the tags.
> 
>> Signed-off-by: Andre Werner <andre.werner@systec-electronic.com>
> 
> Was the original patch actually merged? I don't see it in next.

Ah, I see Guenter's response.

Best regards,
Krzysztof

