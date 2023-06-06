Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F546C7EE24
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Jun 2023 06:23:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235105AbjFFGXz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Jun 2023 02:23:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235135AbjFFGXg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Jun 2023 02:23:36 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F6091BFF
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Jun 2023 23:22:28 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-977ed383b8aso176564166b.3
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Jun 2023 23:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686032546; x=1688624546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=awyPqVAflJ9HW7mRusvVZFjRIMdP5oGweyBZiHENeLc=;
        b=HREL2QlbSNI55ddaivjqqQYDRAsordq18Ce41nZK8NNcZ0E+Qu0nBM6LjzFjBpOjz1
         8nc6/233uTZNDMOERCxjsLH4/n7sxno888oZ1x+W3QRY/6RcoYDr590Qju+kfa1EHU/I
         VGSJcd/umzLBH5Kqg5gd+XcKWzM/4ix6CKLz2Se1IUNDLZ0b4YMmucBI2mhIJIYeHpZy
         Iyth1qVfMPh/Gq3dTJJ9+ldDPEs3IJSXAUeocQBVhJ78pTj/GKX11zOpvHcPf6GzGD0Q
         pcd4emFAMIgNxxFMhNSYIHKh03KUpI/wTyo8fpom6B3rsSCzYBWKbS/P/aGv2/8rDVdv
         EN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686032546; x=1688624546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=awyPqVAflJ9HW7mRusvVZFjRIMdP5oGweyBZiHENeLc=;
        b=ViK+FR8A8kQFJetRWycBkctRwU2rMvmkqMmra2YsV9coviNx5uYe0woa61xICUQqL8
         AYeOxABr5pSeXI8u4AL1LI0Fko5v2jq7hQ/6ukQcDkEmdGvPxfTd8i/BZ9QOgprsTeoS
         D6p4yn640I+4r696JGS3GXD3Bqp+crfQYquHJmWBxUl9h9eYku7nD1VHRjY6AE3EfttO
         ZV72MrcCBrS9A/T0ph/dQ+J/31jOQ1OaVBYj4iA8OiL6FwwMJDA0X5PmGt+jef7ix0GJ
         ijvKlON9Im1vXdKwZBIOaPPeWl2uDF6VhqFtXJe5FZuoMyOuXNidpMnN2+IOFCOEwDpH
         zOZA==
X-Gm-Message-State: AC+VfDzEY4Z7am/m/yvx9F1JFcC0MqqDCqyTAQ7EOrxYE/Usk21gV3Sw
        v7vAHDHnCzz+W1oyunEFvCgXpg==
X-Google-Smtp-Source: ACHHUZ4lQQLCUHb0etGsOAcpL6rQaxYC2rekThP+u2yThClAae5wuLBDKidMXKm5OdkorlU2aQ+dtg==
X-Received: by 2002:a17:907:97cd:b0:973:d84a:33a4 with SMTP id js13-20020a17090797cd00b00973d84a33a4mr1234857ejc.6.1686032546349;
        Mon, 05 Jun 2023 23:22:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u23-20020aa7d897000000b0050cc4461fc5sm4622224edq.92.2023.06.05.23.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 23:22:25 -0700 (PDT)
Message-ID: <29b720ab-4b9f-c415-3caa-e4c1b04aa568@linaro.org>
Date:   Tue, 6 Jun 2023 08:22:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 3/5] dt-bindings: hwmon: hpe,gxp-fanctrl: remove fn2
 and pl regs
Content-Language: en-US
To:     "Hawkins, Nick" <nick.hawkins@hpe.com>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>
Cc:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Verdun, Jean-Marie" <verdun@hpe.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
References: <20230531151918.105223-1-nick.hawkins@hpe.com>
 <20230531151918.105223-4-nick.hawkins@hpe.com>
 <d2232369-c7e9-c572-8528-243800f0bc08@linaro.org>
 <DM4PR84MB1927707FA782DC565C22B8A2884DA@DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DM4PR84MB1927707FA782DC565C22B8A2884DA@DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 05/06/2023 18:52, Hawkins, Nick wrote:
>>> Remove the fn2 register and pl register references as these memory areas
>>> are now consumed by the GXP GPIO driver. The fan driver now gathers fan
>>> information from GPIO driver.
> 
>> How is it expressed in bindings? I don't see it.
> 
> Greetings Krzysztof,
> 
> Thanks for the feedback. Just to confirm: Is this comment referring to the
> content of the patch description? For the third version I want to make sure
> I address your concern.

The concern was that one of your drivers have clear dependency on other.
How do you solve probe ordering and dependency?

Best regards,
Krzysztof

