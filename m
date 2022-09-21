Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1759EECAAD8
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Sep 2022 07:43:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbiIUHng (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Sep 2022 03:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbiIUHnc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Sep 2022 03:43:32 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F96C5EDD5
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 00:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663746211; x=1695282211;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=V+ySt9OqSbkCWlhu3IVh2aAVe7nzsdiigrVb7ptlyBE=;
  b=DUjm6at66vfgMcKOgqx7j8Pvk09G3pV1Y8unfj/ZTGrUL4bHsIwWyhPe
   dj1aWCaAPMcV06ZzwT0bjUgGjiKBSqe8PCSQ9S2NRry/R57Moo5zLurpv
   1L26Tcj2r3olTtXdQfAT2QNxFWVUULvFtY7iVMWQqR1vZLQe6uY4l5ouJ
   NY6T+KOEOjIW+mDAf1lbNeoWyEVyRKRa6r6fgM4Eky8hdgSMr2XTmFb6Q
   58L8jM+nNQ9HOm5nchYrYMCMjfskRwU4E5Z6hEZ+zSbM1UZsGaZkA2S1R
   J7DD7pom1jVdYighfb4Kq3+jCa9l/XWx/LxfnVcWMGe0gFYJ5tpJEdtPz
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="287000452"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="287000452"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 00:43:30 -0700
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="687764650"
Received: from jrcarrol-mobl.ger.corp.intel.com (HELO [10.213.205.22]) ([10.213.205.22])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 00:43:29 -0700
Message-ID: <9ec2aa09-5cc2-4bdf-e17e-7770721deb06@linux.intel.com>
Date:   Wed, 21 Sep 2022 08:43:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [PATCH 4/7] drm/i915/hwmon: Show device level energy
 usage
Content-Language: en-US
To:     "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc:     Badal Nilawar <badal.nilawar@intel.com>,
        intel-gfx@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        Riana Tauro <riana.tauro@intel.com>,
        Jon Ewins <jon.ewins@intel.com>
References: <20220825132118.784407-1-badal.nilawar@intel.com>
 <20220825132118.784407-5-badal.nilawar@intel.com>
 <ec4dd4de-5e3a-5c4b-e318-f5afc4644d0a@linux.intel.com>
 <87edw5d164.wl-ashutosh.dixit@intel.com>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <87edw5d164.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 21/09/2022 01:24, Dixit, Ashutosh wrote:
> On Tue, 13 Sep 2022 01:50:08 -0700, Tvrtko Ursulin wrote:
>>
> 
> Hi Tvrtko,
> 
>> On 25/08/2022 14:21, Badal Nilawar wrote:
>>> From: Dale B Stimson <dale.b.stimson@intel.com>
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>>> index 9a2d10edfce8..03d71c6869d3 100644
>>> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>>> @@ -25,3 +25,11 @@ Contact:	dri-devel@lists.freedesktop.org
>>>    Description:	RO. Card default power limit (default TDP setting).
>>> 			Only supported for particular Intel i915 graphics
>>> platforms.
>>> +
>>> +What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
>>> +Date:		June 2022
>>> +KernelVersion:	5.19
>>
>> Date and kernel version will need updating throughout I think.
>>
>> But why I am here actually is to ask if there are plans to make
>> intel_gpu_top support this? It would be nice to have since it reports power
>> for integrated.
> 
> There were no plans but now Riana has an IGT patch series which exposes a
> unified inteface for rapl/hwmon (igfx/dgfx):
> 
> https://patchwork.freedesktop.org/series/108185/
> 
> So perhaps we can either have intel_gpu_top use this IGT lib or if it
> doesn't, copy some functions to intel_gpu_top.

Looks promising and would be nice yeah.

On the practicalities, first thing which comes to mind that probably it 
would need to be a separate library like igt_perf and igt_device_scan, 
since so far we have avoided linking intel_gpu_top with the whole lib_igt.

Regards,

Tvrtko
