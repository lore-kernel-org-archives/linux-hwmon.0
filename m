Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC77C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 May 2022 08:19:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241483AbiEQITl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 May 2022 04:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242283AbiEQITe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 May 2022 04:19:34 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA29B3CFD2
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 01:19:33 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id i9so2275515edr.8
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 01:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+9WF+jfeaKBEzOX+lERO2uJekUjyE02OyMlke8wHLlc=;
        b=w7ZYp1hJWWVevtdBw9odgfO6RWJ3gt+GvZj+X2Y4cJ4t23jBJaLFOM6QHJJJDeSpUN
         UGA6H3BJdsP1SdYAOa1/bgpfJ5Sp2aMKpo/7bako9L5oMgQUxv6Qx6lPJeoDWj8sxODQ
         W+s3COys7XSkgsPse3s8ZC3z8F6dx7qfZAvMW63o9LrXA2XybTpIJRzyI/Fwzk5LC/nh
         vSC5IvbPDJMjrG+yPi1+02F9MJv1GLUKzCfU+Wj1QZsr7BM3Vz6hdv7K4R21Ua9/98zy
         mmw+IVrIbFZ3iTdQmadGpPkHUbvXV8Y884Z6v/+2ibDS0a0DBl8x+PSj4oc5sKeCvCnt
         8ECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+9WF+jfeaKBEzOX+lERO2uJekUjyE02OyMlke8wHLlc=;
        b=xtG9SjdDcAqNNcf4TaEY5C6csst0G8Q504jKfFX5Kk0tu9Pn/K0+AaUZkH5QfHcOQ0
         t531Bk/EijVQfUX1G5AO7HBCSxVXPkho7P6fzmGc/wjhE78GgA0tMF+W1G++EPtBtd6K
         dRdtfnVSpQtX8+6Gx6mfLSGm8B2NonxqjgflYeJLQSnV4zt3E7wpiWX3YzVuJxjJ1WJu
         ABX3LQiC6e9Q0HFZgSbLK7yj0uHubRcC3NsjI+xBsdU70Q/ZVEmcGgj+ZLIThMvGZpBb
         5kbnvBof05XDoU1VoKCJDEnleFkAPBE1QgQvQKvEgt+uh0aKUoJNOqP4ETeR2kypxn+v
         fJXA==
X-Gm-Message-State: AOAM533dA9C2BnrmXG3fOvv5LQLT64pdSTmo6mo0hlz9ACcyB5Y1pSGY
        CzuozPoS5YbuBYe3ftVzU7/DDmasSp8EB5Z+
X-Google-Smtp-Source: ABdhPJwwJZootVi74+Jw2XNywzpf+6h2f1MeBtPOr+hTjfC/SVQLKVnnQuwEHLSYBTSpkF1KIr5X7w==
X-Received: by 2002:aa7:cb99:0:b0:42a:ba14:fb6c with SMTP id r25-20020aa7cb99000000b0042aba14fb6cmr6831193edt.78.1652775572426;
        Tue, 17 May 2022 01:19:32 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t15-20020a170906178f00b006f3ef214daesm751578eje.20.2022.05.17.01.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 01:19:32 -0700 (PDT)
Message-ID: <fd978527-5edf-22c2-52bd-1891f25251f4@linaro.org>
Date:   Tue, 17 May 2022 10:19:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [v3 1/3] dt-bindings: hwmon: lm90: add missing ti,tmp461
Content-Language: en-US
To:     Holger Brunck <holger.brunck@hitachienergy.com>,
        linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220517075626.16809-1-holger.brunck@hitachienergy.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517075626.16809-1-holger.brunck@hitachienergy.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 17/05/2022 09:56, Holger Brunck wrote:
> This sensor is already supported from the driver, but is missing in the
> list of compatible devices in the yaml file.
> 
> Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
