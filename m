Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2825DC4321E
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Nov 2022 14:18:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234009AbiK2OSI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Nov 2022 09:18:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235250AbiK2OR3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Nov 2022 09:17:29 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B2B069300
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 06:15:35 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id l8so17289419ljh.13
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 06:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BRpdkJK2Wo92ON846N6eHVIM5x8Sd+GDvvbGsGBzl0k=;
        b=I+R/M8dE9pmPamxZ3RSuWcocOq1rviSIGC0ap0QPJgzV1OFULdizRcDBcRmhvJ3niN
         UBLin+dkqj5rdvepvMyFLA7YMrqpuTk0W07CFV4CEBZJdEt7RAkSdIJddwMLHap9qo5a
         UV1W3K+GE2LD68UDPxWMo/GWAPsiZfcnL8/QY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BRpdkJK2Wo92ON846N6eHVIM5x8Sd+GDvvbGsGBzl0k=;
        b=n43bL1UVq3aFMoAKHjWyy60vqhagos8R62VmTbmeJtQ+sf4xAhy06dssDjvzku+rua
         J93Z2PRqktG4Z5ER8+m3f3kVftTlcdLbKYR5nXuOn+X+/qIRUBbko4lYqi35/7dpW6M7
         6+VXBz6DxK5/UBo8n6FrFWgnukxAMLYZAVIud/r6VuU4k41OBkf4t5n38zH0vPvU50W/
         bXybJfRV1xG0AvvSXfHFcxwDOrPy7Esi5pF/jh5zdKbC0wJUPIDNOcgMCd4UH41CcXGb
         L46N/nBLNybguknavaqiHmSIvfT42zaoKs333dMichqLGPcNtVMuzqG6raPeCk1WMlAI
         47SQ==
X-Gm-Message-State: ANoB5pnUw4dJeTCTV7oP/byTFz9l8HckX1kCYWA3Qum5uSTBVpeLrJW6
        QUAMzCkMy/ohlZZ/KITjhrwXYA==
X-Google-Smtp-Source: AA0mqf66BjvHqAMZwEdJBt0dFTt5/SHy1+6HQvcJmTOWZBR9LFU3R1/MSDg9xbs8lvTCdJbqEGsmrQ==
X-Received: by 2002:a2e:be8b:0:b0:278:ea67:a38c with SMTP id a11-20020a2ebe8b000000b00278ea67a38cmr11889405ljr.63.1669731333470;
        Tue, 29 Nov 2022 06:15:33 -0800 (PST)
Received: from [172.21.3.193] ([87.54.42.112])
        by smtp.gmail.com with ESMTPSA id b16-20020a056512071000b004a8b9c68735sm2071805lfs.102.2022.11.29.06.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 06:15:33 -0800 (PST)
Message-ID: <05782b6b-4e09-2b13-32c4-4984753dcef0@rasmusvillemoes.dk>
Date:   Tue, 29 Nov 2022 15:15:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 5/5] rtc: isl12022: sort header inclusion
 alphabetically
Content-Language: en-US, da
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
References: <20221126141806.62205-1-andriy.shevchenko@linux.intel.com>
 <20221126141806.62205-5-andriy.shevchenko@linux.intel.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <20221126141806.62205-5-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 26/11/2022 15.18, Andy Shevchenko wrote:
> Sort header inclusion alphabetically for better maintenance.

Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

