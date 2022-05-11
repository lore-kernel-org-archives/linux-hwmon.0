Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42ABC433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 May 2022 17:55:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234595AbiEKRzk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 May 2022 13:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345925AbiEKRzi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 May 2022 13:55:38 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23FD66D865
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 10:55:38 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id l18so5578122ejc.7
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 10:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/FwjoTI9KKF/DHqOsUyINnabl/AdXqMd1Dk70LhDCQ8=;
        b=h83lArFGhzEKwgBj5CCebA1wFLB0zadieWJEhNAOhebWmYnrh1Xr4utxDqWMBjhWDy
         kHOkJoQB/2lI/bgtopI/FPTJmGP9Cym5dYa2luKxd5tHDd9H16mZ3+9dlnRS1MMKTCFK
         LGyWezINVV4qJD/PdWkFtVhr6rH72DSI4IgqXQEkjO0Fgek+hRnvGqhJBhN7ybCZu9Nf
         mT50IGL2cQuIrnJ0i15q1om6NYN6gt88Mgyaf7kcgyJrWU9Aw7h7XMajLNiMn5aObtKA
         y0sEGeHubGLvEht37J5wieaNBLzjq8lYwWD0G8N398OOxhL1Qn7IB4fvZw2y7l++zTuK
         Xalw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/FwjoTI9KKF/DHqOsUyINnabl/AdXqMd1Dk70LhDCQ8=;
        b=evA7WuanhikSfZ7onGJZF0HB6YipOj+F+p45d75bwB5T6cXFXHbaUeu+ikX+ah4wMZ
         num2CP4b0zKv/b03PtPTEpCqlAJnTqdZNrsTckcF1S9yZeGwQfNpS3dh763GugYK2eEL
         zpNxwQ/ty5EOLcFJ0GRcrbNfq/IogS7llnIVFnqI+yywXMDmEhx2bDA17p4N0Ov31c4O
         MnxmuLC35BV2vu7K/laYl9dpK3SpCQ+SZBbdDCZf9AlVDQVz/+PKWFe6tJjnYCjI2O22
         s/loiUsw5x+uSStBmoynffNPFDsFaGA9KP1ivB7pR9ZM7iB72nibtdgC5xXtUCknLRLB
         FufQ==
X-Gm-Message-State: AOAM532EI3xakGLDKJgO/nZbNQxhpTJb56vyFxwYfwqxMTeCP8hUkqTc
        ySgThnM7hUG0xEikkFCAi8WhgQ==
X-Google-Smtp-Source: ABdhPJyl0/IxKkciw5u8JGwzExEC0k4giCZqpN20qHftxgmYSfk9ysL5FWDvzmKpWzqiew8UFOvvhA==
X-Received: by 2002:a17:906:478c:b0:6f4:e6c6:526f with SMTP id cw12-20020a170906478c00b006f4e6c6526fmr26424014ejc.41.1652291736715;
        Wed, 11 May 2022 10:55:36 -0700 (PDT)
Received: from [192.168.0.155] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l19-20020a170906645300b006f3ef214e69sm1206288ejn.207.2022.05.11.10.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 10:55:36 -0700 (PDT)
Message-ID: <15cb434a-7a64-58bb-083c-fa7aeacae672@linaro.org>
Date:   Wed, 11 May 2022 19:55:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [v2 1/2] dt-bindings: add extended-range-enable property to
 lm90.yaml
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        Holger Brunck <holger.brunck@hitachienergy.com>,
        linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220510080900.22758-1-holger.brunck@hitachienergy.com>
 <34d88cd9-2bcd-77e6-8cc9-93b8cbd63a8f@linaro.org>
 <037b551f-1781-321a-1984-117d098d980d@roeck-us.net>
 <b895f874-c8b8-3889-c7c9-0c0494e9bae0@linaro.org>
 <85d1ed0b-1e1f-bee7-9b0f-fbbf50921ad0@roeck-us.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <85d1ed0b-1e1f-bee7-9b0f-fbbf50921ad0@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/05/2022 19:40, Guenter Roeck wrote:
>> Me neither. Just pick one matching the device actually using this
>> property. If all of them are using it, how about keeping old "national"
>> or it's owner "ti"? If not all of them are using it, then this would
>> need "allOf:if:then" restricting where the property is (not) applicable.
>>
> 
> It is only applicable for tmp451, tmp461, and adt7461[a], so it looks
> like "allOf:if:then" will be needed. 

Yes, please.

> Note that none of those chips are
> or have ever been owned by National. Given that, maybe ti would be most
> appropriate ?

Sure.


Best regards,
Krzysztof
