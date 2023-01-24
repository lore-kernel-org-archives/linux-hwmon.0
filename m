Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8992BC25B4E
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Jan 2023 12:19:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233655AbjAXMTh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Jan 2023 07:19:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233702AbjAXMT3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Jan 2023 07:19:29 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC1FE44BDF
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 04:19:23 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id o13so14713896pjg.2
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 04:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A/7Qu8+3n1M8/9GOtQ5EA0GbOvgIBu69H4oMSLKB4RU=;
        b=gFLiV5tfkgWilYvilc2OjqCiE4ojC5DbptZJ+Z3A23EwAvNvB8V/zwRslyMfz98GQ0
         dCO8BqEEO8/Va3C11xmtci/elCMFrz4GqUqLk/znJwK00v1q6CIxnvtDALHrwsOYmLP9
         YCZpQ/6wjV+K614rz5LhfvOABnrvvALvbYzXrvcHYZLOmfXFWUKW7cCO5G9JuBQvRK7I
         we/+a9kIzzeymeuIj5BUR22uiGzfDff6JYa3s6zHMcLa03yLP+izkwL7tbCje4QoQ+Uh
         GYlC5P5Z5yh4Ph9Xm1GUXnh70l57Wpo3k7WJIStAokegORE1OAV00cQ/IOdqYIzJ+V65
         mmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A/7Qu8+3n1M8/9GOtQ5EA0GbOvgIBu69H4oMSLKB4RU=;
        b=0AsWATRFHNwLaZ10dr/x5SYkXsg61bCX5zu/iLDgWi0HVkcGSO+8ryE/G11KmKsx0E
         BkBLMONpHbdJcy83lESB2AxZyXTiZRnZS/USqRIQeFm/iVX9K0rd1/1nve42+w2+l8F5
         O77pHkn+l5M7AH+i+VLq8BZoTk22jeZsIYpmA+idPhJYTq25ARw0M4/Sggds/xRfHsUX
         DsqARj415aj9pJm8l+HUFFOLT2yd8X32dscuMguOTYsQjbx+mNVu/IYRhxN6lN7tJRLs
         2jkNj0E4yto/I/usa66zIFXnJ3xbGx9e97KbhpTV4IJTc/TWC2f4Sb6468b6zC1L0MFR
         N4dg==
X-Gm-Message-State: AFqh2kq/q5+y4wbJvw0NBY02JjSC8IZlHdvVMI1mK8MxcBTXfLIVCHpF
        Vy8RpjuYfZTEBfthNvCfimNcFg==
X-Google-Smtp-Source: AMrXdXtufDumWV+8RAXQ8wsMW2TlQHdMz5dV3ooJEie5JhRJKuPT+qDq47usLgM+OvGgRlC85uh10Q==
X-Received: by 2002:a17:90a:1a41:b0:22b:b82a:f3a6 with SMTP id 1-20020a17090a1a4100b0022bb82af3a6mr14479079pjl.33.1674562763389;
        Tue, 24 Jan 2023 04:19:23 -0800 (PST)
Received: from ?IPV6:2405:201:d02f:d899:2028:7962:400:43b6? ([2405:201:d02f:d899:2028:7962:400:43b6])
        by smtp.gmail.com with ESMTPSA id t8-20020a17090a1c8800b0020aacde1964sm8182776pjt.32.2023.01.24.04.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 04:19:22 -0800 (PST)
Message-ID: <3993c666-7038-76f8-9216-3db23ca0bffb@9elements.com>
Date:   Tue, 24 Jan 2023 17:49:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] hwmon: (pmbus/tda38640) Add driver for Infineon TDA38640
 Voltage Regulator
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230124110111.3965317-1-Naresh.Solanki@9elements.com>
 <b4b11836-5a4b-a2b7-18e2-89ca26f19817@linaro.org>
 <05947e9f-0667-4565-b481-ca5635da4174@9elements.com>
 <d8fb3c45-435d-f080-6ba4-e9e4595f3638@linaro.org>
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <d8fb3c45-435d-f080-6ba4-e9e4595f3638@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi

