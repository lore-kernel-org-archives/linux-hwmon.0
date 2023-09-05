Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BFC1CA0FE2
	for <linux-hwmon@archiver.kernel.org>; Tue,  5 Sep 2023 16:26:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351499AbjIEQ0D (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 5 Sep 2023 12:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353554AbjIEGma (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 5 Sep 2023 02:42:30 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E94D1CC2
        for <linux-hwmon@vger.kernel.org>; Mon,  4 Sep 2023 23:42:26 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99de884ad25so323215666b.3
        for <linux-hwmon@vger.kernel.org>; Mon, 04 Sep 2023 23:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693896145; x=1694500945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ugyMfJxNvEDJjj/a2Xl7UVxjq+twvGg0NQ9wiJcmDU=;
        b=qByfCK5bKVcWHpUgY+YhvyppRbQqUjIQXvn8tuHvAmsLqHL88eBLUcFj+KlGcPDWe6
         pvHqm0++fPkTM2qMEhzC0AbvrybhSnqzhUGKEX/rUGEY/EDMjEjqscMJS7BypUwERExu
         JR2laMcMLt2BrH0stGbmvFKgf+Yn7R1AVdhCueMhKozGprXX8oVsw4U1xnPuaIiHAlPd
         nELOVtfWVqwZh3TA2AzlyA36PZm+C3UNA6Ix58grVnGCWc+VDgH+Cz6e3AiOBCXCZUwK
         btO7EpIkTC6DYP/0zBcH2oZFKHWT0lpHRHaZk6EZNPmCbRHQviowsdTpJOEW9me9JH59
         sD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693896145; x=1694500945;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ugyMfJxNvEDJjj/a2Xl7UVxjq+twvGg0NQ9wiJcmDU=;
        b=BkUoqWV67JPnHX4lLYa9cdUatjny2rD/cDNAcOzB8bJiOTXmUs9XNwiHKdHLwHdPKy
         rpCEUmBSJOm3eWkkFngS3zo6OEtVh7acTK2vY6VVIQSMkLgQTsmIrA8Cf03DAiXffyU9
         B8nWeHvl1/qNpafIKnIRcKkUBB9htOPCXoPPYpngKkBOoqz2uHytsEgn/UD5K+UJkEtb
         XusU6LLmTu1ahJfWE3kEoaYw6f8nj1OPiTd6Hb9T7po5jtb60Oq5Ti2Vbi7d0avhNyN0
         TVUECA8Kxb/BMar43NS6fPMiNd1a8VLLCJf6NA7S4zxpd7ixxcPQ8JWmoQbgDMmuyPfb
         rtiw==
X-Gm-Message-State: AOJu0Yzbnysy+iobtIYulx+Xb00N7tcdUTDNSj/BQmz5z4ZGU63OUQN0
        EwCI3nknQuyAWuVdNIFZq0X/bg==
X-Google-Smtp-Source: AGHT+IFSmevS7/xXWVuQyFeT07AMl+yZq3VbNuqQ8OMhjg5tonqxRjiTIhrioHj1GnVBbyaP7zS7+Q==
X-Received: by 2002:a17:906:ef8f:b0:9a5:8eab:49da with SMTP id ze15-20020a170906ef8f00b009a58eab49damr8369843ejb.19.1693896145502;
        Mon, 04 Sep 2023 23:42:25 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id lo6-20020a170906fa0600b0099bd453357esm7077134ejb.41.2023.09.04.23.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 23:42:25 -0700 (PDT)
Message-ID: <36680e91-f8f2-12e1-900b-48e6166bc7f2@linaro.org>
Date:   Tue, 5 Sep 2023 08:42:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 1/3] dt-bindings: hwmon: Add Infineon TDA38640
Content-Language: en-US
To:     Naresh Solanki <naresh.solanki@9elements.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        krzysztof.kozlowski+dt@linaro.org,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230831190731.265099-1-Naresh.Solanki@9elements.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230831190731.265099-1-Naresh.Solanki@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 31/08/2023 21:07, Naresh Solanki wrote:
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        tda38640@40 {

Any reason why you ignored Conor's comment here?

Best regards,
Krzysztof

