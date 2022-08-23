Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9648C32789
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Aug 2022 17:07:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344023AbiHWRHs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Aug 2022 13:07:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346698AbiHWRGt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Aug 2022 13:06:49 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757E4A5C68
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Aug 2022 06:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661261747; x=1692797747;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=U6ob9CnwsfWm7TPeZ+gLxGHBxjJ5Og69koiNr0SEo2g=;
  b=USRErL4bHtgpdv9MHQq7dTXFzVD5bfDcyQ+MJxgHZu1rVjyK2Htm9Y+q
   eOsE09UJANQOnvo0Ep6WzZt64yD6GBmlmmiOB31B2alkvv4zAA0m7OAc/
   Z8SwEzqFV6IBHjdSCc7NURRwwnMsdTZoSMjLijhvOWH6Ez0/Ht4+dbNmS
   uzQwIEq0CjAkuS/DqxBql13Hd2B1ZZ3KZ/tHsMMHBdUSzBIqKE5yodHBF
   jODC3/KzL8L/ACKhBYQ20XQKMqLf4VMy3kxDQaiK+ZYc+sAOSLuOgpSSt
   w9Ur3GOPxC/IVs6gYqk51ScqekP0gORNU7V2WA2K+OakbAiBZBMmvfhTQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="294970300"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="294970300"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 06:35:47 -0700
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="638658080"
Received: from obeltran-mobl2.ger.corp.intel.com (HELO localhost) ([10.252.51.100])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 06:35:45 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     "Nilawar, Badal" <badal.nilawar@intel.com>,
        intel-gfx@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/7] drm/i915/hwmon: Add HWMON infrastructure
In-Reply-To: <20220823121926.GD203169@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220818193901.2974625-1-badal.nilawar@intel.com>
 <20220818193901.2974625-2-badal.nilawar@intel.com>
 <87ilmoo707.fsf@intel.com>
 <50a6d108-4518-c30e-5096-3ee921c75606@intel.com>
 <8735dnmgwp.fsf@intel.com> <20220823121926.GD203169@roeck-us.net>
Date:   Tue, 23 Aug 2022 16:35:42 +0300
Message-ID: <8735dnkrpt.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 23 Aug 2022, Guenter Roeck <linux@roeck-us.net> wrote:
> On Tue, Aug 23, 2022 at 12:46:14PM +0300, Jani Nikula wrote:
> [ ... ]
>> >> 
>> >> So why not do this in i915 Kconfig:
>> >> 
>> >> config DRM_I915
>> >> 	...
>> >> 	depends on HWMON || HWMON=n
>> > With this change I am getting recursive dependancy error when I run make 
>> > oldconfig
>> >
>> > badal@bnilawar-desk1:~/workspace/wp3/drm-tip$ make oldconfig
>> >    HOSTCC  scripts/basic/fixdep
>> >    HOSTCC  scripts/kconfig/conf.o
>> >    HOSTCC  scripts/kconfig/confdata.o
>> >    HOSTCC  scripts/kconfig/expr.o
>> >    LEX     scripts/kconfig/lexer.lex.c
>> >    YACC    scripts/kconfig/parser.tab.[ch]
>> >    HOSTCC  scripts/kconfig/lexer.lex.o
>> >    HOSTCC  scripts/kconfig/menu.o
>> >    HOSTCC  scripts/kconfig/parser.tab.o
>> >    HOSTCC  scripts/kconfig/preprocess.o
>> >    HOSTCC  scripts/kconfig/symbol.o
>> >    HOSTCC  scripts/kconfig/util.o
>> >    HOSTLD  scripts/kconfig/conf
>> > drivers/gpu/drm/i915/Kconfig:2:error: recursive dependency detected!
>> > drivers/gpu/drm/i915/Kconfig:2: symbol DRM_I915 depends on HWMON
>> > drivers/hwmon/Kconfig:6:        symbol HWMON is selected by EEEPC_LAPTOP
>> > drivers/platform/x86/Kconfig:332:       symbol EEEPC_LAPTOP depends on INPUT
>> > drivers/input/Kconfig:8:        symbol INPUT is selected by DRM_I915
>> > For a resolution refer to Documentation/kbuild/kconfig-language.rst
>> > subsection "Kconfig recursive dependency limitations"
>> 
>> *sigh*
>> 
>>   Note:
>> 	select should be used with care. select will force
>> 	a symbol to a value without visiting the dependencies.
>> 	By abusing select you are able to select a symbol FOO even
>> 	if FOO depends on BAR that is not set.
>> 	In general use select only for non-visible symbols
>> 	(no prompts anywhere) and for symbols with no dependencies.
>> 	That will limit the usefulness but on the other hand avoid
>> 	the illegal configurations all over.
>> 
> Agreed. HWMON should not be selected anywhere. Unfortunately it is, and
> drm is no exception. It is selected by DRM_RADEON and DRM_AMDGPU.
> Maybe just select it in DRM_I915 as well after all; in practice it won't
> make a difference.

And I guess everyone just does what I'm about to do now, throw my hands
up in the air in disgust and resignation. :p

BR,
Jani.



-- 
Jani Nikula, Intel Open Source Graphics Center
