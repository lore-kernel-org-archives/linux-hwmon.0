Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FFAEC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 May 2022 14:28:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348891AbiEQO2O (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 May 2022 10:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235130AbiEQO2N (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 May 2022 10:28:13 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 679DB42A27
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 07:28:11 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id bu29so31746629lfb.0
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 07:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=82rVaSSwGzZ2dC5Dnw4nt7/FT2LLEK1ZFDX66RCczp0=;
        b=AD9EMI4E0d4pYcH2vq6m4jqsUNjH7EYNrIBe1UD6q6GaXECD3UJ4Arp+7dVrNqmXA3
         CzB6vbs2CUhaUbQp/xLnLA+NZUpyfGnTrPKrZmnhdw8b1xIFMdet6O7tOmX0K902dHaG
         JojQ8ae73km0fZuL2DGky5qUCp3dTCByXeegXk2zvJ2RKjK0UOoleGlJbpQCB01r4ngi
         ja8tOYbTM/435wV0oF/J161ZcjE9m7+yFWySb3pTDLAKYF8bmeK6hThUSuSJ9js26ZSi
         hHo/C7bsSysqkhaxWQ8DdyeSN21J2K8bUg87mRvrb4MQsPfr5kT49Ekv8cIx9k39GyMs
         GMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=82rVaSSwGzZ2dC5Dnw4nt7/FT2LLEK1ZFDX66RCczp0=;
        b=Hal7nPy1wQOKxTaCrAMh6W0XLnI2UFebzU1oRKCTa1BBltqQ1HEdB5YPSj7EPEYz16
         /VK3tD2pMwfTOQfT+zEk0KdkXEl3pGUqWwVhVncCSWOBAUfDtAyJnPXYMvmJeR5R+mQM
         dQOYbkKnl/tPON3GUtW5lnAcXti3xNMyTmd1U2VxTbJTs3DNVyWwJNTJYayV996B1TNs
         GxSXsZQ6OZYxx6aZ1Q1Wfbwz5K0LaS7ZRhxVmHUACzNyCd+QOesrfKAtMl7rqPFgC/Fm
         O3YF3Xz8XsVnqPuoSdw9Dgye/jHlC3lbNx0pHyzgyFfxERie0ZTXUiyl9eLL0rNa0sgV
         HMxw==
X-Gm-Message-State: AOAM530H0g/APqkExTsFmHwUmNNA52EiL0z5sks+1s6ZTPLtsfeQL1hd
        ZwZC+Wlqv59sutpwg9EZC7HGiQ==
X-Google-Smtp-Source: ABdhPJxuOZhoZLnAIt+q7KxzCSHUI5aNKXZkeMpg8/VteGHiVo7v7yNaoCB09YjkZYDp6MY4lWx7Uw==
X-Received: by 2002:a05:6512:398c:b0:473:ab45:1f7c with SMTP id j12-20020a056512398c00b00473ab451f7cmr16892699lfu.341.1652797689816;
        Tue, 17 May 2022 07:28:09 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v16-20020ac25610000000b0047255d211c4sm204894lfd.243.2022.05.17.07.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 07:28:09 -0700 (PDT)
Message-ID: <ddf24a21-fb71-6fc1-d641-68a824f4da2f@linaro.org>
Date:   Tue, 17 May 2022 16:28:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: lm90: add
 ti,extended-range-enable property
Content-Language: en-US
To:     Holger Brunck <holger.brunck@hitachienergy.com>,
        linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220517135614.8185-1-holger.brunck@hitachienergy.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517135614.8185-1-holger.brunck@hitachienergy.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 17/05/2022 15:56, Holger Brunck wrote:
> Some devices can operate in an extended temperature mode.
> Therefore add a boolean ti,extended-range-enable to be able to
> select this feature in the device tree node. Also make sure that this
> feature can only be enabled for the devices supporting this feature.
> 
> Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>
> ---
> changes for v4: 
>    - use "if:not:then" instead of "if:else"


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
