Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB90BC0015E
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Aug 2023 20:25:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjHEUZB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Aug 2023 16:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjHEUZA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Aug 2023 16:25:00 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC4951BE5
        for <linux-hwmon@vger.kernel.org>; Sat,  5 Aug 2023 13:24:51 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51bece5d935so4285609a12.1
        for <linux-hwmon@vger.kernel.org>; Sat, 05 Aug 2023 13:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691267090; x=1691871890;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I9u1JIe+S+ZRsZagR23AwndpCmmekGj2y2aYKsRIq1c=;
        b=EwIxppLa2LKK3fjD/dxA9a6GuV4Oo+n+2rzY01GYbTgL7T7LX1jcv5hEeeMF+jT3Ze
         byp7a/wZxjfARR5EQPgR/oj3UbdvPwuxWxQhKAkz/hJBS3mQeVl+YmYkmleKZ0Xp9Ku9
         6+j6WubW5uD/lWP8I0qlXPhEEr694fQNxE1kQNZaibcCkJmuvapOcQ6TgABsJmX5HHFm
         H+pq9212UUnm+nkijnqaJn2Vs0Ps1qtindkPDnYsaS00AkknAZAibAaokYhwjmTDlib2
         5uVCOHbbzUt8qS2iynvlLcwG/LymkJH5aCemgPgUmX0sxfwnfAN2h5SaABSWwlWF3YAF
         m4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691267090; x=1691871890;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I9u1JIe+S+ZRsZagR23AwndpCmmekGj2y2aYKsRIq1c=;
        b=ShIrS+GMsGYYEp7i0UVpaYscUFQ63wbIvmkwwtNbmfY4Kd+CfWHnBRGQxoFIjgJEhx
         Dj/Icu0BGFi8Sbi++VBtgEUy0FshKah1Om7W4jQB2Q2r1HQy3HxPpKKRFu5SGwDs04EJ
         A0y3aa2rvpjVoKru7FsnrmWwuLCVEFZxo2DdGcEzzc+cS9XBcKd0qAKjm6DLYTiARmK6
         1cgzhWF8rKH41KphBjLIZ4+iuZ8zkOsBR4LVzSN0su0bsd41BRDemFsKuVIgP6rkVltW
         j/pXvhDX+Ee+bUGr4e4WNC1cYcnL1yHyvi8qcLgMiVXqEzr0q7ORqtwmpSKfvHZWDQMN
         6k9g==
X-Gm-Message-State: AOJu0Yxz+kAEQJlmFukC6Lw9EOFytT8o29HbcqkC7ayiY0kGqXzCBOBH
        zcCS9VV0lueevUbg6O4tfIeWvhgO1R5WTh33Cx4=
X-Google-Smtp-Source: AGHT+IEfVWd3dsC8eI5sDNM1yTcX/YzszOsEXK+ozLfSVWr5dRe21ZxsGYN59D5YL6ALLfqvOX5hpQ==
X-Received: by 2002:aa7:c383:0:b0:522:219b:ce05 with SMTP id k3-20020aa7c383000000b00522219bce05mr5199384edq.7.1691267090247;
        Sat, 05 Aug 2023 13:24:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id d19-20020aa7d693000000b0051ded17b30bsm3057965edr.40.2023.08.05.13.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Aug 2023 13:24:49 -0700 (PDT)
Message-ID: <fbf6f9b0-dafe-8a4e-f3fe-f4a99c421abb@linaro.org>
Date:   Sat, 5 Aug 2023 22:24:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add MAX6639
Content-Language: en-US
To:     Naresh Solanki <naresh.solanki@9elements.com>,
        Guenter Roeck <linux@roeck-us.net>,
        krzysztof.kozlowski+dt@linaro.org,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marcello Sylvester Bauer <sylv@sylv.io>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230803144401.1151065-1-Naresh.Solanki@9elements.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230803144401.1151065-1-Naresh.Solanki@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 03/08/2023 16:43, Naresh Solanki wrote:
> From: Marcello Sylvester Bauer <sylv@sylv.io>
> 
> Add binding documentation for Maxim MAX6639 fan-speed controller.
> 
> Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> ---

...

> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      fan-controller@10 {
> +        compatible = "maxim,max6639";
> +        reg = <0x10>;

I wished the examples were a bit more complete (not only 40% of your
properties). Well, that's not a stopper, so:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

