Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C34C43219
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Nov 2022 08:56:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbiKXI4u (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Nov 2022 03:56:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbiKXI4g (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Nov 2022 03:56:36 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5199BA30
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Nov 2022 00:56:35 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id w4so938566plp.1
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Nov 2022 00:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y+JlTCURFbhvaQe3VOudsfUIZNYcfNLZEHpC87BXVEE=;
        b=RVuYHCbfloxktxLMqw8zNS/LMduzjvrHQ9tEgE8Hg5Y9kP1l2ycAHmS9TSrEY01ZLt
         aPztU0lmLF5/dgbK/S9yFb4VAEPRz3N/Zp+EdR8uyC0HLbqOqTeQx4JVwfKRbn5fps8P
         JtrBYa7hIXjztPMZIlw5Oj7j0XphO0gsNSczbwzZ+zAL0ESf4gzrUXcmuJTv8FMq6bHU
         /qnqswrZ2RVO1K3jiP2pEngdCF1wJY22WDcObU699AAKoqqNlp9jHetfpsmLnym0YfDb
         1Xv5lD3lwUua3GRWAzvMtf1GBDDwDZkAIOzCJTYL5QXT9PxqtNAFmI7jjJxkbc1ozQnX
         rhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+JlTCURFbhvaQe3VOudsfUIZNYcfNLZEHpC87BXVEE=;
        b=nv4dXSOG5SfuFf6CRIIiCNY/dH9hj9YRsHC+lY7qcfXkeUdfGpLxxYaYI5yaWy5U8U
         aRBZZGFKaErkFFAuJEpeILjwv4NOdNAhZ2yMLy/F/UyGkxjBLGPrcTbjq/6THvddw04s
         Y31Y0ZMRbupv+HWnKKSaXFeJph8fNwtYVcWZG6kdWmvXKQ3Va/pF7nKcEdOZ/w4Bn7IC
         b0b9hr1yi98eTTmM83m7rg7i5K0Wq69DfnxPsF9mwIaIBvGApkmYFo+B7/C4tU3h/tHJ
         3BsE2RKH1Y8z/LyDtF98vR8gMYktcy5t+c7qm2whT5YTU0iKZsMTmyR2wPyYefwOddj9
         Rkxw==
X-Gm-Message-State: ANoB5pk3SXvKxwdKg0oRkHbxLxjqVMTHBoyXDg8PkeYYqIYCqSVCBxi4
        oVbistvFBIgIVrzI1EPMXRB+5g==
X-Google-Smtp-Source: AA0mqf4wDtKU6FE10Kh5h9uR3I85P0FI6tiarpFlWpI7Zh6Qf7/ihXAMpOcaD24k80GlHGKrbWnSTw==
X-Received: by 2002:a17:90a:d38a:b0:218:a7e6:60df with SMTP id q10-20020a17090ad38a00b00218a7e660dfmr21150431pju.38.1669280194819;
        Thu, 24 Nov 2022 00:56:34 -0800 (PST)
Received: from ?IPV6:2405:201:d02f:d899:2028:7962:400:43b6? ([2405:201:d02f:d899:2028:7962:400:43b6])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902f7cc00b0018958a913a2sm657661plw.223.2022.11.24.00.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 00:56:34 -0800 (PST)
Message-ID: <df8201b0-414e-4daf-0dae-bd3ce790304c@9elements.com>
Date:   Thu, 24 Nov 2022 14:26:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/3] hwmon: (pmbus/core): Implement IRQ support
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Cc:     broonie@kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-kernel@vger.kernel.org
References: <20221122135014.3504094-1-Naresh.Solanki@9elements.com>
 <20221122135014.3504094-3-Naresh.Solanki@9elements.com>
 <1724dbac-024a-2758-a030-c07352b536fc@roeck-us.net>
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <1724dbac-024a-2758-a030-c07352b536fc@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

On 22-11-2022 10:32 pm, Guenter Roeck wrote:
> On 11/22/22 05:50, Naresh Solanki wrote:
>> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>>
>> Implement IRQ support to monitor PMBUS regulator events.
>>
>> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> 
> Adding a PMBus interrupt handler should be generic and also handle hwmon
> specific events. It should report any status changes as sysfs attribute
> notifications.
This handler scope is to address regulator faults.

> 
> Guenter
> 

Regards,
Naresh
