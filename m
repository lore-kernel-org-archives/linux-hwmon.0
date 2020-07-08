Return-Path: <SRS0=Rliy=AT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F34C433DF
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Jul 2020 11:00:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D81922063A
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Jul 2020 11:00:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728385AbgGHLAY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 8 Jul 2020 07:00:24 -0400
Received: from mga07.intel.com ([134.134.136.100]:25107 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726110AbgGHLAY (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 8 Jul 2020 07:00:24 -0400
IronPort-SDR: uCjjhkstMgJyGxPCNS6nVvLgrxWmYlKBE8O/c90J6t5N4xQjha8NPv0U4iW/Op/VDPMGKTdNp4
 3Gk40jKM5UHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="212714683"
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; 
   d="scan'208";a="212714683"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2020 04:00:23 -0700
IronPort-SDR: TSA4nmFJs62NNI1LcYSIyNfA4nqIfFkGnVwE7naNeMypFu5w1LsvB7qeKZeJzwG/KzkMV04RzV
 AtB+XZJ4U19g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; 
   d="scan'208";a="388789155"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga001.fm.intel.com with ESMTP; 08 Jul 2020 04:00:23 -0700
Received: from [10.91.127.224] (zlukwins-pc.igk.intel.com [10.91.127.224])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by linux.intel.com (Postfix) with ESMTPS id CE73C5805F0;
        Wed,  8 Jul 2020 04:00:21 -0700 (PDT)
From:   zlukwins <zbigniew.lukwinski@linux.intel.com>
Subject: Re: Maximum rate value of input power for pmbus device
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     jae.hyun.yoo@linux.intel.com, lukasz.tuz@intel.com,
        linux-hwmon@vger.kernel.org
References: <ddcb240a-5444-ba46-ecdf-70350d27125f@linux.intel.com>
 <20200629165950.GB113813@roeck-us.net>
Message-ID: <808c2d5c-e0d9-572c-a002-2a87430702c7@linux.intel.com>
Date:   Wed, 8 Jul 2020 12:50:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200629165950.GB113813@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 6/29/20 6:59 PM, Guenter Roeck wrote:
> +linux-hwmon@vger.kernel.org
>
> On Mon, Jun 29, 2020 at 08:31:11AM +0200, zlukwins wrote:
>> Hi,
>>
>>
>> I am OpenBMC FW developer working currently on some power measurement stuff.
>>
>> I would like to have maximum rated input power for pmubus device available
>> in hwmon sysfs. This value is read by MFR_PIN_MAX command:
>>
>> /MFR_PIN_MAX//
>> //The MFR_PIN_MIN command sets or retrieves the maximum rated value, in
>> watts, of//
>> //the input power./
> Interesting typo in the PMBus specification. Yes, it really does associate
> MFR_PIN_MIN - which doesn't seem to exist - with the maximum rated output
> power.
>> And I wondering which attribute shell be used to expose that value in sysfs.
>> I went through documentation
>> (https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface) and found
>> the following:
>>
>> power[1-*]_max			Maximum power.
>> 				Unit: microWatt
>> 				RW
>>
>> But it looks like it is already occupied by PIN_OP_WARN_LIMIT.
>>
>> Maybe new attribute shall be used? If so how to call that?
>>
> None of the standard attributes reports (or is supposed to report) rated
> values, so we can not just use any of those.
>
> Also, we can not just add a single attribute to handle this situation,
> for the simple reason that there are many more similar attributes.
> PMBus specifies (this is from version 1.3.1):
>
> MFR_VIN_MIN
> MFR_VIN_MAX
> MFR_IIN_MAX
> MFR_PIN_MAX
> MFR_VOUT_MIN
> MFR_VOUT_MAX
> MFR_IOUT_MAX
> MFR_POUT_MAX
> MFR_TAMBIENT_MAX
> MFR_TAMBIENT_MIN
> MFR_MAX_TEMP_{1,2.3}
>
> All those report rated values. I do see the need/desire for reporting such
> information. The only real solution I can see is to add a new set of
> attributes to the hwmon ABI. Something like:
>
> 	currentX_rated_min	# for consistency
> 	currentX_rated_max
> 	inX_rated_min
> 	inX_rated_max
> 	powerX_rated_min	# for consistency
> 	powerX_rated_max
> 	tempX_rated_min
> 	tempX_rated_max
> plus maybe, for consistency:
> 	humidityX_rated_min
> 	humidityX_rated_max
>
> Those would be read-only attributes.
>
> Thoughts, comments, feedback anyone ?
>
> Thanks,
> Guenter


I really like your proposition but I guess we need to wait few more days 
for the feedback.

But have some questions here.

What about potential next steps when we all agreed to follow that 
approach. Should documentation modification reach upstream repository 
first and then e.g. pmbus hwmon module implementation?


Thanks

Zbigniew


