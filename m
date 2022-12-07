Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A302DC352A1
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Dec 2022 17:59:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbiLGR7s (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 7 Dec 2022 12:59:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiLGR7q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Dec 2022 12:59:46 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BDF55CD09
        for <linux-hwmon@vger.kernel.org>; Wed,  7 Dec 2022 09:59:46 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id x28so12580634lfn.6
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Dec 2022 09:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xzPIIHJ1Rx7W7OD0G8eMenZ9zj+B5F0PnPlpat3xklc=;
        b=UXpgHXTFGYUweNouQpPno29sHtNAL/jhMwxXafo5uOe/iEciVXCYpavftBwknC2my/
         9Uy/VshAP9An+L/tAjUZO+9YtVr9q3Qv89AN17gtRn5w3W67lIBat4fLb3jUVdUs9Tre
         CbwO1c0+95byKcQHD/DUbLqPqzQzl+aEmFLdruPNZYq2IgXeyC/2MpKlueS2ZawASS6A
         a0xSosvGOZIrvIaoS+Shk/ITbARVaB/AtaR0rhmcXeBGilWFd/j8a46LQOiJwAUqi5Zc
         IGvPvyW0irluJ/6KcLPtTXdri0HANvayczkEd/vXHzAdNd2QpBOph3XRaWMBgvZ2SiEJ
         Mr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xzPIIHJ1Rx7W7OD0G8eMenZ9zj+B5F0PnPlpat3xklc=;
        b=bvrKNKGFUdtdDWGZmqHXF8IGUtCchqBdSf7DuY/YYzyOwvUi0EER55jjzNNjF47/fK
         MoLlnN+sStLdmuZHmjuShMVoqAure6zxW3AqypR2Of/kUSKoNfZ+GNvmD3RHCFCBFbgp
         S7qbU6isZ2hJn9BsQY+yLp52v5dBxEYgY4k3qAYh//8+0qh+IsfjhW/dPpqbOjcVmryy
         dxMZy9OYZskS/bawjQm15aHol4lXR1igMPTrcy7MNCG/2i6QgLSyHgV+q5Abar55aVzR
         mTIv3cpsjyd5tl+H72yESbsAzTOPD/F5sQz+mhzAHrWRI1U6EzL3BHBm0rPjlgWGUR9q
         xoxg==
X-Gm-Message-State: ANoB5pnIvJ+PKlEmGAOr7P8RWsmA3MLDcHRRfsNIfcSoaEWuxu8RuwpP
        XPTXHfzJD3j7zSOMHEa+A4/dAQ==
X-Google-Smtp-Source: AA0mqf4bFnRtzANo/1HX9jgQhllGdBce+YDCVO9UkkGvJLPzCy7oV6FOKm1Q22ucoJbhAYuAmzf//w==
X-Received: by 2002:a19:9152:0:b0:4b5:6930:dfab with SMTP id y18-20020a199152000000b004b56930dfabmr5844562lfj.324.1670435984427;
        Wed, 07 Dec 2022 09:59:44 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id h13-20020ac24dad000000b004b1892aa5c8sm2933914lfe.56.2022.12.07.09.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 09:59:43 -0800 (PST)
Message-ID: <3be5ad78-daa9-39aa-9dad-c2234a0a464c@linaro.org>
Date:   Wed, 7 Dec 2022 18:59:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 2/4] dt-bindings: regulator: Add mps,mpq7932
 power-management IC
Content-Language: en-US
To:     Saravanan Sekar <saravanan@linumiz.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, marten.lindahl@axis.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221207173716.123223-1-saravanan@linumiz.com>
 <20221207173716.123223-3-saravanan@linumiz.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221207173716.123223-3-saravanan@linumiz.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 07/12/2022 18:37, Saravanan Sekar wrote:
> Document mpq7932 power-management IC
> 
> Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
> ---
>  .../bindings/regulator/mps,mpq7932.yaml       | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mps,mpq7932.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

