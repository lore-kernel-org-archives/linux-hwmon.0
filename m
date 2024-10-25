Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6069F1FB8B3;
	Fri, 25 Oct 2024 15:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868905; cv=none; b=aBpclojUW/l/Q24sy9LhOj9JXwSZuadsjmainavDHAGUoyPoqd9G8fu+Es0xWeutsG/lFRO0X0uFuU1pHGGmpHfrpGrkVM4Qm7UK6yjow/thKjUfqfN+A0GFQjErf53y4Jwxr3qWDLxfnixQnvJEqdjC1MMttJj1+TQ/4nEnyIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868905; c=relaxed/simple;
	bh=17d/zXwR7DAxHpRRgX8HsRNtLWR+OYpu1cCPhv8+mMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFvYw+q7bX6cB+Fdk+TYDYQt3VbnkKBPIAcsNRh3H6wN9FWbOcdXuz+t9aW/91DmGFmeNkd/rsUcZqgI1uxOLxrcKOFQgBWkqfQnsq+1xi9z5dOHFTDsdUIvtEwI0Rd3U31AntvgYYRLVKg9RC+fWTtbF+ezuuTDM50D7eaKPTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVhHjcNZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVhHjcNZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729868901; x=1761404901;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=17d/zXwR7DAxHpRRgX8HsRNtLWR+OYpu1cCPhv8+mMQ=;
  b=BVhHjcNZo5I1uthfB3HTxSqErQ0tPMz28rXEQGcjyga7m6bb3CU+pL5n
   NGXqlZAgNgj7lNdtjRx08QVkEwTzMs+zRvbD+Vl2EzP4VpPtk6Q4o3yA9
   2+df5xzswmBLUTJHStJy8OTPkZ2P3OoZvi3lGmY6tMIuQ0lvm/Ebi3cQo
   Bzf8hh2+9L/fbDiCzCvhI4/LlEkaHMGK9w4k0DmhEFXsasB0QtqtP0dru
   1AE5ZJtpmosOwwq9uDYKAtdT7jRCSogiSV6vICbrqJyDMr/aZObqzLv8q
   EI/Hm1KadfrlJLOa/Il1tKSSg5HRyh/wIqf3x2VwUwSPtnf/xq6DgDGdY
   w==;
X-CSE-ConnectionGUID: P//mlLvRQ2y03gQ04DyU8A==
X-CSE-MsgGUID: sxIJxIYCRxWSeT/fcTIkSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="54945787"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="54945787"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 08:08:19 -0700
X-CSE-ConnectionGUID: ZqwCPTRcRqOG6rXyT/I5Bg==
X-CSE-MsgGUID: dHTBt65+RpWXf/EtSuMLkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="85725260"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Oct 2024 08:08:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4Lv4-000YOG-38;
	Fri, 25 Oct 2024 15:08:06 +0000
Date: Fri, 25 Oct 2024 23:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: Grant Peltier <grantpeltier93@gmail.com>, robh@kernel.org,
	linux@roeck-us.net, geert+renesas@glider.be, magnus.damm@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] hwmon: (pmbus/isl68137) add support for voltage
 divider on Vout
Message-ID: <202410252248.fyNDg737-lkp@intel.com>
References: <7138f3c551ce201ddc9b5e3889ce969d1cd0ac57.1729812789.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7138f3c551ce201ddc9b5e3889ce969d1cd0ac57.1729812789.git.grantpeltier93@gmail.com>

