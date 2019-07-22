Return-Path: <SRS0=+gze=VT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A30C7618F
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 18:11:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A86102190D
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 18:11:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbfGVSLg convert rfc822-to-8bit (ORCPT
        <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Jul 2019 14:11:36 -0400
Received: from endrift.com ([173.255.198.10]:44298 "EHLO endrift.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726343AbfGVSLg (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Jul 2019 14:11:36 -0400
Received: from [10.1.10.210] (c-67-180-122-246.hsd1.ca.comcast.net [67.180.122.246])
        by endrift.com (Postfix) with ESMTPSA id 866D7A067;
        Mon, 22 Jul 2019 11:11:35 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 1/2] x86/amd_nb: Add PCI device IDs for family 17h, model 71h
From:   Vicki Pfau <vi@endrift.com>
X-Mailer: iPhone Mail (16F203)
In-Reply-To: <5be62ebf-0930-3ea5-6e0c-936e21450725@gmail.com>
Date:   Mon, 22 Jul 2019 11:11:34 -0700
Cc:     "Woods, Brian" <Brian.Woods@amd.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "x86@kernel.org" <x86@kernel.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <9E38F05F-8906-42F8-AB63-EEF2F2DBAD57@endrift.com>
References: <20190718182617.6964-1-marcel.p.bocu@gmail.com> <20190718193330.GA23809@roeck-us.net> <690c10a3-0f5f-6ba7-9dc9-b7150b300dd1@gmail.com> <91c6b4cb-2ae4-c2fb-faf4-110b2c426901@roeck-us.net> <33703f78-c704-b904-8643-59a1fb1849fa@gmail.com> <20190719160840.GA26100@roeck-us.net> <alpine.DEB.2.21.1907221057410.1782@nanos.tec.linutronix.de> <20190722091245.GA23240@nazgul.tnic> <20190722160420.GA16162@amd.com> <20190722165105.GA9336@roeck-us.net> <20190722173928.GA16597@amd.com> <5be62ebf-0930-3ea5-6e0c-936e21450725@gmail.com>
To:     Marcel Bocu <marcel.p.bocu@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

I'm getting similar variance. Compiling Linux seems to spike the temperature above 70, even with a new CPU cooler, so I'm wondering if there might be an offset I'm missing. It may just be the fan being too slow (going to be reconfiguring the BIOS settings today).

The reason I haven't replied sooner is because I've been busy with a new job, and I wasn't sure if my phone would send a properly (un)formatted email. I'm fine with whosever patch gets in, so long as temperature reading works on my machine.

Also, for what it's worth, I'm not a "he". Vicki is generally a female name.

Vicki

>> On Jul 22, 2019, at 11:04 AM, Marcel Bocu <marcel.p.bocu@gmail.com> wrote:
>> 
>>> On 22/07/2019 20:39, Woods, Brian wrote:
>>> On Mon, Jul 22, 2019 at 09:51:05AM -0700, Guenter Roeck wrote:
>>> 
>>> With 3900X, and the series applied, I get:
>>> 
>>> k10temp-pci-00c3
>>> Adapter: PCI adapter
>>> Tdie:         +45.1°C  (high = +70.0°C)
>>> Tctl:         +45.1°C  
>>> 
>>> which looks about right.
>>> 
>>> Interesting, though. I thought there are two CPU dies on this chip.
>>> I guess the temperature sensor is on the IO block ? If so, are there
>>> additional sensors on the CPU dies ?
>>> 
>>> Guenter
>> 
>> That's good to know.  Thanks for testing it.
>> 
>> What happens is the IOD takes the max temperature of the chiplets in the
>> package and presents that as the temperature of the package.  It works
>> the same way as it does in Rome (server parts).  For better or worse,
>> you just get the max temperature of the chiplets rather than the
>> temperatures of the individual chiplets.
> 
> Out of curiosity, is it the maximum temperature of all chiplets, or just
> the non-powergated ones? Because this might explain why I get so much
> variance in the idle temperature (40 <-> 50°C in a matter of a second
> with a mostly-idle processor). This variance is visible on linux, but
> not at all on the firmware's configuration interface.
> 
> One other option would be the stock fan not being tight-enough... but
> apparently quite a few people have the issue. I'll try tightening it!
> 
> Marcel

