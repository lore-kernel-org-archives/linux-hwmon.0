Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5AF4C76196
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Apr 2023 06:11:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbjDKGLq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Apr 2023 02:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbjDKGLp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Apr 2023 02:11:45 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A66AE6A
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Apr 2023 23:11:44 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id ud9so17348718ejc.7
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Apr 2023 23:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681193503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x3LBh7GbM/KtRzgDN8v/wdUoPQ86yqjFptu4ZXT0gZs=;
        b=xtCVmdoqr9s8pnzDmuFK7DyHcHsh08104vZadRbOqMX8oX3G+pzPcYiTZuyGjb1q5s
         wWRzJ0nE9IneVXnbNhlhD+8b3NDSlMmoCkEB/RMGaY+mWjN/rhxSsmxpz4NkhFWezEgl
         huM3JumsyAMCaDQSAxbsZ49K6siE41tdh9M8o0OjjGCjVQcCZZgPij/usghwrF0pKl5R
         LIYnORLV+epQf2Wo4BLgUBEJcPMBNTRq2fsVmS4mCSYIpGuDQTMm3cdBhIIcHt/FbsrC
         nDVIYjNqqfIcBirH1R9Xda1OlvRdcrGKsQyxbVjqVjTGI4lDedavmPKdHXpLW8k5k9t5
         sV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681193503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x3LBh7GbM/KtRzgDN8v/wdUoPQ86yqjFptu4ZXT0gZs=;
        b=bxxDFly4ex66BDymMMp9cnKeuzzycZu7AWbAvtjD9eUw1igBBBsRzkFXsgeWyS2XHr
         deM2v0aecpiaRNc7sM7syZcghnad8TlHLpNh6N0S1VI61KIf7IoiN04ZNRZ++rhzHTuC
         iWjbPYSa//KR/m5i3zJGvTe9aljytMFjf7dw/2OS4rWUNlP3tQ+pu10oO7VPcJQbABAk
         ABs6ZU/Uboy9W9YneDrJ/WzOaSPCTGCLfcPEXE9+TEAY/I04GH/Aa6yDjqCYIFhmpasG
         aKj3Hyu+7M1pPQ8TN0OWMXn9VQmeKi8OpLcAbG77enrHh8M2HAHTnrHLrCH0voXMT5J6
         6eoA==
X-Gm-Message-State: AAQBX9dVmG/h9ixWlHP2yE3rsbJuQvalcr3GXnKLZmVwrDbaWSNM+jI7
        mdw+wkZfR/8IdpODHQDXqBKiaA==
X-Google-Smtp-Source: AKy350YPqsV7qZusK/N83+7CscOxJxYzUdjA094vdcz/SfTlGJzvPuDCuFvWzhqNNMebKqux7Wb3Nw==
X-Received: by 2002:a17:906:f2c2:b0:93e:fa12:aa1a with SMTP id gz2-20020a170906f2c200b0093efa12aa1amr1297116ejb.1.1681193502786;
        Mon, 10 Apr 2023 23:11:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:dad2:72b7:3626:af61? ([2a02:810d:15c0:828:dad2:72b7:3626:af61])
        by smtp.gmail.com with ESMTPSA id hr15-20020a1709073f8f00b009477ba90a85sm5719974ejc.69.2023.04.10.23.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 23:11:42 -0700 (PDT)
Message-ID: <0d4d27e6-02e0-09e3-8e99-18b40880961c@linaro.org>
Date:   Tue, 11 Apr 2023 08:11:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] nvme: host: hwmon: constify pointers to
 hwmon_channel_info
Content-Language: en-US
To:     Christoph Hellwig <hch@lst.de>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Sagi Grimberg <sagi@grimberg.me>,
        linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20230407145845.79557-1-krzysztof.kozlowski@linaro.org>
 <20230411060900.GD18527@lst.de> <20230411061012.GA18624@lst.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230411061012.GA18624@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/04/2023 08:10, Christoph Hellwig wrote:
> On Tue, Apr 11, 2023 at 08:09:00AM +0200, Christoph Hellwig wrote:
>> Thanks,
>>
>> applied to nvme-6.4 with a trivial whitespace fix.
> 
> Actually, I've dropped this again as it causes this warning:
> 
> drivers/nvme/host/hwmon.c:221:19: warning: initialization discards ‘const’
> qualifier from pointer target type [-Wdiscarded-qualifiers]
> 
> This looks like we might need a core hwmon change first.

The dependency was described in the patch. Guenter also provided
a stable branch with the dependency:

git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-const

Best regards,
Krzysztof

