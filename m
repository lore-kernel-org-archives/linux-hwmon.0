Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D955FC25B67
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Oct 2023 14:32:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbjJZOcn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Oct 2023 10:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234902AbjJZOcm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Oct 2023 10:32:42 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0150C128
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Oct 2023 07:32:40 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5ae143e08b1so7249547b3.1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Oct 2023 07:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698330760; x=1698935560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VPxudaEJ1UBBc6mfPo2+Z+YvjpbZXusH2gI4eMMgBvg=;
        b=LMN1Lxx5Ot5686wDHSLodiL0TzMM/iRVy5IkDxDO1T8gRGPO8DrywlahJLq4sitYuT
         I9CSl/7Lfb8pNEwABUiDduRm6YKi+oXfgLKXEUWk8fX/YcHXkkMZZV9i1efmv0ns1DBD
         bik3PP439iZGuizVSWauTCQi3kb4lZnkcNtzS2zJs36jGtl7RiNyi+bougGDZhGymCws
         4IpGeOp0wrsrt0KxNBOVfIiy2/iIaqIaPmwMbjBjG4gRRtT01uUhP+kjQApBIRxj+ovk
         99PQWkol0LIXEbXFMs4HvaDuhB+IaqdhUMIETf341p9G4ZebGvcAO76ugAHJ6IvbtZgD
         WUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698330760; x=1698935560;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPxudaEJ1UBBc6mfPo2+Z+YvjpbZXusH2gI4eMMgBvg=;
        b=jdoM3rX203Ikh0XxgZyYp4oFGt1RR0Uhg7ytGZdQStU/pzdS39uWeSmz81FgLhcMV0
         ikTFsjHLXaS/r8zQsiCQ9OvBw1FQwRQo9pqmD63MNrq3nIQa9uFZwzK9zxb4lYAsIvhm
         JR5YxUrLTCyytiu/Tb8BbiaX+XmF1tNgGVyfMdaKpyx127vQ0rhEcdsu/YwObwUtvMhw
         ZUgbL5KIZv4U0Glx2mA3iKezANNPyvYzq5EBGxfUZuATFi2Ce0mkUhtX0HKS4845Azvg
         6s/8noRC+EhKMB9J6qww0A+BJ9NtTZyytZLtMojgsqlWOOZXHIKXQOFC0QpYpy7Xs+Z1
         hjOw==
X-Gm-Message-State: AOJu0YxwreFfUThyd6QCU79eNGYN0pjvRmevYA1TBihssWc6+dMPn3tI
        bhCy3mY+VuiugzufM6OXuQYn80+owUs=
X-Google-Smtp-Source: AGHT+IHuRK123wLoB8adQMfBOrN3l6HBD9wr/DubAZEzkiAqeRDmUXwxsi8Ww69ANMxbmJh4kK5lPQ==
X-Received: by 2002:a0d:cc8c:0:b0:5a7:acae:3bb0 with SMTP id o134-20020a0dcc8c000000b005a7acae3bb0mr21864266ywd.5.1698330760102;
        Thu, 26 Oct 2023 07:32:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k203-20020a816fd4000000b0059b1e1b6e5dsm6086036ywc.91.2023.10.26.07.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 07:32:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1e372f1b-2b27-fc16-ee58-34b279fb9004@roeck-us.net>
Date:   Thu, 26 Oct 2023 07:32:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] hwmon: (axi-fan-control) Fix possible NULL pointer
 dereference
Content-Language: en-US
To:     =?UTF-8?Q?Nuno_S=c3=a1?= <noname.nuno@gmail.com>,
        Nuno Sa <nuno.sa@analog.com>
Cc:     linux-hwmon@vger.kernel.org,
        Dragos Bogdan <dragos.bogdan@analog.com>,
        Jean Delvare <jdelvare@suse.com>
References: <20231025132100.649499-1-nuno.sa@analog.com>
 <1623e497-d850-47bc-925b-f97439864299@roeck-us.net>
 <76a49e935fa745242b9e8aa4746c9a1bd5525aa8.camel@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <76a49e935fa745242b9e8aa4746c9a1bd5525aa8.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/25/23 22:24, Nuno Sá wrote:
> On Wed, 2023-10-25 at 11:57 -0700, Guenter Roeck wrote:
>> On Wed, Oct 25, 2023 at 03:21:00PM +0200, Nuno Sa wrote:
>>> From: Dragos Bogdan <dragos.bogdan@analog.com>
>>>
>>> axi_fan_control_irq_handler(), dependent on the private
>>> axi_fan_control_data structure, might be called before the hwmon
>>> device is registered. That will cause an "Unable to handle kernel
>>> NULL pointer dereference" error.
>>>
>>
>> Applied, but, please,
>>
>>> Fixes: 8412b41 ("hwmon: Support ADI Fan Control IP")
>>
>> WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title
>> line>")' - ie: 'Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")'
>> #88:
>> Fixes: 8412b41 ("hwmon: Support ADI Fan Control IP")
>>
>> consider running checkpatch on your patches in the future.
>>
> 
> Oh, sorry for that. As you figured I just cherry-picked the patch from a colleague. I
> think it's time to have some kind of hook running some basic checks before git send-
> mail.
> 

No worries. Happens. Fortunately problems like this are easy to fix.
I have a little script which downloads a patch, runs checkpatch on it,
and applies it if checkpatch reports no issues.

Thanks,
Guenter

