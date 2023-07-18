Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795BAEB64DA
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 Jul 2023 07:23:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbjGRHXj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Jul 2023 03:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231406AbjGRHXi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Jul 2023 03:23:38 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC4E10C7
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Jul 2023 00:23:36 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51e28b299adso7523224a12.2
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Jul 2023 00:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689665015; x=1692257015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iSCltwnxHWzRk7Y0cpNIDArzz5ZlpHqXZ9iMuTI+OfI=;
        b=J3Au4Ibv4sJBTBwp5hff3IG5hjiz2HQ7R60pq1w96sXSgKgHSZpCbiEmYh6VYt5D//
         v26B4j5tRf+TzLdiXvmJDEN3otxqD4+DAiNx/xPqmiFQL5YSo6+brxkxz2Dck6rHgJQr
         Ds7UajxieXovAmZ3F8+tXxuIVvSJmCJwmOyuWsB9hllCx5+FnwCAw/V160TW6/jxow10
         NLu3hFA076fFgR9o4HOQHjlMmOVkCpmnYLsU6QYLGwiFiMWvxB5Hj7CVIkri3TsR8Kbq
         Es8YHHxXEG9wVEnlKvyrYNLXSxMVsytHlGceVn//iPMy5GMgu6U4hqhSxY6S5ikrI45H
         0yEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689665015; x=1692257015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iSCltwnxHWzRk7Y0cpNIDArzz5ZlpHqXZ9iMuTI+OfI=;
        b=biqcDKIYE5mqKHH6ZP5csepZPlXUXlGTQ87sBMfPiFo7PRJvD4b926N1VwzIHOcPIM
         CIT7Vd+h1u5eIaPuAncw0XNRnIir25wOPozhTnqUtj7wANJ4cG/aYcRZs8wqzuGb4Kr0
         6rZ7u41LKwfsBH1eQYf2jM1D8/eZHPS7+jbo1mZgnuzEBiM6vdCGbaUeUbMdrnINICOu
         FxImHvkAFpDk7bv2rf36MdoeyH09V4+QOqSar4x3LYbUChuYMQ6Mc3iN7NSWb1S4SOOM
         hsDQAHG4dXPdQF6cIXFTdVowNyQPQoPex3OC8LVlOvmWxY1s6gQUzlZ4v6JD7e0ZgE+x
         zLgw==
X-Gm-Message-State: ABy/qLb2gA/dRvv/bGGplL3lJ+Gipss8vry+2GzCw85hsjUAX5FiDOwR
        S+fYTLl7VgiJzFx3l5yvmKr8tg==
X-Google-Smtp-Source: APBJJlEJWK3IpPoAF1MaJSbNIxYudv8k8QIAIToUGUIbAOix+a6dif5mC+LwN0ZJE9o3qJu2NgnD3w==
X-Received: by 2002:aa7:cd52:0:b0:51e:3558:5eb6 with SMTP id v18-20020aa7cd52000000b0051e35585eb6mr12997197edw.3.1689665015019;
        Tue, 18 Jul 2023 00:23:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id n3-20020aa7c683000000b005219864c7cfsm776223edq.39.2023.07.18.00.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 00:23:34 -0700 (PDT)
Message-ID: <91725f89-f3fe-7879-1346-e4cd2eb8d2e9@linaro.org>
Date:   Tue, 18 Jul 2023 09:23:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add description for new hwmon
 driver hs3001
Content-Language: en-US
To:     Andre Werner <werneazc@gmail.com>, jdelvare@suse.com,
        linux@roeck-us.net, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, robh+dt@kernel.org
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andre Werner <andre.werner@systec-electronic.com>
References: <20230718070114.3871-1-andre.werner@systec-electronic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718070114.3871-1-andre.werner@systec-electronic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 18/07/2023 09:01, Andre Werner wrote:
> This is the initial description.
> 
> Signed-off-by: Andre Werner <andre.werner@systec-electronic.com>
> 
> v1: Using separate dt-binding hs300x.yaml
> v2: Reviewer recommends documentation of driver dt-binding in
> trivial-devices.yaml because the driver has no special properties
> to describe.

BTW, you already sent v2, so this is v3. Please version your patches
correctly.

Best regards,
Krzysztof

