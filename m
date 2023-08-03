Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40FCC00528
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Aug 2023 00:06:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232222AbjHCAGr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Aug 2023 20:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232287AbjHCAGd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Aug 2023 20:06:33 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B86E421D
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Aug 2023 17:06:04 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1bb84194bf3so3288365ad.3
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Aug 2023 17:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691021162; x=1691625962;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=grmkJDN/0GasEHyO1WVplU4u2nlUGNLeHBx8s3alU3I=;
        b=WlttW27JC6vrkQm61HlAGn7WwB6U5l0njVsNePtCWTNW7k4sPX8a/xubA+5rEuaKgi
         NEzOvVaHKYqyGNEb0Cvxr4AN7oGMXyXoh0NtG0NghRcQXr9Tu4M0qQAsnaGFSgzIuF+3
         skCv+8JdHgTj6RI8K6PbmIQejW8XXqMqcWlW2tUif6+C2/vhwje4KfRdnCZW9Kijf+E5
         Vg20kqSXtQvBH74BgKp+TJTmVBzqka531gFVSSZZu8l0atcP8Bgy9cfRmc8aTvakpxt5
         mA0tdoVNvzQlHr9UQHDsPu6I2xN84fWsHDEdv/Ouv+Z2c8GKJ/xPWNSBIHH/lZ2wKmKz
         Pihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691021162; x=1691625962;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grmkJDN/0GasEHyO1WVplU4u2nlUGNLeHBx8s3alU3I=;
        b=K0y09tlWUBAXqKiGpJ2DnIjB47UPh949xs763RB1cFSWpeLG5glty9lhQIPfF6MJi1
         DS9AYdg0iRfj1RyH9FOkBu9mzuS4oYKeHLmXm8wPTU6lAPe0vIVZ1hIamKPbVY9HG3Zt
         g49trUYybfUWU9+CnybYdtPCLV05cb05EwUdcV48DylQY3VeDY1oI/9FmbAPd7rDlmjj
         8ltm+sIIk0mGHUch3anh82qEufdV89fic0wSKKjONg8msNd6aHfEoGWysEWGocX0RrJs
         3Akl2zSbrlsqX30wuMMzDxwV2mjSF8QEt+ToI2tAifV0Z2W/cGO5KTsN9zEyN587FE0e
         EVdw==
X-Gm-Message-State: ABy/qLaQnhPt0I8bNxhs3zCo67JVzJ+di2RM2UFpV2fvtruK/YXjEEsM
        AAxR4VU2hKJzcOOxR7AQaAM=
X-Google-Smtp-Source: APBJJlFeQk/58/lrEwKheMm9/V7nF/pPWdthMmgFj+BbmiigOP0qgzXxCQSBhRzgoaYqsbiLDV3V2Q==
X-Received: by 2002:a17:902:d506:b0:1b8:9044:b8ae with SMTP id b6-20020a170902d50600b001b89044b8aemr17589681plg.11.1691021162250;
        Wed, 02 Aug 2023 17:06:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id jj6-20020a170903048600b001ab39cd875csm12946322plb.133.2023.08.02.17.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 17:06:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ca20b318-f3c8-cfb9-2ff6-8bdc9bb014b2@roeck-us.net>
Date:   Wed, 2 Aug 2023 17:06:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/6] drm/xe/hwmon: Add HWMON infrastructure
Content-Language: en-US
To:     Andi Shyti <andi.shyti@linux.intel.com>
Cc:     Badal Nilawar <badal.nilawar@intel.com>,
        intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-2-badal.nilawar@intel.com>
 <ZMrbZXOVsyT133D8@ashyti-mobl2.lan>
 <b863c26d-143b-9dd4-7f90-44a2b0ae94e2@roeck-us.net>
 <ZMroG8SWDMDHtsOL@ashyti-mobl2.lan>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <ZMroG8SWDMDHtsOL@ashyti-mobl2.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/2/23 16:34, Andi Shyti wrote:
> Hi Guenter,
> 
> [...]
> 
>>>> +static const struct hwmon_channel_info *hwmon_info[] = {
>>>> +	NULL
>>>> +};
>>>
>>> just:
>>>
>>>     static const struct hwmon_channel_info *hwmon_info[] = { };
>>>
>>> would do.
>>>
>>
>> What would be the point ? This is just a placeholder, and we need
>> a NULL entry at the end.
> 
> right... this series needs to be read from the end to the
> beginning :)
> 

Or applied completely, review the result, and then dig back to
the individual patches to provide feedback. I got severely confused
when trying to review the series. I am not really sure if the split
into multiple patches is really making the review easier; it seems
to me it does the opposite.

Guenter

