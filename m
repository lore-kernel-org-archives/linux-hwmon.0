Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4174C4332F
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 Oct 2023 15:22:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344855AbjJaPWY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 31 Oct 2023 11:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344575AbjJaPWS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Oct 2023 11:22:18 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C8A9F
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Oct 2023 08:22:04 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1cc3bc5df96so20766855ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Oct 2023 08:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698765723; x=1699370523; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=m4JJ+ZpMjnx8VlKZjQJH6i26ELPfngwe2aVKnCYHGDo=;
        b=Or0MzVYx53uBGkV2BNwJ/gg2jAoqZzkAxsHX+a5LopnuNXBh2W5Bdc2rfzyKA93d0L
         AYzeeeA+ghqtl29Ai+wncN9vcN7o5TUJmRP3/lp+V3B5OMfY7Iq/vnd5RercEI1243g8
         RWReGAToP5fq1iNo6G2GMGUWGZSxvaiFVR+3fL6dgd51c3I5EaEOUpq9+G/rsbitmZmO
         L34XVpdhpZcEjlcJHLgZsv1qYXgrI5o0M8vsQ/H7U7ZZZoXly1pACxgZESkfFaB46g55
         d8+8TW1ZZVQzBaXF6rHR+2OmCCXiT5foV3vY+SPN5fjLljQzEHzkaRyUHahPW1fU6eL9
         3qtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698765723; x=1699370523;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4JJ+ZpMjnx8VlKZjQJH6i26ELPfngwe2aVKnCYHGDo=;
        b=n0HL8xniVNVzw22rcVpmzrwfzrgzlJM2ej7coDsqhI5c6UUnqVZAXy7+u7oO8WK66C
         ddC530AFJ6dhcNQDE0iISSFiD8GIHw1OzntDuakHwCaM0oq82vuMYbpG8wFZnzOOXcXu
         uJ42iXvnRMk6J0pWO3Rof/3343+dKgU7qli1Qs71zoGIbKew6HnLr2jcBNIamB7Zs/aY
         D1ZOlCjicOzE18qY3r6nCVxeYlgdCyhN2+vEoHUT5MarJ7HP7zoJcns7/fk1N1xAOPcy
         tkVUfgtNl0nE2KRITXBPpfixhNYMQn+X0ZtZroqwrEi6+yAgRuxotiTaXzVspc4JjmWr
         WvIg==
X-Gm-Message-State: AOJu0YyPCw9RkGoN7AqsYWUJUCrGn4rktPGUrKy0iB4aeJVx1ead/SpV
        CcPsR7IKwHuHvrAXxoliNVMmleBnwR8=
X-Google-Smtp-Source: AGHT+IGQqdL7M/cAoQQbfX5Y8Q4qwP+s9T1nEtySub3HIGYFLZWyDx1w6vakaOLnk3cBd+h5qX7jOw==
X-Received: by 2002:a17:902:e809:b0:1cc:6d2c:fb59 with SMTP id u9-20020a170902e80900b001cc6d2cfb59mr1327380plg.28.1698765723542;
        Tue, 31 Oct 2023 08:22:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902c14200b001cc3fae08basm1463019plj.52.2023.10.31.08.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Oct 2023 08:22:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <33d8508f-e17f-4900-afde-64315c7f416c@roeck-us.net>
Date:   Tue, 31 Oct 2023 08:22:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [PATCH v2] hwmon:Add MEC172x Micro Chip driver for
 Lenovo motherboards
Content-Language: en-US
To:     David Ober <dober@lenovo.com>
References: <20231031120942.4404-1-dober6023@gmail.com>
 <4ab27937-df39-44bf-967c-0f8ddc987879@roeck-us.net>
 <SEYPR03MB7192C99C83C4FFFF25190E17DAA0A@SEYPR03MB7192.apcprd03.prod.outlook.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <SEYPR03MB7192C99C83C4FFFF25190E17DAA0A@SEYPR03MB7192.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/31/23 08:14, David Ober wrote:
> That was the changes from the original commit, my bad.
> 
> Do I submit the entire patch again and will it replace this, not sure how to fix this
> 

Please

- do not top-post
- never drop the mailing list from your replies

"git rebase -i <parent>", where <parent> is the baseline SHA,
lets you edit the list of patches. Select "squash" to squash
a patch into a previous one.

Guenter


> David
> 
> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Tuesday, October 31, 2023 10:52 AM
> To: David Ober <dober6023@gmail.com>; linux-hwmon@vger.kernel.org
> Cc: linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org; jdelvare@suse.com; corbet@lwn.net; David Ober <dober@lenovo.com>; Mark Pearson <mpearson@lenovo.com>
> Subject: [External] Re: [PATCH v2] hwmon:Add MEC172x Micro Chip driver for Lenovo motherboards
> 
> On 10/31/23 05:09, David Ober wrote:
>> This addition adds in the ability for the system to scan the MEC172x
>> EC chip in Lenovo ThinkStation systems to get the current fan RPM
>> speeds and the Maximum speed value for each fan also provides the
>> current CPU and DIMM thermal status
>>
>> Signed-off-by: David Ober <dober6023@gmail.com>
>>
>> v2 fixed mixcased naming
>> v2 add mutex protection
>> v2 removed references to ACPI as it is not used
>> v2 added comment to explain why returning a -1 is needed
>> ---
>>    drivers/hwmon/lenovo-ec-sensors.c | 81
>> ++++++++++++++++++-------------
> 
> What is this patch based on ? I don't see that driver in drivers/hwmon/, and based on the patch I would be surprised if I had accepted it.
> 
> Guenter
> 

