Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58695C10F1D
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Dec 2022 14:20:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235789AbiLMOUI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 13 Dec 2022 09:20:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235894AbiLMOT7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Dec 2022 09:19:59 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4174920BCE
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Dec 2022 06:19:58 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id f20so3439407lja.4
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Dec 2022 06:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EMyYtrU31qIqDBD9DxhVXcwRAXD72OPOTw3x1Svfa2k=;
        b=SDEyNxDxgIElp7BRSiViRI9XVucIw2MTgwHgLm/AUJw75Yf7ntxXinMq5YYDzQmrWD
         dDHl95SVdIEaCSwG/Y+mTUcilt7S47a6SsCDbBWuVlvJ8OrxCBVBer+/74KXonJkNvDN
         4OXEdCPaBrbCiMvDPWV+uHiSDx4b3PkR91CTIdAgIefluA4pYs8V4L7h4EzmaCkpmERW
         hzZcquDFHGKMxjCf/Ap65baerwoBkZy4D5eF8S2PZ2RuX06/S/tLlpIQoqLX6w3/urnL
         fGwwn1Xn5apIeqKLt6TdncMdOuuxpD2MqdiQn51x+wNvg10PdI/Qt/LdNWh3a3IMzygR
         Jxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EMyYtrU31qIqDBD9DxhVXcwRAXD72OPOTw3x1Svfa2k=;
        b=wNwb9o2ctdfsbeyfEXD3XBlrn/fSG8yJPXg84DdxQjSZ+28/J8PV0uPHAkHhBv2vuE
         QmE8UFZsDZFrW4VD37KxxRhYzmRf8Ohp6MeVVbv3Qb25000pJxtoT9q/j9/XYALeoucY
         DwU+/nHRPqPIKGT1LXq4vEv958SdfKaqyTtjR2sOuL5vJ1NVj5jTwVjh0e18iqGNIZEb
         DcnEcDhn5Hj2+qznm6eLMyeHsqUY/01Jqgrwub74yhtaOSS/iNk5+m6stbLSNGRxjeJ8
         FKRo6/ikxOZhllo1geggAZJWXBNK5PO2ozzCr3lPzmfIGCVFj+VNGuM1O9eS0WfCbuBT
         Mm4A==
X-Gm-Message-State: ANoB5pm3W+V6NYfnzdCZ50ENacqvSxTQ77OZP/LnvXh7tYY+fIfhVpNK
        aNeGNJ9YWW1kRUjiHwwWCa2hAA==
X-Google-Smtp-Source: AA0mqf62Rjtx/IsL79mhl1BYRYlsELpLE4pnLyB3o6ubxKNCcGj1PBfDe9vSzoz90bd+J9hIKQD9lQ==
X-Received: by 2002:a05:651c:17a2:b0:277:13a1:1886 with SMTP id bn34-20020a05651c17a200b0027713a11886mr6603214ljb.6.1670941196605;
        Tue, 13 Dec 2022 06:19:56 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s26-20020a05651c201a00b002770fb5722fsm275824ljo.123.2022.12.13.06.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 06:19:56 -0800 (PST)
Message-ID: <2172e561-ec0f-5c4e-96d2-ceb2010f2673@linaro.org>
Date:   Tue, 13 Dec 2022 15:19:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: correct indentation and style in
 examples
To:     Rob Herring <robh@kernel.org>
Cc:     Kun Yi <kunyi@google.com>, Jonathan Cameron <jic23@kernel.org>,
        Krishna Chatradhi <ch.naveen@samsung.com>,
        =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Eric Tremblay <etremblay@distech-controls.com>,
        linux-hwmon@vger.kernel.org,
        Supreeth Venkatesh <supreeth.venkatesh@amd.com>,
        linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Alexandru Tachici <alexandru.tachici@analog.com>,
        devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Akshay Gupta <Akshay.Gupta@amd.com>,
        Robert Marko <robert.marko@sartura.hr>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Luka Perkov <luka.perkov@sartura.hr>
References: <20221213092643.20404-1-krzysztof.kozlowski@linaro.org>
 <167093911583.912886.13512120412056690614.robh@kernel.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <167093911583.912886.13512120412056690614.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 13/12/2022 14:46, Rob Herring wrote:
> 
> On Tue, 13 Dec 2022 10:26:41 +0100, Krzysztof Kozlowski wrote:
>> Fix mixed indentation to 4-spaces, remove unnecessary suffix from
>> i2c node name and use lower-case hex.  No functional impact.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/hwmon/adi,adm1177.yaml           | 12 ++---
>>  .../bindings/hwmon/adi,adm1266.yaml           |  6 +--
>>  .../bindings/hwmon/adi,axi-fan-control.yaml   | 20 ++++-----
>>  .../bindings/hwmon/adi,ltc2947.yaml           | 20 ++++-----
>>  .../bindings/hwmon/adi,ltc2992.yaml           | 26 +++++------
>>  .../devicetree/bindings/hwmon/amd,sbrmi.yaml  |  6 +--
>>  .../devicetree/bindings/hwmon/amd,sbtsi.yaml  |  6 +--
>>  .../devicetree/bindings/hwmon/iio-hwmon.yaml  |  8 ++--
>>  .../bindings/hwmon/national,lm90.yaml         | 44 +++++++++----------
>>  .../bindings/hwmon/ntc-thermistor.yaml        |  2 +-
>>  .../bindings/hwmon/nuvoton,nct7802.yaml       | 16 +++----
>>  .../devicetree/bindings/hwmon/ti,tmp513.yaml  | 22 +++++-----
>>  .../bindings/hwmon/ti,tps23861.yaml           | 16 +++----
>>  13 files changed, 102 insertions(+), 102 deletions(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 

This is fixed in second patch which points to: I need to change their order.

Best regards,
Krzysztof

