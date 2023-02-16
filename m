Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A25AC636CC
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Feb 2023 19:25:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbjBPTZ4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Feb 2023 14:25:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjBPTZz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Feb 2023 14:25:55 -0500
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C67847411
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Feb 2023 11:25:53 -0800 (PST)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-15ff0a1f735so3779007fac.5
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Feb 2023 11:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=be5OviXETp25FAannj1ohZzkt7jAZjAjOARVQL9th98=;
        b=C9ULPRoBMkVzv5FAnzjPsKRTqiA8awljX75OuoeN6RhZg18JmPtanHtGz3BkFHfzI4
         cvCAGdik2yLukMRm9oCMwjWoN2dLyR9zYkT/U2suvyyV4N3Sr9RF8NQ/MuroffAD9an2
         f7FQlz95nTTotlqcEp06KWX9jMvUIJ0J25C0W6Fh14EdmVlZoUEGSXOsOODte37UucBw
         1rKnFy7YSBxkmcbBO3yW3WkiDX6GEzUoT48Qo2wxIAL3BYBh+MfMJnMEgVek45ze6LyP
         SS0ZReRkGL+CGbxU4ojYZBcf7r9bKjHFmXQc1yrKTKWdsQ4XsnvEzfdG4l5ZKZIqz237
         mY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=be5OviXETp25FAannj1ohZzkt7jAZjAjOARVQL9th98=;
        b=cC3yAQnIF+cv3pMb+/ngW1C/KZV9Z2PP8sJAb6a/ifTXJJf7UCjHPF/1rItOK/TlzA
         PgbkO/3Tq6IFvjWqj6rBNm8T23jf6aXHffidjo2tvfH/ElOznghCR3UbyLznj7d7WLca
         Bn98sJmbs9gBYY3/UTLZBb7XCW9cRyDNclfbk3bryuARmafzsRxmuHvLsgMxc0+aHCcY
         63teOj1rrGZsZj/8xsnO69oPLpZbpB+4druDy9fCVsaATOQ2sAYoaqmtCN+bi24YfyYE
         tBySBHBZeudxKQML18Zxqhyg2uId39m0aX7S0U9TKxtyw+gOLymdyP2XinbDNRKnnHgj
         ySaw==
X-Gm-Message-State: AO0yUKUxBFzIfqUtjGkZt2m0rMQOrArVKBF7g+LaSdTZ4V22CRfhMLaE
        C5G8ETJR52HVdVQTZR/Aqog=
X-Google-Smtp-Source: AK7set9Oetk/U+Wn7ySsSh3+ukQq3ZEH/RdwvX7BGp5Qi7pzbOhZhSEp1fvfkuW0ECtmLhGDguFGLQ==
X-Received: by 2002:a05:6870:e40f:b0:163:4a10:827e with SMTP id n15-20020a056870e40f00b001634a10827emr4235656oag.16.1676575552782;
        Thu, 16 Feb 2023 11:25:52 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ea1-20020a056870070100b0016dfadd3bdcsm866965oab.55.2023.02.16.11.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 11:25:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <03a57aad-b5f8-3483-8444-4334a03482dc@roeck-us.net>
Date:   Thu, 16 Feb 2023 11:25:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Rodrigo Vivi <rodrigo.vivi@intel.com>,
        "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc:     intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Anshuman Gupta <anshuman.gupta@intel.com>,
        Riana Tauro <riana.tauro@intel.com>,
        Badal Nilawar <badal.nilawar@intel.com>,
        gwan-gyeong.mun@intel.com, linux-hwmon@vger.kernel.org,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Vinay Belgaumkar <vinay.belgaumkar@intel.com>
References: <20230214053342.1952226-1-ashutosh.dixit@intel.com>
 <20230214053342.1952226-4-ashutosh.dixit@intel.com>
 <f7a7e280-804f-b397-a8c5-c4dae0451111@roeck-us.net>
 <87sff7tygb.wl-ashutosh.dixit@intel.com> <Y+58hLJYJYVQ5KyP@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 3/3] drm/i915/hwmon: Expose power1_max_enable
