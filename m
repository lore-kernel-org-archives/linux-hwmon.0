Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339FCC7EE29
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Jun 2023 06:53:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231786AbjFAGx4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Jun 2023 02:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231699AbjFAGxy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Jun 2023 02:53:54 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E0FB11F
        for <linux-hwmon@vger.kernel.org>; Wed, 31 May 2023 23:53:53 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-97448470403so49020666b.1
        for <linux-hwmon@vger.kernel.org>; Wed, 31 May 2023 23:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685602431; x=1688194431;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wy1nuKe9dp+eWuPldOf3TtXePfHrrKoH9eFDnQbPB2k=;
        b=ftFG+tInwul7DileJC7NDnJAXc5+mJ3bgyw1BujBWgZDXPjhLRNjPR788l2+dJOji3
         4yZ1W3mMltATahD5LFmm4nTdnflz7BA+odHKi+L/MpDbE7eFZKJLwS1Ck//C9iWtm6ht
         JVI/vq/aJAttbnZGSA8swxmGiJy621j1+vyvHcLMS5DqGGw36WdhJotMi0U9mtDKYHNj
         cwgwnwW8Ciqag4lTA65W4viTKLmoKJvQ00SGInpHwLsDHP65ME1KdWCH+qfQgx91vSqL
         SF29aHRsMGvtTvnZFf08XtBpRL+bIk7oy+/XN6+s+hvwYHAjXu3zrGXMUXBydRJajnGr
         710A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685602431; x=1688194431;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wy1nuKe9dp+eWuPldOf3TtXePfHrrKoH9eFDnQbPB2k=;
        b=huKF+hwsD9ULolHuP7j8TmjdPj0+tIQhMWwYR2hTVbtx1Jxag2jd2qRZdCyOJYqZ4o
         50vOHzOv1hlCQKIQzZVPGfwA7huosc2R1MuuwVSKxvqVK6Qg4jIdkIBLsHH3maHzzOPu
         IBtNFaWKLOIYvYWaYtrbK0FhghEnnmFaPwk1Jns3QD1G4xwExz0iCQVGhQncTUOlS540
         8Hyu+W5rqo8Bg/6yyRMXwfWmMGpVZfDW6zhp13+lwMuE47sDONaJn5JkCJpUKRW2Nc6U
         peFpiswPWqDhs3DsJazODItbfUAJD2Tm3WDdCPHcdTk3JC79Brlrdtgo6TlWqRSpNu++
         icWw==
X-Gm-Message-State: AC+VfDxGHBfUglNJ9wzLecpEW6IJTWGkELygaGpOuOnP/lHMir3a7w6e
        SSkZzLknQUwyDCseOMKv+tjmHw==
X-Google-Smtp-Source: ACHHUZ7AcpoTcnH2btdZ20lRMn5AeEGvUeXhNkieDRwTI+omxRnH9Avyf/dCT/n9xHbBm+RMWQTd7g==
X-Received: by 2002:a17:907:6d23:b0:973:d9ad:273f with SMTP id sa35-20020a1709076d2300b00973d9ad273fmr6964433ejc.46.1685602431496;
        Wed, 31 May 2023 23:53:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id h21-20020a1709062dd500b0097404f4a124sm5264376eji.2.2023.05.31.23.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 23:53:51 -0700 (PDT)
Message-ID: <d2232369-c7e9-c572-8528-243800f0bc08@linaro.org>
Date:   Thu, 1 Jun 2023 08:53:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/5] dt-bindings: hwmon: hpe,gxp-fanctrl: remove fn2
 and pl regs
Content-Language: en-US
To:     nick.hawkins@hpe.com, verdun@hpe.com, linus.walleij@linaro.org,
        brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jdelvare@suse.com,
        linux@roeck-us.net, andy.shevchenko@gmail.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20230531151918.105223-1-nick.hawkins@hpe.com>
 <20230531151918.105223-4-nick.hawkins@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531151918.105223-4-nick.hawkins@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 31/05/2023 17:19, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Remove the fn2 register and pl register references as these memory areas
> are now consumed by the GXP GPIO driver. The fan driver now gathers fan
> information from GPIO driver.

How is it expressed in bindings? I don't see it.

> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> 
> ---


Best regards,
Krzysztof

