Return-Path: <SRS0=T2qr=BU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B43C433E0
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 Aug 2020 05:48:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28E2F20756
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 Aug 2020 05:48:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgHJFsY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 Aug 2020 01:48:24 -0400
Received: from mga14.intel.com ([192.55.52.115]:45752 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725763AbgHJFsX (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Aug 2020 01:48:23 -0400
IronPort-SDR: BWnfLhQ7jG9iG359zoQo7OhguVyqwTkWuctKzTyMWBUxHlVGlFdqa6oJsJjXiThFjwXTNAMUyJ
 Vj7snh0ZEJSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9708"; a="152696572"
X-IronPort-AV: E=Sophos;i="5.75,456,1589266800"; 
   d="scan'208";a="152696572"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2020 22:48:23 -0700
IronPort-SDR: Xma9uFcgoHZ12aF9aCZ1Wsx8W1HpsE56srGnOElGKQL4KQfvcTOjm62VMNtlWnPhfpKuIgksbD
 UUhT59yPTUOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,456,1589266800"; 
   d="scan'208";a="438568898"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga004.jf.intel.com with ESMTP; 09 Aug 2020 22:48:23 -0700
Received: from [10.91.127.224] (zlukwins-pc.igk.intel.com [10.91.127.224])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by linux.intel.com (Postfix) with ESMTPS id D3EE7580787;
        Sun,  9 Aug 2020 22:48:22 -0700 (PDT)
Subject: Re: [PATCH 0/3] Extending hwmon ABI with attributes for rated values
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
References: <1596224237-32280-1-git-send-email-zbigniew.lukwinski@linux.intel.com>
 <66a7bf34-3b2a-a61e-d382-8b2ab9ac1101@roeck-us.net>
From:   zlukwins <zbigniew.lukwinski@linux.intel.com>
Message-ID: <873bc977-0930-dfbb-921d-43dabcae8035@linux.intel.com>
Date:   Mon, 10 Aug 2020 07:39:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <66a7bf34-3b2a-a61e-d382-8b2ab9ac1101@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/7/20 5:52 PM, Guenter Roeck wrote:
> On 7/31/20 12:37 PM, Zbigniew Lukwinski wrote:
>> This patch series is about extending hwmon ABI with new attributes
>> for rated values. All of that is to cover PMBus specification which
>> provides registers reporting rated values:
>> PMBus Power System Mgt Protocol Specification - Part II – Revision 1.3.1,
>> chapters: 22.3.1 - 22.3.10, 22.3.15
>>
>> Zbigniew Lukwinski (3):
>>    docs: hwmon: Add attributes to report rated values
>>    hwmon: (core) Add support for rated attributes
>>    hwmon: (pmbus/core) Add support for rated attributes
>>
>>   Documentation/hwmon/pmbus.rst           | 15 ++++++-
>>   Documentation/hwmon/sysfs-interface.rst | 70 +++++++++++++++++++++++++++++++++
>>   drivers/hwmon/hwmon.c                   | 10 +++++
>>   drivers/hwmon/pmbus/pmbus.h             | 13 ++++++
>>   drivers/hwmon/pmbus/pmbus_core.c        | 49 +++++++++++++++++++----
>>   include/linux/hwmon.h                   | 20 ++++++++++
>>   6 files changed, 168 insertions(+), 9 deletions(-)
>>
> I have been struggling with "rated_{min,max}" vs. "{min,max}_rated",
> but then figured it does not really make a difference, and rated_ as
> prefix may actually make more sense. I'll queue the series for v5.10.
> Let's see if there is any feedback.
>
> Thanks,
> Guenter

Sure.

Thanks,

Zbigniew

