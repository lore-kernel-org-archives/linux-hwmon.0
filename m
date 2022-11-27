Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C96C4321E
	for <linux-hwmon@archiver.kernel.org>; Sun, 27 Nov 2022 12:40:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiK0Mkx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 27 Nov 2022 07:40:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiK0Mkw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 27 Nov 2022 07:40:52 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79BB3263B
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Nov 2022 04:40:51 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id g12so13518008lfh.3
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Nov 2022 04:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BEZiWNlmMZOygjLOWw/ZtkvMzNslxXaop6Zd/Hpngds=;
        b=uPET2E6RBT9YYG3BX3kJ8CDGZQFtzJlQnA9lANT4SYfwBPNfNvZRXYn57wsSqP/tvZ
         9hd+3uLaDuU9Rr2rkbPHMp0PC0b8K6dhV0Z+h52Rytw48HjhSWbRNLrBN4atUC5Dez3K
         CWiraQgPv8nJF3cmY2eGCnG2qBYuJXRjBcu8h89mRv8Pz46edI2TdDUh3CE3L5gMAUhA
         P3xBvnlsSz9/9TU3fNmdyZjLWBG//UChjid0v0reXzgNJLdM+VBlUVSdT/bt/5mzqYC4
         p87V5Y4i1IwuNuev2N/wMR6vGZ3BIC3/PLxEWopyVoX0oSjWEIPNHGrey2P2JjTUtoXh
         dscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BEZiWNlmMZOygjLOWw/ZtkvMzNslxXaop6Zd/Hpngds=;
        b=tm+ZvyD0jzmdEkCVd87oGnSuJMlMnateRqpvL+Fi61iiGxeYTMfBCeJ/cHLt4/6oVb
         S9dAnrmNWceSem8+8oDeLOiy2XmNQrJREKDuqI+CamEUwreB+4Q2JdJJoKJs6XWVPIS9
         jsGRi96TyR0QZpewh0dtppfjPaNTj37WvMJQl7OhfUk03V6F6GueM7SkVfueIxF8EUeG
         skQ82u/u7SGq7gk3Ij3VLq+zBJ0qm8+Btle3bqOK0Sy4ppa5Dny/gkL08TPyb/eM5tDz
         TGrygXc+adJz1GGlJwHgxcPJf8eAUgoWcdRNWOx78LXLRuRaWlAuNqj+skLZZD3tjydu
         GMfw==
X-Gm-Message-State: ANoB5pks3jyHS08ilFldLfooHvzcRS+xuv8vpdVZ8ko8MgRdUDZlh8d4
        Eh29uvK1LJYuom8qtXSOa6xr3ZOAAbfFTMUl
X-Google-Smtp-Source: AA0mqf5r5+bwfplIUXg0PV1Y2fq0cQrQRwQaLW+BCBSS3iV3kor5+4Dv8565gnyiwcCFagC3Is98Rw==
X-Received: by 2002:a05:6512:2c85:b0:4a2:5937:e9b with SMTP id dw5-20020a0565122c8500b004a259370e9bmr15031109lfb.11.1669552849918;
        Sun, 27 Nov 2022 04:40:49 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u4-20020ac248a4000000b0049944ab6895sm1276255lfg.260.2022.11.27.04.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 04:40:48 -0800 (PST)
Message-ID: <d1b841cf-2a83-7b75-1e8c-37f1a5ee13b1@linaro.org>
Date:   Sun, 27 Nov 2022 13:40:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 3/3] MAINTAINERS: Add entry for mpq7932 PMIC driver
Content-Language: en-US
To:     Saravanan Sekar <saravanan@linumiz.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org
References: <20221126171711.1078309-1-saravanan@linumiz.com>
 <20221126171711.1078309-3-saravanan@linumiz.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221126171711.1078309-3-saravanan@linumiz.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 26/11/2022 18:17, Saravanan Sekar wrote:
> Add MAINTAINERS entry for Monolithic Power Systems mpq7932 PMIC driver.
> 

The entry is already there. Your commit msg and subject do not match at
all what you are doing.


Best regards,
Krzysztof

