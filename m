Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8511418643
	for <linux-hwmon@vger.kernel.org>; Mon, 11 Mar 2024 09:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710150345; cv=none; b=VoASBZcjckNZWWvUMNG0Ixnw+GyiMxt648hIRGURSYG0gV5haPDAMPGOybLzIupK3lOhk6gOnPKGw7TzjlRmyNYiVXPtrlgw1bQ9VXgCD68zRDE7i2qNs6gTJirpQoHFnltsahrYDlNo113RoH35e0ckpW4os0SbhQ5Sz5YuNao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710150345; c=relaxed/simple;
	bh=hxQkMrjaHaMI3tmcI7eLbyKeUHHcef+saX4YyZU0y9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GWqIrhCn4RXWeD72/Pp7x/4Lumz13mTzowwloT0vUGI41uEutMNp72C+tSu35c1NPgEA8NLoEJxnup2RWE0ZYocOhwrgIvDkjur19fOwBbfwPHfEtoZUji1cM2eawjG4uYpTBPpC5t0sYocSKq0K2nplvqd/25BI7lU+wdA6mHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/CrVBd7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/CrVBd7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710150342; x=1741686342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hxQkMrjaHaMI3tmcI7eLbyKeUHHcef+saX4YyZU0y9I=;
  b=J/CrVBd7yc8fr3LYQWSCoM+//qvV3JbdCFuhWXjBm6s/3bIt4ZvMA+W9
   9CkLLLasdBn2lvHvsFP1u5T0IiJdridD98Bs93DgepKYGiNcK649n6Xo2
   TIxH1jzbpXzgBn6Xt8PJIe969w7VObB4yklOqua1Z2Do23nZbAN0coPhM
   VI+U4+qEffziyhBoOusCZMmuJA2qg2JrhEKQWZ/Ad112RbtE+IuMq169Y
   +nab0E2DA1+mXdBH6QsujqPRwURRF1uudf/Le1MIC3h/Af2xbcmPaxR11
   r3u8OAvPHJPCGyQXGpYGyPnZlxsyPchfTLaA2UI/TVgStcpTnIJvwMrKs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="27273865"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="27273865"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 02:45:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="42095300"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Mar 2024 02:45:40 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjcDy-00093D-0z;
	Mon, 11 Mar 2024 09:45:38 +0000
Date: Mon, 11 Mar 2024 17:44:41 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: [groeck-staging:kunit 12/14] arch/sh/include/asm/bug.h:75:25: error:
 '__BUG_FUNC' undeclared
