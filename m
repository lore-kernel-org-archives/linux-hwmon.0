Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A620C4167B
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Nov 2022 17:00:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236544AbiK2RAQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Nov 2022 12:00:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235807AbiK2Q74 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Nov 2022 11:59:56 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3DAC6D952
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 08:55:32 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id w129so14255970pfb.5
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 08:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RZHZ3xLER05lERGmVtojr5I/PMD3IeMahsWj4IK2BO4=;
        b=FLTqGfw883rvILtX1vl/qcfz1Uk0n8/VtcJ2aZ0sHZFcTaQtSJ7UE2CtgeDaKMfls4
         45iltsi9nBcj+Gh9BuC6PSJh7YBtViexq6xQLKPimOPClsBFkr1ORh2K7uQujzCI2rll
         MeDZIdgeDj9Z9FY73QnYgc7D3YcVfK90kszlBRAdwYla21DuHzGBezFPqAk05eO4xlt/
         +raaZN7pphXcggRvP9rGR2mZB2fhesGTObt5wFziFx955KsqVdWGtzWjsLOkA3dTSdS2
         iIFLIKm7aDmGTWaG2w/wrvgriSo48nNyZDod5ZzuX+fdc3blyx0JbPCKq85ZrcI+C5KK
         2btg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RZHZ3xLER05lERGmVtojr5I/PMD3IeMahsWj4IK2BO4=;
        b=DUECnvgHjTVUhOhOEzCsIzMlMSjNP3wGuJ28zWYrwYPmoHLUgEWrSdjio1aPTh1PZe
         fzo7SNy6P6uIz1U8EWpr6ueaGkc+AHfNVu8icg7EK+eharPji+MRFGCKFDfVVaR1WFUm
         nMAoiZDMssgoHA07DKnP2dCfvRT+lsUQaw+uEZQCcQU+8G/bOVmM4m83TQJkk16idaCI
         95PpEHBv9xW9cvMgCA1HJ7uRsUPcXLJ+VrdTvNla4PJcMd0x5dLmz61AumRx1Orj9KbZ
         YfI5T+5aD3xLJUkLcd6ebB+PsPsnbZohsefoq3Ll3EdytIG/1mi5g3LDaD6fnPihgCuk
         dPzw==
X-Gm-Message-State: ANoB5pmRyD+vr7d5pVxuiF2HiKP+uwxjf/LiIRYCTwMdjZxtE6sZOAWc
        hXv4h9CElzHv3Qok+BL3KpdSj/iTDqZoFjVQ
X-Google-Smtp-Source: AA0mqf4zbadJGZLXlVcQk6yMXvQO5BV+w3tjYzjLIuoy8pYCkzrKq7A/sFqwdEXyzNbFUYLr4fSDxw==
X-Received: by 2002:a62:e717:0:b0:572:df9e:d57d with SMTP id s23-20020a62e717000000b00572df9ed57dmr61064060pfh.10.1669740932564;
        Tue, 29 Nov 2022 08:55:32 -0800 (PST)
Received: from ?IPV6:2405:201:d02f:d899:2028:7962:400:43b6? ([2405:201:d02f:d899:2028:7962:400:43b6])
        by smtp.gmail.com with ESMTPSA id n7-20020a170902d2c700b0018997f6fc88sm2234583plc.34.2022.11.29.08.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 08:55:32 -0800 (PST)
Message-ID: <3faaa168-9802-9773-aa10-ee8ff0447d97@9elements.com>
Date:   Tue, 29 Nov 2022 22:25:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v8 4/4] hwmon: (max6639) Add pwm support
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-pwm@vger.kernel.org, kernel@pengutronix.de,
        Rob Herring <robh@kernel.org>
References: <20221129161134.2672474-1-Naresh.Solanki@9elements.com>
 <20221129161134.2672474-5-Naresh.Solanki@9elements.com>
 <20221129163427.dxnqfay6ur6mvivu@pengutronix.de>
 <d2d54a34-56dc-df83-5fde-ad0a9a73a9e0@roeck-us.net>
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <d2d54a34-56dc-df83-5fde-ad0a9a73a9e0@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi

On 29-11-2022 10:11 pm, Guenter Roeck wrote:
> On 11/29/22 08:34, Uwe Kleine-König wrote:
>> On Tue, Nov 29, 2022 at 05:11:34PM +0100, Naresh Solanki wrote:
>>> Add pwm support for max6639. Also configure pwm fan speed based on pwm
>>> provided in DT.
>>
>> Did you do anything to resolve the questions I had in reply to v5? If
>> yes, I must have missed it.
I did split the patch to separate dt changes & pwm specific changes.
>>
> 
> I don't see a response to my concerns either, especially regarding fan mode
> (dc vs. pwm) in the bindings. For that reason, I won't even look at the 
> series.

I intend to use max6639 driver but with DT support.
Did additional changes(like using PWM provider) based on feedback I 
received.

> 
> Guenter
> 
>> Note that maintainer time is scarce and with sending new versions of a
>> patch with no sign that you improved in the aspects that were critized
>> before, you're burning that scarce time and loosing the good will of the
>> responsible maintainers.
>>
>> Best regards
>> Uwe
>>
> 
Regards,
Naresh
