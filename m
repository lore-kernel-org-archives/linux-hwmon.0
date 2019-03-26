Return-Path: <SRS0=FSWF=R5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 373C7C43381
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Mar 2019 13:32:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 051242075D
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Mar 2019 13:32:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tu495GXb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731571AbfCZNcA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Mar 2019 09:32:00 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37706 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731565AbfCZNcA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Mar 2019 09:32:00 -0400
Received: by mail-pf1-f193.google.com with SMTP id 8so8081912pfr.4;
        Tue, 26 Mar 2019 06:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ISBk9iKLZh9b592XAotP4czFKccKb14HhkMsquTcYZk=;
        b=Tu495GXbrxScnkfadMC3khBxZEDkFzH4DE2Y4HzEGkkXHWGlL1BJTPhWzTrvKm96fo
         /irqgoO3LHe2pypD6sSjtmcgr+hsYoVyOKOJqTDM1kdFana6gDxi42TUFZfVh6L5eW0c
         FEl0/RRZI4a4bPeQ0ZpWgMVmi3+uJ7pM9xI2QMy/HQGcC8nrKxR0ZpdY/z1gCaYxrlOw
         FFFtabEKyq+5TaRjvIldiuYtl6R5q5WllDBYIJRpFrKkoV+uyVzDAoctwtz2bh8O+Z2O
         RK9ajMvlk9xvQ+uVBjQt/cX1Y8rvkB4TDGTohg8iqRUV524LFmcgAdo7MWui3dujdPu8
         xXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ISBk9iKLZh9b592XAotP4czFKccKb14HhkMsquTcYZk=;
        b=a0Dlg4D2XIpxUkaFODkJcm2SdzVTxLTUNBf5qL/iQiqbLXkkqUK9+AFmO1o3wtkB9u
         xTP/WvLUQp0DuGBEflXX1W1ldcwvlZIuRU5XesDr33pGWaFZNJl1Kc0Pp+QJUzcBE925
         ud7kNBr5rOo1by6WqstQ9d7BewhIYyl9PdKJA3a12zIATxwxFoUC0jBi3XIRonijWiC6
         TDQNoi957H3SBMvvqkXOL4ZZXMgkd300jsDOlXYr8eWdqTIMDws4LxY6cslk1bNwDu/z
         EooPTmJ2/tcDBHR1PDZTGkBr81+6cPnVRH8SYxsGtoLKfitDthtkeuOuKZJKGGIiTn98
         RPZg==
X-Gm-Message-State: APjAAAVQwS3rS4CHK7ah6aMaybWOjID7vcoRpIdBU194VPAS0iBSxP9B
        fon/phXfmWzn7Ui10j+ihuUjj5NW
X-Google-Smtp-Source: APXvYqyMjuNUdXHHMNpsD/qqxwCU4nTWQ4h523u05IX2HmGZb24lIX0WvQbMyJG4jzg912w4E0s09g==
X-Received: by 2002:a62:4351:: with SMTP id q78mr16972005pfa.86.1553607119025;
        Tue, 26 Mar 2019 06:31:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d3sm25521526pfc.125.2019.03.26.06.31.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Mar 2019 06:31:57 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] hwmon: lochnagar: Add Lochnagar 2 hardware
 monitoring driver
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-hwmon@vger.kernel.org, corbet@lwn.net,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com
References: <20190325110020.4349-1-ckeepax@opensource.cirrus.com>
 <20190325110020.4349-2-ckeepax@opensource.cirrus.com>
 <7cd9502f-f986-d513-45a6-e7e40bd67b1f@roeck-us.net>
 <20190325131651.GF46536@ediswmail.ad.cirrus.com>
 <20190325164622.GB28275@roeck-us.net>
 <20190325171054.GG46536@ediswmail.ad.cirrus.com>
 <20190325184711.GA3195@roeck-us.net>
 <20190326100551.GI46536@ediswmail.ad.cirrus.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <cebb47a5-1ca8-cd0c-dc06-7534dd7a9b2b@roeck-us.net>
Date:   Tue, 26 Mar 2019 06:31:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190326100551.GI46536@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/26/19 3:05 AM, Charles Keepax wrote:
> On Mon, Mar 25, 2019 at 11:47:11AM -0700, Guenter Roeck wrote:
>> On Mon, Mar 25, 2019 at 05:10:54PM +0000, Charles Keepax wrote:
>>> On Mon, Mar 25, 2019 at 09:46:22AM -0700, Guenter Roeck wrote:
>>>> On Mon, Mar 25, 2019 at 01:16:51PM +0000, Charles Keepax wrote:
>>>>> On Mon, Mar 25, 2019 at 04:17:31AM -0700, Guenter Roeck wrote:
>>>>>> On 3/25/19 4:00 AM, Charles Keepax wrote:
>>>>>>> From: Lucas Tanure <tanureal@opensource.cirrus.com>
>>>> There is another possibility which might meet your requirements: If the
>>>> important attribute is power consumption, you might consider providing
>>>> power attributes. Those _are provided in micro-units. That isn't exactly
>>>> as expected, as drivers should only provide power attributes if actually
>>>> reported by the HW, but there is an argument to make that it makes sense
>>>> here. You could then even provide powerX_average and make the number
>>>> of samples indirectly configurable with powerX_average_interval.
>>>>
>>>
>>> Thank you for the suggestions I will investigate them and see
>>> where I get to. The power option does sound tempting as the
>>> ability to configure the number of samples feels like something
>>> that could be handy in the future. But on the flip side adding
>>> high accuracy APIs might be useful for others in the future.
>>>
>> Agreed, but we would have to think about it more before jumping into
>> it. There would be several possible solutions. Adding new sysfs files
>> might be one. Another might be "scale" attributes or similar. Or get rid
>> of the sysfs ABI entirely and use something similar to iio. Or go further
>> and create a hwmon->iio bridge and use iio to report high resolution
>> information.
>>
> 
> Ok I think I will have a look at the using the power entries
> first and we can see what that looks like. I am leaning in that
> direction as it would be nice to get something merged in the not
> too distant future and having configuration for the averaging
> does seem like it protects against the hardware guys going "for
> this project we need to average over this many samples".
> 
> On another note I have not really done a lot with hwmon/iio
> before, my assumption was this should really be an hwmon device
> since it is monitoring the state of the hardware and only
> supports simple single readings, no buffering etc. Are you also
> comfortable that this is the sub-system this device belongs in?
> 

Yes. I was talking about the ABI, not the subsystem.

Guenter