Message-ID: <202403111729.aJdD9J6c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git kunit
head:   7de5e832565e4ad14ce709a13a5bad0337ea252f
commit: 714f83b24ef458f157efdf5b4af7b473fa79bb47 [12/14] sh: Add support for suppressing warning backtraces
config: sh-randconfig-001-20240311 (https://download.01.org/0day-ci/archive/20240311/202403111729.aJdD9J6c-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403111729.aJdD9J6c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403111729.aJdD9J6c-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from arch/sh/kernel/asm-offsets.c:14:
   include/linux/thread_info.h: In function 'check_copy_size':
>> arch/sh/include/asm/bug.h:75:25: error: '__BUG_FUNC' undeclared (first use in this function)
      75 |                    "i" (__BUG_FUNC),                    \
         |                         ^~~~~~~~~~
   include/asm-generic/bug.h:123:17: note: in expansion of macro '__WARN_FLAGS'
     123 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/thread_info.h:249:13: note: in expansion of macro 'WARN_ON_ONCE'
     249 |         if (WARN_ON_ONCE(bytes > INT_MAX))
         |             ^~~~~~~~~~~~
   arch/sh/include/asm/bug.h:75:25: note: each undeclared identifier is reported only once for each function it appears in
      75 |                    "i" (__BUG_FUNC),                    \
         |                         ^~~~~~~~~~
   include/asm-generic/bug.h:123:17: note: in expansion of macro '__WARN_FLAGS'
     123 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/thread_info.h:249:13: note: in expansion of macro 'WARN_ON_ONCE'
     249 |         if (WARN_ON_ONCE(bytes > INT_MAX))
         |             ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'set_nr_cpu_ids':
>> arch/sh/include/asm/bug.h:75:25: error: '__BUG_FUNC' undeclared (first use in this function)
      75 |                    "i" (__BUG_FUNC),                    \
         |                         ^~~~~~~~~~
   include/asm-generic/bug.h:111:33: note: in expansion of macro '__WARN_FLAGS'
     111 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   arch/sh/include/asm/bug.h:85:25: note: in expansion of macro '__WARN'
      85 |                         __WARN();                               \
         |                         ^~~~~~
   include/linux/cpumask.h:47:9: note: in expansion of macro 'WARN_ON'
      47 |         WARN_ON(nr != nr_cpu_ids);
         |         ^~~~~~~
   In file included from include/linux/seqlock.h:21,
                    from include/linux/mmzone.h:17,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7:
   include/linux/seqlock.h: In function '__seqprop_raw_spinlock_assert':
>> arch/sh/include/asm/bug.h:75:25: error: '__BUG_FUNC' undeclared (first use in this function)
      75 |                    "i" (__BUG_FUNC),                    \
         |                         ^~~~~~~~~~
   include/linux/seqlock_types.h:57:33: note: in definition of macro '__SEQ_LOCK'
      57 | #define __SEQ_LOCK(expr)        expr
         |                                 ^~~~
   include/asm-generic/bug.h:111:33: note: in expansion of macro '__WARN_FLAGS'
     111 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   arch/sh/include/asm/bug.h:85:25: note: in expansion of macro '__WARN'
      85 |                         __WARN();                               \
         |                         ^~~~~~
   include/linux/lockdep.h:261:14: note: in expansion of macro 'WARN_ON'
     261 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ^~~~~~~
   include/linux/lockdep.h:267:9: note: in expansion of macro 'lockdep_assert'
     267 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^~~~~~~~~~~~~~
   include/linux/seqlock.h:192:20: note: in expansion of macro 'lockdep_assert_held'
     192 |         __SEQ_LOCK(lockdep_assert_held(s->lock));                       \
         |                    ^~~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:226:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     226 | SEQCOUNT_LOCKNAME(raw_spinlock, raw_spinlock_t,  false,    raw_spin)
         | ^~~~~~~~~~~~~~~~~
   include/linux/seqlock.h: In function '__seqprop_spinlock_assert':
>> arch/sh/include/asm/bug.h:75:25: error: '__BUG_FUNC' undeclared (first use in this function)
      75 |                    "i" (__BUG_FUNC),                    \
         |                         ^~~~~~~~~~
   include/linux/seqlock_types.h:57:33: note: in definition of macro '__SEQ_LOCK'
      57 | #define __SEQ_LOCK(expr)        expr
         |                                 ^~~~
   include/asm-generic/bug.h:111:33: note: in expansion of macro '__WARN_FLAGS'
     111 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   arch/sh/include/asm/bug.h:85:25: note: in expansion of macro '__WARN'
      85 |                         __WARN();                               \
         |                         ^~~~~~
   include/linux/lockdep.h:261:14: note: in expansion of macro 'WARN_ON'
     261 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ^~~~~~~
   include/linux/lockdep.h:267:9: note: in expansion of macro 'lockdep_assert'
     267 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^~~~~~~~~~~~~~
   include/linux/seqlock.h:192:20: note: in expansion of macro 'lockdep_assert_held'
     192 |         __SEQ_LOCK(lockdep_assert_held(s->lock));                       \
         |                    ^~~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:227:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     227 | SEQCOUNT_LOCKNAME(spinlock,     spinlock_t,      __SEQ_RT, spin)
         | ^~~~~~~~~~~~~~~~~
   include/linux/seqlock.h: In function '__seqprop_rwlock_assert':
>> arch/sh/include/asm/bug.h:75:25: error: '__BUG_FUNC' undeclared (first use in this function)
      75 |                    "i" (__BUG_FUNC),                    \
         |                         ^~~~~~~~~~
   include/linux/seqlock_types.h:57:33: note: in definition of macro '__SEQ_LOCK'
      57 | #define __SEQ_LOCK(expr)        expr
         |                                 ^~~~
   include/asm-generic/bug.h:111:33: note: in expansion of macro '__WARN_FLAGS'
     111 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   arch/sh/include/asm/bug.h:85:25: note: in expansion of macro '__WARN'
      85 |                         __WARN();                               \
         |                         ^~~~~~
   include/linux/lockdep.h:261:14: note: in expansion of macro 'WARN_ON'
     261 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ^~~~~~~
   include/linux/lockdep.h:267:9: note: in expansion of macro 'lockdep_assert'
     267 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^~~~~~~~~~~~~~
   include/linux/seqlock.h:192:20: note: in expansion of macro 'lockdep_assert_held'
     192 |         __SEQ_LOCK(lockdep_assert_held(s->lock));                       \
         |                    ^~~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:228:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     228 | SEQCOUNT_LOCKNAME(rwlock,       rwlock_t,        __SEQ_RT, read)
         | ^~~~~~~~~~~~~~~~~
   include/linux/seqlock.h: In function '__seqprop_mutex_assert':
>> arch/sh/include/asm/bug.h:75:25: error: '__BUG_FUNC' undeclared (first use in this function)
      75 |                    "i" (__BUG_FUNC),                    \
         |                         ^~~~~~~~~~
   include/linux/seqlock_types.h:57:33: note: in definition of macro '__SEQ_LOCK'
      57 | #define __SEQ_LOCK(expr)        expr
         |                                 ^~~~
   include/asm-generic/bug.h:111:33: note: in expansion of macro '__WARN_FLAGS'
     111 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   arch/sh/include/asm/bug.h:85:25: note: in expansion of macro '__WARN'
      85 |                         __WARN();                               \
         |                         ^~~~~~
   include/linux/lockdep.h:261:14: note: in expansion of macro 'WARN_ON'
     261 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ^~~~~~~
   include/linux/lockdep.h:267:9: note: in expansion of macro 'lockdep_assert'
     267 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^~~~~~~~~~~~~~
   include/linux/seqlock.h:192:20: note: in expansion of macro 'lockdep_assert_held'
     192 |         __SEQ_LOCK(lockdep_assert_held(s->lock));                       \
         |                    ^~~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:229:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     229 | SEQCOUNT_LOCKNAME(mutex,        struct mutex,    true,     mutex)
         | ^~~~~~~~~~~~~~~~~
   include/linux/jump_label.h: In function 'static_key_fast_inc_not_disabled':
>> arch/sh/include/asm/bug.h:75:25: error: '__BUG_FUNC' undeclared (first use in this function)
      75 |                    "i" (__BUG_FUNC),                    \
         |                         ^~~~~~~~~~
   include/asm-generic/bug.h:116:25: note: in expansion of macro '__WARN_FLAGS'
     116 |                         __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                         ^~~~~~~~~~~~
   include/asm-generic/bug.h:144:17: note: in expansion of macro '__WARN_printf'
     144 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~
   include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
      81 | #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,               \
         |                                   ^~~~
   include/linux/jump_label.h:286:9: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
     286 |         STATIC_KEY_CHECK_USE(key);
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h: In function 'static_key_slow_dec':
>> arch/sh/include/asm/bug.h:75:25: error: '__BUG_FUNC' undeclared (first use in this function)
      75 |                    "i" (__BUG_FUNC),                    \
         |                         ^~~~~~~~~~
   include/asm-generic/bug.h:116:25: note: in expansion of macro '__WARN_FLAGS'
     116 |                         __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                         ^~~~~~~~~~~~
   include/asm-generic/bug.h:144:17: note: in expansion of macro '__WARN_printf'
     144 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~
   include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
      81 | #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,               \
         |                                   ^~~~
   include/linux/jump_label.h:302:9: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
     302 |         STATIC_KEY_CHECK_USE(key);
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h: In function 'static_key_enable':
>> arch/sh/include/asm/bug.h:75:25: error: '__BUG_FUNC' undeclared (first use in this function)
      75 |                    "i" (__BUG_FUNC),                    \
         |                         ^~~~~~~~~~
   include/asm-generic/bug.h:116:25: note: in expansion of macro '__WARN_FLAGS'
     116 |                         __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                         ^~~~~~~~~~~~
   include/asm-generic/bug.h:144:17: note: in expansion of macro '__WARN_printf'
     144 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~
   include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
      81 | #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,               \
         |                                   ^~~~
   include/linux/jump_label.h:319:9: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
     319 |         STATIC_KEY_CHECK_USE(key);
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h: In function 'static_key_disable':
>> arch/sh/include/asm/bug.h:75:25: error: '__BUG_FUNC' undeclared (first use in this function)
      75 |                    "i" (__BUG_FUNC),                    \
         |                         ^~~~~~~~~~
   include/asm-generic/bug.h:116:25: note: in expansion of macro '__WARN_FLAGS'
     116 |                         __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                         ^~~~~~~~~~~~
   include/asm-generic/bug.h:144:17: note: in expansion of macro '__WARN_printf'
     144 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~
   include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
      81 | #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,               \
         |                                   ^~~~
   include/linux/jump_label.h:330:9: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
     330 |         STATIC_KEY_CHECK_USE(key);
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h: In function 'rcu_head_after_call_rcu':
>> arch/sh/include/asm/bug.h:75:25: error: '__BUG_FUNC' undeclared (first use in this function)
      75 |                    "i" (__BUG_FUNC),                    \
         |                         ^~~~~~~~~~
   include/asm-generic/bug.h:123:17: note: in expansion of macro '__WARN_FLAGS'
     123 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/rcupdate.h:1054:9: note: in expansion of macro 'WARN_ON_ONCE'
    1054 |         WARN_ON_ONCE(func != (rcu_callback_t)~0L);
         |         ^~~~~~~~~~~~
   include/linux/maple_tree.h: In function 'mt_clear_in_rcu':
>> arch/sh/include/asm/bug.h:75:25: error: '__BUG_FUNC' undeclared (first use in this function)
      75 |                    "i" (__BUG_FUNC),                    \
         |                         ^~~~~~~~~~
   include/asm-generic/bug.h:111:33: note: in expansion of macro '__WARN_FLAGS'
     111 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   arch/sh/include/asm/bug.h:85:25: note: in expansion of macro '__WARN'
      85 |                         __WARN();                               \
         |                         ^~~~~~
   include/linux/maple_tree.h:804:17: note: in expansion of macro 'WARN_ON'
     804 |                 WARN_ON(!mt_lock_is_held(mt));
         |                 ^~~~~~~
   include/linux/maple_tree.h: In function 'mt_set_in_rcu':
>> arch/sh/include/asm/bug.h:75:25: error: '__BUG_FUNC' undeclared (first use in this function)
      75 |                    "i" (__BUG_FUNC),                    \
         |                         ^~~~~~~~~~
   include/asm-generic/bug.h:111:33: note: in expansion of macro '__WARN_FLAGS'
     111 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   arch/sh/include/asm/bug.h:85:25: note: in expansion of macro '__WARN'
      85 |                         __WARN();                               \
         |                         ^~~~~~
   include/linux/maple_tree.h:823:17: note: in expansion of macro 'WARN_ON'
     823 |                 WARN_ON(!mt_lock_is_held(mt));
         |                 ^~~~~~~
   include/linux/ktime.h: In function 'ktime_divns':
   arch/sh/include/asm/bug.h:61:25: error: '__BUG_FUNC' undeclared (first use in this function)
      61 |                    "i" (__BUG_FUNC),                    \
         |                         ^~~~~~~~~~
   include/asm-generic/bug.h:78:57: note: in expansion of macro 'BUG'
      78 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^~~
   include/linux/ktime.h:134:9: note: in expansion of macro 'BUG_ON'
     134 |         BUG_ON(div < 0);
         |         ^~~~~~
   include/linux/page-flags.h: In function 'folio_flags':
   arch/sh/include/asm/bug.h:61:25: error: '__BUG_FUNC' undeclared (first use in this function)
      61 |                    "i" (__BUG_FUNC),                    \
         |                         ^~~~~~~~~~
   include/linux/mmdebug.h:24:25: note: in expansion of macro 'BUG'
      24 |                         BUG();                                          \
         |                         ^~~
   include/linux/mmdebug.h:124:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
     124 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
         |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:313:9: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     313 |         VM_BUG_ON_PGFLAGS(PageTail(page), page);
         |         ^~~~~~~~~~~~~~~~~
   In file included from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8:
   include/linux/page-flags.h: In function 'PageLocked':
   arch/sh/include/asm/bug.h:61:25: error: '__BUG_FUNC' undeclared (first use in this function)
      61 |                    "i" (__BUG_FUNC),                    \
         |                         ^~~~~~~~~~
   include/linux/bitops.h:50:44: note: in definition of macro 'bitop'
      50 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   include/linux/page-flags.h:377:10: note: in expansion of macro 'test_bit'
     377 | { return test_bit(PG_##lname, &policy(page, 0)->flags); }
         |          ^~~~~~~~
   include/linux/mmdebug.h:24:25: note: in expansion of macro 'BUG'
      24 |                         BUG();                                          \
         |                         ^~~
   include/linux/mmdebug.h:124:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
     124 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
         |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:353:17: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     353 |                 VM_BUG_ON_PGFLAGS(enforce && PageTail(page), page);     \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:377:32: note: in expansion of macro 'PF_NO_TAIL'
     377 | { return test_bit(PG_##lname, &policy(page, 0)->flags); }
         |                                ^~~~~~
   include/linux/page-flags.h:427:9: note: in expansion of macro 'TESTPAGEFLAG'
     427 |         TESTPAGEFLAG(uname, lname, policy)                              \
         |         ^~~~~~~~~~~~
   include/linux/page-flags.h:467:1: note: in expansion of macro '__PAGEFLAG'
     467 | __PAGEFLAG(Locked, locked, PF_NO_TAIL)
         | ^~~~~~~~~~
   include/linux/page-flags.h: In function '__SetPageLocked':
   arch/sh/include/asm/bug.h:61:25: error: '__BUG_FUNC' undeclared (first use in this function)
      61 |                    "i" (__BUG_FUNC),                    \
         |                         ^~~~~~~~~~
   include/linux/bitops.h:50:44: note: in definition of macro 'bitop'
      50 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   include/linux/page-flags.h:398:3: note: in expansion of macro '__set_bit'
     398 | { __set_bit(PG_##lname, &policy(page, 1)->flags); }
         |   ^~~~~~~~~
   include/linux/mmdebug.h:24:25: note: in expansion of macro 'BUG'
      24 |                         BUG();                                          \
         |                         ^~~
   include/linux/mmdebug.h:124:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
     124 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
         |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:353:17: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     353 |                 VM_BUG_ON_PGFLAGS(enforce && PageTail(page), page);     \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:398:26: note: in expansion of macro 'PF_NO_TAIL'
     398 | { __set_bit(PG_##lname, &policy(page, 1)->flags); }
         |                          ^~~~~~
   include/linux/page-flags.h:428:9: note: in expansion of macro '__SETPAGEFLAG'
     428 |         __SETPAGEFLAG(uname, lname, policy)                             \
         |         ^~~~~~~~~~~~~
   include/linux/page-flags.h:467:1: note: in expansion of macro '__PAGEFLAG'
     467 | __PAGEFLAG(Locked, locked, PF_NO_TAIL)
         | ^~~~~~~~~~
   include/linux/page-flags.h: In function '__ClearPageLocked':
   arch/sh/include/asm/bug.h:61:25: error: '__BUG_FUNC' undeclared (first use in this function)
      61 |                    "i" (__BUG_FUNC),                    \
         |                         ^~~~~~~~~~
..


vim +/__BUG_FUNC +75 arch/sh/include/asm/bug.h

    66	
    67	#define __WARN_FLAGS(flags)				\
    68	do {							\
    69		__asm__ __volatile__ (				\
    70			"1:\t.short %O0\n"			\
    71			 _EMIT_BUG_ENTRY			\
    72			 :					\
    73			 : "n" (TRAPA_BUG_OPCODE),		\
    74			   "i" (__FILE__),			\
  > 75			   "i" (__BUG_FUNC),			\
    76			   "i" (__LINE__),			\
    77			   "i" (BUGFLAG_WARNING|(flags)),	\
    78			   "i" (sizeof(struct bug_entry)));	\
    79	} while (0)
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
