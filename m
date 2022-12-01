Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A22AC4321E
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Dec 2022 17:00:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbiLARAY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Dec 2022 12:00:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbiLARAQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2022 12:00:16 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D462AD322
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Dec 2022 09:00:15 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id l8so2543053ljh.13
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Dec 2022 09:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WXnwTyp0YzPLRKKZLOzA/snGGDPMoFoECUlFdWFKQ/8=;
        b=cN63MJ1yua6tFgv8fqubukDCnpaSammsB9wrt0ahsC14hkp5sjMoKEoc0PSshbAH43
         RunesN1GCo5ibSd3GI34qkdeSvBcR7Dq1jjME8BplO+6GNV/2xPJHPSfS+l0peUYk5bx
         vVfSHCdtlBDg7Cg8zFBxidJG/yFv4+dtAkHCOmh4MrS3+2sGbGYuIyzfHFtwIwTgGXlN
         PjTLoTo9OeV9XM93wvUrohURu39ddWUmQB6c3Pqle1TUFTltlz6K70Fuc8k3mC4L0Rlq
         rtdhxQTQALFVJEd4Q0nMfMHffYSaECzJdtKnkGkRDN/LEk1Z44jqAxbOQ9QaWMZ8Iizl
         M9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WXnwTyp0YzPLRKKZLOzA/snGGDPMoFoECUlFdWFKQ/8=;
        b=YU2eZMa9++2ryP4m+6Gq66NN5EFKlniZfFVyXpHENSkuWdOZZEgwvszc94VuHQypKm
         1c+BlcjXT73R/DHUuqAfitxNndm/Ct/2V18T0i3AumHWVgNFF335DywNrT7IG/0CLj5o
         59SDE+NvRwmObxl1CFev8hGSQ+qTxob8FrcCPtAByxCHHwUn8tArZSShLmKqiaVynZOs
         2nngC6kXHPuuOC97fJRz3AUKecQ0pc/tQevkzsMarsI+YLBz+SgIqwu5YOwCbpzN5GfA
         WWL0ZItbqtY6XY8pSO6jAHeaFMuMzA6asSDNv7lxGcApc4123dR4HdArKlUJIatWRW+U
         b7hA==
X-Gm-Message-State: ANoB5pnbVvN5a2omOAzZZx4iyVyN6zMp1tPua4jVcExuO3GbQkDihJ7s
        8Y9xdV3cKj0ikvBphYI6VzwbgA==
X-Google-Smtp-Source: AA0mqf5V8lf0rMqvlg71kHW8BCttSGXbDCzdME1L5cknr3D55eoHjtElDUF0dTr4LZREa3ygTFHGXg==
X-Received: by 2002:a2e:380b:0:b0:279:8590:8a28 with SMTP id f11-20020a2e380b000000b0027985908a28mr12497729lja.48.1669914013570;
        Thu, 01 Dec 2022 09:00:13 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c7-20020a056512324700b004b50d4521f0sm711819lfr.15.2022.12.01.09.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 09:00:13 -0800 (PST)
Message-ID: <02a90915-2786-9454-1f10-fbf1ab18f8c1@linaro.org>
Date:   Thu, 1 Dec 2022 18:00:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/4] dt-bindings: hwmon/pmbus: Add mps,mpq7932
 power-management IC
Content-Language: en-US
To:     Saravanan Sekar <saravanan@linumiz.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, marten.lindahl@axis.com,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
References: <20221201044643.1150870-1-saravanan@linumiz.com>
 <20221201044643.1150870-3-saravanan@linumiz.com>
 <bc86121f-3cc2-1e55-4c6a-02cb1644a8bd@linaro.org>
 <e7b20055-4f44-aa91-e18d-9fb0f835fbf1@linumiz.com>
 <29de4d2b-3e32-809e-6ccd-5e7a4fe548fc@linaro.org>
 <e0d97b79-2133-8869-eaea-eb286fdb3a11@roeck-us.net>
 <785e942a-0691-f87e-b6e9-058749a79ec1@linaro.org>
 <8228db8d-2a32-1d23-74f3-05b9fe529a82@linumiz.com>
 <bdab2e58-ea12-0ccf-a25a-ed89e50a5332@linaro.org>
 <ddcda7c9-6aa8-2660-d6fb-8dc117f330c4@linumiz.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ddcda7c9-6aa8-2660-d6fb-8dc117f330c4@linumiz.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 01/12/2022 17:52, Saravanan Sekar wrote:

>>>
>>> Indeed it is PMIC chip. I think this is not the first and not sure title
>>> has to be changed for hwmon subsystem.
>>>
>>> bindings/hwmon/pmbus/ti,lm25066.yaml
>>> title: National Semiconductor/Texas Instruments LM250x6/LM506x
>>> power-management ICs
>>
>> Then I propose to put it in regulator directory.
>>
> 
> Just for clarification, should bindings put in regulator directory?

Yes, only the bindings. Assuming of course that the PMIC is the main
role of this device and it's not a MFD (then usually we put them into mfd).

Best regards,
Krzysztof

