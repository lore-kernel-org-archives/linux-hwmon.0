Return-Path: <SRS0=Is7H=SN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B445C10F13
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 13:19:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 06B78206B7
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 13:19:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BU1D98OA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbfDKNTM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 Apr 2019 09:19:12 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:32977 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbfDKNTM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Apr 2019 09:19:12 -0400
Received: by mail-pf1-f194.google.com with SMTP id h5so3471687pfo.0
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Apr 2019 06:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5D+35iHpWSajVWvKDitrlrDHfbsvpXs79kwfZvz/Njw=;
        b=BU1D98OAN9Hb9F0dT1/O9L2fNYGL4cxmpRDC9qcBVFNvyip62/enScqzjOECMGAjI4
         yB6P9jb5IsWqbJZQPZ42Zqu3W68kWNwG5uS7yrCoewqZpSW4R7AUJz7fVUJUUJx/AeVS
         0CRV4FIF1KNuCTwYrUZjFF0H1SN6SturFt2wH+Y1ZIIXWoSX6yBQhi1SjiiPJ3k31hMV
         aFU4OEi3IoAgSbKwaYVD4ft8IVGSUHWgTgk+5taXoiED7ja3sY4gDAeCv38nTWfSQWoI
         QNjqq30F3Wha3mOcaHlg8h0sAtyzuJF+BOK0U7D/VmciN9f4wyPdeCBMJJfizIRhSPCi
         4Qaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5D+35iHpWSajVWvKDitrlrDHfbsvpXs79kwfZvz/Njw=;
        b=AOrnDdysKNpRxe+TfftLHYllKFXYSJmRMcFOz9EmI8L68ZdC+Pb/5cJZdYMpyTKC4g
         k0I4Mj1d3zbLcgxlvtEYHSkJ58qvwly2m198DvzBnUiF8aHV92a/1nbKR0f2Kq+3QvgX
         7XSIl6MmRyeugMf5g8k1rnxh7PLWnesmpCnS9rMmGlb4y4XD70LnunuawqouIcXbq45l
         QJLt9D4yfK1X0xLE0Mzoc6/dzi+FIwbXfSgtATtZD2QZvmhjKBYl9Ub7jmHcmesHsr3m
         0NjI3vVJHUoWUGYEC/HdFeO9eUmfrUlxBkmD1PR6fdl665rLIVl1ffwD2nrkVVjjJ7b5
         jseA==
X-Gm-Message-State: APjAAAXdM7vShZtaAgCgb3epTQ1aq506HEW65V/c9es3mtw/c7+QbQwU
        1T4lUG63jqaml1lBhaOYJaSgCVSK
X-Google-Smtp-Source: APXvYqxHfpVroKBXRM320QfhhkR586gkBCEMUXl2o2l37v23x+6UGRxmFs/4nxV6sJN91rW/3sq6MQ==
X-Received: by 2002:a63:6503:: with SMTP id z3mr41645222pgb.113.1554988752026;
        Thu, 11 Apr 2019 06:19:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p14sm38298784pfa.26.2019.04.11.06.19.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Apr 2019 06:19:11 -0700 (PDT)
Subject: Re: [PATCH 1/3] pmbus: support for custom sysfs attributes
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
References: <cover.1554934898.git.krzysztof.adamski@nokia.com>
 <28f92a8e63ce4b0e1071e8fdb2315a057daee9c6.1554934898.git.krzysztof.adamski@nokia.com>
 <b3f0de78-e3bc-5c73-e732-9fa62c3404cf@roeck-us.net>
 <20190411075340.GB28466@localhost.localdomain>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <c1bc8f07-3160-c411-e795-2aa864db1be6@roeck-us.net>
Date:   Thu, 11 Apr 2019 06:19:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411075340.GB28466@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/11/19 12:53 AM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
> On Wed, Apr 10, 2019 at 05:35:21PM -0700, Guenter Roeck wrote:
>> On 4/10/19 3:38 PM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
>>> This patch makes it possible to pass custom struct attribute_group array
>>> via the pmbus_driver_info struct so that those can be added to the
>>> attribute groups passed to hwmon_device_register_with_groups().
>>>
>>> This makes it possible to register custom sysfs attributes by PMBUS
>>> drivers similar to how you can do this with most other busses/classes.
>>>
>>> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>>> ---
>>>   drivers/hwmon/pmbus/pmbus.h      |  3 +++
>>>   drivers/hwmon/pmbus/pmbus_core.c | 13 ++++++++++++-
>>>   2 files changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
>>> index 1d24397d36ec..fb267ec11623 100644
>>> --- a/drivers/hwmon/pmbus/pmbus.h
>>> +++ b/drivers/hwmon/pmbus/pmbus.h
>>> @@ -417,6 +417,9 @@ struct pmbus_driver_info {
>>>   	/* Regulator functionality, if supported by this chip driver. */
>>>   	int num_regulators;
>>>   	const struct regulator_desc *reg_desc;
>>> +
>>> +	/* custom attributes */
>>> +	const struct attribute_group **groups;
>>
>> I can understand the need and desire for one additional group. More than one
>> is highly questionable. Please explain why you think that more than one extra
>> attribute would ever be needed. It does add substantial complexity, so
>> there should be a good reason.
> 
> The only situation I could come up is if the driver would want to group
> attributes in different directories by setting different name for each
> of them. One other reason I choose to use this approach is that this
> seems to be standard way for passing this information on other
> layers/frameworks.  For example, this is the same "format" you would
> pass this kind of data when creating a class, a bus, a driver or when
> you use any of the *_register_with_groups().
> 
> This approach is simply more generic with (to my opinion) low cost of
> implementation. But if we don't want to support that, I'm fine to change
> this to single custom group.
> 

I think we can postpone this discussion for now, as we'll go with standard
attributes to be implemented in the pmbus core.

Thanks,
Guenter
