Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BFEC04A94
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Aug 2023 14:26:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbjHDO0H (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Aug 2023 10:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjHDO0H (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 Aug 2023 10:26:07 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D750CC
        for <linux-hwmon@vger.kernel.org>; Fri,  4 Aug 2023 07:26:06 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-79095499a17so79413239f.3
        for <linux-hwmon@vger.kernel.org>; Fri, 04 Aug 2023 07:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691159166; x=1691763966;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y9KpHa+dJYf7Rr/AB7AbigXxXMBbeq9J/2SAJzIYCiE=;
        b=TvPGqua3u8dIRz5wCyd6/InXNhcPWrDymGvJtaqLA98wUPMFAGmOB5Jn/gNxcCXQKp
         D0U9swK9AH3ah1sTG+sTj+zOsKULPPR5Ti1LMgOX4HrK+i/3TN6AiywNtMljoEvSaBxI
         aTD0oL8tOVmV3qQpMDeu/WtqZhF7gfuozdbb0JjExjRgQrJZia53CaHNPpmu7ZkkASzD
         vGpghj1TXgqGfFRLBQHojDqCWQ+rVQ0FYwaFYA3dBc3W4EG2PMRmk5Gs20Y3W693KsBZ
         M94uJJKjSd7q2NBeiyPd/gZNerGEnpfJJsaMyZd6sA/69wLh8+nQL7mwR6yUKEhwg5t+
         qlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691159166; x=1691763966;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9KpHa+dJYf7Rr/AB7AbigXxXMBbeq9J/2SAJzIYCiE=;
        b=k5UWPmYgmC991uCWCQzR9tV1W03F7sTE/aLtVhaauGD7F2ugbQEjvBOys5Z2/UyEhx
         Oc1yWWakU0xtX/Bo7DRY2eKfEhjdvR47nYuJ8ZvS8+6JM414fzCRximCQx8n/j6n8fH7
         lzXcxPjJgj5QLylRqyRVuAQFr9cSN6w7SUncz2P4reF67sHLGjJ+GqhdwX0lexJxNKLF
         fR8aaPeN5QU7EerXmPy5i9tEFpOPQyxjKZs9TT8MNyQliIVJodVgnNmpxIx/Anba50lJ
         2Sw14Gk2st+r+W0AC4ZceHgajts+0McE06IRFi6fKnUbGsWSLSc+KuK0Vv9/802xjPml
         YHWw==
X-Gm-Message-State: AOJu0Ywp54RBBusVLIfRmeEcurNGRjBGK/WoYbSMJ89x6GHVlFDsN/zo
        CGMkB+SyLmwKgqdqKskEEx0=
X-Google-Smtp-Source: AGHT+IHrySynM8PPJXY9PmJXGvLb8qfSHuMabBwJgmIXVJHxIIoSgmHc2HagdHI+bShP1OQsLTYKzA==
X-Received: by 2002:a05:6602:1b4d:b0:786:f47b:c063 with SMTP id dl13-20020a0566021b4d00b00786f47bc063mr1989884iob.21.1691159165675;
        Fri, 04 Aug 2023 07:26:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l13-20020a5d8f8d000000b00786f50d6bf5sm668913iol.19.2023.08.04.07.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 07:26:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <55da1781-3ea7-b3bc-05f8-8af25e5ea143@roeck-us.net>
Date:   Fri, 4 Aug 2023 07:26:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     "Nilawar, Badal" <badal.nilawar@intel.com>,
        Andi Shyti <andi.shyti@linux.intel.com>
Cc:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-2-badal.nilawar@intel.com>
 <ZMrbZXOVsyT133D8@ashyti-mobl2.lan>
 <d8258e4d-4cc4-78e2-7858-78409f47774f@roeck-us.net>
 <436c15bf-c031-9f72-c4cc-c7ff1600fdbf@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 1/6] drm/xe/hwmon: Add HWMON infrastructure
In-Reply-To: <436c15bf-c031-9f72-c4cc-c7ff1600fdbf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/4/23 06:19, Nilawar, Badal wrote:
> 
> Hi Guenter,
> On 03-08-2023 04:42, Guenter Roeck wrote:
>> On 8/2/23 15:40, Andi Shyti wrote:
>>> Hi Badal,
>>>
>>> [...]
>>>
>>>> +struct xe_hwmon_data {
>>>> +    struct device *hwmon_dev;
>>>> +    struct xe_gt *gt;
>>>> +    char name[12];
>>>> +};
>>>> +
>>>> +struct xe_hwmon {
>>>> +    struct xe_hwmon_data ddat;
>>>> +    struct mutex hwmon_lock;
>>>> +};
>>>
>>> why do we need two structures here? Can we merge them?
>>>
>>
>> A later patch adds multiple hwmon devices which makes use of it.
>> I think that is flawed, and I am not inclined to accept it.
> Is there any obvious reason that there shouldn't be multiple devices? In i915 we are doing the same. https://patchwork.freedesktop.org/patch/497324/?series=104278&rev=3
> 

Technically you can do whatever you like as long as the code doesn't reside
in drivers/hwmon. I won't NACK it, but I won't give it a Reviewed-by:
either. i915 shouldn't do it, but I didn't realize what they are doing
at the time. Other drivers doing it wrong is not an argument. You can't
argue that you may drive faster than the speed limit because others do it
or because police didn't stop you last time you did either.

One chip, one hwmon device. Do you have separate parent devices for
all your hwmon devices ? If yes, you can argue that having multiple hwmon
devices make sense. If not, you can't.

Guenter

