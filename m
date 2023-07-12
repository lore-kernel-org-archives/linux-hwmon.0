Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A2DEB64D9
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Jul 2023 11:58:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbjGLL6w (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 Jul 2023 07:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233697AbjGLL6T (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Jul 2023 07:58:19 -0400
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC011FE3
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2023 04:57:56 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b701dee4bfso112987861fa.0
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2023 04:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689162714; x=1691754714;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3aUrZFM5gyMcA+QPyE8YHFPQc0BMKlzWQfDrf9yaDl8=;
        b=sbGBH3cTrViLbJqY9LfsvRbfRFg6V1DJ8qDClRQlF+ABOPuHuTj2SaF+C1Dg0uQ7y3
         75WuEthxrmsUylBZcg+0dYXggdiLts3fmnKE3diWgx5atpJAguGe/qinQy8RJQ4hl54D
         URCBFj4cLlVC3MOuuYcJrthoJH4IalM2ebtl1heCEeI+EOqzQs53IRdiL75alXWkdtQj
         dziNA3TA7j9f4n4VG0NT9WQR+/KSl64e1csNmLDwDgPlNOeohH71wH3Lnu+mVK5rHcu6
         bf86n/lIdvc3ZzjmXgi0P6hJzVlGCrjHH7ujKukABoHFh9H619aGOv+B+F5Znd47Zy+9
         j4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689162714; x=1691754714;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3aUrZFM5gyMcA+QPyE8YHFPQc0BMKlzWQfDrf9yaDl8=;
        b=S5g3P6uL+kT+L+2BoJ3/kMCYC5hOifMHuSaCSm4naQH75VYIid3RSHEI15Dd0HMFGo
         hP1b8C9DNbMMmNB15mbSit0yAtXhxDzs5PuoZPBuqBHetBehIKke1/b/bh/uDoG1MAh5
         4TaBk1kqV9UdMDqSQirycjFRT+P0zdbPQ51jmWYb+JIKT6UDM5izRU92Sx0Hn9c4RKG/
         D9x0htRBQsEkmdDPPdO02Rzo8nOhu4qJxvtsX0F3Q2rTOiuMfFHK+IogLEnhJH/upHf8
         8zNPhHVS3eSP1optaMsPXwctNgKAH28lwmI9oWKIzQiFHAw/yfwdA7zEPA/ajkpkUWC+
         jJhw==
X-Gm-Message-State: ABy/qLZPJ2M1wZpqBBPZdYy0/1HKt1VAsSCBEeJFkuDHAoQ8mgAPdUjr
        R1nj0hBS+qoFwZ9nf3uSE2e3yQ==
X-Google-Smtp-Source: APBJJlEaQO7gyYYDeV4Yr+qR7c/XnqifTqJIkggMCvR665mQT6xvulYbzD9SVMFZVDsLOy/VWSCXnw==
X-Received: by 2002:a2e:88d8:0:b0:2b6:cca1:9760 with SMTP id a24-20020a2e88d8000000b002b6cca19760mr15421335ljk.27.1689162713841;
        Wed, 12 Jul 2023 04:51:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id kb9-20020a1709070f8900b009894b476310sm2458160ejc.163.2023.07.12.04.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 04:51:53 -0700 (PDT)
Message-ID: <ce408456-5b8f-8aae-335f-a6c0845d1166@linaro.org>
Date:   Wed, 12 Jul 2023 13:51:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/8] dt-bindings: trivial-devices: Add MPS MP2971 and
 MP2973
Content-Language: en-US
To:     Naresh Solanki <naresh.solanki@9elements.com>,
        devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Rob Herring <robh@kernel.org>
References: <20230712114754.500477-1-Naresh.Solanki@9elements.com>
 <20230712114754.500477-2-Naresh.Solanki@9elements.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712114754.500477-2-Naresh.Solanki@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/07/2023 13:47, Naresh Solanki wrote:
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
> 
> Add Monolithic Power Systems MP2971 & MP2973 to trivial devices.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

