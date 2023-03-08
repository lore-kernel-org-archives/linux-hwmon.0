Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AF4C678D5
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Mar 2023 10:27:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbjCHK1n (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 8 Mar 2023 05:27:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbjCHK1m (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Mar 2023 05:27:42 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAA9F509A8
        for <linux-hwmon@vger.kernel.org>; Wed,  8 Mar 2023 02:27:40 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id cy23so63532862edb.12
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Mar 2023 02:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678271259;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AQ/6QfXn/6Jg+ZbEEyzjQnYHfQ5MmftaUjn8g6npsRU=;
        b=CH9iTuyvEKjx41R01D9lDo28wcMGUnWVMlAH8UcjREAqEb1jM58+5+ep+UDIStHXL/
         nBjruki0NVy+WIVhpBzOXwq+KYtt/RqXqBfhD7DmYT/3nqOJ1GkSrROr5MLD/0zI4Uvw
         omwbXfbtIy/ZUvpw0DZejWniPxTgE9MGjgBPgaOs9JhkW9MGiIcQM3TnKfGwH7jo+kKm
         FnhhMnwwRcAU2VCvrfMlPil74XOGP34YKtg2qbPxxtwILVEQruREdM8mBSYKVxC4FMvl
         inTCX//aTeoZGesVISqBromkxF2qKEt0YsCNZce70yn2zd9aTMjyLo23aevMap779bRh
         gapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678271259;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AQ/6QfXn/6Jg+ZbEEyzjQnYHfQ5MmftaUjn8g6npsRU=;
        b=Qd6OlA0SXWWFpQwTi7jvf7BQKxtlwhetmf/5jbfQHwzzL3s722nqLAxIfcCjo0fc7S
         2rQGjnvtoAttr+2Qm0U1ytwK/YAXKtZ/3PzDauGWr+mO3SvSnGlMk7ZEpLMxM9wyxM93
         DGSLA0CafR79GGBL0s5m2cfOkLdlw9nQCNyHCG8SNV7yVYeOlqH2Ia/89NhzgnIej4TH
         Ws+bazsvu5TCh6II79KvLiGBRrODKELv2kJJ/iGusvyAFMHKzA45HmaD5+yFhESTb0H1
         ndMRh9kf1D7jgL5sh+OxLct7PoiWveaZNOr17dS3vKoD0sguxXaTWqFBqyIqulZq1mPK
         y47w==
X-Gm-Message-State: AO0yUKVL0FmOFv8pkZOP0cSSRsBB7pZjhrkA9jQm23x9KdIbaoqhhg6a
        hbQiZQ5pEkcPZhTbI3Chpv/AJA==
X-Google-Smtp-Source: AK7set+if0MRpDbkmOS4gQjE5ei/fRkpjNAPftW5oqyFhXFqaWKUe31w045f0kGQt4+konwW2yOdOg==
X-Received: by 2002:a17:906:5e0c:b0:872:82d3:4162 with SMTP id n12-20020a1709065e0c00b0087282d34162mr16023180eju.44.1678271259413;
        Wed, 08 Mar 2023 02:27:39 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id z15-20020a5096cf000000b004f0de6d52fcsm1676732eda.74.2023.03.08.02.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 02:27:39 -0800 (PST)
Message-ID: <559c2588-e586-b4fb-97f8-5fe25bb79607@linaro.org>
Date:   Wed, 8 Mar 2023 11:27:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 1/2] dt-bindings: hwmon: ina2xx: add supply property
Content-Language: en-US
To:     Svyatoslav Ryhel <clamor95@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230308094024.14115-1-clamor95@gmail.com>
 <20230308094024.14115-2-clamor95@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308094024.14115-2-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 08/03/2023 10:40, Svyatoslav Ryhel wrote:
> Add supply property.

You have entire commit msg to explain and give background, but instead
there is just sentence duplicating subject. And since you did not
explain anything, we have questions... like: INA238 does not have VDD,
so this does not look correct.


Best regards,
Krzysztof

