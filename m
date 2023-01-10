Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA6DC54EBE
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Jan 2023 09:08:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231515AbjAJJIw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 Jan 2023 04:08:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237980AbjAJJHy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 Jan 2023 04:07:54 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E9C84ECB0
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Jan 2023 01:07:53 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id i17-20020a05600c355100b003d99434b1cfso9285112wmq.1
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Jan 2023 01:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7JbaxC7KPieHLp+g5p9tmnTTK4fIMEmiIEMJJms0GZ4=;
        b=zQAoaBT8syYTjq/VlJv6oSVm1PPkQlXAL2RZQE0RInE74XU48Z10cR7uTFMV3tPGi2
         B6JPTTK7nJvGTu6APUx3VIkQCfsUiCWXBkAdgb0kWyERoOrPTKZjpXPSX6WezXRsMMZy
         uUNRpc7GaUQz6GRaIc2O1PDNyttUlwJH+zJYsLlvg1YXhSiyzf6wtZdrosT3L5R39H03
         fl0oE7UEMnxUpqKpHoz7dk2XeVP/itmoeLA0qC580aUwBPH+RiJAZuGrO6rxccKsDoh9
         kS9tdJBHedoVZ/Z4Rt8xJ9gSrxlY5ftL1a0Nfu7dzZnNqJnHri/G4amtVqozh3U/vJn+
         wGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7JbaxC7KPieHLp+g5p9tmnTTK4fIMEmiIEMJJms0GZ4=;
        b=HEMlE8TIZLItmAEI9IQfQ6/NDkskHg/xi/si3URQ8+BrNygmLecCJ3amemPTzXqz7H
         YkURztLYydgQUIUVdK2U39ICpcGzAvDb+aqsi46vCA1sNIlrfSBfsZyuYpPPfDYTJukg
         AU6K26QdAk4r9EtT0QGGSV52X+aIx0klogXtSvzLMi6pJtesRQuGlRy/1/HgKN2G6yoF
         C4hshdqZkugn83bL6WXaprls0Bqma9Uj9sBIJZwEVdpuAxuXBehKiL+H2vmVQ7Xb4xlT
         WdgSS8eOf3OnTR3Pzdyn4JekTPDwdL2R64Tgf3943bgYx0Hr5kABeJOCxQa8o/gW96Hn
         Mqqw==
X-Gm-Message-State: AFqh2kpJ7nqvJl0PXs8p4cVl2w/XdF+MOVJ1Uf/oPO3qs4BF6WNSqVsV
        LL2d6831OAZQFUsvk0iRoGIeaA==
X-Google-Smtp-Source: AMrXdXs6ZSGkTV66Vz7LmN9fgcIN/7pcFQbA/DwdXkepR6WdHGhSJpt/3Tqxt+j9manNylw8VlkBKw==
X-Received: by 2002:a05:600c:1da3:b0:3d0:965f:63ed with SMTP id p35-20020a05600c1da300b003d0965f63edmr49170877wms.23.1673341672120;
        Tue, 10 Jan 2023 01:07:52 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id fc14-20020a05600c524e00b003a3442f1229sm21206674wmb.29.2023.01.10.01.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 01:07:51 -0800 (PST)
Message-ID: <f2d70c17-e519-fbde-eb61-1acba70a59a0@linaro.org>
Date:   Tue, 10 Jan 2023 10:07:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/5] dt-bindings: hwmon: adi,ltc2945: Add binding
Content-Language: en-US
To:     Jonathan Cormier <jcormier@criticallink.com>,
        linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bob Duke <bduke@criticallink.com>,
        John Pruitt <jpruitt@criticallink.com>
References: <20221214220727.1350784-3-jcormier@criticallink.com>
 <20230109233534.1932370-1-jcormier@criticallink.com>
 <20230109233534.1932370-2-jcormier@criticallink.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230109233534.1932370-2-jcormier@criticallink.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/01/2023 00:35, Jonathan Cormier wrote:
> Create initial binding for the LTC2945 I2C power monitor.
> Add shunt-resistor-micro-ohms parameter

If you want to keep that sentence, sure, but let's make it a sentence -
missing full stop.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

