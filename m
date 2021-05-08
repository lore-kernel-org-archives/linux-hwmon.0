Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECFDC433ED
	for <linux-hwmon@archiver.kernel.org>; Sat,  8 May 2021 15:48:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D775661152
	for <linux-hwmon@archiver.kernel.org>; Sat,  8 May 2021 15:48:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbhEHPtq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 8 May 2021 11:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhEHPtq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 8 May 2021 11:49:46 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE51C061574
        for <linux-hwmon@vger.kernel.org>; Sat,  8 May 2021 08:48:44 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id g15-20020a9d128f0000b02902a7d7a7bb6eso10562418otg.9
        for <linux-hwmon@vger.kernel.org>; Sat, 08 May 2021 08:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eUylR8lC23VCN5fMG1CQsku42Pc33B0hKosEoqbjQxY=;
        b=YJMYgWvZ7tQJP4cAC8s77ccEuqXWKGEIplchxv1NFEkOOFww6N/VY4M1b6RluD4wvD
         bBlrz79rCNN5VZafHhp3dl2DBhUGFdX66t1KW7Ad+sEF4LeadhyMf67Xeb7a1ecyTIFm
         FIgPFVFB33iTgTgz03VAB5/7ZR7fWkoON0+1zoIV6hn0sNjUp90e6MAPIzfnFh9OYDJ4
         SeAO/twGRVoVvTutp7pWiLDY6fhtpy+B0s0zsdpOCW1itwhuJbUJwOBreqKTZCFMRdhi
         gXO4GWiuwgQHzVJd8fWjgKBoe7d1K9ijwzeDcdxhb98oYUH2V3yMcj0i8ZJhUZliwp/4
         GhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eUylR8lC23VCN5fMG1CQsku42Pc33B0hKosEoqbjQxY=;
        b=IYP6OOWL8E+NqGA/htKTcD9QfE38gTvCW5VT3vkop5fF154NIXhM0dNCCeAJtXlLON
         3eLwJZvmbf5e/rc0qZibwVAvXgffTKBBiIFkT2m7/1mBJBCSkjNyWkqXMxrmHxv6/Arp
         pr20jcefa6Q6uAsGDZRBwwt2e0Y+c/NQwbi4xXfJmgjW6UJh2EeA4aP4np6KOXAnMp5P
         2z5dUPUw1Zp/CrIGTkUeqpO2YkwQPk2Lb0jLQPF9nBYwIFyZPQ+1qdQUFAFkY9Xd2hbH
         Lz4kQRiOa1otbkj2ja4B7qOBiZjWw7tPPFgTYmLZ0WDLNUVJEQag3zBhlnJvTyyfsmx6
         wOiA==
X-Gm-Message-State: AOAM530unBWekBP25ddwTu/LIIQv+UDCW52b4DWcqK411H1sEC5RmlT2
        80t/zKfthU0Da7derwjnE81QMUTUPpw=
X-Google-Smtp-Source: ABdhPJzMfcgupA6i8QQ6NfakgBAVPIUceWO19P4Pkh0j9I6MEci+Eqh16BG2isxUBgWxUa5Wi/RTqQ==
X-Received: by 2002:a9d:4c83:: with SMTP id m3mr13482940otf.26.1620488923529;
        Sat, 08 May 2021 08:48:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a14sm1885828otl.52.2021.05.08.08.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 May 2021 08:48:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] hwmon: (max31722) Add support for MAX31722/MAX31723
 temperature sensors
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tiberiu Breana <andrei-tiberiu.breana@nxp.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20210508153104.GA3116801@roeck-us.net>
Message-ID: <989935f4-0d12-e4ab-210e-c51150b8b10c@roeck-us.net>
Date:   Sat, 8 May 2021 08:48:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210508153104.GA3116801@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Re-sent with updated To: address.

On 5/8/21 8:31 AM, Guenter Roeck wrote:
> Hi,
> 
> On Wed, Mar 30, 2016 at 07:16:24PM +0300, Tiberiu Breana wrote:
>> Add basic support for the Maxim Integrated MAX31722/MAX31723 SPI
>> temperature sensors / thermostats.
>>
>> Includes:
>>      - ACPI support;
> 
>> +	{"MAX31722", 0},
>> +	{"MAX31723", 0},
> 
> Those ACPI IDs are invalid. Are they used anywhere ?  If so,
> can you provide references ?
> 

Thanks,
Guenter
