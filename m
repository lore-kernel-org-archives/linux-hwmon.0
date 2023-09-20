Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDDDCCE79AC
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Sep 2023 06:47:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232228AbjITGrb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 20 Sep 2023 02:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232143AbjITGra (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 Sep 2023 02:47:30 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1046AD
        for <linux-hwmon@vger.kernel.org>; Tue, 19 Sep 2023 23:47:24 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9a21b6d105cso817225066b.3
        for <linux-hwmon@vger.kernel.org>; Tue, 19 Sep 2023 23:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695192443; x=1695797243; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ItM+TknBaVUePyzd+K9zDA8JpLcEfRL0RuIuQPWPMDo=;
        b=tAVtGjWuSa9lNQKLbODyu9wLIICBl4fncvJ08jFuJRQ1Bg9O105Pl0Ag1rpEiq/zw4
         RhSKrNYcg7pSS/56sDq40/y+jvNG1F0I1BAUftydBgz4koFcOl1A7BTaSZ9cBvRoM0DD
         1/M7gySxFQuzgqyhdnM6nXxAjqbBAnMVT0O2gE6kupdE+4dE+BtAF0zEfezT2/yQeGg9
         q6eLO334cDZe4jOsYz3WQ8+tu1SyofRLmtBnzkN3qIyuxlHkOfkjlS8Ya91fEPFJzb0v
         oQuXU7NluDICj+cOvIiVCCPhI1uu5A8J7ow7eQmMD5B4HkSR8PyxMK4YyuspvI6kiEdU
         pHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695192443; x=1695797243;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ItM+TknBaVUePyzd+K9zDA8JpLcEfRL0RuIuQPWPMDo=;
        b=NMp9alV09w2zeWqYQPbQPP/yAL//nv/oFkcboWBSCY/3i9qJmpiQKeNoR0n6ZX0doE
         AgWHrwe4BXQ35C8+Ymk/OqI6W+D1Z1mFePupXAT2q82Anqk/2hiZfC2ed/jfz7CRq4LT
         SHWKAQ6WuWGcSGHMgOXcSJvky3M1TFjPWejKrBxXtUxhYESoRK0C1wjsL3JZ9nc/xgc0
         biFpVhLFHzNuZAMfop1furjYeLcpMPzUm0YB2ta7Y70oZB3QzcAO4xtZnSZFSIasEL74
         JBl82E4L1DdI0X/N43P9245KKxiVUrmSTnLMJmAnK5hXRzZehne7JZZYsQ0W6QKPhUrP
         uUjw==
X-Gm-Message-State: AOJu0YyKHnRZ1vcwuATKskwKkGRFAUl7sh2R+7sXUg5C8tmJOIv/Ge5+
        qbF4Z/wUALa7V2uC/2trqWm2e7LIUMA1C6mtkhON2A==
X-Google-Smtp-Source: AGHT+IH/O0PptEtTtAOR5cdeRSNUd/ta1ny/TMJspKe9DtyuAwN6r1PUUDbhIwgJ3hBlmrb4o+6xpA==
X-Received: by 2002:a17:906:220f:b0:9a9:f09d:7c10 with SMTP id s15-20020a170906220f00b009a9f09d7c10mr1220085ejs.11.1695192443199;
        Tue, 19 Sep 2023 23:47:23 -0700 (PDT)
Received: from [172.20.24.238] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id oq8-20020a170906cc8800b0099bc08862b6sm9067327ejb.171.2023.09.19.23.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 23:47:22 -0700 (PDT)
Message-ID: <9b0a9782-05fc-fad6-5abb-ba9c940e6d10@linaro.org>
Date:   Wed, 20 Sep 2023 08:47:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 1/2] dt-bindings: hwmon: add INA233 binding documents
To:     Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230920054739.1561080-1-Delphine_CC_Chiu@wiwynn.com>
 <20230920054739.1561080-2-Delphine_CC_Chiu@wiwynn.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230920054739.1561080-2-Delphine_CC_Chiu@wiwynn.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 20/09/2023 07:47, Delphine CC Chiu wrote:
> Add INA233 binding documents for Yosemite V4 config.
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../devicetree/bindings/hwmon/ina233.txt      | 27 +++++++++++++++++++

No bindings in the TXT format.

Anyway, this looks like could be merged with existing ina bindings.

Best regards,
Krzysztof