In-Reply-To: <Y+58hLJYJYVQ5KyP@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/16/23 10:57, Rodrigo Vivi wrote:
> On Tue, Feb 14, 2023 at 07:11:16PM -0800, Dixit, Ashutosh wrote:
>> On Mon, 13 Feb 2023 22:16:44 -0800, Guenter Roeck wrote:
>>>
>>
>> Hi Guenter,
>>
>>> On 2/13/23 21:33, Ashutosh Dixit wrote:
>>>> On ATSM the PL1 power limit is disabled at power up. The previous uapi
>>>> assumed that the PL1 limit is always enabled and therefore did not have a
>>>> notion of a disabled PL1 limit. This results in erroneous PL1 limit values
>>>> when PL1 limit is disabled. For example at power up, the disabled ATSM PL1
>>>> limit is shown as 0 which means a low PL1 limit whereas the limit being
>>>> disabled actually implies a high effective PL1 limit value.
>>>>
>>>> To get round this problem, expose power1_max_enable as a custom hwmon
>>>> attribute. power1_max_enable can be used in conjunction with power1_max to
>>>> interpret power1_max (PL1 limit) values correctly. It can also be used to
>>>> enable/disable the PL1 power limit.
>>>>
>>>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>>> ---
>>>>    .../ABI/testing/sysfs-driver-intel-i915-hwmon |  7 +++
>>>>    drivers/gpu/drm/i915/i915_hwmon.c             | 48 +++++++++++++++++--
>>>>    2 files changed, 51 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>>>> index 2d6a472eef885..edd94a44b4570 100644
>>>> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>>>> @@ -18,6 +18,13 @@ Description:	RW. Card reactive sustained  (PL1/Tau) power limit in microwatts.
>>>> 			Only supported for particular Intel i915 graphics
>>>> platforms.
>>>>    +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_enable
>>>
>>> This is not a standard hwmon attribute. The standard attribute would be
>>> power1_enable.
>>>
>>> So from hwmon perspective this is a NACK.
>>
>> Thanks for the feedback. I did consider power1_enable but decided to go
>> with the power1_max_enable custom attribute. Documentation for
>> power1_enable says it is to "Enable or disable the sensors" but in our case
>> we are not enabling/disabling sensors (which we don't have any ability to,
>> neither do we expose any power measurements, only energy from which power
>> can be derived) but enabling/disabling a "power limit" (a limit beyond
>> which HW takes steps to limit power).
> 
> Hi Guenter,
> 
> are you okay with this explanation to release the previous 'nack'?
> 

Not really. My suggested solution would have been to use a value of '0'
to indicate 'disabled' and document it accordingly.

> For me it looks like this case really doesn't fit in the standard ones.
> 
> But also this made me wonder what are the rules for non-standard cases?
> 
> I couldn't find any clear guidelines in here:
> https://docs.kernel.org/hwmon/hwmon-kernel-api.html#driver-provided-sysfs-attributes
> 
> We are seeing drivers around to freely use non-standard hwmon.

Yes, sure, freely. You conveniently ignore

Do not create non-standard attributes unless really needed. If you have to use
non-standard attributes, or you believe you do, discuss it on the mailing list
first. Either case, provide a detailed explanation why you need the non-standard
attribute(s). Standard attributes are specified in Naming and data format
standards for sysfs files.

from Documentation/hwmon/submitting-patches.rst.

> Are we free to add non standard ones as long if doesn't fit in the defined
> standards, or should we really limit the use and do our own thing on our own?
> 

> I mean, for the new Xe driver I was considering to standardize everything
> related to freq and power on top of the hwmon instead of separated sysfs
> files. But this would mean a lot of non-standard stuff on top of a few
> standard hwmon stuff. But I will hold this plan if you tell me that we
> should avoid and limit the non-standard cases.
> 

Oh, I really don't want to keep arguing, especially after your "freely"
above. Do whatever you want, just keep it out of drivers/hwmon.

Guenter

