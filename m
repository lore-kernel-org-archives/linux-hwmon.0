Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F24C77B73
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Apr 2023 09:01:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232629AbjDSJBD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Apr 2023 05:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232019AbjDSJBB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Apr 2023 05:01:01 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B2812C9C
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Apr 2023 02:00:58 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-517c01edaaaso2921938a12.3
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Apr 2023 02:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1681894858; x=1684486858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Ri0q2/V4tp17Jo0FXn5qCoZ/hu41lgkAXDj8GUCjG4=;
        b=e6FJpg1/lSg6Fzj64vBbsl3hJAjBsz1G6UqWuw88c4fCh0Ew+10L4n3OelrDuC/FYl
         T9bPIjDBNkK8VJgcBXm/Y44QI7KGymGCU8jRiql7yqxtIn6E5UtgM9PN2lBQQ35k6Hii
         MxFmS5MtHJzoqeTTkVde59z2lr+YDlX1hvdSMPFsG2qt6rJmJ/IKVwnRYVMalzsQMndr
         WfvI7BkSiEvkIKby0wY4PP407ZIZfBlD+SilDCXTaVRheNk19wY8jBX7r4u1M0WeeoRp
         Lqp/1jduTdNNC2GmwNkkWoktbumIo8+SLEGDZeLo2Df88eg2DxTrKyykm4Zv7/JnMJ5R
         MZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681894858; x=1684486858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ri0q2/V4tp17Jo0FXn5qCoZ/hu41lgkAXDj8GUCjG4=;
        b=Eyj1w3A6Kv45QcZu+CFSiIoBxzqBpG/29OYrJqPhYgqcrrxa0wPASU9xkDYnt3F/vL
         KcpcQVLC6qMhT7sSMWl9XE4pFB+FogKnGqEkvaiLkGH+pEqOVhhx77bQ9vdvYPUCa0IP
         SFsZA1GlMd2RXWQe+Bbv3rdkPSGu2xeNkFSKgi7Wt8/IvFbPJ6td1nQEoFBQu2nhZbWS
         c6mS/XW8hho1ZizmIyB5TlDcn8HtUWgOuiOb3dufDX3NdKXI6Ds6b4xAhYUF8RFxvMx/
         CCyV5AoyEdEHgQQA71bTIrRxSXoavksr9KPF4rWF4VxGAsWPklQWcC/KDsn9SE0qx9b7
         Dacg==
X-Gm-Message-State: AAQBX9fnubsoYuhXdGau+86vBQCUiIILFdFLT1SaOXLvN0Ii9hkNpQo5
        LdfU2v3fW4YDl9VVtHIDqzPpIQ==
X-Google-Smtp-Source: AKy350b6IXvh1v6ck6A/sCyMXZ3FN45V2eFT0zulVRY/vapMyIBlskFX9zTC4ovnUc9DmdwJuOK7Bw==
X-Received: by 2002:a17:902:f683:b0:1a9:20d6:3c3f with SMTP id l3-20020a170902f68300b001a920d63c3fmr631660plg.55.1681894858066;
        Wed, 19 Apr 2023 02:00:58 -0700 (PDT)
Received: from ?IPV6:2405:201:d02f:d855:461d:14be:2cce:b776? ([2405:201:d02f:d855:461d:14be:2cce:b776])
        by smtp.gmail.com with ESMTPSA id iz17-20020a170902ef9100b001a19f2f81a3sm10976492plb.175.2023.04.19.02.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 02:00:57 -0700 (PDT)
Message-ID: <e63bba13-05f0-7d1b-bf11-04ef5eda3afd@9elements.com>
Date:   Wed, 19 Apr 2023 14:30:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add binding for max6639
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230418113217.781524-1-Naresh.Solanki@9elements.com>
 <742f546b-3952-32f4-9f20-3a355785d162@linaro.org>
Content-Language: en-US
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <742f546b-3952-32f4-9f20-3a355785d162@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Krysztof,

On 18-04-2023 09:47 pm, Krzysztof Kozlowski wrote:
> On 18/04/2023 13:32, Naresh Solanki wrote:
>> Add Devicetree binding documentation for Maxim MAX6639 temperature
>> monitor with PWM fan-speed controller.
> 
> Subject: drop second/last, redundant "binding for". The "dt-bindings"
> prefix is already stating that these are bindings.
Ack
> 
>>
>> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
>> ---
>>   .../bindings/hwmon/maxim,max6639.yaml         | 55 +++++++++++++++++++
>>   1 file changed, 55 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>> new file mode 100644
>> index 000000000000..20b28cd36555
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>> @@ -0,0 +1,55 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +
> 
> Drop blank line
Ack
> 
> This is v9. Where is the changelog? Where is previous authorship? At
> least some parts of it? Why this has less properties than old one? Why
> this has more mistakes than the old one? Go to previous patch... or fix
> everything which was already fixed.
This patch is to add basic dt support only hence no additional properties.

> 
> Best regards,
> Krzysztof
> 
Regards,
Naresh
