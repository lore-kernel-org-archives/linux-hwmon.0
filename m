Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5450DC64990
	for <linux-hwmon@archiver.kernel.org>; Thu, 25 Aug 2022 14:17:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232920AbiHYORU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 25 Aug 2022 10:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241303AbiHYORQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 25 Aug 2022 10:17:16 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95302A033C
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Aug 2022 07:17:13 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id m3so22737090lfg.10
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Aug 2022 07:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=eKQ1RbXwOC6zGcrhn3vCU5z+POMesdAR7pXy72wDAkk=;
        b=uumy1Ow7CgrfcOdwchTvHJTMp93riJC/m2ZjeqySaoGDiNTq4GGSzMqb0Pl9Ac6peB
         syOauHwQeSSQXfzI6K6ZLvQLlBKgGZYD2b6FDfw6TnY+MQ3r8KlSqYxIHGz3CHW/R0Qv
         cQ4seYeHcs92Tt79h7W6RspjpHkr2cNrOLz7KWR7hDls67MIRsRUYzfkWIrFFypYstUu
         QlqIAf1LEo0IsDAH1CYOOW3qubd2sRjWxGXxL5MQoRU0q7wjPRiGDkSotTfDPztFE2pF
         OdplW31SoOVU7fRHUDHpGoZXhrGEdY6L/i8q80E9st+Z0d0D8kvZ48oLyjqBC69pvXc3
         1tfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=eKQ1RbXwOC6zGcrhn3vCU5z+POMesdAR7pXy72wDAkk=;
        b=eA2YTEZFPfSXh9HH8xAnXetLQzVOGDFQ4cjroVOX8suFxDgLrZ0rQyC5JVyoY1wgfv
         rZfJSwYC29SqFXLEiAN5NHYQC/Pl7ZsTlzkujnck8vtq33GKLpqWLoq0dBnRYSf+TSju
         GzaOqhwccozejfWeYsSTy3BcJNN5OFhXmnEsL9NSgQWXQ+XgKoN2fL43hlqat3Zl5sOR
         1Xyhe+XJRo+fUzsgbys12SyySZpABkdJz91xZC+gKvP2rxJ1uYVdpkB8jxHwCQZHnRxb
         KSRR8P7ctEsQCrrAVfc4STULJNGt3wGdplqaibxJ58P8sxxErX3uHU2MFbqeiXOBBdO7
         +j8g==
X-Gm-Message-State: ACgBeo3KBMw0j4yZV6cMYaeq3ACLl204+yaeRORcRL+hJ4gIgb2n9EVy
        kPlwNPGEaR4yJ1tvnqaNsxHOBg==
X-Google-Smtp-Source: AA6agR52SKThKo1JHDLhl+xCQIf0ysmSGmllYxgUw/FdXSKfpY66PWC8EUPs7oPEUWcECuqLRsxwMQ==
X-Received: by 2002:a05:6512:23a1:b0:48a:fde8:ce8c with SMTP id c33-20020a05651223a100b0048afde8ce8cmr1312907lfv.393.1661437031860;
        Thu, 25 Aug 2022 07:17:11 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id r1-20020a2e8e21000000b00261a8e56fe4sm593436ljk.55.2022.08.25.07.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 07:17:11 -0700 (PDT)
Message-ID: <f64f493b-aad9-1811-3a9e-790f7613b99b@linaro.org>
Date:   Thu, 25 Aug 2022 17:17:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] hwmon: tps23861: add support for initializing the chip
Content-Language: en-US
To:     =?UTF-8?Q?Andreas_B=c3=b6hler?= <dev@aboehler.at>
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220825141043.75354-1-dev@aboehler.at>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220825141043.75354-1-dev@aboehler.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 25/08/2022 17:10, Andreas Böhler wrote:
> The tps23861 driver does not initialize the chip and relies on it being
> in auto-mode by default. On some devices, these controllers default to
> OFF-Mode and hence cannot be used at all.
> 
> This brings minimal support for initializing the controller in a user-
> defined mode.
> 
> Tested on a TP-Link TL-SG2452P with 12x TI TPS23861 controllers.
> 
> Signed-off-by: Andreas Böhler <dev@aboehler.at>
> ---
>  .../bindings/hwmon/ti,tps23861.yaml           | 76 +++++++++++++++++

Please run scripts/checkpatch.pl and fix the warnings.

Best regards,
Krzysztof
