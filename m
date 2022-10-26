Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25372C433FE
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 Oct 2022 07:08:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233243AbiJZHIO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 Oct 2022 03:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233073AbiJZHIM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Oct 2022 03:08:12 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AE0DA50E6
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Oct 2022 00:08:11 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id h2so7840710pgp.4
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Oct 2022 00:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+qUlIwZeb2OzRCIxvB0RXwAn3a0hotQnA55yAaKYVwQ=;
        b=K99xW6wkB1mD+TijD5Gh3u4HklETbLnyToQwYYGHiCr+/OtIPpuxgnfaD3mDPIaAFq
         IYPUXBOn2xy+P0FPlEavAa34rQdtikRSZzJtye7/b9X7Pp9R+aH0N0na2mUKbUYEu23x
         TOqBOfNbBdF56TEAS/dXWJbwk6uT82LNJeaeAsU6MCUKKwr8ZOy2rXtLY/CqivsPkYYU
         EQ9AGUerLPKD+lLydQIf1PQw6LzeONWFAtd9aM0MO4J9nLFG8lZsS9Eq1azqFbYY+z2z
         qvrKf8UxsuXdoRHG4Nx+7XqxbyQIH4FGADgnNhx3WYrZAHs7f+H8rOYH42yhWaqdZIUT
         xwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+qUlIwZeb2OzRCIxvB0RXwAn3a0hotQnA55yAaKYVwQ=;
        b=58drwrXswB4a6AuWNRaRWAG54gn9RMXmcKBScZn1nwWrSbA0Vg1S0LchW9U7nHfooJ
         vggxnMOgUWqSEfPHWxa093XIJawx21KY6U7Nc63PSCpRcXDnJZSw0NxCOVDsAZWNwjhJ
         9TP9Af6KV0NICZWqyh0e5cLjq9r78gWH1+j93U0OPqqKvjaKZFRar5nW0clOndDIRPzo
         deZdOX6j5cJw6t1O0jjVFeZsrNbVmU9NCaUQEYeub5rPPXNfe4nzHpelb0VN3cy1bKnu
         VV+TUSTZX2iLhoTMokzyI3ho3qAd9sXrzTg+wgLUSBEYgRCIAEOsnV+lRkqYCwd/wtG7
         7Vjw==
X-Gm-Message-State: ACrzQf0KXjuHy3JnLPQBvqRY8TzChoh1IfwHS11KxYMVCEP7pcK26cxm
        S/gO5uM8lPG9uFg0KICC2sDHqg==
X-Google-Smtp-Source: AMsMyM6aVto8lYOTPaPCvCgWV9fgdB/2yGnk7ODLMaLkPX3e/fr7VWYGMr+1XuxqZ1qYNeDk7fxSqA==
X-Received: by 2002:a05:6a00:24d2:b0:567:3c7d:d888 with SMTP id d18-20020a056a0024d200b005673c7dd888mr42180988pfv.33.1666768090907;
        Wed, 26 Oct 2022 00:08:10 -0700 (PDT)
Received: from ?IPV6:2405:201:d02f:da6a:d4a2:1253:adfc:370? ([2405:201:d02f:da6a:d4a2:1253:adfc:370])
        by smtp.gmail.com with ESMTPSA id g25-20020aa796b9000000b0056bf24f0837sm2400289pfk.166.2022.10.26.00.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 00:08:10 -0700 (PDT)
Message-ID: <e6d6a81f-9292-a95a-ca71-642f3d1b2628@9elements.com>
Date:   Wed, 26 Oct 2022 12:38:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v4 0/3] Add devicetree support for max6639
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>
References: <20221013094838.1529153-1-Naresh.Solanki@9elements.com>
 <CABqG17gYexJkzLou1HVP7n4CGyXq70oq68E+nCOwvf=OMFhqTA@mail.gmail.com>
 <20221025180130.GA1229379@roeck-us.net>
Content-Language: en-US
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <20221025180130.GA1229379@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

On 25-10-2022 11:31 pm, Guenter Roeck wrote:
> You did not address many of my comments.
I've update comment to explain defaults. Thus retaining previous behaviour.
This patch series is about incremental change just to make it DT compatible.

Thanks,
Naresh
