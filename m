Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40BFC4321E
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Dec 2022 10:26:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbiLAK0l (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Dec 2022 05:26:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbiLAK0T (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2022 05:26:19 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 097539FAB0
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Dec 2022 02:26:10 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id z4so1356349ljq.6
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Dec 2022 02:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MYT2nq0QXSxRz64AN42vH74ETqWDNSsFMko9zkH39vk=;
        b=A2j26QK6XZeEZRd1pVoVNtq3AvjNoVgfwfmhzFjUMB5j+Zdnccpi3N8UGw2F9b7gu7
         LgWmZdSJ3SVsAtjqXbiL+GjUX1vLBxxBV95su/i3xNZBf0NZV2lHSs3FbWLclDmnzXIE
         9WBGBhY1KveAhn71WSIBt98bDmYZ7iIRDoiYFNftcD9yQVWcHPMrbEe1cLNjaCTgNU7U
         3ulcTG5mxZdipYHysym39htN68RXaanTR3fQyZa3Lnv4rcUm8dx7yQMmzNzRexFHM3p5
         qowj7BH9Xh3fJPPyCmmTwpmEJj9y0DocDG3MLBTmQ8h78yKK3+EF+g61O6nWGdY+/gg2
         HleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MYT2nq0QXSxRz64AN42vH74ETqWDNSsFMko9zkH39vk=;
        b=T/HUy49pvKlFnuNrsB9Ghsw87mZiHshq4zo4sLWw6JSn3j/w712scfKJMbye50XjTT
         zOkYmfAcm2e9ING/vc1wnN37V+NuKJ6frT1HNU00Gzqruiy9VcjY28f8TUKk/TfpoGy0
         KmAgAXT+Fc/Z7Z2QpfYQ24sn+h45I3ridlzagfQTE4Cp8B4a22DcPCi760yNXq50wp+g
         jm5pJnF4FLidpVc0WZScOosXdVaV4pfLO0oTZ4OErlDNJMGrOPXrdPQrVn9mCEOFnL1G
         nGMnnyXUpwqqHK2ZqbDyxct/S1ScQQYh2Kddx1OKJc+lVTk5XENNSst1EDZ9j5dgU7ds
         LMqw==
X-Gm-Message-State: ANoB5plG8xERukSWyc7csyY1/YaDTJ78zu6Fh3kxwRid73R72Ei1x00m
        XnUqGndrhCAGjnPs/QU04b4O+yx7Zht4adEl
X-Google-Smtp-Source: AA0mqf5Qinw7ldn269i13qHU7N4BlOct4Q02ZBOfbWmzYzZyjReCeMq8uWrycdBhL3R5L2q85NNOrg==
X-Received: by 2002:a2e:a5c4:0:b0:277:c03:a7ed with SMTP id n4-20020a2ea5c4000000b002770c03a7edmr20474278ljp.283.1669890368405;
        Thu, 01 Dec 2022 02:26:08 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c2-20020a056512324200b004b5478d8222sm74420lfr.184.2022.12.01.02.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 02:26:06 -0800 (PST)
Message-ID: <bc86121f-3cc2-1e55-4c6a-02cb1644a8bd@linaro.org>
Date:   Thu, 1 Dec 2022 11:26:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/4] dt-bindings: hwmon/pmbus: Add mps,mpq7932
 power-management IC
Content-Language: en-US
To:     Saravanan Sekar <saravanan@linumiz.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, marten.lindahl@axis.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221201044643.1150870-1-saravanan@linumiz.com>
 <20221201044643.1150870-3-saravanan@linumiz.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221201044643.1150870-3-saravanan@linumiz.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 01/12/2022 05:46, Saravanan Sekar wrote:
> Document mpq7932 power-management IC
> 
> Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
> ---

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof

