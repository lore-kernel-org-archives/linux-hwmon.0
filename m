Return-Path: <SRS0=9bva=SO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A032FC10F0E
	for <linux-hwmon@archiver.kernel.org>; Fri, 12 Apr 2019 15:39:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6F0CD2171F
	for <linux-hwmon@archiver.kernel.org>; Fri, 12 Apr 2019 15:39:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDMVgiUG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbfDLPjB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 12 Apr 2019 11:39:01 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40191 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726711AbfDLPjA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 12 Apr 2019 11:39:00 -0400
Received: by mail-pf1-f193.google.com with SMTP id c207so5331662pfc.7
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Apr 2019 08:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LxKrOR4Es9TxGMnrWTC0p+WVoOobxxLBbf710MYpjWs=;
        b=ZDMVgiUGOC8uGGWXYvBcdqjLvB8kMXNBHClEIhhD789AuGfxY6K0TemCucLglt63Za
         pxvrM9drqZpgGf6CWT+ajik3jONaAVpfy5rqKNVwFB9OXpI63tC0eeoLLq+5w/RJW7G3
         PVRlqpQThRxtFZSzX1p5/xfMbMKHnvV3eZUdeKbiOJ5D6kzyfLkNPuinTKd+qEWvUtxE
         p3krbWnB9DNii4WQBmXPt8l7LFDu2v6/yYR6dR/NcMUJSjXV7JMYfTvN5tsEnMXmhdSO
         si9JsG6D78X3+DprmVS2L8vse+1bYh2sNGq5u635IohY2088EaBGXj8uD8fMiivbo6KY
         WYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LxKrOR4Es9TxGMnrWTC0p+WVoOobxxLBbf710MYpjWs=;
        b=PyFlwNcyYoibVI5uCv4+egwtM8f7qUomGpE4wlHRr6OYHx7ZF6F+tfRywOCXSyuvrM
         0LjM3n9LU0GKXh9Leq7M1ZatZvsyN3YUpTtfOnLpaT/rHgYQMnviAsvgLPqRkfFhRATG
         sYg1JtyrDU7mxcMo1f6NgoGfsSxxuypyRFBpoD+WLvLF0WNZGZb6wlZn14zdz+gT48BU
         eYTQQKu2vqoocjHgCvR44QH0gHxwtp3xnvKRWbRwnQQI8c2qXjiCcP6cgW9dL48tAmgj
         xZWF5dl18weOKFEMXyTFcmVCXxhSULMdAV5Q4ulrPGyGfXu8RS/noeyoNxEBnbTD3K15
         AA/A==
X-Gm-Message-State: APjAAAWYjgIzckfW3/SjOdiigKPF5vwRCmGYovKXJRnJgS+oAMnYEs55
        HsJ7tfEKXZBj1YK7KBGeLRM4f8Y5
X-Google-Smtp-Source: APXvYqwReZfLnbOdyX2HZk2Dyy02RlIKb138zy+i/jmGW+JIZx7LTALTmA5uFwZGHc0mcqy3igSsdQ==
X-Received: by 2002:a63:8142:: with SMTP id t63mr51363339pgd.63.1555083539752;
        Fri, 12 Apr 2019 08:38:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c62sm7767608pfg.33.2019.04.12.08.38.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Apr 2019 08:38:58 -0700 (PDT)
Subject: Re: Couple of questions on SCMI sensor protocol and Linux
 implementation
To:     Sudeep Holla <sudeep.holla@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org
References: <1902f151-7ddd-6b4b-4135-a2affe20c009@gmail.com>
 <20190412135747.GC23351@e107155-lin>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <0ceb650b-7968-3cb3-12a1-f8174ed7b13a@roeck-us.net>
Date:   Fri, 12 Apr 2019 08:38:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190412135747.GC23351@e107155-lin>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/12/19 6:57 AM, Sudeep Holla wrote:
> On Tue, Apr 02, 2019 at 08:22:58PM -0700, Florian Fainelli wrote:
>> Hi Sudeep,
>>
>> There are a couple of things on which I would appreciate your feedback
>> regarding the Linux SCMI sensor protocol:
>>
>> 1) The Linux SCMI implementation has all the nuts and bolts to allow
>> configuring trip points, but the hwmon subsystem through the use of
>> hwmon_thermal_add_sensor() API does not actually make use of that
>> capability. Would it be a big stretch to use the hwmon_ops::write
>> function to get to support that feature?
> 
> As a concept, it sounds good. Though I am not sure if write API semantics
> match with what we want here with trip point configuration.
> 

Last time I checked, the thermal subsystem concept of trip points was strictly
dynamic. Exceeding a trip point (low or high) would result in a signal followed
by the trip point being updated.

In the hwmon subsystem, and in general with temperature sensors it supports,
trip points (or limits) are static. Making such static trip points available
to the thermal subsystem would, in many cases, have undesirable consequences:
Exceeding a trip point often does not only generate a signal, it may also
activate a pin which, in turn, could for example activate fans or, in extreme
cases, shut down the system. It would also affect status reporting in the hwmon
subsystem, where exceeding a trip point is reported with a sysfs attribute.

In order to interconnect the thermal subsystem more closely with the hwmon
subsystem, it would be necessary for the thermal subsystem to recognize a
concept of static trip points.

If scmi is to be used with the thermal subsystem and its concept of dynamic
trip points, I would suggest to move the driver from hwmon to thermal. People
can then use the thermal->hwmon bridge for (limited) temperature reporting
through the hwmon subsystem.

Thanks,
Guenter
