Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A1DC71140
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Aug 2023 09:36:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359233AbjHRJgX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Aug 2023 05:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357547AbjHRJfx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Aug 2023 05:35:53 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DAA830E6
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Aug 2023 02:35:51 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5254f9eda36so881354a12.1
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Aug 2023 02:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692351350; x=1692956150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hfNi7JSKPZId/vX/i5U5Vygp+2lX7VCsOltrQFE5gZ0=;
        b=yHkzXIub7BNebiOEltNrfpmP9qkFHgVPPbK/hyeP3OR8/bXppY3+1W9MISAePwiZgd
         xu6/2dUbf2N6aPr7eTI3NybNOE59RDNSRNjDSrmBr0viI9mvFV4+vnI4/F8suNYLGUdQ
         ZePFWghl9W2o6uW3YXJgAs/o57zIYIW0ZO5zzAvYW1WYpYpKhVP6/GH3EIumSCvbKFP1
         l3khRxp0NYdi28yjb+JLgbWPukHIt0VoZUg+VgHR74APUofjDcT8wfieNDDwpj62Fa6T
         Hfo9S3jpZGY2mIFZrZuEibRjQRmOGrcFR/4gRWvhvHFlQM+45vY7RtzNjv4EErc7T5cT
         49zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692351350; x=1692956150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hfNi7JSKPZId/vX/i5U5Vygp+2lX7VCsOltrQFE5gZ0=;
        b=LbYsCjxtS0GPztpezFz9N8ILvUFuN7HnoyBdk82ShbjkJOhwQeSZ8qWb3e/TDfVbvS
         uvH/+Ktv/DJ3XjNU0+ZfQqBbREcNwP5IT931QPH3gHHIbm+EdMij5gxMrh0CU47pv3Lo
         3HTtOG6CRh6hSeeQLy8qFvcWizh+uwjjrerbY5TbOegy/8d4IkB3iFD948FIwwkymN9B
         h+Bz2RSyu6qqNx+b9uKeNxhGbhqfmEhZCMJDUPiUL1vN+j/NxtB1ORH5Sf7sU79jsPqZ
         FHPQKH/G0ztoTfadwMaJIyQQjXE+o/zQm0nbDiQQmdmz+AY3Bac3K4JOrt0WVzwXiVvP
         uVkw==
X-Gm-Message-State: AOJu0YwZNOBnzWvwd8ZqWbv4VuQFwFrzRgtBeOnwEfrZhFp0sNBeaGj3
        lPQhQekqEf6zE9iZtfXjcw4kXQ==
X-Google-Smtp-Source: AGHT+IEPujuSa8cOVqm2zhubowgpe/JPUlxLAAhtqQfJagG/gJ2jSmeyd2nx58vbQzxtgVkR9p8p1A==
X-Received: by 2002:a05:6402:1204:b0:528:88f5:eafc with SMTP id c4-20020a056402120400b0052888f5eafcmr1849520edw.23.1692351349845;
        Fri, 18 Aug 2023 02:35:49 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id g3-20020aa7c583000000b005224d960e66sm860433edq.96.2023.08.18.02.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Aug 2023 02:35:49 -0700 (PDT)
Message-ID: <be72501f-f7dd-38b6-cf2d-326185ae7e91@linaro.org>
Date:   Fri, 18 Aug 2023 11:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 2/2] dt-bindings: hwmon: add renesas,isl28022
Content-Language: en-US
To:     =?UTF-8?Q?Carsten_Spie=c3=9f?= <mail@carsten-spiess.de>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1692033412.git.mail@carsten-spiess.de>
 <3f98be38377cc556619c6876f6dcec2d54102271.1692033412.git.mail@carsten-spiess.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3f98be38377cc556619c6876f6dcec2d54102271.1692033412.git.mail@carsten-spiess.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 17/08/2023 16:29, Carsten Spieß wrote:
> Add dt-bindings for Renesas ISL28022 power monitor.
> 
> Signed-off-by: Carsten Spieß <mail@carsten-spiess.de>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

