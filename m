Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5501C433ED
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 May 2021 17:03:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F29160FDB
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 May 2021 17:03:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbhEKRES (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 May 2021 13:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbhEKRES (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 May 2021 13:04:18 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E98C06174A;
        Tue, 11 May 2021 10:03:11 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id v24so558118oiv.3;
        Tue, 11 May 2021 10:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SenRFtg3kcFbs9vUTSmXrCXzTJuUoNr/azEqion6f2I=;
        b=ms09Mwt8atK8e8z4XkXwnkx/g/8OA3s4WXTvgC8GOPh8A68iFoqao0PcCZaQvrCWsE
         Y+hny1Mkf6oYe87L6FSD+3p7wd7wual20ENgIsKkh6aJqUQAkN7pCvs7buQMKtIZN4G8
         uU0GjjdXnZL3pumcB0+oBHZg+g2O1AX2kJBiUYazyoSpa44uXeuwqfJkfz6whYExen9a
         qesivuXtZZ6/x6cqBODlDk29idP1b18zL3j1bMbqu4yoztV5qBg0xZlk4JsrDN950yNP
         tWDHRzbFEVEKPrVPo4/p7SHc0ImrDnmqfnlFCyDI8KWQzx8Pllg+3U2o1wSCWVHhm9iX
         bx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SenRFtg3kcFbs9vUTSmXrCXzTJuUoNr/azEqion6f2I=;
        b=aP9ritPxpMKeczrP6W8qi7sv43sCNkS/2ukTk7EzCILzcfxJXqHEiUwOgGoec93jaC
         aQ3/yuUjDARqBhIyk3nwxQPI1zPKH+pQ/J4BJZpMSVUdxq9DPHS9Qr6mL/X0M4XNXXot
         oWMAyjfYXC2w7HZCGz7CZLhHqlpZkD4RWsq50EoC1m9B4pe3izcF1lAHaQWimL1yKRqk
         UM5nWMXUeuMM4a+tTyPYsWoUaY80U/lDNhSULa5n46uK7NpRooY3J4rmMIaQHAVKQD0j
         laB3Lstacttx+TG3OaWmgRvzGofYOhB/MKwveKgbvF21QX86AeqkTYD6tObftz81gKLA
         FyvQ==
X-Gm-Message-State: AOAM530n6BCha1k18GGkUYT1tbERb5lOMocdlViGe2mDZoxANDL6rlDk
        KIh4bMaf34iV/V3IEkf90WkohPRhQmA=
X-Google-Smtp-Source: ABdhPJwnIEc9xuTkyAD1ymyeOcrSUYpAk5q55kGwgiAq9RpWg6Oe3n1ZGfG7oOk76v7SVQVU06OW8w==
X-Received: by 2002:aca:c792:: with SMTP id x140mr12467289oif.88.1620752590542;
        Tue, 11 May 2021 10:03:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c19sm3272847oiw.7.2021.05.11.10.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 10:03:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH hwmon-next v7 0/3] Add support for MPS Multi-phase mp2888
 controller
To:     Vadim Pasternak <vadimp@nvidia.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20210511055619.118104-1-vadimp@nvidia.com>
 <b967ca2a-acb6-6b76-7aee-788126f910e7@roeck-us.net>
 <DM6PR12MB38985D51FA4430D1CD1F6303AF539@DM6PR12MB3898.namprd12.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <3f3fa7b2-3891-3540-4703-f5bf83ffaec1@roeck-us.net>
Date:   Tue, 11 May 2021 10:03:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB38985D51FA4430D1CD1F6303AF539@DM6PR12MB3898.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/11/21 6:34 AM, Vadim Pasternak wrote:
> 
> 
>> -----Original Message-----
>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>> Sent: Tuesday, May 11, 2021 4:32 PM
>> To: Vadim Pasternak <vadimp@nvidia.com>; robh+dt@kernel.org
>> Cc: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org
>> Subject: Re: [PATCH hwmon-next v7 0/3] Add support for MPS Multi-phase
>> mp2888 controller
>>
>> On 5/10/21 10:56 PM, Vadim Pasternak wrote:
>>> Add driver and documentation for mp2888 device from Monolithic Power
>>> Systems, Inc. (MPS) vendor. This is a digital, multi-phase,
>>> pulse-width modulation controller.
>>>
>>> Patch set includes:
>>> Patch #1 - increases maximum number of phases.
>>> Patch #2 - provides mp2888 driver and documentation.
>>> Patch #3 - providesy binding documentation.
>>>
>>
>> Series applied.
> 
> Thank you, Guenter.
> 
> I see from the following errors from robot:
>>> ERROR: modpost: module mp2888 uses symbol pmbus_do_probe from namespace PMBUS, but does not import it.
>>> ERROR: modpost: module mp2888 uses symbol pmbus_read_word_data from namespace PMBUS, but does not import it.
>>> ERROR: modpost: module mp2888 uses symbol pmbus_write_word_data from namespace PMBUS, but does not import it.
>>> ERROR: modpost: module mp2888 uses symbol pmbus_get_driver_info from namespace PMBUS, but does not import it.
> 
> What does it mean?
> 

It needs

MODULE_IMPORT_NS(PMBUS);

No worries, I'll fix it up.

Guenter


