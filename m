Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB16C54E94
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Jan 2023 07:17:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234465AbjAYHRc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Jan 2023 02:17:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233330AbjAYHRa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Jan 2023 02:17:30 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0927237F24
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 23:17:29 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id bk16so16053944wrb.11
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 23:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=chlnQKczQqGxgtBmjCWKCW6AYBinQQ7f23gebMJ77yc=;
        b=VqDygT8O9wpfGsIZWFRg/+xuF9eF8OFkp0u8fcS3gvHjFZqH7hSDBytY8tkpoVCOYH
         KcGQoO3QYl0tfQpuLwWfurJw3MIH7oNtN0LznOAOJBmlkdJ8zBQrBTzaUFvr8fr66QfM
         n0284fg3GHoJ90BbSuVLe7h4t6/LYjO+spf+J3dtWzGvpIT2XX99jz5yStFUPnfNOh5E
         xgteqe3OSUipUNNcK0FKpKEYKpCfy4SERdvdp32GCUiW/hXjEHvmLR0xF6OKaB6aKhLA
         UY/tfMtfwrFWsgn4gm++2vCoGmRt7SbgfUzq+yz04YZKUesEPvEXPXWc7496tDn6m2de
         ycGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=chlnQKczQqGxgtBmjCWKCW6AYBinQQ7f23gebMJ77yc=;
        b=Cr6wX+3GxFB9Wfz9FUFAfcNoA3VPew7w100Lfbw56ZBkgQEpdbfjGiK18zdyD8oQB0
         Z/y4jeUk8OfdrBXNc48tc4uYyItjzB922Wa788O45dq3ZO/NLPI6PPqH+NVFm55QRwtD
         zd/Gr2zSbUI+y+MkLdcdMQOL64t2KCb1EiL/xEgV6nUhBd2j7c7+vV0M7qoKJF7X5jUj
         fDkjrbZ7Z8xfFXNB7rdeLvQ1Vela+rzuWEzVYzxBUBe7o3Zprk1P3Q9SqtdVZD7qaRWh
         SVMxIs/poRp3a16nI1jF++Arf/7ZqrdCmiFl8rni6WbCKWOUX0SzDKOR7qYUeeswpkrV
         hhvg==
X-Gm-Message-State: AFqh2kpKMOiWeNgpdpHdfWYJDMsz5jV+KxJxXLbzqC1XXXQ5OMZ4XEF8
        v7+EM5m5MpJOkCHgweZKX/MfVQ==
X-Google-Smtp-Source: AMrXdXtNNTvlwsj4dxm1R0laqwG0cpyCC+E5QBosMbZ5BoH/xc/nE86RIea1JgdtdCBInnDiQS6WDQ==
X-Received: by 2002:a05:6000:a06:b0:2bd:d84d:bbbe with SMTP id co6-20020a0560000a0600b002bdd84dbbbemr30996639wrb.47.1674631047510;
        Tue, 24 Jan 2023 23:17:27 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q6-20020adfcd86000000b002bded7da2b8sm3638255wrj.102.2023.01.24.23.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 23:17:27 -0800 (PST)
Message-ID: <1cabe00c-e701-24ee-1c20-3b8eccf4fe39@linaro.org>
Date:   Wed, 25 Jan 2023 08:17:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v4 1/2] dt-bindings: trivial-devices: Add Infineon
 TDA38640 Voltage Regulator
Content-Language: en-US
To:     Naresh Solanki <naresh.solanki@9elements.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230124202317.3704963-1-Naresh.Solanki@9elements.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124202317.3704963-1-Naresh.Solanki@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 24/01/2023 21:23, Naresh Solanki wrote:
> Infineon TDA38640 is PMBUS compliant voltage regulator.
> 
> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

