Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E18EC32789
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Aug 2022 16:39:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245168AbiHWQjw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Aug 2022 12:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245169AbiHWQjY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Aug 2022 12:39:24 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80C6825584
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Aug 2022 07:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661265698; x=1692801698;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=07FK7UHFLDg6iPG/itsou6QriNlpbiVNbRTWnmOB/HA=;
  b=eYIFLH2I29g3Wt5SrxNw7a0wE72W8v+CuDqLTU2B/cTwoHb6i/nbIUuk
   4i+3j9JWNc4eIZ7DGS8gyvFEpKCdWSMDFqeA5v0CUQCRC79EQBSYzmNKl
   In/rihB9pVHsnUZM4Z94FMyo6jyFLmKNPJBQO2l00Od79w6NmhzJRNSqA
   2QKfXUm0ksNNdaB+U6kShEG0ZvwmVKSG0Y6quXOCyQ+2/Vv2Qp5Z23bG6
   LSqO5QciYGN9xtXs7WqL3jygUufFhvTwdaK9Rd88CevZD2a5tLqJrrs0Z
   rNqvS5DF6mjyezRT4oeReVKpj4WEecaxA5oHYpFwIllZavbE65iOEv18K
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="379994152"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="379994152"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 07:41:38 -0700
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="670058730"
Received: from obeltran-mobl2.ger.corp.intel.com (HELO localhost) ([10.252.51.100])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 07:41:36 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     "Nilawar, Badal" <badal.nilawar@intel.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     intel-gfx@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/7] drm/i915/hwmon: Add HWMON infrastructure
In-Reply-To: <31f5e19e-1f74-9457-e9a8-b65a5094f1e4@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220818193901.2974625-1-badal.nilawar@intel.com>
 <20220818193901.2974625-2-badal.nilawar@intel.com>
 <87ilmoo707.fsf@intel.com>
 <50a6d108-4518-c30e-5096-3ee921c75606@intel.com>
 <8735dnmgwp.fsf@intel.com> <20220823121926.GD203169@roeck-us.net>
 <8735dnkrpt.fsf@intel.com>
 <31f5e19e-1f74-9457-e9a8-b65a5094f1e4@intel.com>
Date:   Tue, 23 Aug 2022 17:41:34 +0300
Message-ID: <87r117ja3l.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 23 Aug 2022, "Nilawar, Badal" <badal.nilawar@intel.com> wrote:
> On 23-08-2022 19:05, Jani Nikula wrote:
>> On Tue, 23 Aug 2022, Guenter Roeck <linux@roeck-us.net> wrote:
>>> On Tue, Aug 23, 2022 at 12:46:14PM +0300, Jani Nikula wrote:
>>> [ ... ]
>>>>>>
>>>>>> So why not do this in i915 Kconfig:
>>>>>>
>>>>>> config DRM_I915
>>>>>> 	...
>>>>>> 	depends on HWMON || HWMON=n
>>>>> With this change I am getting recursive dependancy error when I run make
>>>>> oldconfig
>>>>>
>>>>> badal@bnilawar-desk1:~/workspace/wp3/drm-tip$ make oldconfig
>>>>>     HOSTCC  scripts/basic/fixdep
>>>>>     HOSTCC  scripts/kconfig/conf.o
>>>>>     HOSTCC  scripts/kconfig/confdata.o
>>>>>     HOSTCC  scripts/kconfig/expr.o
>>>>>     LEX     scripts/kconfig/lexer.lex.c
>>>>>     YACC    scripts/kconfig/parser.tab.[ch]
>>>>>     HOSTCC  scripts/kconfig/lexer.lex.o
>>>>>     HOSTCC  scripts/kconfig/menu.o
>>>>>     HOSTCC  scripts/kconfig/parser.tab.o
>>>>>     HOSTCC  scripts/kconfig/preprocess.o
>>>>>     HOSTCC  scripts/kconfig/symbol.o
>>>>>     HOSTCC  scripts/kconfig/util.o
>>>>>     HOSTLD  scripts/kconfig/conf
>>>>> drivers/gpu/drm/i915/Kconfig:2:error: recursive dependency detected!
>>>>> drivers/gpu/drm/i915/Kconfig:2: symbol DRM_I915 depends on HWMON
>>>>> drivers/hwmon/Kconfig:6:        symbol HWMON is selected by EEEPC_LAPTOP
>>>>> drivers/platform/x86/Kconfig:332:       symbol EEEPC_LAPTOP depends on INPUT
>>>>> drivers/input/Kconfig:8:        symbol INPUT is selected by DRM_I915
>>>>> For a resolution refer to Documentation/kbuild/kconfig-language.rst
>>>>> subsection "Kconfig recursive dependency limitations"
>>>>
>>>> *sigh*
>>>>
>>>>    Note:
>>>> 	select should be used with care. select will force
>>>> 	a symbol to a value without visiting the dependencies.
>>>> 	By abusing select you are able to select a symbol FOO even
>>>> 	if FOO depends on BAR that is not set.
>>>> 	In general use select only for non-visible symbols
>>>> 	(no prompts anywhere) and for symbols with no dependencies.
>>>> 	That will limit the usefulness but on the other hand avoid
>>>> 	the illegal configurations all over.
>>>>
>>> Agreed. HWMON should not be selected anywhere. Unfortunately it is, and
>>> drm is no exception. It is selected by DRM_RADEON and DRM_AMDGPU.
>>> Maybe just select it in DRM_I915 as well after all; in practice it won't
>>> make a difference.
>> 
>> And I guess everyone just does what I'm about to do now, throw my hands
>> up in the air in disgust and resignation. :p
> How about sticking to existing approach only. In my previous response I 
> mentioned that for combo which we want to reject CONFIG_HWMON=m && 
> CONFIG_DRM_I915=y combo i915_hwmon.o is not getting build.
> It is only getting build for below combos
> CONFIG_HWMON=m && CONFIG_DRM_I915=y
> CONFIG_HWMON=m && CONFIG_DRM_I915=m
> CONFIG_HWMON=y && CONFIG_DRM_I915=m

Then please hide the IS_REACHABLE() within i915_hwmon.h and add stubs as
is customary. Let's not clutter high level driver code with some random
#if directives.

BR,
Jani.


> Regards,
> Badal
>> 
>> BR,
>> Jani.
>> 
>> 
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
