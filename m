Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB6EC433FE
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 Oct 2022 14:18:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233731AbiJZOSe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 Oct 2022 10:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234127AbiJZOSW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Oct 2022 10:18:22 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 137DD10F891
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Oct 2022 07:18:22 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id l9so8051702qkk.11
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Oct 2022 07:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6YtRWJZKbMif6QKbJ+qEdydNmgiCQ/4zO/xpn20FjE4=;
        b=zdv4FwBCWn4px/ZLt6urY7kQ5Nzp174y1W9tVH1mW0ock6rV9wZBSXu9ivTdt6zbTL
         WhTDnHDBw6mAYNtI1BmdeflDYALhjHvpVldTdQOpUwhBZIaoGdCzXbY5dpeFGggOUHTk
         gXzffOzZ97i6hXQYzh94pTxhfIp9F/Db6KAkqCdRA2p66dGQ17rJw4netdD4OIdeJw7l
         rOXafc6nTCRjQyLebEIxGq9w5UK9kZFVCmfkC8lz6F0smWx2CvSh5U2Eq3RVRHPk4ceH
         DL7jADWT0VUCCapVJZ7hHRtLV3xSA/Im1YVoB4lPOkXqFBvaDiDq2+moeBa7ACD9uqMA
         cVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6YtRWJZKbMif6QKbJ+qEdydNmgiCQ/4zO/xpn20FjE4=;
        b=BnO6woqGbdEyKwG+kwIK8HWI0USHUhkxfkJJDdz2WLUJUCvZhwmNxtMia26GRwCGfA
         3e7Qa/+BUUnRk7iaL2DL3M6RqkVWQ4OT2sgqWLa2n3XGOZ4ZG9N8rEHDvFjEvYSYapgl
         5LZkXez3gjSn2c00F/Qd7updkxsWGFvQRDVSVGLoq6vRl7Cxzp8iQvAu8BmMdidlygCH
         uitbZLzw9oKS6S0YYDdrA5+bCzJFwGTMOc8SheM+1lChJf3bNb1rQjGtpyeC7IQJePKX
         41q8rvPBxlZq/67jILZouFbJ/Mn3Pdl31IsF/bYiuqVFhDGro6HTlQzwlTFP5VC7DLCG
         p/CA==
X-Gm-Message-State: ACrzQf1TCaw0DbvCfQzomcnPLnrfzGM8T07/VctEs/+5+/nOFuWl0ChZ
        pYmBDISL2PU7I+o3KYVgCeRwCg==
X-Google-Smtp-Source: AMsMyM6764WLKyAmF+3eAYWy9F1BsXvQY4uwWjp3lRii2rrmauPtCVQKmSB/pWf5AHM85b+gdXjhGA==
X-Received: by 2002:a37:6945:0:b0:6f4:ae0f:648b with SMTP id e66-20020a376945000000b006f4ae0f648bmr11991186qkc.329.1666793901165;
        Wed, 26 Oct 2022 07:18:21 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id b14-20020ac8540e000000b00399ad646794sm3293499qtq.41.2022.10.26.07.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 07:18:20 -0700 (PDT)
Message-ID: <4ddf54db-69c6-69a8-5c73-6c365b9f90b3@linaro.org>
Date:   Wed, 26 Oct 2022 10:18:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 2/2] dt-bindings: rtc: add bindings for max313xx RTCs
Content-Language: en-US
To:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Zeynep Arslanbenzer <Zeynep.Arslanbenzer@analog.com>
References: <20221026131124.289-1-Ibrahim.Tilki@analog.com>
 <20221026131124.289-3-Ibrahim.Tilki@analog.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221026131124.289-3-Ibrahim.Tilki@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 26/10/2022 09:11, Ibrahim Tilki wrote:
> Devicetree binding documentation for Analog Devices MAX313XX RTCs

Drop second "bindings for" from the subject, it's redundant.

> 
> Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
> Signed-off-by: Zeynep Arslanbenzer <Zeynep.Arslanbenzer@analog.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

