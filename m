Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EBCC04A95
	for <linux-hwmon@archiver.kernel.org>; Thu, 29 Sep 2022 06:51:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234948AbiI2Gv6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 29 Sep 2022 02:51:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234890AbiI2Gvy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 29 Sep 2022 02:51:54 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F317B107DCA
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Sep 2022 23:51:52 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id o2so818742lfc.10
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Sep 2022 23:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Fco6NMVSVhjPLhPkls0dH/RXUx15xfAB9MdMBpMfFz4=;
        b=POUBwZmv07BX7QqfQ1b1U+mZxtX68uKAHirMssVC/JYRXNJUATpWFHYLCG8k3+1JEX
         qcfIyeH+8M6phsYlI1NCFU3oPrcZZLYVC9ISDHurdu0eFoin1UzJlcjtu+IeO2o9aph4
         z/MWhOMfSzYTe/7Wb9AgeU7J2g0cy0QPVYVa7Kl5jhgijfHHCKXOgNu/Z3FIJWiLgxZj
         f+tjDVEm39qk3aM4Liza0cA9TKQpEje8Tv84UaESnSZzo/V0JkMHu5G9HYQ3Z5geXKiI
         yzUph5zhCu+kBSRiTMDWi5kIsLrI04K3tmOy1mspZH9rgYV6wrhwi5iEMD54nErGn/CC
         h9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Fco6NMVSVhjPLhPkls0dH/RXUx15xfAB9MdMBpMfFz4=;
        b=fSIqOD0w9yVpXrMAxSRe4mzsZ8W8hdX+bFaHov6x1TrFOfdZnDLYFA/4+31dwSpj98
         fNbjhJLjf5KdDOLAdzb/CxkLWNg5B6pV4864l7VpWiPGwb2dyjlKbk/8fbcOU++sUG8b
         5YzyYszLSnaT1y9diTk4PJoJdColUhd8Veil/M/jY44Y2axDMt6dmtBobuxtyO9m0PVU
         PxegkiBya9DiQojMrNssjt0f0g/kvwlHxyQ69cozI4Ieg/+ttUymjyhCyyZIL65yKhol
         r2quqiz+8ydlhM2faFv5QWfNbq4Y543qh2RubXrZz5CH7mb+kE6XRZf0tympQWJlZhfu
         SY3A==
X-Gm-Message-State: ACrzQf2NGFW/U2AJrQ7d0H+FChHA67rrnFQTuWa9XM+kNmW0oTON6ekw
        wuTib+3hx+hcDEkaj8s7IzhAoj6O300lTw==
X-Google-Smtp-Source: AMsMyM7bkcsMr1PEiTGX4Bxt999WsCoUi4nb4/gpk043vx+H3mhmVUqZcxTAZg2mFgIIszFqb3HbLw==
X-Received: by 2002:ac2:5a49:0:b0:49f:f620:b81b with SMTP id r9-20020ac25a49000000b0049ff620b81bmr696226lfn.307.1664434311372;
        Wed, 28 Sep 2022 23:51:51 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id i19-20020a2ea233000000b0026c549bdd2fsm625724ljm.129.2022.09.28.23.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 23:51:50 -0700 (PDT)
Message-ID: <83f9c460-3009-f123-0b82-1d0bd23b7c12@linaro.org>
Date:   Thu, 29 Sep 2022 08:51:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] devicetree: hwmon: shtc1: Clean up spelling mistakes and
 grammar
Content-Language: en-US
To:     Colin Ian King <colin.i.king@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Christopher Ruehl <chris.ruehl@gtsys.com.hk>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220928213139.63819-1-colin.i.king@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928213139.63819-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 28/09/2022 23:31, Colin Ian King wrote:
> The yaml text contains some minor spelling mistakes and grammar issues,
> clean these up.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Subject prefix: dt-bindings: hwmon: sensirion,shtc1:

With the subject fixes:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

