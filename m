Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECEFBC433EF
	for <linux-hwmon@archiver.kernel.org>; Sun, 27 Mar 2022 11:17:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233196AbiC0LS7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 27 Mar 2022 07:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbiC0LS6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 27 Mar 2022 07:18:58 -0400
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3410C39825;
        Sun, 27 Mar 2022 04:17:18 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id h4so16470467wrc.13;
        Sun, 27 Mar 2022 04:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Yo4Qxz57xPmfJcP7ucWBN2Y163R/nwHjuNzzvflm4rU=;
        b=CW8S7mQujMa7SA7TD5fPDu8Lzlci8oo09qDkAjITX7n7HLSNWXeFjJN9lz1rMS2G4q
         fDYYD2tKhmoZQj+Z+fQFeKSwIu0BNreeeZH8Ku+w3INlcYhB/IRWxVVRciTkbBohmBXL
         xMwgRkU5IyvPpupHDxXqEwIg/az7Vs08P3oXCf+hLMenZNreA4+pCfoalSoRK6Ygkkqi
         zwhrGdefuomPuv49TSaUFEtGXiMJSMDfkj/g20O7utrs5saKQXicgaV2SimlHSxfkNle
         NSmhdowH6dTdjpgIpWKdtxwRNm1WuHc251hieFyIbzle8eEIPzYrZnIUt5QqfdptxcaH
         6ikA==
X-Gm-Message-State: AOAM531ms9pHw7FW8gOm+UyzZAM6wZnQbkMy/E5a9kIf+RsmLxlZp1We
        GXH+JB19ptNB1M9NZtc2pIUf4JQJ4AM=
X-Google-Smtp-Source: ABdhPJz8x6R8DUBdB2seJZmTkt1ay+PlI0jnhgdDgynlwHgHCu3xzK8Nsc8tACfQh0xFCNq9DpppTQ==
X-Received: by 2002:a05:6000:1d82:b0:203:e5cc:c19b with SMTP id bk2-20020a0560001d8200b00203e5ccc19bmr16740081wrb.553.1648379836536;
        Sun, 27 Mar 2022 04:17:16 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.googlemail.com with ESMTPSA id w7-20020a1cf607000000b00389a5390180sm8925535wmc.25.2022.03.27.04.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Mar 2022 04:17:15 -0700 (PDT)
Message-ID: <015bac04-4378-b4b8-c7d1-b0e2615fbe45@kernel.org>
Date:   Sun, 27 Mar 2022 13:17:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 3/4] dt-bindings: hwmon: add Microchip LAN966x bindings
Content-Language: en-US
To:     Michael Walle <michael@walle.cc>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220326192347.2940747-1-michael@walle.cc>
 <20220326192347.2940747-4-michael@walle.cc>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220326192347.2940747-4-michael@walle.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 26/03/2022 20:23, Michael Walle wrote:
> Add a binding for the temperature sensor and the fan controller on the
> Microchip LAN966x family.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  .../bindings/hwmon/microchip,lan966x.yaml     | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,lan966x.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>


Best regards,
Krzysztof
