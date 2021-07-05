Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F975C07E99
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Jul 2021 14:47:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B4B061879
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Jul 2021 14:47:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbhGEOtz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 5 Jul 2021 10:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbhGEOtz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Jul 2021 10:49:55 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54985C061574
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Jul 2021 07:47:17 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id m3so2046801oig.10
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Jul 2021 07:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/bG8jvQ0E0TKfaEh1K0DfN8mXq5cCkTNBIlXJe0rIAg=;
        b=UtSBksVbnlN5W/6uVBjtLINrj1NLFeyxW8ZYkHy6EkhJYqcLvuHyRYx6XlX7KuTnYf
         BcVziZ5bzF7EyxcRdlK06Bs75aLVhd0TJG2eU8UMwR91o2uW2mVlfHA3I2sWkYWEDC3A
         JnR35Di591uYUl9BYHCuA3KDJtEVeYbQr1L+MXn08YiGRvIjGQkg/RFnOjuOb2Y0HJFl
         zlEdY1W8FmR5yuNMcXrnMAURzi33zpZvKVU3Qq7EgOoNcsDTVMxGRBfH9H8XqbpAS290
         oR6wI4n0IW3f7nQJBgKRVlNcaS4RrvsvlZW2r+0nNVMqQqp7J0aAP9mxj6k7vBck+uRe
         ZmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/bG8jvQ0E0TKfaEh1K0DfN8mXq5cCkTNBIlXJe0rIAg=;
        b=lTFWbLZCEzN2NgsGMLNre3/REeu9KdAvPUl3pAl2xb69k8qGwmsc/HrpuQvHSjViB0
         4WBLzA8nE5zgT5Trq26S2kcHod7Sg3iBTFb9V4IqG/lPSe8Riqd741LznZt1dRI33Yf6
         KkGoiu4mAkX6vL2u6+NKvxpdmOhZpPsNDJEiTQHx9lUhUeafHP5pMDRZmrQgMNAhdfld
         l6Xir1eHG6K/SGOgU9taFgZwQKq7vjhTv3CbKvn9YWr+E5vCRbzTtxQoJS2FcpnmmXfz
         lA1pZVIfxgD04VnrFp5lDPXjAKmWebx4vZXc76xHPf5QcHRmpoKgYxA4csrMPRx6Dv9c
         N+Og==
X-Gm-Message-State: AOAM531zYj3SZsH029ZyeWxijTEHKPtUpsp0oLNf3podL7n5EjMQCUnU
        U6CwZ2hoI278AWZaX652plCjnKAxyus=
X-Google-Smtp-Source: ABdhPJz2S784RZkMc3yc6vCnaL/NWGNasPvaYZkLHdL1xMU/VUWluLny2LiLzwZEZhzi2qGFjCoTYQ==
X-Received: by 2002:aca:2212:: with SMTP id b18mr9958619oic.52.1625496436524;
        Mon, 05 Jul 2021 07:47:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c4sm2681016ots.15.2021.07.05.07.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jul 2021 07:47:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Henk <henk.vergonet@gmail.com>, linux-hwmon@vger.kernel.org
References: <CAMFK4TN9jcvwkdBdX1E4zH2NzS0LbCFqGW+MUzCKXor=4UwoBw@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: HWMON: (nct6775) Correct number of inputs on NCT6796D
Message-ID: <f3106f6d-1fa0-129f-28a2-9a85b5f9c453@roeck-us.net>
Date:   Mon, 5 Jul 2021 07:47:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMFK4TN9jcvwkdBdX1E4zH2NzS0LbCFqGW+MUzCKXor=4UwoBw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/5/21 5:30 AM, Henk wrote:
> Noticed in the documentation that the NCT6796D actually has 16 analog voltage inputs, where only 15 are configured.
> 
> See: https://www.nuvoton.com/resource-files/NCT6796D_Datasheet_V0_6.pdf <https://www.nuvoton.com/resource-files/NCT6796D_Datasheet_V0_6.pdf> page 59-60:
> 
> 8.6.2.1. Voltage Reading
> NCT6796D has 16 voltage reading:
> .....
> and the missing one in the driver:
> VIN9: Voltage reading Bank 4, Index 8F
> 
> This patch adds support for in15 on the NCT6796D.
> 
> Signed-off-by: Henk Vergonet <henk.vergonet@gmail.com <mailto:henk.vergonet@gmail.com>>
> 
Please read and follow Documentation/process/submitting-patches.rst
when submitting patches.

As for the patch itself, it doesn't define the limit register addresses
in NCT6775_REG_IN_MAX[] and NCT6775_REG_IN_MIN[], and it doesn't define
the register address itself in NCT6779_REG_IN[]. That means it won't work.

Guenter
