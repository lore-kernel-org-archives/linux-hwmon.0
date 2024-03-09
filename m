Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C141096F
	for <linux-hwmon@vger.kernel.org>; Sat,  9 Mar 2024 01:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709946734; cv=none; b=X0dnJ1Mi4GKpjA4JWxKbebkRoRSTZdl78ha2aW/F2KaAe0cA6wSwJZKqPXJOdXETtBhNQpcOMeSBDTqozQZyGlBFradCddB9uRwshrkatNV6Ngu7b5bEMBlLJ9rKSfMZTcNEFEQNERgnioeA0nFjhyzuvh0j5OLH4hMYoXL1eF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709946734; c=relaxed/simple;
	bh=92Y5DxoSD0tTFCmt7rh1HAuPQCb7/5cKYLgU23cxiyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BYUxWfweLhdPXLwxs0SWKJJVsOlY4F/UM+uxQiJISXKSoxUYqUHdXM/RGlFCOe7nTo7fdNqNyfe9w2LV7Tece7+HbPeDrBXtwDY/x/8+jsbS4Txt0ggwwLuOrV6TksH7ofX2XhnqE+fA2XyzkZW0kZ5S9Ixgu8+VDd7L1UJTVIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fI1aBXha; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fI1aBXha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709946732; x=1741482732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=92Y5DxoSD0tTFCmt7rh1HAuPQCb7/5cKYLgU23cxiyE=;
  b=fI1aBXhaphU6GchbH5oZvatktVrcVcEeEv7lT4IlLELvANQTdNNgX51u
   tmTXVU/GWd1O4eoUdfy8I2kREXaaDLdcuvsreWNt7rPZ0Tak+Q2HxyECu
   HlDsmOpP4tZFrcacI3HlCx7IksTIfELUk2uJqmHsfaVFN0dWBxAnK/USs
   IejfVH3biL/pwYn6o/v75oZe6z9S3FI81jFCvwx2yuWB+uwiyBPNLPCA9
   l6DUdMMSEpF6k4zBhWPa+BJtfykxePgG9kzMRvgZHbQ+ZBZ6ygZexu3ar
   VLTCZKu/YaZ2pKl9jFjvsZxDdhNHHYVD27J964jYYQwXznT0g1VkpJ/++
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="15413676"
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="15413676"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 17:12:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="33776135"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Mar 2024 17:12:09 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rilFu-0006ql-1G;
	Sat, 09 Mar 2024 01:12:06 +0000
Date: Sat, 9 Mar 2024 09:11:52 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: [groeck-staging:kunit 14/15] arch/riscv/include/asm/bug.h:73:40:
 error: '__BUG_FUNC' undeclared
