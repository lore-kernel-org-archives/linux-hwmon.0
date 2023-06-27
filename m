Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE18C0015E
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Jun 2023 06:05:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbjF0GFk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 27 Jun 2023 02:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbjF0GFj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Jun 2023 02:05:39 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C21941BEB
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jun 2023 23:05:37 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b6a1245542so28568381fa.1
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jun 2023 23:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687845936; x=1690437936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CyPTwXW8OQFLcvCUzk+L4ves/sIMoSF+nd/0rCMq1yQ=;
        b=klJmp/nCgsEu04JBsh0N6zKskcd3DbcCqiC8aN82DvhicDWRaK5M6A9U4ZvgJSYhws
         +vvLnF6LZVCG+SHh6SBUpEnT/TH7FkK15xzdBD4dpr7c+JIXxTQn3OmuTLG0/cBM7s85
         agXIn2UC6ifBjpOHQ+QU+wjnuc3llvk0Mue5+WBZGcWzKHgrNaJAw7kGqOP0mrMaQzTL
         m8wfYXYxnNvtHLjtl06WVphR2azEbBTAyv0B3rG2RCVz+iX65NMIJDtZUoT3cjBx6i6+
         NsJY3ukPa6NrkaRUvyQuI/JnLRP0b0V1Z0UNZqfdsmzkxHTNu8Z0g4aoYE9Jp914h176
         7FdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687845936; x=1690437936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CyPTwXW8OQFLcvCUzk+L4ves/sIMoSF+nd/0rCMq1yQ=;
        b=fMjK8ZLxpjcSTB/QAvIOjfInGZtn3vncfP2iNEIAkOBvVhanrWsw5NJx+AJXpjxa6i
         M94PbI8l6rqilMSFoSks4/Pv8vlcmcooXoxVidwQtfnMuJJumn0fDa/sr01NjfGBP2B8
         vnOiPv9dOk0RhdIH7SFj4sNRKS3nn6FwhbzuvLh7iFbpV5hz6J3zVETA+lW6NNgI2bdP
         2FZUKzNr9bS2S879+RPfXqO0siqOVwIMuu/QSgwZIcSAO9eMKGs0J2br7CjFoCPJXvgJ
         kt0ugrqkouYbHR1bovrOd2CoCeIAwq/0fdBYKhNdmayJDBvTMNlavuZEgXmhQFw3/zPq
         tnRw==
X-Gm-Message-State: AC+VfDxUfSxOQ+M4VfQN4zyk0bZAfJgN82ENrUs0UlKtHFyKn36yw0OL
        lCsGpiZXLgVvU1URIl48zNrOmQ==
X-Google-Smtp-Source: ACHHUZ5Ma67VplIaCiyfjjcDvZSi6chXIk/ZwfpAdj4TFP5vkBq63dVYVMNm+FXXMaRRz2YwJWM1PA==
X-Received: by 2002:a05:6512:234f:b0:4f9:795f:a6e5 with SMTP id p15-20020a056512234f00b004f9795fa6e5mr6066234lfu.68.1687845935918;
        Mon, 26 Jun 2023 23:05:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003fb9ebb6b88sm1274944wmj.39.2023.06.26.23.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 23:05:35 -0700 (PDT)
Message-ID: <ce730674-5ec5-2386-b574-37e5819239bb@linaro.org>
Date:   Tue, 27 Jun 2023 08:05:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 3/3] dt-bindings: hwmon: add sht3x devicetree binding
To:     JuenKit Yip <JuenKit_Yip@hotmail.com>, jdelvare@suse.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, corbet@lwn.net
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20230626072923.340544-1-JuenKit_Yip@hotmail.com>
 <DB4PR10MB6261859DA1087597DDC3CCB39226A@DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM>
 <326cc8a4-3366-e8af-8051-7284bfb6dfaa@linaro.org>
 <DB4PR10MB62610826B15E48C2CA2F51779227A@DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DB4PR10MB62610826B15E48C2CA2F51779227A@DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 27/06/2023 02:29, JuenKit Yip wrote:
>>
>>
>>> +  reg:
>>> +    maxItems: 1
>> Missing vdd-supply (required) and reset-gpios (optional).
> 
> It means that we should implement relevant codes about vdd-supply?

It means your binding should have vdd-supply, which is required, and
reset-gpios, which is optional.


Best regards,
Krzysztof

