Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE514C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Apr 2022 21:07:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233724AbiD0VLI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Apr 2022 17:11:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237329AbiD0VLA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Apr 2022 17:11:00 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51E55257
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Apr 2022 14:07:14 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id t6-20020a056830224600b00605491a5cd7so1887794otd.13
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Apr 2022 14:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eivpmiI0Hkgkl9tmdloqYOisXVSDF55bffupxrD3eUY=;
        b=QyA5fD2iTrR7N4ZqjX8s8r76PGsI/1sjO1J0BWax8JZwOEL/yYAYAtRLLP6OihtgyN
         WS3WBE1G+jAHoWbJ/R8unFp1i+dxwJvZSvLxl+53Ss5xSddYinXZiy5y10YLzgXQ+1Az
         M9Cry6MBOe+ayrccQ11myVbnPHcSQvPliO+nPCLI8p9dRBsIRAZPznNbLx9CFheFYsJr
         ZaZBDbxl5PCU4Z4RpmM4KHIGA84eKSV2akOJnLTrsqYuZtnxj/RovZwW8gt6B1Hmkoaq
         ER9eJRdBAUW/adyBz0pWszdgBOY6z9GJP/UcO+70jnya6Dhr5wN03TeblPLDKXXfG917
         joMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eivpmiI0Hkgkl9tmdloqYOisXVSDF55bffupxrD3eUY=;
        b=gffOgD2/qTJFwWDmOIXT34WSXsyhjxa04+s+xQATmeTKd3IVLK+pW2i0wmSuon4wN8
         g1JdQT1KgUSjah9BU+8zYqQo2gYh9pjRDW87MKPSy5uquWGFj9qL+EyTpd4w3Sz4zEw1
         GY+r5Io6zcQptR/JL+r9n0qC7ljVqOEIIyetWOYFO5mcXKN/NSS3EtFdV35HDEZPdomI
         17rSf06sHPoa4AwQdEcCJzzC7qMeWalWQMhToBbLymcSYfjPsWguehP1r5nA8ftC+pv4
         n7oUl2CgKj7uKcskK73jS8bWhbEJ0ufOyzazvWohW2eR7RX2KOMcq5Mq3pQTjWBqfXMf
         bjNg==
X-Gm-Message-State: AOAM533wEX5lieUhbTzgInx/rSv3g/12lvFlSztBuiGSazAwBRMwFADr
        +N3Tb9GjRZtOZ2LFZdthCe16i6X7Xes=
X-Google-Smtp-Source: ABdhPJzJwqq+XrqIhFnaOQjnOPKxE6IsCozKRExhs9fI0bHvTLx3Nkxh3LxgTs1KdBpCc3mWfdcDBw==
X-Received: by 2002:a9d:7447:0:b0:605:465c:115e with SMTP id p7-20020a9d7447000000b00605465c115emr10783513otk.345.1651093633607;
        Wed, 27 Apr 2022 14:07:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j17-20020a056808119100b00322e1b61907sm6325014oil.35.2022.04.27.14.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 14:07:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3fde4708-2775-6383-1652-12e072b4b9c4@roeck-us.net>
Date:   Wed, 27 Apr 2022 14:07:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ARM: Add hwmon driver for LRADC found on Allwinner
 A13/A20 SoCs
Content-Language: en-US
To:     =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
        Ruslan Zalata <rz@fabmicro.ru>
Cc:     linux-hwmon@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <202204272007.23RK74Ds021079@devbox.fabmicro.ru>
 <6425291.4vTCxPXJkl@jernej-laptop>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <6425291.4vTCxPXJkl@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/27/22 13:23, Jernej Škrabec wrote:
> Hi Ruslan!
> 
> Dne sreda, 27. april 2022 ob 21:25:12 CEST je Ruslan Zalata napisal(a):
>> Some Allwinner SoCs like A13, A20 or T2 are equipped with two-channel
>> low rate (6 bit) ADC that is often used for extra keys. There's a driver
>> for that already implementing standard input device, but it has these
>> limitations: 1) it cannot be used for general ADC data equisition, and
>> 2) it uses only one LRADC channel of two available.
>>
>> This driver provides basic hwmon interface to both channels of LRADC on
>> such Allwinner SoCs.
>>
>> Signed-off-by: Ruslan Zalata <rz@fabmicro.ru>
> 
> Before even going to check actual driver, please read https://www.kernel.org/
> doc/html/latest/process/submitting-patches.html in detail.
> 
> Just few basic things to fix first:
> 1. subject doesn't conform to rules
> 2. send patch to maintainers and mailing lists (use scripts/get_maintainer.pl)

I only got the copy sent directly to me. Anyway, how is this different to
the driver in drivers/iio/adc/sun4i-gpadc-iio.c ?

Guenter