Message-ID: <202403090925.9F3ftAe2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git kunit
head:   8280c85b76519939a065f6b73fde0c6328ee8ea2
commit: bdd9fe868147b04b93bf89f0dceb8554d52b8bdd [14/15] riscv: Add support for suppressing warning backtraces
config: riscv-nommu_k210_sdcard_defconfig (https://download.01.org/0day-ci/archive/20240309/202403090925.9F3ftAe2-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090925.9F3ftAe2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090925.9F3ftAe2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from arch/riscv/kernel/asm-offsets.c:10:
   include/linux/thread_info.h: In function 'check_copy_size':
>> arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:89:29: note: in expansion of macro '__BUG_FLAGS'
      89 | #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
         |                             ^~~~~~~~~~~
   include/asm-generic/bug.h:123:17: note: in expansion of macro '__WARN_FLAGS'
     123 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/thread_info.h:249:13: note: in expansion of macro 'WARN_ON_ONCE'
     249 |         if (WARN_ON_ONCE(bytes > INT_MAX))
         |             ^~~~~~~~~~~~
   arch/riscv/include/asm/bug.h:73:40: note: each undeclared identifier is reported only once for each function it appears in
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:89:29: note: in expansion of macro '__BUG_FLAGS'
      89 | #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
         |                             ^~~~~~~~~~~
   include/asm-generic/bug.h:123:17: note: in expansion of macro '__WARN_FLAGS'
     123 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/thread_info.h:249:13: note: in expansion of macro 'WARN_ON_ONCE'
     249 |         if (WARN_ON_ONCE(bytes > INT_MAX))
         |             ^~~~~~~~~~~~
   include/linux/jump_label.h: In function 'static_key_fast_inc_not_disabled':
>> arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:89:29: note: in expansion of macro '__BUG_FLAGS'
      89 | #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
         |                             ^~~~~~~~~~~
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
>> arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:89:29: note: in expansion of macro '__BUG_FLAGS'
      89 | #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
         |                             ^~~~~~~~~~~
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
>> arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:89:29: note: in expansion of macro '__BUG_FLAGS'
      89 | #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
         |                             ^~~~~~~~~~~
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
>> arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:89:29: note: in expansion of macro '__BUG_FLAGS'
      89 | #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
         |                             ^~~~~~~~~~~
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
>> arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:89:29: note: in expansion of macro '__BUG_FLAGS'
      89 | #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
         |                             ^~~~~~~~~~~
   include/asm-generic/bug.h:123:17: note: in expansion of macro '__WARN_FLAGS'
     123 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/rcupdate.h:1054:9: note: in expansion of macro 'WARN_ON_ONCE'
    1054 |         WARN_ON_ONCE(func != (rcu_callback_t)~0L);
         |         ^~~~~~~~~~~~
   include/linux/maple_tree.h: In function '__mas_set_range':
>> arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:89:29: note: in expansion of macro '__BUG_FLAGS'
      89 | #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
         |                             ^~~~~~~~~~~
   include/asm-generic/bug.h:111:33: note: in expansion of macro '__WARN_FLAGS'
     111 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:135:17: note: in expansion of macro '__WARN'
     135 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/maple_tree.h:694:41: note: in expansion of macro 'WARN_ON'
     694 | #define MAS_WARN_ON(__mas, __x)         WARN_ON(__x)
         |                                         ^~~~~~~
   include/linux/maple_tree.h:712:9: note: in expansion of macro 'MAS_WARN_ON'
     712 |         MAS_WARN_ON(mas, mas_is_active(mas) &&
         |         ^~~~~~~~~~~
   include/linux/maple_tree.h: In function 'mt_clear_in_rcu':
>> arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:89:29: note: in expansion of macro '__BUG_FLAGS'
      89 | #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
         |                             ^~~~~~~~~~~
   include/asm-generic/bug.h:111:33: note: in expansion of macro '__WARN_FLAGS'
     111 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:135:17: note: in expansion of macro '__WARN'
     135 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/maple_tree.h:804:17: note: in expansion of macro 'WARN_ON'
     804 |                 WARN_ON(!mt_lock_is_held(mt));
         |                 ^~~~~~~
   include/linux/maple_tree.h: In function 'mt_set_in_rcu':
>> arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:89:29: note: in expansion of macro '__BUG_FLAGS'
      89 | #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
         |                             ^~~~~~~~~~~
   include/asm-generic/bug.h:111:33: note: in expansion of macro '__WARN_FLAGS'
     111 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:135:17: note: in expansion of macro '__WARN'
     135 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/maple_tree.h:823:17: note: in expansion of macro 'WARN_ON'
     823 |                 WARN_ON(!mt_lock_is_held(mt));
         |                 ^~~~~~~
   include/linux/ktime.h: In function 'ktime_divns':
>> arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:89:29: note: in expansion of macro '__BUG_FLAGS'
      89 | #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
         |                             ^~~~~~~~~~~
   include/asm-generic/bug.h:111:33: note: in expansion of macro '__WARN_FLAGS'
     111 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:135:17: note: in expansion of macro '__WARN'
     135 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/ktime.h:152:9: note: in expansion of macro 'WARN_ON'
     152 |         WARN_ON(div < 0);
         |         ^~~~~~~
   include/linux/srcu.h: In function 'srcu_down_read':
>> arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:89:29: note: in expansion of macro '__BUG_FLAGS'
      89 | #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
         |                             ^~~~~~~~~~~
   include/asm-generic/bug.h:123:17: note: in expansion of macro '__WARN_FLAGS'
     123 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/srcu.h:270:9: note: in expansion of macro 'WARN_ON_ONCE'
     270 |         WARN_ON_ONCE(in_nmi());
         |         ^~~~~~~~~~~~
   include/linux/srcu.h: In function 'srcu_read_unlock':
>> arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:89:29: note: in expansion of macro '__BUG_FLAGS'
      89 | #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
         |                             ^~~~~~~~~~~
   include/asm-generic/bug.h:123:17: note: in expansion of macro '__WARN_FLAGS'
     123 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/srcu.h:285:9: note: in expansion of macro 'WARN_ON_ONCE'
     285 |         WARN_ON_ONCE(idx & ~0x1);
         |         ^~~~~~~~~~~~
   include/linux/srcu.h: In function 'srcu_read_unlock_nmisafe':
>> arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:89:29: note: in expansion of macro '__BUG_FLAGS'
      89 | #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
         |                             ^~~~~~~~~~~
   include/asm-generic/bug.h:123:17: note: in expansion of macro '__WARN_FLAGS'
     123 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/srcu.h:301:9: note: in expansion of macro 'WARN_ON_ONCE'
     301 |         WARN_ON_ONCE(idx & ~0x1);
         |         ^~~~~~~~~~~~
   include/linux/srcu.h: In function 'srcu_up_read':
>> arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:89:29: note: in expansion of macro '__BUG_FLAGS'
      89 | #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
         |                             ^~~~~~~~~~~
   include/asm-generic/bug.h:123:17: note: in expansion of macro '__WARN_FLAGS'
     123 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/srcu.h:326:9: note: in expansion of macro 'WARN_ON_ONCE'
     326 |         WARN_ON_ONCE(idx & ~0x1);
         |         ^~~~~~~~~~~~
   include/linux/memory_hotplug.h: In function 'generic_alloc_nodedata':
>> arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:85:9: note: in expansion of macro '__BUG_FLAGS'
      85 |         __BUG_FLAGS(0);                                         \
         |         ^~~~~~~~~~~
   include/linux/memory_hotplug.h:58:9: note: in expansion of macro 'BUG'
      58 |         BUG();
         |         ^~~
   include/linux/percpu-refcount.h: In function 'percpu_ref_tryget_live_rcu':
>> arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:89:29: note: in expansion of macro '__BUG_FLAGS'
      89 | #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
         |                             ^~~~~~~~~~~
   include/asm-generic/bug.h:123:17: note: in expansion of macro '__WARN_FLAGS'
     123 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/percpu-refcount.h:280:9: note: in expansion of macro 'WARN_ON_ONCE'
     280 |         WARN_ON_ONCE(!rcu_read_lock_held());
         |         ^~~~~~~~~~~~
   include/linux/memremap.h: In function 'devm_memremap_pages':
>> arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:89:29: note: in expansion of macro '__BUG_FLAGS'
      89 | #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
         |                             ^~~~~~~~~~~
   include/asm-generic/bug.h:123:17: note: in expansion of macro '__WARN_FLAGS'
     123 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/memremap.h:209:9: note: in expansion of macro 'WARN_ON_ONCE'
     209 |         WARN_ON_ONCE(1);
         |         ^~~~~~~~~~~~
   include/linux/slab.h: In function '__kmalloc_index':
>> arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:85:9: note: in expansion of macro '__BUG_FLAGS'
      85 |         __BUG_FLAGS(0);                                         \
         |         ^~~~~~~~~~~
   include/linux/slab.h:470:17: note: in expansion of macro 'BUG'
     470 |                 BUG();
         |                 ^~~
   include/linux/xarray.h: In function 'xa_mk_value':
>> arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:89:29: note: in expansion of macro '__BUG_FLAGS'
      89 | #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
         |                             ^~~~~~~~~~~
   include/asm-generic/bug.h:111:33: note: in expansion of macro '__WARN_FLAGS'
     111 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:135:17: note: in expansion of macro '__WARN'
     135 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/xarray.h:56:9: note: in expansion of macro 'WARN_ON'
      56 |         WARN_ON((long)v < 0);
         |         ^~~~~~~
   include/linux/xarray.h: In function 'xas_set_order':
>> arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:85:9: note: in expansion of macro '__BUG_FLAGS'
      85 |         __BUG_FLAGS(0);                                         \
         |         ^~~~~~~~~~~
   include/asm-generic/bug.h:78:57: note: in expansion of macro 'BUG'
      78 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^~~
   include/linux/xarray.h:1653:9: note: in expansion of macro 'BUG_ON'
    1653 |         BUG_ON(order > 0);
         |         ^~~~~~
   include/linux/uaccess.h: In function 'copy_struct_from_user':
   arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:89:29: note: in expansion of macro '__BUG_FLAGS'
      89 | #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
         |                             ^~~~~~~~~~~
   include/asm-generic/bug.h:123:17: note: in expansion of macro '__WARN_FLAGS'
     123 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/uaccess.h:355:13: note: in expansion of macro 'WARN_ON_ONCE'
     355 |         if (WARN_ON_ONCE(ksize > __builtin_object_size(dst, 1)))
         |             ^~~~~~~~~~~~
   include/linux/sched/signal.h: In function 'signal_set_stop_flags':
   arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:89:29: note: in expansion of macro '__BUG_FLAGS'
      89 | #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
         |                             ^~~~~~~~~~~
   include/asm-generic/bug.h:111:33: note: in expansion of macro '__WARN_FLAGS'
     111 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:135:17: note: in expansion of macro '__WARN'
     135 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/sched/signal.h:272:9: note: in expansion of macro 'WARN_ON'
     272 |         WARN_ON(sig->flags & SIGNAL_GROUP_EXIT);
         |         ^~~~~~~
   include/linux/sched/signal.h: In function 'restore_saved_sigmask_unless':
   arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:89:29: note: in expansion of macro '__BUG_FLAGS'
      89 | #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
         |                             ^~~~~~~~~~~
   include/asm-generic/bug.h:111:33: note: in expansion of macro '__WARN_FLAGS'
     111 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:135:17: note: in expansion of macro '__WARN'
     135 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/sched/signal.h:549:17: note: in expansion of macro 'WARN_ON'
     549 |                 WARN_ON(!signal_pending(current));
         |                 ^~~~~~~
   include/linux/quota.h: In function 'make_kqid':
   arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:85:9: note: in expansion of macro '__BUG_FLAGS'
      85 |         __BUG_FLAGS(0);                                         \
         |         ^~~~~~~~~~~
   include/linux/quota.h:114:17: note: in expansion of macro 'BUG'
     114 |                 BUG();
         |                 ^~~
   include/linux/quota.h: In function 'make_kqid_invalid':
   arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:85:9: note: in expansion of macro '__BUG_FLAGS'
      85 |         __BUG_FLAGS(0);                                         \
         |         ^~~~~~~~~~~
   include/linux/quota.h:141:17: note: in expansion of macro 'BUG'
     141 |                 BUG();
         |                 ^~~
   include/linux/mm.h: In function 'try_get_page':
   arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:89:29: note: in expansion of macro '__BUG_FLAGS'
      89 | #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
         |                             ^~~~~~~~~~~
   include/asm-generic/bug.h:123:17: note: in expansion of macro '__WARN_FLAGS'
     123 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/mm.h:1472:13: note: in expansion of macro 'WARN_ON_ONCE'
    1472 |         if (WARN_ON_ONCE(page_ref_count(page) <= 0))
         |             ^~~~~~~~~~~~
   include/linux/mm.h: In function 'handle_mm_fault':
   arch/riscv/include/asm/bug.h:73:40: error: '__BUG_FUNC' undeclared (first use in this function)
      73 |                 : "i" (__FILE__), "i" (__BUG_FUNC),             \
         |                                        ^~~~~~~~~~
   arch/riscv/include/asm/bug.h:85:9: note: in expansion of macro '__BUG_FLAGS'
      85 |         __BUG_FLAGS(0);                                         \
         |         ^~~~~~~~~~~
   include/linux/mm.h:2410:9: note: in expansion of macro 'BUG'
    2410 |         BUG();
         |         ^~~
   include/linux/mm.h: In function 'fixup_user_fault':


vim +/__BUG_FUNC +73 arch/riscv/include/asm/bug.h

    60	
    61	#ifdef CONFIG_GENERIC_BUG
    62	#define __BUG_FLAGS(flags)					\
    63	do {								\
    64		__asm__ __volatile__ (					\
    65			"1:\n\t"					\
    66				"ebreak\n"				\
    67				".pushsection __bug_table,\"aw\"\n\t"	\
    68			"2:\n\t"					\
    69				__BUG_ENTRY "\n\t"			\
    70				".org 2b + %4\n\t"                      \
    71				".popsection"				\
    72			:						\
  > 73			: "i" (__FILE__), "i" (__BUG_FUNC),		\
    74			  "i" (__LINE__),				\
    75			  "i" (flags),					\
    76			  "i" (sizeof(struct bug_entry)));              \
    77	} while (0)
    78	#else /* CONFIG_GENERIC_BUG */
    79	#define __BUG_FLAGS(flags) do {					\
    80		__asm__ __volatile__ ("ebreak\n");			\
    81	} while (0)
    82	#endif /* CONFIG_GENERIC_BUG */
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
