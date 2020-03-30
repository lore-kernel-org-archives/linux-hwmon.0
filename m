Return-Path: <SRS0=Jj3a=5P=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD7CC2D0F1
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Mar 2020 18:48:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF5DB2082F
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Mar 2020 18:48:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IelanpLu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727905AbgC3SsU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 30 Mar 2020 14:48:20 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44000 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgC3SsS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 30 Mar 2020 14:48:18 -0400
Received: by mail-pf1-f195.google.com with SMTP id f206so9017463pfa.10
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2020 11:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A/5cntKj1Rboep0ErkxJsbgUnugu9yuS7FLop8xwtCk=;
        b=IelanpLuCnZmnRe4IM3SN00rqXJcLN3mB/J4FHrHy/TZ7SKBM7vBOaYHrKit7WEpjw
         Eki+wb+zC5QMCebrghTZEEmxtI34pKZdIqBy9D7LbIR8K7+dg6IMZeb6F1rBPymE3zmN
         CvYqFtzki4SnFWcOc2SGE+ul8pA4tweVrO160354CBTc5SnKFCtvNQIJyM94iDemDicX
         kAFR2ETi2FCImESrDT53hM2BlkWky15Z8LKvBlRO/YsVrtL26lurj8CkHqE1AdptqB+a
         R7XxAe0zqSWFdvGKvJ0J0LRHra+TH6XLzD/DzS234CPGCEwKf7SDTZR8CBiICRhAVUau
         VNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=A/5cntKj1Rboep0ErkxJsbgUnugu9yuS7FLop8xwtCk=;
        b=ohYTosu2Jvm00G1zb7DlGLC62fQ8URytK8tOsbzjIEdg0da25B6FSbOFHzG1bDWN6O
         TqqZV0Z6nnl0xq14rG6cgSY8TfAbixj0anut09vzD8L1k/q6s0dQ3bIWEWb4cqu+bVNg
         KlGd4TxxRYtcXGhS8O/EQfF+ZYqbL3qGDjhae5Z+Wh6v3i5tGNhT3azR/kyfHEDj3zhh
         MOcfp+GQyPWH5u+Nnz2fnY8BnQf3efYP7Qf/sHz9Ixi8oh9oD2PcmVvyiMs5apnGIsNf
         dK0q1/efuC4fhn2ez0Xf+5A7vqunMXhM+Fj6ucwCjjJPbWJOaOZMvQ8ECbBslBjexFTm
         nOqg==
X-Gm-Message-State: ANhLgQ1z8X6RW9aUr39VGEjGDC+k83MWrPm5Y6UZ4U3IWQ8bQFfgy7SA
        H1VDdJKYkT7wl2/2VzNf00BOsr9N
X-Google-Smtp-Source: ADFU+vszedluTj80RaKNLI5miVmMBmoXsYGao5SAoFEOHYhMM/xJQ5/V63A9rJE5zg/IahCQoV7QJw==
X-Received: by 2002:a63:ff4e:: with SMTP id s14mr14214611pgk.269.1585594096792;
        Mon, 30 Mar 2020 11:48:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r70sm10787393pfr.116.2020.03.30.11.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2020 11:48:15 -0700 (PDT)
Subject: Re: Linux driver for IRPS5401 - status reg not found
To:     Robert Hancock <hancock@sedsystems.ca>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-hwmon@vger.kernel.org
References: <e303166b-4d7a-d2b9-a5c0-fd4de8d22a49@xilinx.com>
 <44d8631a-618c-a061-d9ca-d8030dd8a420@roeck-us.net>
 <52d41b38-8af9-1496-65dc-c36179a9d286@sedsystems.ca>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <299872b6-0fcf-3ef1-5b52-41fceb2dcdc0@roeck-us.net>
Date:   Mon, 30 Mar 2020 11:48:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <52d41b38-8af9-1496-65dc-c36179a9d286@sedsystems.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/30/20 8:42 AM, Robert Hancock wrote:
> On 2020-03-30 9:24 a.m., Guenter Roeck wrote:
>> On 3/30/20 4:33 AM, Michal Simek wrote:
>>> Hi Robert and Guenter,
>>>
>>> Xilinx boards are using IRPS5401 chips and I have tried to use your driver.
>>> I have checked that u-boot can detect that devices and read it.
>>>
>>> ZynqMP> i2c probe
>>> Valid chip addresses: 0C 13 14 20 43 44 74
>>> ZynqMP> i2c md 13 0 10
>>> 0000: 00 08 00 08 00 08 00 08 00 08 00 08 00 08 00 08    ................
>>> ZynqMP> i2c md 14 0 10
>>> 0000: 00 08 00 08 00 08 00 08 00 08 00 08 00 08 00 08    ................
>>> ZynqMP> i2c md 43 0 10
>>> 0000: 00 98 ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
>>> ZynqMP> i2c md 44 0 10
>>> 0000: 00 8a ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
>>> ZynqMP>
>>>
>>> Here is DT fragment which I use (it is under i2c mux)
>>>
>>> 185                         irps5401_43: irps5401@43 {
>>> 186                                 compatible = "infineon,irps5401";
>>> 187                                 reg = <0x43>; /* pmbus / i2c 0x13 */
>>
>> Does that mean the mux is at 0x13 ?
> 
> These chips have two I2C addresses with two separate interfaces: the standard PMBus-compatible interface at an address between 0x40-0x4f, which the irps5401 driver supports, and another proprietary interface at an address between 0x10-0x1f. The specific addresses in those ranges is configured by the value of a resistor on one of the pins.
> 

Ah, sorry, I didn't get that part earlier. Unfortunately, the datasheet
doesn't seem to include a description of the proprietary interface
registers/commands, or maybe I am missing it.

The chip datasheet does talk a lot about various MTP registers.
Part of that register set is Write_protect_section and
Read_protect_section. Maybe the PMBus registers are all read
protected ?

Guenter
