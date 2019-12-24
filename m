Return-Path: <SRS0=lH8M=2O=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FC4C2D0CF
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Dec 2019 05:28:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A5082071E
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Dec 2019 05:28:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMQGi95P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbfLXF2j (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Dec 2019 00:28:39 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:33385 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbfLXF2i (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Dec 2019 00:28:38 -0500
Received: by mail-pj1-f65.google.com with SMTP id u63so574140pjb.0
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Dec 2019 21:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IOUWLqsxSyj4HZmMwsLRBTlp6WYH8zpgVO728XTzOcA=;
        b=CMQGi95P69ajpw3Ia+jvdAHsFPX6bPLswU+ejRepyWx0eNq4r+tubHzvIgUaIr5yo7
         7Vs6ypdgUZUjzpjBjOIyWsd9Kl450vnhDUF+HFwIHvRUFIEXTKn+t3r9QKZmkRxKFRQK
         NXO2QkL36CKAlVuJHWJZryqd6/mVrieTUCfSufX/leu7X684y+K1uTu2igTDVKokcyKX
         7/E82WSCtLMVVk+GfCtFP3HKvSoNbIM0WWTMTpSJMlgqABngsVgFyPqDB1n7uskf5wl0
         0yHkEMWUPqVGYdr0+Aydhuik6+64FpFdVPrPlDQz3WTTuItoXvxIwclbT4ywnXvBIB+I
         2r9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IOUWLqsxSyj4HZmMwsLRBTlp6WYH8zpgVO728XTzOcA=;
        b=CirjzXCzZfAtgytTpDMifmtRVnP6UnDW81+nuzRhwkFd+v7lHl0EtAPKHqqeya2hy2
         RZ9mGz8CuoBKud7WmdT3ZsaoiAc0Izh3r6aZ7oeWwPsq3jS2woy9rRf5nkL9zvE349r5
         6Qt527iO0YZWiWsTdyYMVyq/6B+tyYN2R26smLyNf3IRUZ/VipOFd7aEVQrzIuqswsND
         DKGbx297hIrTdYgoc/RBeVx6wkWTdODrG7lU+3yO4pKKmq5brRvV6a/HiBs6YqFUyVPg
         PfqX/091ncin/OS1aVK110gNC4rphoRDZrWk6807vn70aAC6e7TKnl+TGN3vHnWmqzdL
         PFUA==
X-Gm-Message-State: APjAAAVLJIcBsvZ4KXqNS+nLLUgBpZnQ4vpyeYd+sw3uga/rMCOC9H7P
        OSWmdz/Cs2z8MkGCc/yd82Q=
X-Google-Smtp-Source: APXvYqzrQCJC9X/9W1g0oRdnbDXPUVL/U/6WI+Z0KAaTZRmN2dPO8L7bhrE4TPR8H4eW2dSGK2C+xQ==
X-Received: by 2002:a17:90a:660d:: with SMTP id l13mr3586292pjj.23.1577165318191;
        Mon, 23 Dec 2019 21:28:38 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h126sm971978pfe.19.2019.12.23.21.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2019 21:28:37 -0800 (PST)
Subject: Re: kernel 5.4.6 + Ryzen 3700X: "Can't display frequency and others
 of Ryzen7 3700X"
To:     pgnet.dev@gmail.com, linux-hwmon@vger.kernel.org
Cc:     marcel.p.bocu@gmail.com
References: <bb629ef6-a669-8849-17f4-481c8c9f9347@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <b2f72e65-4a80-0aaf-ce7e-0880fdcf60c7@roeck-us.net>
Date:   Mon, 23 Dec 2019 21:28:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <bb629ef6-a669-8849-17f4-481c8c9f9347@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/23/19 6:46 PM, PGNet Dev wrote:
> I'm running linux kernel 5.4.6-24.ge5f8301-default on an AMD Ryzen 3700X cpu.
> 
> I'm seeing very limited lm_sensors output.
> 
> I've posted my recent detail to an existing, but closed (?), lm_sensors issue,
> 
> 	Can't display frequency and others of Ryzen7 3700X. #187
> 	https://github.com/lm-sensors/lm-sensors/issues/187#issuecomment-568630737
> 

The "sensors" command, or libsensors, or hardware monitoring in the Linux kernel
in general, does not support, did never support, and will never support displaying
CPU frequencies.

Displaying fan speeds, supply voltages, and system temperatures other than
the CPU temperature has nothing to do with the CPU installed in a system.
It depends on support for the Super IO chip used on the motherboard, which
may or may not be supported by the Linux kernel. If it is not supported,
it is quite likely that the motherboard vendor does not support Linux and
refuses to make the necessary information available for Linux kernel developers.

In the specific issue referenced above, it appears that a Nuvoton NCT6796D
was detected but not instantiated. Most likely the problem is that the IO address
range necessary to access the chip is reserved by the BIOS. Looking into the
kernel log would reveal that information. Again, that has nothing to do with
support for the CPU installed on the board, but with the board vendor and,
to a substantial degree, the lack of support for Linux by that board vendor.

> I note some recent work in kernel logs,
> 
> 	https://cdn.kernel.org/pub/linux/kernel/v5.x/ChangeLog-5.4
> 
> particularly by Marcel Bocu.
> 
> b4 (re)opening any new tickets, etc, checking-in here first.
> 
> *IS* the kernel support for Zen2 Ryzen 3700X incomplete, as yet?
> 
> And, *should* sensors output for Zen arch be full/complete?
> 

If you think something is missing that should be displayed by k10temp,
if you have documentation from AMD describing the necessary registers to
obtain this information, and if you have permission from AMD to publish
it, please feel free to submit a patch adding it to the k10temp driver.
Please make sure that the additional information follows the hardware
monitoring ABI (specifically, CPU frequencies are not part of that ABI).

Thanks,
Guenter
