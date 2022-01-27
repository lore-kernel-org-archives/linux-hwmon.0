Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D92AC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Jan 2022 16:43:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238575AbiA0QnU convert rfc822-to-8bit (ORCPT
        <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Jan 2022 11:43:20 -0500
Received: from aposti.net ([89.234.176.197]:59878 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244002AbiA0QnT (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Jan 2022 11:43:19 -0500
Date:   Thu, 27 Jan 2022 16:43:10 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [bug report] hwmon: Add "label" attribute
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-hwmon@vger.kernel.org
Message-Id: <YRND6R.QOHHPJC4LTBW1@crapouillou.net>
In-Reply-To: <73331bd3-a252-4e11-e84c-8dfad3f62eb0@roeck-us.net>
References: <20220127085245.GF25644@kili>
        <TI4D6R.WEHYEPI3R49G3@crapouillou.net>
        <73331bd3-a252-4e11-e84c-8dfad3f62eb0@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

Le jeu., janv. 27 2022 at 06:28:26 -0800, Guenter Roeck 
<linux@roeck-us.net> a écrit :
> On 1/27/22 01:47, Paul Cercueil wrote:
>> Hi,
>> 
>> Le jeu., janv. 27 2022 at 11:52:45 +0300, Dan Carpenter 
>> <dan.carpenter@oracle.com> a écrit :
>>> Hello Paul Cercueil,
>>> 
>>> This is a semi-automatic email about new static checker warnings.
>>> 
>>> The patch 073c3ea6c530: "hwmon: Add "label" attribute" from Jan 10,
>>> 2022, leads to the following Smatch complaint:
>>> 
>>>     drivers/hwmon/hwmon.c:825 __hwmon_device_register()
>>>     warn: variable dereferenced before check 'dev' (see line 810)
>>> 
>>> drivers/hwmon/hwmon.c
>>>    809
>>>    810        if (device_property_present(dev, "label")) {
>>>                                             ^^^
>>> The patch adds a new unchecked dereference
>> 
>> I will send a patch to address that.
>> 
>> I'm surprised that this function can be called with dev == NULL in 
>> the first place, though.
>> 
> 
> Originally it was needed for the thermal subsystem, which did not 
> provide a parent
> device. By the time that was reworked, it was (mis-)used by the 
> Loongson-3 hwmon
> driver (which was never reviewed by a hwmon maintainer and does 
> pretty much
> everything wrong).

Where is that Loongson-3 hwmon driver? I can't find it anywhere.

Maybe we can change that now?

-Paul