On 24-01-2023 05:35 pm, Krzysztof Kozlowski wrote:
> On 24/01/2023 12:45, Naresh Solanki wrote:
>> Hi
>>
>> On 24-01-2023 04:40 pm, Krzysztof Kozlowski wrote:
>>> On 24/01/2023 12:01, Naresh Solanki wrote:
>>>> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>>>>
>>>> Add the pmbus driver for the Infineon TDA38640 voltage regulator.
>>>>
>>>> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>>>> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
>>>> ---
>>>>    .../devicetree/bindings/trivial-devices.yaml  |  2 +
>>>
>>> Split bindings from driver code.
>> Sure
>>>
>>>>    drivers/hwmon/pmbus/Kconfig                   | 16 ++++
>>>>    drivers/hwmon/pmbus/Makefile                  |  1 +
>>>>    drivers/hwmon/pmbus/tda38640.c                | 78 +++++++++++++++++++
>>>>    4 files changed, 97 insertions(+)
>>>>    create mode 100644 drivers/hwmon/pmbus/tda38640.c
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
>>>> index f5c0a6283e61..a28b02036489 100644
>>>> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
>>>> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
>>>> @@ -141,6 +141,8 @@ properties:
>>>>              - infineon,slb9645tt
>>>>                # Infineon SLB9673 I2C TPM 2.0
>>>>              - infineon,slb9673
>>>> +            # Infineon TDA38640 Voltage Regulator
>>>> +          - infineon,tda38640
>>>>                # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
>>>>              - infineon,tlv493d-a1b6
>>>>                # Infineon Multi-phase Digital VR Controller xdpe11280
>>>> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
>>>> index 30448e049486..9f4bbb9c487a 100644
>>>> --- a/drivers/hwmon/pmbus/Kconfig
>>>> +++ b/drivers/hwmon/pmbus/Kconfig
>>>> @@ -395,6 +395,22 @@ config SENSORS_STPDDC60
>>>>    	  This driver can also be built as a module. If so, the module will
>>>>    	  be called stpddc60.
>>>>    
>>>> +config SENSORS_TDA38640
>>>> +	tristate "Infineon TDA38640"
>>>> +	help
>>>> +	  If you say yes here you get hardware monitoring support for Infineon
>>>> +	  TDA38640.
>>>> +
>>>> +	  This driver can also be built as a module. If so, the module will
>>>> +	  be called tda38640.
>>>> +
>>>> +config SENSORS_TDA38640_REGULATOR
>>>> +	bool "Regulator support for TDA38640 and compatibles"
>>>> +	depends on SENSORS_TDA38640 && REGULATOR
>>>> +	help
>>>> +	  If you say yes here you get regulator support for Infineon
>>>> +	  TDA38640 as regulator.
>>>
>>> Drop entire option, why is it needed?
>> You mean regulator option ?
>> This is how other pmbus regulator devices have provided option.
> 
> Hmmm... I wonder why this is of any use.
 From what I can think of. Chip also provide pin to control regulator 
enable. If that is used in the design then the regulator option may not 
be needed.
> 
>>>
>>>> +
>>>>    config SENSORS_TPS40422
>>>>    	tristate "TI TPS40422"
>>>>    	help
> 
> (...)
Yes this doesn't has regulator support in driver.
> 
>>>
>>>> +static const struct of_device_id tda38640_of_match[] = {
>>>> +	{ .compatible = "infineon,tda38640"},
>>>> +	{ },
>>>> +};
>>>> +MODULE_DEVICE_TABLE(of, tda38640_of_match);
>>>
>>> Where is it used? You miss the user.
>> I'm not sure if I get your question right.
>> This chip is used in sbp1 board to power CPU rails.
> 
> No, where is the data structure used (except module autoloading)?
My use case is loading the driver base on DT. Not sure of other uses.
> 
> Best regards,
> Krzysztof
> 
Best Regards,
Naresh