Hi Grant,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on robh/for-next linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Grant-Peltier/hwmon-pmbus-isl68137-add-support-for-voltage-divider-on-Vout/20241025-084244
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/7138f3c551ce201ddc9b5e3889ce969d1cd0ac57.1729812789.git.grantpeltier93%40gmail.com
patch subject: [PATCH v4 1/2] hwmon: (pmbus/isl68137) add support for voltage divider on Vout
config: arm64-randconfig-002-20241025 (https://download.01.org/0day-ci/archive/20241025/202410252248.fyNDg737-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410252248.fyNDg737-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410252248.fyNDg737-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/pmbus/isl68137.c:233:3: error: expected expression
                   u64 temp = DIV_U64_ROUND_CLOSEST((u64)word *
                   ^
>> drivers/hwmon/pmbus/isl68137.c:236:19: error: use of undeclared identifier 'temp'; did you mean 'bcmp'?
                   ret = clamp_val(temp, 0, 0xffff);
                                   ^~~~
                                   bcmp
   include/linux/minmax.h:289:47: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                                 ^
   include/linux/minmax.h:276:53: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                                       ^
   include/linux/minmax.h:122:15: note: expanded from macro '__careful_clamp'
           __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
                        ^
   include/linux/minmax.h:111:22: note: expanded from macro '__clamp_once'
           __auto_type uval = (val);                                               \
                               ^
   include/linux/string.h:271:12: note: 'bcmp' declared here
   extern int bcmp(const void *,const void *,__kernel_size_t);
              ^
>> drivers/hwmon/pmbus/isl68137.c:236:19: error: use of undeclared identifier 'temp'; did you mean 'bcmp'?
                   ret = clamp_val(temp, 0, 0xffff);
                                   ^~~~
                                   bcmp
   include/linux/minmax.h:289:53: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                                       ^
   include/linux/minmax.h:276:59: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                                             ^
   include/linux/minmax.h:122:15: note: expanded from macro '__careful_clamp'
           __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
                        ^
   include/linux/minmax.h:111:22: note: expanded from macro '__clamp_once'
           __auto_type uval = (val);                                               \
                               ^
   include/linux/string.h:271:12: note: 'bcmp' declared here
   extern int bcmp(const void *,const void *,__kernel_size_t);
              ^
>> drivers/hwmon/pmbus/isl68137.c:236:9: error: used type 'typeof (bcmp)' (aka 'int (const void *, const void *, unsigned long)') where arithmetic or pointer type is required
                   ret = clamp_val(temp, 0, 0xffff);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:289:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:276:52: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                      ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:122:15: note: expanded from macro '__careful_clamp'
           __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
           ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:111:22: note: expanded from macro '__clamp_once'
           __auto_type uval = (val);                                               \
                               ^~~
>> drivers/hwmon/pmbus/isl68137.c:236:19: error: use of undeclared identifier 'temp'; did you mean 'bcmp'?
                   ret = clamp_val(temp, 0, 0xffff);
                                   ^~~~
                                   bcmp
   include/linux/minmax.h:289:47: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                                 ^
   include/linux/minmax.h:276:66: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                                                    ^
   include/linux/minmax.h:122:20: note: expanded from macro '__careful_clamp'
           __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
                             ^
   include/linux/minmax.h:112:21: note: expanded from macro '__clamp_once'
           __auto_type ulo = (lo);                                                 \
                              ^
   include/linux/string.h:271:12: note: 'bcmp' declared here
   extern int bcmp(const void *,const void *,__kernel_size_t);
              ^
>> drivers/hwmon/pmbus/isl68137.c:236:9: error: used type 'typeof (bcmp)' (aka 'int (const void *, const void *, unsigned long)') where arithmetic or pointer type is required
                   ret = clamp_val(temp, 0, 0xffff);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:289:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:276:65: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:122:20: note: expanded from macro '__careful_clamp'
           __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
           ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:112:21: note: expanded from macro '__clamp_once'
           __auto_type ulo = (lo);                                                 \
                              ^~
>> drivers/hwmon/pmbus/isl68137.c:236:19: error: use of undeclared identifier 'temp'; did you mean 'bcmp'?
                   ret = clamp_val(temp, 0, 0xffff);
                                   ^~~~
                                   bcmp
   include/linux/minmax.h:289:47: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                                 ^
   include/linux/minmax.h:276:78: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                                                                ^
   include/linux/minmax.h:122:24: note: expanded from macro '__careful_clamp'
           __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
                                 ^
   include/linux/minmax.h:113:21: note: expanded from macro '__clamp_once'
           __auto_type uhi = (hi);                                                 \
                              ^
   include/linux/string.h:271:12: note: 'bcmp' declared here
   extern int bcmp(const void *,const void *,__kernel_size_t);
              ^
>> drivers/hwmon/pmbus/isl68137.c:236:9: error: used type 'typeof (bcmp)' (aka 'int (const void *, const void *, unsigned long)') where arithmetic or pointer type is required
                   ret = clamp_val(temp, 0, 0xffff);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:289:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:276:77: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/minmax.h:122:24: note: expanded from macro '__careful_clamp'
           __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:113:21: note: expanded from macro '__clamp_once'
           __auto_type uhi = (hi);                                                 \
                              ^~
>> drivers/hwmon/pmbus/isl68137.c:236:19: error: use of undeclared identifier 'temp'; did you mean 'bcmp'?
                   ret = clamp_val(temp, 0, 0xffff);
                                   ^~~~
                                   bcmp
   include/linux/minmax.h:289:47: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                                 ^
   include/linux/minmax.h:276:66: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                                                    ^
   include/linux/minmax.h:122:20: note: expanded from macro '__careful_clamp'
           __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
                             ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:293:48: note: expanded from macro '__is_constexpr'
           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                                                         ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                                    ^
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^
   include/linux/string.h:271:12: note: 'bcmp' declared here
   extern int bcmp(const void *,const void *,__kernel_size_t);
              ^
>> drivers/hwmon/pmbus/isl68137.c:236:9: error: used type 'typeof (bcmp)' (aka 'int (const void *, const void *, unsigned long)') where arithmetic or pointer type is required
                   ret = clamp_val(temp, 0, 0xffff);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:289:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:276:65: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:122:20: note: expanded from macro '__careful_clamp'
           __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
           ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:293:48: note: expanded from macro '__is_constexpr'
           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                                                         ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
>> drivers/hwmon/pmbus/isl68137.c:236:19: error: use of undeclared identifier 'temp'; did you mean 'bcmp'?
                   ret = clamp_val(temp, 0, 0xffff);
                                   ^~~~
                                   bcmp
   include/linux/minmax.h:289:47: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                                 ^
   include/linux/minmax.h:276:78: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                                                                ^
   include/linux/minmax.h:122:24: note: expanded from macro '__careful_clamp'
           __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
                                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:293:48: note: expanded from macro '__is_constexpr'
           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                                                         ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                                    ^
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^
   include/linux/string.h:271:12: note: 'bcmp' declared here
   extern int bcmp(const void *,const void *,__kernel_size_t);
              ^
>> drivers/hwmon/pmbus/isl68137.c:236:9: error: used type 'typeof (bcmp)' (aka 'int (const void *, const void *, unsigned long)') where arithmetic or pointer type is required
                   ret = clamp_val(temp, 0, 0xffff);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:289:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:276:77: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/minmax.h:122:24: note: expanded from macro '__careful_clamp'
           __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:293:48: note: expanded from macro '__is_constexpr'
           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                                                         ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
>> drivers/hwmon/pmbus/isl68137.c:236:19: error: use of undeclared identifier 'temp'; did you mean 'bcmp'?
                   ret = clamp_val(temp, 0, 0xffff);
                                   ^~~~
                                   bcmp
   include/linux/minmax.h:289:47: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                                 ^
   include/linux/minmax.h:276:53: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                                       ^
   include/linux/minmax.h:122:15: note: expanded from macro '__careful_clamp'
           __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
                        ^
   note: (skipping 9 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:497:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^
   include/linux/string.h:271:12: note: 'bcmp' declared here
   extern int bcmp(const void *,const void *,__kernel_size_t);
              ^
>> drivers/hwmon/pmbus/isl68137.c:236:19: error: use of undeclared identifier 'temp'; did you mean 'bcmp'?
                   ret = clamp_val(temp, 0, 0xffff);
                                   ^~~~
                                   bcmp
   include/linux/minmax.h:289:53: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                                       ^
   include/linux/minmax.h:276:59: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                                             ^
   include/linux/minmax.h:122:15: note: expanded from macro '__careful_clamp'
           __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
                        ^
   note: (skipping 9 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:497:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^
   include/linux/string.h:271:12: note: 'bcmp' declared here
   extern int bcmp(const void *,const void *,__kernel_size_t);
              ^
>> drivers/hwmon/pmbus/isl68137.c:236:9: error: used type 'typeof (bcmp)' (aka 'int (const void *, const void *, unsigned long)') where arithmetic or pointer type is required
                   ret = clamp_val(temp, 0, 0xffff);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:289:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:276:52: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                      ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:122:15: note: expanded from macro '__careful_clamp'
           __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
           ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 9 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:497:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ~~~~~~^~~~~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> drivers/hwmon/pmbus/isl68137.c:236:19: error: use of undeclared identifier 'temp'; did you mean 'bcmp'?
                   ret = clamp_val(temp, 0, 0xffff);
                                   ^~~~
                                   bcmp
   include/linux/minmax.h:289:47: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                                 ^
   include/linux/minmax.h:276:53: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                                       ^
   include/linux/minmax.h:122:15: note: expanded from macro '__careful_clamp'
           __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
                        ^
   note: (skipping 9 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:497:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^
   include/linux/string.h:271:12: note: 'bcmp' declared here
   extern int bcmp(const void *,const void *,__kernel_size_t);
              ^
>> drivers/hwmon/pmbus/isl68137.c:236:19: error: use of undeclared identifier 'temp'; did you mean 'bcmp'?
                   ret = clamp_val(temp, 0, 0xffff);
                                   ^~~~
                                   bcmp
   include/linux/minmax.h:289:53: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                                       ^
   include/linux/minmax.h:276:59: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                                             ^
   include/linux/minmax.h:122:15: note: expanded from macro '__careful_clamp'
           __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
                        ^
   note: (skipping 9 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:497:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^
   include/linux/string.h:271:12: note: 'bcmp' declared here
   extern int bcmp(const void *,const void *,__kernel_size_t);
              ^
>> drivers/hwmon/pmbus/isl68137.c:236:9: error: used type 'typeof (bcmp)' (aka 'int (const void *, const void *, unsigned long)') where arithmetic or pointer type is required
                   ret = clamp_val(temp, 0, 0xffff);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:289:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:276:52: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                      ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:122:15: note: expanded from macro '__careful_clamp'
           __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
           ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 9 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:497:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ~~~~~~^~~~~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> drivers/hwmon/pmbus/isl68137.c:236:19: error: use of undeclared identifier 'temp'; did you mean 'bcmp'?
                   ret = clamp_val(temp, 0, 0xffff);
                                   ^~~~
                                   bcmp
   include/linux/minmax.h:289:47: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                                 ^
   include/linux/minmax.h:276:66: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                                                    ^
   include/linux/minmax.h:122:20: note: expanded from macro '__careful_clamp'
           __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
                             ^
   note: (skipping 9 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:497:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^
   include/linux/string.h:271:12: note: 'bcmp' declared here
   extern int bcmp(const void *,const void *,__kernel_size_t);
              ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +233 drivers/hwmon/pmbus/isl68137.c

   211	
   212	static int raa_dmpvr2_write_word_data(struct i2c_client *client, int page,
   213					      int reg, u16 word)
   214	{
   215		const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
   216		const struct isl68137_data *data = to_isl68137_data(info);
   217		int ret;
   218	
   219		switch (reg) {
   220		case PMBUS_VOUT_MAX:
   221		case PMBUS_VOUT_MARGIN_HIGH:
   222		case PMBUS_VOUT_MARGIN_LOW:
   223		case PMBUS_VOUT_OV_FAULT_LIMIT:
   224		case PMBUS_VOUT_UV_FAULT_LIMIT:
   225		case PMBUS_VOUT_COMMAND:
   226			/*
   227			 * In cases where a voltage divider is attached to the target
   228			 * rail between Vout and the Vsense pin, Vout related PMBus
   229			 * commands should be scaled based on the expected voltage
   230			 * at the Vsense pin.
   231			 * I.e. Vsense = Vout * Rout / Rtotal
   232			 */
 > 233			u64 temp = DIV_U64_ROUND_CLOSEST((u64)word *
   234					data->channel[page].vout_voltage_divider[0],
   235					data->channel[page].vout_voltage_divider[1]);
 > 236			ret = clamp_val(temp, 0, 0xffff);
   237			break;
   238		default:
   239			ret = -ENODATA;
   240			break;
   241		}
   242		return ret;
   243	}
   244	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
