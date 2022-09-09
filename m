Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DFBECAAA1
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Sep 2022 16:59:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbiIIQ7r (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 9 Sep 2022 12:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbiIIQ7q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Sep 2022 12:59:46 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CDD625284
        for <linux-hwmon@vger.kernel.org>; Fri,  9 Sep 2022 09:59:44 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id x10so2583054ljq.4
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Sep 2022 09:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ql3YShxCvfwOd1yaJ2SrG8NA5IT316l4wnpDFrUd5i8=;
        b=cy0dBIh2VfqaTt0dv8T+F9mubGXWOuHFQHQNk+VPWOAJm6PKjxUNFN3WCfhDuiMv27
         WzPUky2fLM1pSJssD6xPAI4qbg+ag6uksii3UlfH6dziEwwuBCNoa/VSs7PmU06zfF8m
         loBjpIEwYv8wyePEQesT+QHLkHfpJoKIM4eiWN0fwssM9IWzOphutCFJMx2csjXsOGql
         gJ/FNomb9ChsdkXUPt09zpJ3tgQBdgDCXgV+o3TjPmYmQyfyb6boDpaSOXaFQ6dDtMfc
         mBVg7bot4Mt6BSAtn5jY6JH2IMK57IjRrKONqm0eQjd7ULmR9eBy+Bh+AdpoDGao/ICC
         cJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ql3YShxCvfwOd1yaJ2SrG8NA5IT316l4wnpDFrUd5i8=;
        b=7kblV4/dzFVWu8T51MUI1uVxmU3LNcZIJ0hYyNAZuJdAA4LZqNugv1m+hDeGCMapFD
         IFxAJhyjHaIEWdWVMDPv1Osl+yI7xYiL2H4gINNRoplst3GWuM6OlRjW0b6EnqSrC1fE
         saq+lx/5SLvHyr+LTjQ6EKL8BZULcqMHWkAfqSrSS3ajNQpCgiLmHBHkeiJ1iu9ctvN2
         z4ztV3Oi1QmBwf+/K1DBBWuwt5M9cVn7wrU1oMKeZFVYKt/DsQZ1Es1Nl4anbtKC8pU+
         Fx0AWIiGgRthKVq49EHdUCfwKgdTXZaRrmgAzDTrIwXHIe0+Na+/i/KuosJC5o5S5cNT
         6dNg==
X-Gm-Message-State: ACgBeo345Ed+zojQpo8cdgvDoyhpeQ0YnTMQvokUSJOumJOBs4P/Hp0/
        FzeUkFZqOB3moLWXjMlph+j7Kw==
X-Google-Smtp-Source: AA6agR4r4QMgXaqfAUxwOTtjxr6FDHQlE2UN3PoeQoARGTTOMFNHhWbzEfKHPt+sHLQ+6hFvHcpAlw==
X-Received: by 2002:a05:651c:12cb:b0:25e:44ef:8bfa with SMTP id 11-20020a05651c12cb00b0025e44ef8bfamr4352879lje.324.1662742782699;
        Fri, 09 Sep 2022 09:59:42 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u5-20020a2ea165000000b0026a999966bbsm153473ljl.24.2022.09.09.09.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 09:59:42 -0700 (PDT)
Message-ID: <bd277041-db44-58c2-54f5-94f081a07f30@linaro.org>
Date:   Fri, 9 Sep 2022 18:59:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v8 3/4] dt-bindings: hwmon: Add bindings for max31760
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Ibrahim Tilki <Ibrahim.Tilki@analog.com>
Cc:     jdelvare@suse.com, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@roeck-us.net,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
References: <20220909133718.388213-1-Ibrahim.Tilki@analog.com>
 <20220909133718.388213-4-Ibrahim.Tilki@analog.com>
 <1662740789.477872.1507147.nullmailer@robh.at.kernel.org>
 <20220909164710.GA1537271-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909164710.GA1537271-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 09/09/2022 18:47, Rob Herring wrote:
> On Fri, Sep 09, 2022 at 11:26:29AM -0500, Rob Herring wrote:
>> On Fri, 09 Sep 2022 16:37:17 +0300, Ibrahim Tilki wrote:
>>> Adding bindings for Analog Devices MAX31760 Fan-Speed Controller
>>>
>>> Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
>>> ---
>>>  .../bindings/hwmon/adi,max31760.yaml          | 44 +++++++++++++++++++
>>>  1 file changed, 44 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/hwmon/adi,max31760.yaml
>>>
>>
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> ./Documentation/devicetree/bindings/hwmon/adi,max31760.yaml: error checking schema file
> 
> Not sure why the error is useless ATM. I'm checking that.
> 
> The problem is that 'reg' is a matrix and you need to either fully 
> define it or use the simplified form for a single cell:
> 
> reg:
>   minimum: 0x50
>   maximum: 0x57

I think this was in v7, so I understand that schema in that case expects
the third option from anyOf - #/single?

https://github.com/devicetree-org/dt-schema/blob/main/dtschema/meta-schemas/cell.yaml#L62

Best regards,
Krzysztof
