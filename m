Return-Path: <SRS0=G5pm=UL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5DBC31E46
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Jun 2019 13:35:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A23E920866
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Jun 2019 13:35:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbfFLNfy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 Jun 2019 09:35:54 -0400
Received: from mga12.intel.com ([192.55.52.136]:62044 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726747AbfFLNfy (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Jun 2019 09:35:54 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Jun 2019 06:35:52 -0700
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 Jun 2019 06:35:51 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hb3Pq-000GjC-Kt; Wed, 12 Jun 2019 21:35:50 +0800
Date:   Wed, 12 Jun 2019 21:35:12 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Cc:     kbuild-all@01.org, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Alexander Sverdlin <alexander.sverdlin@nokia.com>
Subject: [hwmon:hwmon-next 3/20] include/linux/bitfield.h:46:3: note: in
 expansion of macro 'BUILD_BUG_ON_MSG'
Message-ID: <201906122106.nCVpleND%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   de262494be7aeadd6490141882abead884c0c06f
commit: 82f1bdf369ce46f4baf26e3f15cfb161b945604e [3/20] hwmon: (pmbus/adm1275) support PMBUS_VIRT_*_SAMPLES
config: x86_64-randconfig-a0-06121911 (attached as .config)
compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
reproduce:
        git checkout 82f1bdf369ce46f4baf26e3f15cfb161b945604e
        # save the attached .config to linux build tree
        make ARCH=x86_64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   Cyclomatic Complexity 1 arch/x86/include/asm/bitops.h:fls
   Cyclomatic Complexity 1 include/linux/log2.h:__ilog2_u32
   Cyclomatic Complexity 1 include/linux/string.h:strnlen
   Cyclomatic Complexity 4 include/linux/string.h:strlen
   Cyclomatic Complexity 1 include/linux/i2c.h:i2c_get_functionality
   Cyclomatic Complexity 1 include/linux/i2c.h:i2c_check_functionality
   Cyclomatic Complexity 7 drivers/hwmon/pmbus/adm1275.c:adm1275_write_pmon_config
   Cyclomatic Complexity 144 drivers/hwmon/pmbus/adm1275.c:adm1275_write_word_data
   Cyclomatic Complexity 19 drivers/hwmon/pmbus/adm1275.c:adm1275_read_byte_data
   Cyclomatic Complexity 5 drivers/hwmon/pmbus/adm1275.c:adm1275_read_pmon_config
   Cyclomatic Complexity 32 drivers/hwmon/pmbus/adm1275.c:adm1275_read_word_data
   Cyclomatic Complexity 1 include/linux/device.h:devm_kzalloc
   Cyclomatic Complexity 2 include/linux/of.h:of_property_read_u32_array
   Cyclomatic Complexity 1 include/linux/of.h:of_property_read_u32
   Cyclomatic Complexity 57 drivers/hwmon/pmbus/adm1275.c:adm1275_probe
   Cyclomatic Complexity 1 drivers/hwmon/pmbus/adm1275.c:adm1275_driver_init
   Cyclomatic Complexity 1 drivers/hwmon/pmbus/adm1275.c:adm1275_driver_exit
   Cyclomatic Complexity 1 drivers/hwmon/pmbus/adm1275.c:_GLOBAL__sub_I_00100_0_adm1275.c
   Cyclomatic Complexity 1 drivers/hwmon/pmbus/adm1275.c:_GLOBAL__sub_D_00100_1_adm1275.c
   In file included from include/linux/export.h:45:0,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from drivers/hwmon/pmbus/adm1275.c:10:
   drivers/hwmon/pmbus/adm1275.c: In function 'adm1275_write_pmon_config':
>> include/linux/compiler.h:345:38: error: call to '__compiletime_assert_184' declared with attribute error: BUILD_BUG_ON failed: (((mask) + (1ULL << (__builtin_ffsll(mask) - 1))) & (((mask) + (1ULL << (__builtin_ffsll(mask) - 1))) - 1)) != 0
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                         ^
   include/linux/compiler.h:326:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler.h:345:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
>> include/linux/bitfield.h:46:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),  \
      ^~~~~~~~~~~~~~~~
>> include/linux/bitfield.h:81:3: note: in expansion of macro '__BF_FIELD_CHECK'
      __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
      ^~~~~~~~~~~~~~~~
>> drivers/hwmon/pmbus/adm1275.c:184:9: note: in expansion of macro 'FIELD_PREP'
     word = FIELD_PREP(mask, word) | (ret & ~mask);
            ^~~~~~~~~~
>> include/linux/compiler.h:345:38: error: call to '__compiletime_assert_184' declared with attribute error: BUILD_BUG_ON failed: (((mask) + (1ULL << (__builtin_ffsll(mask) - 1))) & (((mask) + (1ULL << (__builtin_ffsll(mask) - 1))) - 1)) != 0
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                         ^
   include/linux/compiler.h:326:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler.h:345:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
>> include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
>> include/linux/bitfield.h:54:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bitfield.h:81:3: note: in expansion of macro '__BF_FIELD_CHECK'
      __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
      ^~~~~~~~~~~~~~~~
>> drivers/hwmon/pmbus/adm1275.c:184:9: note: in expansion of macro 'FIELD_PREP'
     word = FIELD_PREP(mask, word) | (ret & ~mask);
            ^~~~~~~~~~
   drivers/hwmon/pmbus/adm1275.c: In function 'adm1275_read_pmon_config':
   include/linux/compiler.h:345:38: error: call to '__compiletime_assert_172' declared with attribute error: BUILD_BUG_ON failed: (((mask) + (1ULL << (__builtin_ffsll(mask) - 1))) & (((mask) + (1ULL << (__builtin_ffsll(mask) - 1))) - 1)) != 0
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                         ^
   include/linux/compiler.h:326:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler.h:345:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
>> include/linux/bitfield.h:46:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:95:3: note: in expansion of macro '__BF_FIELD_CHECK'
      __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: "); \
      ^~~~~~~~~~~~~~~~
>> drivers/hwmon/pmbus/adm1275.c:172:9: note: in expansion of macro 'FIELD_GET'
     return FIELD_GET(mask, (u16)ret);
            ^~~~~~~~~
   include/linux/compiler.h:345:38: error: call to '__compiletime_assert_172' declared with attribute error: BUILD_BUG_ON failed: (((mask) + (1ULL << (__builtin_ffsll(mask) - 1))) & (((mask) + (1ULL << (__builtin_ffsll(mask) - 1))) - 1)) != 0
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                         ^
   include/linux/compiler.h:326:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler.h:345:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
>> include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
>> include/linux/bitfield.h:54:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:95:3: note: in expansion of macro '__BF_FIELD_CHECK'
      __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: "); \
      ^~~~~~~~~~~~~~~~
>> drivers/hwmon/pmbus/adm1275.c:172:9: note: in expansion of macro 'FIELD_GET'
     return FIELD_GET(mask, (u16)ret);
            ^~~~~~~~~
--
   Cyclomatic Complexity 1 arch/x86/include/asm/bitops.h:fls
   Cyclomatic Complexity 1 include/linux/log2.h:__ilog2_u32
   Cyclomatic Complexity 1 include/linux/string.h:strnlen
   Cyclomatic Complexity 4 include/linux/string.h:strlen
   Cyclomatic Complexity 1 include/linux/i2c.h:i2c_get_functionality
   Cyclomatic Complexity 1 include/linux/i2c.h:i2c_check_functionality
   Cyclomatic Complexity 7 drivers/hwmon//pmbus/adm1275.c:adm1275_write_pmon_config
   Cyclomatic Complexity 144 drivers/hwmon//pmbus/adm1275.c:adm1275_write_word_data
   Cyclomatic Complexity 19 drivers/hwmon//pmbus/adm1275.c:adm1275_read_byte_data
   Cyclomatic Complexity 5 drivers/hwmon//pmbus/adm1275.c:adm1275_read_pmon_config
   Cyclomatic Complexity 32 drivers/hwmon//pmbus/adm1275.c:adm1275_read_word_data
   Cyclomatic Complexity 1 include/linux/device.h:devm_kzalloc
   Cyclomatic Complexity 2 include/linux/of.h:of_property_read_u32_array
   Cyclomatic Complexity 1 include/linux/of.h:of_property_read_u32
   Cyclomatic Complexity 57 drivers/hwmon//pmbus/adm1275.c:adm1275_probe
   Cyclomatic Complexity 1 drivers/hwmon//pmbus/adm1275.c:adm1275_driver_init
   Cyclomatic Complexity 1 drivers/hwmon//pmbus/adm1275.c:adm1275_driver_exit
   Cyclomatic Complexity 1 drivers/hwmon//pmbus/adm1275.c:_GLOBAL__sub_I_00100_0_adm1275.c
   Cyclomatic Complexity 1 drivers/hwmon//pmbus/adm1275.c:_GLOBAL__sub_D_00100_1_adm1275.c
   In file included from include/linux/export.h:45:0,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from drivers/hwmon//pmbus/adm1275.c:10:
   drivers/hwmon//pmbus/adm1275.c: In function 'adm1275_write_pmon_config':
>> include/linux/compiler.h:345:38: error: call to '__compiletime_assert_184' declared with attribute error: BUILD_BUG_ON failed: (((mask) + (1ULL << (__builtin_ffsll(mask) - 1))) & (((mask) + (1ULL << (__builtin_ffsll(mask) - 1))) - 1)) != 0
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                         ^
   include/linux/compiler.h:326:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler.h:345:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
>> include/linux/bitfield.h:46:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),  \
      ^~~~~~~~~~~~~~~~
>> include/linux/bitfield.h:81:3: note: in expansion of macro '__BF_FIELD_CHECK'
      __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
      ^~~~~~~~~~~~~~~~
   drivers/hwmon//pmbus/adm1275.c:184:9: note: in expansion of macro 'FIELD_PREP'
     word = FIELD_PREP(mask, word) | (ret & ~mask);
            ^~~~~~~~~~
>> include/linux/compiler.h:345:38: error: call to '__compiletime_assert_184' declared with attribute error: BUILD_BUG_ON failed: (((mask) + (1ULL << (__builtin_ffsll(mask) - 1))) & (((mask) + (1ULL << (__builtin_ffsll(mask) - 1))) - 1)) != 0
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                         ^
   include/linux/compiler.h:326:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler.h:345:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
>> include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
>> include/linux/bitfield.h:54:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bitfield.h:81:3: note: in expansion of macro '__BF_FIELD_CHECK'
      __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
      ^~~~~~~~~~~~~~~~
   drivers/hwmon//pmbus/adm1275.c:184:9: note: in expansion of macro 'FIELD_PREP'
     word = FIELD_PREP(mask, word) | (ret & ~mask);
            ^~~~~~~~~~
   drivers/hwmon//pmbus/adm1275.c: In function 'adm1275_read_pmon_config':
   include/linux/compiler.h:345:38: error: call to '__compiletime_assert_172' declared with attribute error: BUILD_BUG_ON failed: (((mask) + (1ULL << (__builtin_ffsll(mask) - 1))) & (((mask) + (1ULL << (__builtin_ffsll(mask) - 1))) - 1)) != 0
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                         ^
   include/linux/compiler.h:326:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler.h:345:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
>> include/linux/bitfield.h:46:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:95:3: note: in expansion of macro '__BF_FIELD_CHECK'
      __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: "); \
      ^~~~~~~~~~~~~~~~
   drivers/hwmon//pmbus/adm1275.c:172:9: note: in expansion of macro 'FIELD_GET'
     return FIELD_GET(mask, (u16)ret);
            ^~~~~~~~~
   include/linux/compiler.h:345:38: error: call to '__compiletime_assert_172' declared with attribute error: BUILD_BUG_ON failed: (((mask) + (1ULL << (__builtin_ffsll(mask) - 1))) & (((mask) + (1ULL << (__builtin_ffsll(mask) - 1))) - 1)) != 0
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                         ^
   include/linux/compiler.h:326:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler.h:345:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
>> include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
>> include/linux/bitfield.h:54:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:95:3: note: in expansion of macro '__BF_FIELD_CHECK'
      __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: "); \
      ^~~~~~~~~~~~~~~~
   drivers/hwmon//pmbus/adm1275.c:172:9: note: in expansion of macro 'FIELD_GET'
     return FIELD_GET(mask, (u16)ret);
            ^~~~~~~~~

vim +/BUILD_BUG_ON_MSG +46 include/linux/bitfield.h

3e9b3112 Jakub Kicinski 2016-08-31  43  
3e9b3112 Jakub Kicinski 2016-08-31  44  #define __BF_FIELD_CHECK(_mask, _reg, _val, _pfx)			\
3e9b3112 Jakub Kicinski 2016-08-31  45  	({								\
3e9b3112 Jakub Kicinski 2016-08-31 @46  		BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),		\
3e9b3112 Jakub Kicinski 2016-08-31  47  				 _pfx "mask is not constant");		\
e36488c8 Arnd Bergmann  2018-08-17  48  		BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");	\
3e9b3112 Jakub Kicinski 2016-08-31  49  		BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?		\
3e9b3112 Jakub Kicinski 2016-08-31  50  				 ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
3e9b3112 Jakub Kicinski 2016-08-31  51  				 _pfx "value too large for the field"); \
3e9b3112 Jakub Kicinski 2016-08-31  52  		BUILD_BUG_ON_MSG((_mask) > (typeof(_reg))~0ull,		\
3e9b3112 Jakub Kicinski 2016-08-31  53  				 _pfx "type of reg too small for mask"); \
3e9b3112 Jakub Kicinski 2016-08-31 @54  		__BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +			\
3e9b3112 Jakub Kicinski 2016-08-31  55  					      (1ULL << __bf_shf(_mask))); \
3e9b3112 Jakub Kicinski 2016-08-31  56  	})
3e9b3112 Jakub Kicinski 2016-08-31  57  
3e9b3112 Jakub Kicinski 2016-08-31  58  /**
1697599e Jakub Kicinski 2017-02-09  59   * FIELD_FIT() - check if value fits in the field
1697599e Jakub Kicinski 2017-02-09  60   * @_mask: shifted mask defining the field's length and position
1697599e Jakub Kicinski 2017-02-09  61   * @_val:  value to test against the field
1697599e Jakub Kicinski 2017-02-09  62   *
1697599e Jakub Kicinski 2017-02-09  63   * Return: true if @_val can fit inside @_mask, false if @_val is too big.
1697599e Jakub Kicinski 2017-02-09  64   */
1697599e Jakub Kicinski 2017-02-09  65  #define FIELD_FIT(_mask, _val)						\
1697599e Jakub Kicinski 2017-02-09  66  	({								\
1697599e Jakub Kicinski 2017-02-09  67  		__BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_FIT: ");	\
1697599e Jakub Kicinski 2017-02-09  68  		!((((typeof(_mask))_val) << __bf_shf(_mask)) & ~(_mask)); \
1697599e Jakub Kicinski 2017-02-09  69  	})
1697599e Jakub Kicinski 2017-02-09  70  
1697599e Jakub Kicinski 2017-02-09  71  /**
3e9b3112 Jakub Kicinski 2016-08-31  72   * FIELD_PREP() - prepare a bitfield element
3e9b3112 Jakub Kicinski 2016-08-31  73   * @_mask: shifted mask defining the field's length and position
3e9b3112 Jakub Kicinski 2016-08-31  74   * @_val:  value to put in the field
3e9b3112 Jakub Kicinski 2016-08-31  75   *
3e9b3112 Jakub Kicinski 2016-08-31  76   * FIELD_PREP() masks and shifts up the value.  The result should
3e9b3112 Jakub Kicinski 2016-08-31  77   * be combined with other fields of the bitfield using logical OR.
3e9b3112 Jakub Kicinski 2016-08-31  78   */
3e9b3112 Jakub Kicinski 2016-08-31  79  #define FIELD_PREP(_mask, _val)						\
3e9b3112 Jakub Kicinski 2016-08-31  80  	({								\
3e9b3112 Jakub Kicinski 2016-08-31 @81  		__BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");	\
3e9b3112 Jakub Kicinski 2016-08-31  82  		((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);	\
3e9b3112 Jakub Kicinski 2016-08-31  83  	})
3e9b3112 Jakub Kicinski 2016-08-31  84  

:::::: The code at line 46 was first introduced by commit
:::::: 3e9b3112ec74f192eaab976c3889e34255cae940 add basic register-field manipulation macros

:::::: TO: Jakub Kicinski <jakub.kicinski@netronome.com>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--WIyZ46R2i8wDzkSu
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICGz9AF0AAy5jb25maWcAlFxbc9w2sn7Pr5hyXpLaciLJiuLdLT2AJDgDD0kwADij0QtK
kcc+qujiM5KS+N+fboAXAATGOamttQbduDe6v240+P133y/I68vTw83L3e3N/f3Xxef94/5w
87L/uPh0d7//76Lgi4arBS2Y+gmYq7vH179//vv9hb44X/zy09lPJ28Pt+eL9f7wuL9f5E+P
n+4+v0L9u6fH777/Dv73PRQ+fIGmDv9ZfL69ffvr4odi//vdzePi15/eQe3TH+0fwJrzpmRL
neeaSb3M88uvQxH80BsqJOPN5a8n705ORt6KNMuRdOI0sSJSE1nrJVd8aqgnbIlodE12GdVd
wxqmGKnYNS08xoJJklX0nzDzRirR5YoLOZUy8ZvecrGeSrKOVYViNdX0Spm2JRdqoquVoKTQ
rCk5/J9WRGJls4hLsy33i+f9y+uXaa1wOJo2G03EUlesZury3Rmu+TCwumXQjaJSLe6eF49P
L9jCULviOamGxXvzJlasSeeun5mBlqRSDv+KbKheU9HQSi+vWTuxu5QMKGdxUnVdkzjl6jpV
g6cI50AYF8AZVWT+wcjCWjgst1ZIv7o+RoUhHiefR0ZU0JJ0ldIrLlVDanr55ofHp8f9j+Na
y53csNY5Gn0B/puryp1FyyW70vVvHe1opKtccCl1TWsudpooRfLV1GonacUytzXSgQaINGMW
n4h8ZTlwGKSqBrGFM7B4fv39+evzy/5hEtslbahguTkireAZdY66Q5Irvo1TaFnSXDHsuizh
cMr1nK+lTcEacw7jjdRsKYhC2Y+S85UrylhS8Jqwxi+TrI4x6RWjApdll+ibKAG7A0sFhw30
RpxLUEnFxoxR17ygfk8lFzkteq0BM3WEoiVC0n7m4xa6LRc065al9CV0//hx8fQp2LRJ1fJ8
LXkHfYJKVPmq4E6PRgJcloIocoSMistRoA5lA9oVKlNdEal0vsuriHQYJbqZhC0gm/bohjZK
HiXqTHBS5NDRcbYaNpQUH7ooX82l7loc8iD16u5hf3iOCb5i+VrzhoJkO001XK+uUVnXRhbH
DYPCFvrgBcujqsTWY0UVO9+WWHbu+sA/CkyPVoLka09iQooVLncwpr3oMFZsuUJRNbsi4jI1
WxJHTwlK61ZBB01sHgN5w6uuUUTsPB1niUeq5RxqDRuTt93P6ub5j8ULDGdxA0N7frl5eV7c
3N4+vT6+3D1+nrZqwwTUbjtNctOGt1wRIgqEfz6NkMZqG50p8xUcXrJZhsc0kwUqxZyCeoba
KrrmiA2kIkpGqa1k0V34B/MfBQImxySvBgVp1k/k3UJGpBrWWgNtmiH8AIwDwutIufQ4TJ2g
COc0bwemWVXT6XAoDYUVlHSZZxVzjybSStLwTl1enM8LdUVJeXl6Ma2XpUk1F3K3N55nuCxm
r/oF9Rdk3Py1/cMRh/Uoljx3i1eguuHMXD5M4AtRVgm2j5Xq8uzELcc9qcmVQz89m+SdNWoN
0KykQRun7zy56wCrWuxpBNCouUBRy65tAZhK3XQ10RkBkJ17Amy4tqRRQFSmma6pSatVlemy
6uQq1SCM8fTsvaP5Eh345SMsog2O3EXeS8G7VrrHBxBNvoyeCsts532MoWVF/Fj1dFEkcGFP
L0G0r6mIs7QArRKntq9e0A3L6TEOaCSpGIY5UFEeo2ftUbKBB3GbA6gU4AVop3j9Fc3XLYd9
RosAwCY+kV75gW9h+ovz7GQpYSSgyQEi+Vs2HEtaEQdgZdUaV8+AC+FIiflNamjNYgzHdxFF
4LJAQeCpQInvoECB65cYOg9+e14IOJO8BWsAXiPaVbM5XNQg3FFgHnBL+MPD+xbne79B2ea0
NTgRLTgNbE2by3YN/YI2x46dFWvL6UeosGs4cgzEVbhzkUuqEG/rHnwd2bpvcOCwIyw9Q7ki
TeFCP+vOWIjhlBq1F/7WTc1cp9XRLLQqwZYID9oEyxMdcEYAUCOaio21A+w0dWF+ghZxOm25
C8MkWzakKh0JNdMyBWOHBnqWMamXK9Bxnm/G4q4m47qD9YgfZFJsGEyp3wEZ6Qd6yYgQjDre
yRp5d7Wcl2gPiU+lGYAIWBAUems8Qw6zsniS0Z/zRFNPAH/aByj+wBT0tiU7CVg6MnCUWWMw
3CU2hgiDP9O0oP0mH6RhOL2SOu6i0YNBGVSnReFaIXvGoE89+hyObJ2eeJ6+AVJ9vKzdHz49
HR5uHm/3C/rn/hGgGAFgkSMYA7g8IaxE43Z4hghz1pva+JNR6PcPe5za3tS2Q4ugA1w/SGLV
ZXYQridRtwSAgQl8Tee9IlmiAZ+Nx9lIBvsmlnSAAs5hQhqaXMSAWoDW4HXY80RfEVGA4xY/
Vl1ZAi5qCXQTcczNZBGCgXONMUDfD+Elq4KjNiJdUMjGJEoXOvoRvYH54jxzHeMrE2j1frtm
zUYdUesXNOeFe1AB57YAdY2dUZdv9vefLs7f/v3+4u3F+RvvSMCC9mj1zc3h9n8wtvvzrYnj
PvdxXv1x/8mWuCHCNVjmAdg5i6TAfzQzntPquguOY42gUTRgcpn1si/P3h9jIFcY3owyDGI3
NJRox2OD5sAL6PnG6IgkunDN/UDwpNwpHHWXNpvsmSfbOdkNZliXRT5vBHQcywTGPAof0Iw6
C8UOu7mK0QiAKQ3CRwOoMHKAaMKwdLsEMVWB2gI0auGidWcFdWZu/KuBZNQeNCUwKrPqmnWC
zxyfKJsdD8uoaGxIC0y6ZFkVDll2EmN3KbLxO1Yd9NLW4P7BiY5ymMUlleEEv2RiueawUrDD
7xyMZ2KXpnLKc+lVLUzOqAbXjknS4DAKvtW8LGFBL0/+/vgJ/rs9Gf/zD7SWdZvqqDMBUUeG
SoA9lIhql2MUkDrordgBGsdI52onGQhREAhtl9bRq0CPV/Jy9IT7SxAYNrXnFcWC5lbZGfPU
Hp5u98/PT4fFy9cvNlDwaX/z8nrYP9s4ir+SMWXqThAnXVKiOkGt/+CqTiRenZHWj3E5xLo1
0Uzn2PCqKJlxMicPnirAWCwaQcJG7AECzCmqsHN6pUDaUIKP4T/kxNNd6aqVcd8HWUg9tXPM
k2NclrrOWGK4ozT08fmSsKrzQat1oXgNcluCczNqn1iMfgeHE9AeOBPLjrqRElhZgrEsz5b1
ZUecwJFFtqwxsdv4gtAYOlsDshiGMbW4WcVvSzZ1f/TCYHU4lCDaFgsJDqxDzGNs5AMs74oj
hDIDi3ZUr9/Hy1sZj87WCCzP4iRAFnVkhKNBcIHyIHmiAQvfa3sb2blwWarTNE3J3G8vr9ur
fLUMoAXGsjd+CZhSVne1OT8lKJtq54TUkMFsDrhytXTARx++ROeVVqBZPGcYWgLxtocp5v72
dDhJDqjsC1e7pRsEHIpzwKmkcwawaqmVCM93LWoW3Y4lADo4kYBP4jENUgHH7ggHIAlQeLEg
vLGJEmEp2KuMLhHixImggy5/OZ0RB7w7rXpPcUqsKpC1muuHOqVVzSWvRrUbSBqPFAoqOPpw
GI7IBF/TRmecK4xcy0Be3NhDX4DhyIouSb6bkawUzIu9zR8K8aJLrkD5x5r5gGL24An9igL2
rfTGN22OA/Tw9Hj38nTwwv6Op2WVOd/2QtTj9kQDbs/DxRRgpm4MoE+q//06LkQsh2MDZzxp
XOCMJWkgEiwe1UTqLwYDJEShYAKWSC8zRDfBfuYtQYygwHdieQhse28aRDcXu9YxK7hw/4QA
+toA52w39+swBOxX9Et6JEXylgUU1JMS70AbzVEIbIG7BSa8TP3D7Ff2dahFaAaG2NGTCGod
ybOpWLrRhINBx9tcD4lYT8ESDQKMjI1VeIyqwdLjVWlHEWzubz6enMTBpgnIgr/DJQY6RNf6
F97IgkcZbWM99D8x2uqhMsBLabxl2Do6qFbC07X4GyEmU+w6CkqwKXDFglUCGywBuOquMcas
mC2RdfBTsAncPC+GVsYAlqQ5uoGOtbjWpycnbkUoOfvlJH7bea3fnSRJ0M5JDIFdXwLFTQK5
onHUYCjoscVzNogEj71zBz+CfzimAl2P014IHGxsYhkoszFUNNQHJ3TZQP0zT4ZWIBtVt/Qh
ySQxDtlbQIvZXGos/8gYhVBdeig3ZAkviScjXRfGBYahxSPOcOJYudNVoY5EnY1LXIFKavFe
y1P7R1yimVIkRaEDZWpoVnEMx6xfnW/xCPjLDYwiTLXBVKvHDCxkYaSzb0a2FTgI6Ci3qke9
1gw+/bU/LMCK3XzeP+wfX8yEUJcunr5g8p7n5/UOeUx4HG+0rcdQ4ITOa4wz40VHMXcnBlEB
pnlCiVtqkBze5p5O96FAzitHM21/s6YaU4NYzjBwmdDDg2uFs3Vos1+D7JmDI0Hd8XUXeu01
W65UnwOFVVo3vGNKQNYU2AQ7NrSkaF3GyNik25DXrNAyqi1tW20u7HDCkbZs3hqC8FLanlMt
CrrRIFxCsIK68Ra/JVBIkXwhl4OE086IAgu1C0s7pXwwZIo30DtPNV2SeYUCJDnFbzwVQUEc
pAy6n9yS3OxEksyK2RKPxKDc14/zHbANkuVSgDQBDk0Nu0erQesBCBr1i6lhDnjXLgUpwtGG
tIicxS+FzLBzhoH4WFaNXWEO3hboWjFreFgMq7xS9QcuxntPw29EZnFP39ZNXN3bgXUS/Gro
Xa34ETZBiw4VEt4FbImgmjfV7kiX4K0nEx+N8LfUUR1+eX8T6beIhGh/RavK+YF1tCnDu2GQ
JObfewXLYP6OHlYDuuq5Zyx9oDQkSy3Kw/5/X/ePt18Xz7c399ZR8jx5PGmpVKNI7bFh9vF+
76R8Y7KRd+aGEr3kG12BPfXH65Fr2iQcd5dLUZ4cqB3NaOq/aRvNNLLX56Fg8QOcmcX+5fan
Hx1PEo6Rda0cGwlldW1/uBcj+AfGV05PvKgmsudNdnYCc/itYyLuOOKNRdbFtru/y0CPPnCl
nHi4Ac47WWYu3ElMzk787vHm8HVBH17vb2ZYgZF3Z5PfmxDBKzf2bq9kwt8m1tChg4ewFLbY
vWTqc57HmtOwZ0PzjuUQX1saQ26GXd4dHv66OewXxeHuT+/OlRbF5YPjSwCm42UZmVHJRG30
CKi9wAFhMpdMs6yE+bAmrpPKrc7LPmciHp7ifFnRsZvICMDPGa8Ihomp/efDzeLTML2PZnqG
MqRkxhkG8mxhvJVcbxzkh0HVDh9FBNnUG0xj7xPNMRkbHPIxDuS9asCLx7uX/S3C6bcf919g
CHjuJigaOCM21OWOh9sbWEeDDCWogecKb21vWSJr+QG8K9A4me+emxhIDt7ZTqInXyZeVMwu
b8zgJkjaNUacMfcpR2gw937NEwvFGp3JLQmfUjAOzgBpdeQebx3teY33IjECb+PlfTNgEnUZ
yyQqwTE3gQHAjAiUTNzN23TD5uXfTE8ETIsrANIBEXUUogq27HgXSdmWsCVGkdtc9wgiAm2h
0L3rE7zmDJIOsZcEsY+C1bNFtyO3T3Pshbverpiifs7pePEox2s5ZdKkTI2gSbDgAOKawl6/
9bLga2nL5yWe+BuAL36SFT3XyJSstjqDKdjcvIBWsyuQyIkszQADJkyqwWu2TjTgcsJie3lB
YQpMRAIQbqELatIL7X2jqRFrJNL/kOUi+kXzoyDTTnnn9wg1knJk1zzveviMSSMzYbHCbfNs
+1uUsJ/+hPeygnGAcHdsPRuDT9AK3nl+3jSFPnzV3+o7VjFR7tTEhatglwPi7BJ4sMT9RbFH
NiGYQDU65KNPhLZMrUC12Q00t5bhLufJFwqG/M28e6smv5l8jxEVjIoklFSDwVzapxlENjDJ
p9su2qZJV9gkdIvkpVE/ajcbZTHElmkOB85xsoHUYVQCLQamNKIwR1aBXjGFuty8VMJVjyg/
U91EVb3skWl8XhJOaNqwg6hW9mtNeT2Rdp2knFQjLkukqZ5s2DGfcC5W7W7Q4aoKqVYe+4dH
njHrobWvYU2OlhGwGWh9dzYnTaNEAUhuA6gLBuqifx4otk6qzxFSWN3KRbR6jDRWF5gF1rmW
YSgJnhBNswE/tAKs30eXYdliaAZMbgyyoB1w0wvliAhzvnn7+83z/uPiD5ux+OXw9Onu3ruj
Q6Z+NSJTMdQB/PnPw45TbK6cPte/ui7FsRGNbh2AUnzzB3A3zy/ffP7Xv/zHsfh+2fK44MYr
7GefL77cv36+c0HvxIev4YykVXjsdrGmNAbQG3wpoQTIfJQFD/sISyYvI8aQSlV3VscZcZja
+A1YP0oayCamTLun1iQFS8xnvTwNdJ476F6mzWM1ECoS97B6rq4JOSZ6/9w51rgU+fgYOpHN
PnCyeFStJ+POCZpIHoIzWsMI4cwUeo150fFxGqVv3k6N8egpNbpKhEVlczpdjeMbdpss2MJW
d82x9z+YpgJAFvxOx/KY7HZTGVaEbxsXa4itpHWKaA59gjYqDPNcuZgSiyaWNCWsLLbxqrPy
SXsOieA6oyX+g0DTf3Hr8NqrqK0gbUvHxAL69/729eXm9/u9+XLCwiQJvDjnOGNNWSs0t1Oj
8MNPPzdjQGg7vXkC8zy8EvsatCVzwdzr9b64Zm6+DzbZg+XxhKYGa2ZS7x+eDl8X9RQAmzni
8cvsgTjehIPe6EiMMhWZ3FHz0qRFX72/qfdQ0HApTqUfBZru46/wkozGSBsbk5ld2c845p2a
42Rv1zx6Px73caRbE+9GsV3zFYfGE6HUvZ9f3o/N00Q+wyAavElkPKYvD/v7QHMXaNOIzoNK
Gea3urPqCyzECZz9WFnkWb317XWQOYs3z3hVKrQK895tRh9H7DUVrqWb+9qvgdld+z67EJfn
J/8OkjaSiZT+rGflqy24whKh85Ba5KjqOfCPqd0pIqBWgPu2fmgwB0fMJjnELvrNtY9zuU2S
16cjrXSWCgsxl1te/joUXbecV+40rrMubi6v35W8itnJa1kPWziFqPskY9iGNp52OdQyMbR5
bMfELYfIlre/VAjfjQ6+GmAiQqZ87i2O2trmKJtEXHfYTnFq67D2qgYlxjDUFWkaiWPLPdGm
4m4CR7q/rjcPtp0VwHeYtMlXNRExj6BV1Hp+/VuTXnen1fOkU908Kqpg3ZbCizZiIR3KjNJv
9i9/PR3+AFQ71/ZwxNc0yBHGEnBaSWzHAWI4Pgb+AkvlPcoxZWHt6YBViXziUtTGMsdfplJ0
keIXeVcFHED8noOKXpM0/uxYay0SfhgifuPSTmkNJjMyFvYAprZxvyBifutilbdBZ1hsUmpS
nSGDICJONxvcsmPEJYIKWndXsYQ3w6FV1zRByHuHOp+vWeKpr624UfGrTKSWPH4v19OmbuMd
4LZoEs8LNzQqEytmh4bGKbHb03TdQhTIoEjl7VDsN98VbVqADYcg229wIBX2BTQcj4st9g5/
Lkdpiz0vG3jyLnMjRIOBHOiXb25ff7+7feO3Xhe/BF7LKHWbC19MNxe9rCMUi78eN0z28TLm
i+oi4ZDh7C+Obe3F0b29iGyuP4aatRdpKqvi7/cNMRBolySZmi0JlOkLEdsYQ24KwOIGBqpd
S2e1rRgemccAjG0S0hFGszVpuqTLC11tv9WfYQN7lPjeDFX4QTOMNKPJSiiTVrX4XTYpWbnz
LI6pC6DPxMfAFtat/80HqsLQ9Vg0HoDBXOVPhz3aLPBeXvaH2YfnZvUnC+jOpifCXwCk1+mv
rcxZZ1/VOsJb8cSnFGacXMbPVYNv1pvGwJwUA2bZQzsASFIcR2RoGspVjGtIlTi26J7BkjRp
ODde2/YrYe1/juylOwVrw1FWz5OzbAW/2h1lKfD5yRE6LmXS2lryseqCoseQZoFFAC5w3I+d
aWSBMRzZjWOr1i/rnxf//4WN601vYZMs/cIm6dPKJFn6xU1p74v00o3LcmzWZtoFzR/3L/9o
aYAVdRp0Ck5thlktXES7/VabTpiutUcttfFFnieBoMwTIFEkPlkD1iP2Aoio2nUF4Seo7Og3
EpFU/R9nz7LduI7jfr4ipxdzbi/uuZb8XtSCkiiL13pZlG2lNjruSmoqZ1JJTpLqnv77IUjJ
IinQujOLehgAKT5BAARAklObPCsL/BAFZFD5qw2++FPf0YOgYhGqR6s7VxCXOLH4N4CQEifR
4HYz8z0jr9YAbXcnx+7WaDKLxlgQgzm1WyBKMtJsnamhJYufPjq4JDUCESF7jVCkUwoIzHnK
X2qpokipuXGVSWGpMau0OJcE88FilFLo5XKhT+sAbfO0+4/MCcPA/Ypg/vJaEcVB9PqEGKFw
DkGBdwEecr8dfj3+ehTa5x/824/Hh1+2r2FH34bBwV1bm9SBqeNKYMzDYdB6qNoBFrCsWDGG
SiHsoPesx1QOb9Qez2Msm8WAPYw/VtNDikCDeNyxMLDlGQkWR/mNj9ZEdhIpt6tQ/aJHR1ya
KUZNE/+a9tyO3AwHuo7lAT5/e9D2wSRNmBR7NOlhhz/EB2S8TDN1D44PHWbUtZDs6RiKVZ0k
MbKaGB1T9oLomBpMwiPoEMOg8Qil2MUHdIh6tOzTTYq+4zeJeIxtuB4rjrK4kKnzxopn14Uv
f3v7/vT9tf1++fj8Wye8P18+Pp6+P30bi+viGBotagGC+0CGHWQ9vg5ZHtHG3qSAkqzZxYOA
ID6b0wSw49wfJqMDWN5KPdS03l2/yk8l1hGAr241JpU5b0flwlGiNHuEynjcCqiNjjYiYDKI
rXHdZ0rjiqS48UESWlZGAmbaIgV7qDUNgNmREPOY7NFgZTXD/XoMJ3Dh7WwnkOTEqbepVlEr
efH4IwyP3+7R+wCqwPoV8iMWjtijQaIYD9NosrqPZEU0hrPY4kIAVJo8GDwtU29MZUWKV5vG
OoWymeuY4sZmYmgY2JU1Cm6gMYJQO42jHJxMeAGJxfWKA3EQE7i9wdXWoqT5iZ8ZvhRPnU1X
r7CHuYzTcLXECr0ojugzjpqDINV0p1VPLFTMviw1CJ7oVSWOUG45krK7TkVeUKRzSPUC6vot
qjzkmCmrKrWLgCqWSWaNGHwzn2aXEVJadlzHskajLD+uRVJB8lJ+35r58IKD/kMleDNXNfCx
Lr+9eV9x9/n48YnIiuW+3lE8RkbqDVVRtmJ2mUudG1VvIfR7Em1WSVaRyDVIqCgeGEwlgMRp
NMKuEwLIW2u4ewDAofYJHOalruORiD4V3fH86/Hz9fXzx93D4z+fvvWBAbojQ92lbfipQZKQ
BTWPdPlZQY8QlYzA2mRh9aZHBCHHeLFGQepkrr+rMGCsfBJ6md2qaRxfzKoTpt0oipP4Y3QA
qEeAtuu7Xv0ZUsJhahyUqffXEn3wimvkNeU6FluoKnHzrEDuQ+wsilnQVp3rVAc6s4qmlkE0
jHegr3mjJXFFvDw+Pnzcfb7e/eNRNBrcRx7AdeSu0/S8YY30ELjzhMvMRCYulvnJtMj0MxNQ
jEXFe5Yal9UKIqa3PGJSRIfelbb+ti1NRrItOz5vH25bJOntdeOy2Bgn8fsmcWeHHZU58gDn
DLRMBHfDkXmMyb2lkorMzoKgMFggzvYdVw8xpY8IQnTADUG7mK4K0aZU95MF/wgIFLacXejA
rZVlTS3cUSyVImamAQd+u+w9Zag53No/ujcWrDybjIKnhxUIp+PbDD0PASOD6+z6biXAghDZ
+ohp94AC7xrYXV0opl0vK/BDG3DijHXjCH6yyk/aEUu9sxAE79kbGmDfXl8+31+fnx/fNQ6v
tvvl4RGy2wiqR40Msve/vb2+f+pnLQy7WD4RzUMq/V/xi4OpGs1+xrX423Mk2QACGVfWOZC4
iGjbAPttRp2PHj+e/uvlDKFtMA7yUoNrPesNurfIrqGi+EBeB5m+PLy9Pr3YQwbRcDLSBh0t
o+C1qo9/PX1++4FPm7kuz50EWdspRrT63bXplYWkwg1cFSmZJecMAX1P3zoGcFfYniRH5fOd
0LTUeYkBhqwwiZaiW3DSOit176YeIiQ4w2VdnDV5RFIVn9J3olJ1X4M05RNGX+zoz+dXsUTf
h4bGZ+lOrDcSvAzJtR6tgVdaFZ5kdw5FC4aapgHp0tDZIZdda66HNZHZLE66K2d/5qcgGeM4
C6qZdiA3S1SxE+q30qHpqaLGmAMUBMquZGu7FkockZ60HYV62ud6RGnZ7WTqd8fLP4A+HVPI
3hmIHVwzvRkV3RluYup3y/xwBON6zEYHO2uO0B0oy1gxrk9/MwiiE2Wa0QheVYjtnHJiTUju
J4Mb0Q3n2BXXKHIl7pkpVxgc7xCrPzrQtAjtvuBV+CjE+S5dz4ZBz3W/r6yOBpT4ISeNm6A+
kw6kObZQRYxBSbW+ghW7urx/PkEf794u7x8Wi4ISYihl/jhZCudRoypkHUfx37vs9eHX86NK
XF2/X14+VKz3XXr5tyF0yBYXpdVamb0Z3FPB71gq0T0zqEj2R1Vkf8TPlw/BGn88vY11HzlA
MTOr/JNGNLQWO8DFirb3QFce7B3SUcYOOejQeQHuoriNoSMJIG0aeAhahBZZqpEZ60Bid7TI
aK3HxAJGRVHleyGfR3XSejex/k3s4iZ2c/u7K3toLIK5I7tm1znm3RgX5mPjzjA78RVpNVcI
WOMRlQqoOCqQKc+EqB2N4eLUImPosWapCRXL07hdAxCaCU3uyUA6y2va5Y3Vrbz+L29vYNXo
gFKvk1SXb5D4yt7CXRhS7/eLC91yvyX3kJbNiRfDsl41Vk8MChYmN/GUB/4tfLjfzBY3a+Bh
4LdxKtRUJ4nQrz4fn53odLGY7Rp3F2Tm4BMEz2JHrhynlNT9FPeevhNTIueEPz5//x3kuMvT
i1DHRVVjw405IVm4XHrOpsLDbaOh0Pegvyw3M3NpZmFS+vO9v1yZcM5rf5naq5anop+uUUjU
GOiV15ENg8xzdVFD0juwKOhe/x1WCA+8y4fu+ZtO8H/6+O/fi5ffQxhCl6Yqh6AId3PNwiPv
DnMh3WRfvMUYWn9ZDHM2PR36l3IiY1sr64QQhxNgUCC8dgqZDs4V0zNY6RSdJIUXH3GtHuE3
cFjtYKz/PWojDUNQLBIixKV8Z88oQtJyNPWsYmTntuues5bAtPer8/nyrz+ENHAR6srzHRDf
fVe8bFAo7bUuqxTKKUmZrQg76SJH/ufrdJEYv426UoAZytF3ib++w9PJS9nTxze05fCXkARv
f03MdOHarKpfjO+LXD5n+fMGUokquqflX6CN5GX2bJoUHgm0T1ybMghquardfBpSohHzCkoO
XFqKltz9p/rXFxpudvdThUk4mKAqgEme01X9h92iohqxOAWWQYkL6TALbwMjkwSEWQ3+pCQC
heWnjlCnhgIPmoGOsBc1TjMsN6ORRzT9fGHYOoXEf8xZ7Uh3I7D7IvhzWCoC0GU/MWD9OtFh
hopVxK3lvCQgYG9MCZpGzsq9WIYg1puvjfSAnxZAEOsD0UOFas4Ifhs+FJQXnFM0/Cgf7cTs
dB0RaTab9XY1bpo4qhajHkC2lVZ/8teIKpEhJVI3z8QIdzlH+0ccPl+/vT7rgTx52eW5VHdo
p4xipi8DfuVQmpraLzOac7Gs25TxeXqa+dqBRaKlv2zaqNSj/jWg1Ngxanu5R8csu4fFgg47
CzJ45RufkoTktUPo4zuwwoa4i2LN4kweyvgnQ76d+3wxw0UomodpweGlC8iSzFzv5CVly1J8
KZEy4tvNzCfoXTLjqb+dzebDqCqIPzOYRDcztcAtl1ju3Z4iSLz12kjd22NkO7YzXKhNsnA1
X2I+jRH3VhtNKTzyoLNHtjEn28XG+JhgTbUYJHHsl/POWo5PmCUyotbU0TvnA9WpJLnDVhz6
sMtGRwqlJagMg827n2AJb0ntG/eXA3iJDEqH7bKf/RwVy0iz2qxvlNzOw0Z7+ukKbZrFGCyU
43azTUrKmxGOUm82W+hWR6uj2sAEa2822ghdcrn/uXzcsZePz/dfP+UrYh8/Lu9C3v0EewzU
c/cs5N+7B8E3nt7gv/obyELl1dWc/0dlGAeyWAq4WMvc9aVxLaKOxcyRgPOKFX8mCOoGpzgp
M/MpQ+5d2AvokOJ0FPLF++Pz5VN0clhgFgkY+KIha5/ZAPn01PjynocsdhQEFFrmVJSOIgKD
lhjamLx+fA4FLWR4eX+wkLJ9TvrXt2uSbf4pBkePcf0tLHj2d01fu7Y9GmU2vDXMQ++ElnQ+
oNkUw8RwkIV0CmI9hZCvzKVDAElV88ZJkZCA5KQl+MPMxvlqXISy6PqsOOSS7JXJEVuSiSaV
+9igiyIFhhbFR25l6FTzQSm98+bbxd1v8dP741n8+Tt28xezioIXAdrbHgmGzHu0xzc/c5Ww
SSjWewE57+WNgmkrJSEkGs3g3Z6gxnxr1DU8nMGWZ6T1/mdQ5JHrmUwpf+An/UHmvHQFcsSO
63wIKqWOw0x0CfwF8QpLJ+rUuDBgCTjhU7RzxGGINnDH2wSi7WDxKBzemPURb4SAtyc57jIT
qKP0ida49a3zy8sdIWV5mrmSIVehVahH1Bm2oCTYOd2ArR2ROV2QjL25NSzN3TjYLLyuXIsC
SL6Kv5xIIdjA2w9OvBAH1mt/iRvLgYBkARG6Q2T7wmkkSVGxr65xhm+4g4Egn44/m+GzLut2
o8RaK8bnDzjTaMIBouJLd5u6xmdSIkEx5ilxbA5JknB8ziRSrcqxc8GTkGKe/vELjhyu7tiJ
lgXLaGvvaPAXi1yPJ0gVn9spHk5CCBYH1Dw0Xz89CdGW4iJ8fV8mBZqiWauPRKSsqZmkXYHk
eyMxQ/MR6xXsqMlsae3NPVcigr5QSkIwBIWGyYinTAgBLgfba9Ga2k8MUJfo3wmJNZ/qREa+
Fjk64OqlqqHGLNp4nte6mFkJLMlxbwWJuZsd+vKP/kFx7OQ1MzypyMGRbFsvV4V4B2A5FRYj
TF3MIsW1XkC4dnHquQZ/ahUcq6Iy+ykhbR5sNugzO1rhoCpIZG2GYIEr/EGYwUHpcJXNG3ww
QteqqtmuyOfOyvDdqN4JsTVRvaAremLocGg99hDkmH+dVqZz3LKkKlfM2rXQiR2Nca2TYw7+
LTm8RYpHsOskp2mSwHGXptNUDhrVPkhDgKJTdjjavktIJxOacjNOrgO1Nb4Frmh85q9ofAkO
6JMreq9vmVA1jHbZ3A0pAsmxc2Mn7Si87Hg9S/A2NUIVckTWRLhkpX00Mk8NKfce8RhjvRR4
TBv+NamPpzzgYiXYaSnH9cFLBNR0+6b+ZNvpV3lbog+yhLR5CZFTuTjUMpVlc6qmxKglKb0p
vpUcyVl/TkRDsY2/bBoc1bm9D+3FPwTgmU3nEM3YDtdgBNyxg1njKmIfawNm4fw6zlz/zCZm
PCPViabGYGSnzBWUwfc7/Pt8f49ZN/UPia+QvDAWV5Y2i9YRdyJwS7dZWWD5+SY6Pk+0h4WV
uQj2fLNZ4IcXoBxOAAolvojfhuz5V1HryNCBt6cY7aM89Dd/rnDXXoFs/IXA4mgx2uvFfEJo
kF/lNMO3UHZfGc/xwG9v5lgCMSVpPvG5nNTdxwZOp0C4sso3840/wQIgorqyHg3lvmMBnxo0
aYJZXVXkRUbREcnNtjMhgdL/G4vbzLczk9P7++nVkZ/EIWwcSTKJb2QJzuOCxd5oMbz1NHH8
dcnqaL5juZk+OBGCvVih6MDeU3CtjdmEWH1Ii535iNUhJfOmwWWTQ+qUGg+pYxmKjzU0b53l
nFH7fQuPYLvMDIntEJK1YPygBeOVhnBV4MoDVWWTi6KKjDGpVrPFxKqvKGhjxtlPHCLcxptv
HZYYQNUFvlWqjbfaTjVCrBDC0Z1SQVxohaI4yYQ4YsR5cDjybDUQKUnpAa+ySIV6Lf6Yby3E
+IwIOHiUh1NKIGep+ZweD7f+bI45ShqljF0jfm4dLFqgvO3ERPOMG2uDlix0BXsA7dbzHCoT
IBdT3JQXITj7Nri9hNfywDC6V2fStDw5dcfc5CVleZ9Rhw8BLA+Km/BCCJh1mAdzhr5RrDXi
Pi9KoTsaIvM5bJt0Z+3ecdmaJsfaYKYKMlHKLAEPLgrBBdK6cUcqiTpFI1+1Ok/mSSB+tlXC
HC+9AvYEjw6wGvMN0ao9s6+WV4mCtOela8FdCeZTgrqKLtIrV5A2TcU4ulhnHEWO+yFWOnix
DAkP7IeFBxFGiLZIJtvB4pTcu0ILlcQIAt92u8xwC26ZOjKLliUO51YBaeqEe8LfP54eHu8g
BrK75pFUj48PXRApYPqwa/JweYMcWqNrrrPFv/o41vYcYYZBIB9MmZk6XzBcnZgHT3Lrkcw6
WbokHLPSTA+/1FGadQrB9io+grLim21UJRi8wZQKuADH569iPENzM+mVDtoUhqRChHOOaUU6
XR7DXQ97DMkZjtCzzOjw2kH/9T7Sz3IdJY2oNJdGEeXuIcOZ785PEJH82zjK/+8Q9vzx+Hj3
+aOnQu4dzhPptq7XTnrCiqwBmzDOLo5/spofW3faRrHzXR6iMnFCF7eL69g8Qu5/X95+fTqv
mWUAtuZ7BD9lGgIbFseQWj01vP4UBnI/qOhoA6yy3u8huuuniclIXbGmw1zDgJ7hVc6nF8El
vl8Mr7SuEFwLw2fsyjo4RFAfG7sRVywXnFEI3c0Xb+YvbtPcf1mvNibJn8W9+vQw1BJOT1a+
DgurXs/WpsHlpa4K7Ol9UJDKuIDoYYLdlculj58ZJtFm81eIMMl5IKn3Ad6MQ+3NlhOtAJr1
JI3vOcwGV5qoy85SrTbL25TpXrT3NontxI1TyNXsyAJ3JaxDslp4eEpLnWiz8CamQm2Fib5l
m7mPsxODZj5BI1jcer7cThCFOGcaCMrK8x2Gpp4mp+facbd8pYFEQGAdm/hcp4lNTFyRRjHj
SfdW4USNdXEmZ4JfJQ9Ux3xyRRWCg+HW/2ERZH5bF8cwcSWyHyjP6WI2n9gQTT3ZqJCUQr+a
WFIBmlZEY4eGTQ0Agr1i5lOFU77W4zIq8yV0HxdXJZFoy3K7xsdRUYT3pMQuvhSWghRgxAub
8Js4nhkvkijsiTdNY8TwSbBMRjLqo1DYSFmzkEN9Nzox0LmyhlyPGki17ngZWpLIZLmYvaZD
w4Crs2zomQaEAI6SVmYcto4nEV9vFpo7u4lcb9ZrV0GB294ot+18OgdVckzhMmEZpJU4xj3n
iBukILS3GXrbatAdBe9nTcgqvG/B0fdm3hzvnET6W0OR1tBgNIf3SViYb+aOI8FFv5zhR59B
f78J62zneZiKaxLWNS+tADWE4MYsdRR/ZZYU6WJ0CYKQRmQ7W/r4yEMAiliyrgYlJCt5gvut
6HSU6mqFgdmRlDT4gChcz+Fwkiacq1s4BNkJ/K7G74oiYtiVhNFDFlFa4h9nKRNLr8E/zlf8
fr3ynB8/5l8nR21fx77nOzY88FFX7TTFruR1ijMBq/R5M5s5m6hIrH2O0AnZxvM2Mw8fJCHU
LK17UgOdcc/DFGeDiKYx4fAQxQIfi0z+wHEsa1bHtK31xMUGPqeNnrXCqHe/9nzX+AghSuZM
mdyLNBIqXL1sZliuUp1Q/r+CUCzXcMn/n9F7FIMMIuTn82Uju+2oS3Hcydafo3qzbpq/xPAh
PgWC2Qvuijw0l4Y3X29wyXnUaSZ0lvlUt3kouYVjNgXan82akcvymGZqQSqq5e1K1pMdq7IW
fUPJ4CMshfeAHWuQs5Hsg1HVnj93cHheZ3HtEEb4sYpJSOdm+heDotmslo5NWZd8tZytG9co
faX1yven5vSrvMrEv1AVSdad/3PXCLEDXzpE8k7mZhwbvypji9Z8T1KCzOw4ADFz40hIFmip
cQAS60FmPcReqxLuR10gjk3veSOIb0PmBp/tYLh4r5BLQ8BR5uXL+4NMnMT+KO7AYGUEKRoN
RkJHLQr5s2Wb2cK3geLvLsh0MHdLRFhv/HCNylOKoCQVWEh+2gXLkOGakkKnLBBouxkVOdug
zpMVIRagTGUQNwtUIUZNSuyDytLBtZTYR2vQdiSjZvxtD2lzvlxutIREPTw14ueuYJodvdke
txhcieJsY8dfdt7U2FIY4oIQ06Yy3/64vF++wY3DKMi1lg8tD9ZaTDGA5+y2m7as7zWupIL9
nED18PUXf7ky1wRJ2xzSSkAqM0f2tbz4WrgcTNodx3R1mZxq9EqFgnLDTJ8f4QKrvtdmrDeX
GNBUvmwFebwgu5lx/0jhTVWkEQKxV4+/dplL3p8uz+McS90oyIchQ93tukNs/OUMBYoPlBW4
LNJIS66E0KkIanvYJSqGaxQsZ6tOFKooGEcj5Nud2Ff1NJY6gjakwjGZFDk0zqwj86o9yrRb
CwxbidXFsv9l7EmW20aS/RUf30RMT2MhFh7mAAIgCQubAZCEfGGoLU23YizLYcvvuf/+ZVYV
gFqyQB9sSZlZhaw9syqXfI0kH4e8ztSo68rXkxpDNXfkgS8TJn2LaXzPaqxfmYLFT1N9/tWB
G1hioO6DjZeOjBWq1HGhP90NXhyP9HfLtrdMkaqwd0sz0m+lggijpImQC8ZJVb9++Q0rAQib
/Owd1HTm4xWBluK7jmM0i8PNJmH3lxgVRi8wIZYp42oUqtQgAaW5rrfzvcXxXqD7Yl+cKX1x
wqdpPVLrkCOmD69V4IZFj3K+ekGho/VTVylKS6IGGReY9GrEqft+SA7YrfaKBCG5PiQcjixb
b8Z6lYl2ySnrYJP7t+sGILNrlMV+DMfQIbgV9gltf73BrOwpssCsux7iYGJxxl3js11Lm6AK
9L4vYRnqHOlUKZrwsDCYxaFI4cihwmhNywNFcNcPZB9z7awx6sf3PFvoYDj28LW8HqhjgSHU
lAbl2txtW+VR8nieomUu3SocHqfull8R26oAsbXOSjJy5/EComGdyWYFM4glXQSRDc/fFxOr
2RUsCO7fZIDRYkdOZyAhdL+4Sa4488hSixlF26JDl8UT9mJzzTu25F029MohPebpHW+oosCl
8K+lvwOtTjFaMy2tqBItrJ/yXrn/nyBT0Jwp3LEhTUo6jBiN7oRxt9uTcULghmQ+u8saHIZw
Ya8RDUg7ByXROkLZkw1mn5f7ABEsWTv5DoBIOKDV53IAVqdxjlH14/Pb89fPTz+hVcgiC6JG
8QnbwY4rDCy/TF4f1CnMq7U/ry4EWr5ig6Ic0o1PXlBNFG2abIONS32fo36uFS7qdOhKo0cw
RqwKZKmVJXrjY1U5pm2pCfOT6/9ax6pVidDBKHNb+J7ep+aZlHz+8/Xb89tfL9+1QSoPzU5J
pi6AbbqngIk8v7WK54/NuheGk9DiWrTpO2AO4H9hyIj1KNb8s4Ub+PRbxowP6Yu4GT+u4Kss
CixZJjka/TjX8NfKcrCxR0RDP5WRveWFkyMrS+5UQLZFMVqSigK2ZvdOdqa4zT2sLDotN5tA
BWjrW3u3Az60vDoL9Da0r9qzxU1c4NrOdKjGzc42R/q0ImKs4P759/e3p5d3f2CIZBE7839e
YN59/vvd08sfT49ocvi7oPoNJHIMqvkPvfYUN3ZLKD++6vviULNgL6r0rCHn8Gs2AuaGrm/W
cgWWkCJIllf5mbo+Qpx4gNYgV56drajf80jRCsFdXsE+pe5uDTO7UGGwIcjtUljq7kgfHT49
Ks2ZHKGWOP35TzhBv4DQBjS/873jQZiFGlcGjCc94JsEvJbihUJCDUnTX/PzHIWxefuLb8Hi
Y9Ls0acGsZ9L2H1fyKKndWfUJjOdToKhqAnCgCKqk3V68Mhw9lhmMwnu8jdIbIHIZYFl5tpX
HoRTzP4FMBFwmxK2LhJeiYKoKDItkZRDws3xvGWYdOEEW0n18F0k550OoMwcYyzHNS5aJ0H0
WLCf3KvIwg+csLtE8wtB8GmAuvclZb6O+MktWwkGuWwIRo9cVsJAAlJEuFfKoIK9L/NRe5eX
KEQuHaVUWUXOtSwpH15EM1Wu2Kl8I9CIbNnA8ivqe52rdkw8y8MHotEDB20drASgr8dwQDnk
hTri2ZWENj9GOVIuQkbhLSWDJmN/Cfbxvv5QtdfDh36JqIjdOcVdFFNNvths2ZxRxGzWrU3T
Yi4IFr9O7/OhzENvJF8WphAmKl98Y0AtiILzOAOoXA5dU8p8VNIYHWUTbPhDUSr4k0tfaIF3
F/DnZ4ziJmX/gQpQv5ACXraKCTT8aa5rLja2/VQfmX4GCqZlgY6Kd0zvI6eGRMVurUm1fCZZ
zhGqAl0gmLn8E5M8PLy9fjNF36GFNrx++q+pLwHq6gZxfGVK6HQSCVt04bmBds51Plya7o65
2WA7+yGpMOy6bJT+8PjIMibAicm+9v1ftu9c785KnHGTwbmc0GmWVx2RpEMgrizxn6QRA7yS
zaolelSE9icopt7LY03wG/0JBcGPoYWlZXgEM0nvRx619meCSpJtJmCVtp7fOzFVYw99TF/j
TASjG8g3sTN8qPYjVSNa1UYh6bQ2kXR3sROYfDZpXjYDVecuuR+6pLBErxVE6THvuvtzkV9W
yXZdM9qMceeqkrpu6jK5s3gcTWR5lnQgIdK2iRMVHHXnvLv1SR6v4uYnC+ijWzRlfin63amz
ZPaaBvBUd0WfG1majOHMQEowByvtN1HpB+bEYIit9H6FGwoemjqAZVXGVEgi72XgehNFs9dk
eybXi8i+Wi1F90H44CuriCgPJ4OcZInBpkjyKpRZhrNZz6+GeHjsl4evX0GvYhukIaCzctFm
HLV8O5xzJmrJGy4HV1lLq8L8eolLScTgMHR2SdqdUSc+tdmr3A/4wyHf8eX+IENqc4LOojEy
7LG8KK9KDFhYLgMYsrwHSc0yB/lY7OKwj0Z9hPL6I1rh6ez1SZUEmQezsdlRnqWcqGj0+mBu
pGpAAgY+j3FA3xUwtKnYacN73adHJeGFfSbxkxTOpt8EFt/3V+baPnKVVz/e1UNM9AmZWnhC
+a4rmXoy6KWoMWKkUdGld8N0o5nrTkfsGufzvQWDPv38Cke+ppHwHlvx1hEENS0c87kJegKp
tEqL2qGWujcabWXXpz4tqguCfRxE1sEf2iL1YtfRFWWtB/j+ss9+qWfIQ5WjWfDCRGvbLtsG
kVtdzkbruHmxvXH8mmRl1bb+dkNZiYk+Vc+MuaNRLjDWWJcGQxBbK+MWa3GoVcfAnhsb1TFE
bLmj4xSmZ4mGxmAORsWXKt5uN+TkJwZwTmt4a2BX7mH5IA6xRWPk3QoyQbOyv7J0nOhBbXHP
mohyTuXRl698oLLU9yyhCvhu0mTJuSj1+KdSVkaqk1ClNDpJO1XdcGPMYWYksCUjLUrr3dWn
Yer7cazvAm3RN32nAccucWGiKK+sJq9q7aB8nCRZ5OLK0+jiolpqKFfub//3LG7OFo1aLiRS
oaNvXEM1dyHJem8jx6aXMe6lohCzF49oIsGNzGX/+eF/ZesxqEjo4yB+qx8Q+ji/n5LbwxHI
q0NFhFcpYqJOjkAn60ykmKQoXN/+XepRTaHwJM8WGRGrFsZKGZ9exioN/WKj0sQ3uIvkCawi
XBoR587G0qDcjeQpro7zLN03F3yYO6sphBmwy3vywZpj+1PblvdmKQ63Xna2WcIJlXduTMDJ
oEQJvH85II9wUjqh1A27BC8j70F9GOLtJlDE8AmHXRdSJ4JMIHe6Apf2GAWuZOCbMP2ONsKY
+NfwAssDVjEsxf/ugxdpIZl0hrhDkclosnUDh2IUXUgiLaqRjYi6k1BIPFnInJoKIhQMla+Y
iU84KBVvHVuoSU5TtnHkRStzQfdQXCpnvblSshz8MHApxrglH4scMbqb0PLEOlHDwGzcgBoY
hUINMCajvGCtgUgRyVq4hAig/6gG9NXO39B+EBOJEK6oL0+jekhOhxwtFLzthpj/k0ktNbG6
IXAs2+DEQDfASqUVr4nklPauQ16EHy9VU8s2QPDn9VxkOki8HfHLA268+PAGCgtlsCsyxmSR
70r7qATfWOExlbcmySr02KQv+hUauhdUGuo0Uym2ViYsh5ZEs/XI0GYLxRCNrkO1foDusiA2
doRrQYSeBRHZqooCAtGnoIa4VH/cxRiheLU77lznJs0+qdzgaD2olvRDbZn3VUqxuNOsYic4
WiET8GFsyQZlfWgJkLFQuKFHRUebCfKyhC2jIqtnZwp0tSVmmyArgjuMwL/yEbzLcIK92TJ2
yeHtDxQm8KOgNxHCgQ25Ikr16bEienA/gCx8GpIhJ2o8lIEb9xWJ8BwSAcJEQoKJKSxsFmoT
cyyOoeuTea+KILBFlBMU+CauT1W9Eu22aIK/T8kDfULDxO5czyMmKKbVTg45gWDnBLEaGWJL
VTWkcHCSsxpRnktpDgqF51kLb24WDi0seSHJEnO3ddfWEVKEThjYSocuFX9GoQhjYrYDYhuR
cB+kLmK6YSYuy/7HUP4NPsJwY6s1IKcqQ20pWUJllpoFVdr6jkccCEOKLo7kmZaScvA8iFXo
E0NbUWcIQH1yDlVkJjMJTYwIQElJoKzi9YWMoWxWvxaTkwrga31eVltytAC+tvYBTXbfNvB8
cjwYarO2MjgFsTe0aRz5Icklojak6D9R1EPKrySKfmg6s/I6HWBBkcOLqGh1hIECtEFyf0HU
lvRVninatOJOG0aj9nGwlSZ7y4xdqeZXmq0SIdh5ETktMKFkut+3a8WLzg88eosAVOyEa80r
+jKM4QimJ4MHCt+atMrOg4jY6AQCbZNPZaLY9UkkfuwSE0nsvYSADhjPiQJig+F7UkzX5m82
G2q3Ap01jMlVDhrVBtRkm6PITBT4YbS2AZ/SbOs45JpAlEcG9ZwoPpahS5dtLxWKIKvc9cdh
9dAFPLVTA9j/SX0TEOm67kHY6uoSaJW7ET3XchAEN87azgkUnuuQWwCgwotnsXCe2av6dBNV
a3vbRLIl9wqO3fmrhyNIrEHIXMAqRa1V8B5x4DCEHxKIYejJOQ9ifhhSKlOWul6cxS6xLhPQ
IBxq0bGgSR5dIoojSsmDTo+pKVTUiedsaTi1kQLc92ipISIPqeFYpatJZIeqdR1C7GFwcgYx
DP2SKZFoSXYJAnobxhDBaXu6qYoCXRiHtGOpoBhcz6W/McTejcuBS+xHkU8aq0oUsUtoXIjY
WhGeDUEIHwxOnnUcgxsbWqbcakkJu73FEVimCWtCGwUUrMHj3sIF4PKjklJk1fR/XhDoB2Vc
I5hkw51jCXWFApAaiE6AMLnZUGBgNTLWiSDKq7w75DX68yMXzX6P9wHJ/bXq/+2YdTZUZp8J
iYnvMU7bdeiKtqdYynJuuX9ozsBe3l4vBZm3jKLfJ0XHfbBv1YyBHTAWqyWaNFVEPH6UZZOi
5LHC0m1WrI0jKdG4mv1345tLo2zfXGmDQY85hRJLwrWJRrVymh73pRknMHhHFHoz/EXOiYv+
CC9UgAQQo67tHT74VC01iXmO4L5Jr9nQTwT08gJSf+OMxLfk2pCEqmd+FVutS2esTY+rldGt
nxp/SYb0mDUH6SFPQDQ3nBlcN5fkvpHDFs8o7kt73TUN5gfB9ZcRVJNlHOuVy8Pbp78eX/98
1357ent+eXr98fbu8AosfnmVx2gu3HY5WuzC93GiEbWrBLBtSVbZNqK6adrbVbWY81x5jiUI
5ZWM1VJvqzeKTd9R+8eIXbzszM1+mCslvicuTs2RFqtlRhgWWPY60SLOCbdk2UuWDBgzjCgm
fOZNVj4WRYdPxFJ9AiPsEuUy85eyyxqPXR0MoRsTdQqbHLJOvEDyx3G18dP+Y7YDRvREfLAf
2qpIXQKTpB9OmNkZ+ksCZmeMpw4Lm4Nn5pKyqNCPU+9ehSACEdnS//kuvYLaumH1ysmC8Eo8
zq3V9i2meACJlrLF7KHSfTG0qUd2aH7qmqktROliF0HNnJ8ZVCV9Jy/bPZwmGstF6DtO3u+s
PBc5KjJWLLTFxtEACoO313gCoD4ax3ZtlnCrNrWWHlSbubWLjQLeL7m+ldf6bOn50OEtVB5e
25N9eqAOOJlhrhL50S7iDaZO5Q8Vnpnah1FLsFU5SayWCgEdR9FerxHAWwEma8VsUx8tVeKk
zFtQZH1yj6qLrePbuwA24MjBrYOsGyNiJJ4r2J1s73774+H70+OyYacP3x6VfRqDk6XUhJF2
zsHiegbzvG36vtgpAUN62TkMSHr0XlTw+FHMWkGXnrAqsM+KZqXMhFahPOoGVsjC3EhFl3ll
kNHTbyGzGH/v0iohmEOw+teVNyMtLNQzXjEcmBE9mQqN4Zd2aDVOnGPOo7SqLVjFXYBjcilb
AQti8J8fXz6hA9IUYc2QW6t9psloCKEMjxi89yPyzWhCepIlH55WkxWwVn0yeHHkUB9moZ7R
CxIzsbyYqGOZZqnOFos/7pCPKAxNGRWzKsfWc+whSVnfdOiRTA0hYnWz4QUm4i+bcMXvkn1h
dktRP4zgmLpJnLGqCQ7rbpTGSFfvGRt4+peEaEe7nUoEPOCJWdTGI5cM9T5nUOqOUyDdQJss
+Do+yndmEtDszQmhhb9G1LEIN7DhYk9QJjgDeqb3RarcjSEUqrJZlmO1XIH6cEq6u9mhnyQu
29TqWII4awSKWXXUWbeQXNPjcPlVwgzdfm80DkOysaudX6GzhUZAsvdJ/RF2tIbO9YwUItqB
MgPiuK1i2bpkARrLhoFBpLGywGzggoi6vxZow+Z/gZM3rgs6DuliW9p0bCaIN6sE8dYSBHjG
e7Y1yLDbiGALwPRdL8MPoXbFr6Lzeu+5u4qeY/lHFsqH0lrZ1oU4dSxR4VEhs53lcpoICLOS
MaFGZges1rT+l7HMpk9jhDt2qNMPfT9jjY5rhSqwz9Mp6p3CRl9sonC0hdBnFFXguDr3DGiT
XhjB3X0MU9nYz1H0JookuzFwHCNqdbLDeIYrWY6xxqFqrbxPbmgSTIkbrowXYrknjt5LaBlr
8aMSVZYVHSOHzZekBHWPUjPaPnSdQI0ezfxz6OvnKdi0MrKzQ4/W0xxOJtec0Z5rrD6ExxtL
dqWpsdAdFl8uiSIIbQtfcjbSoXE4kg3ZuisccQJvVVaaieyiBJDATu5Ltu7TNYopC06Y5JQp
odi5sxNR4FK6XuSTa7Cs/MBiwMs+lfpBvF3pbqasWtF2n0v27SY91skhoW7hmRSqe8JJQEro
mlD2XmbSobfReqcK8EFQqwyhK+POPMhsZyVDxvpX4o1jnJ4A9d11QVuQ2JKSTCSBYwkPOjOk
NZsHd88iN9ZlSHGfpgOnIAFyLDibGrXc2BkmHjNo1soMxL4YMUJvUw5ogUgQYODGE4+02Z8q
OQjPQoPvKOwZZZUKxKIDrntpWShIlK/Ifl+oUCeMQ3qaq1SoOd4iywJ/S/kMSSQ1/GipbhHq
ozzJJKQt4MRCsswGovysLK5WMQkxRAUrjqoqUfgLRB55SmkkLs3IPqkDPyDVs4VIDym0YIq+
3PqWzEUKVehF7q3xxjM/ol/mNaJbncI8aOidWiW60fCS7/nU/EJUGIXUOkLtIWCevcRXV+KI
KERxuNlaa4hD0qtLpdkGnr0CesPW2Yxt7YuEnaCJE6q1fr6qFBFp+qnSxFsb+2nrgkS1vnxR
OZE9LhaMpDUQlbf708fcJc3NJKJzHDuhZW9hyPgXKlANVSXkhYrBv+A/YKokNezTgpyUEwql
qigSQldUJJSm/yyY3qvaxLHsKojsyTtAiSao4iiMyLonpYXCzQcy9V0o54S39hm0R3RD/9Ym
MmkFv0Dm+TfWI1cCPLInpdw1FhxTKmic63v0NFzxdTOIyKHnuM1oxXEVgcJx6Z0qx6V1muOz
1ZppoeGS42qbdPkunTRuBVI3Q7Ev5JiDXaqFo+8wrKFyfpdFR6bvwUiLaZNhfujlGa+71vmM
WGot2BqV4Mu1G2LCCUM9F3bX92e6yr6p72lEUt83lq+hMU9LfU8mqkBovNtl62yNVUt+veD+
iFQXVJWJYB15LtJcsaMCaAKqbJdXjSXRF1SYk7EcAXEsxuCYeVrTkTFbVYzpLqHDbfEesab2
hNIDCNmWVGdFR6QpkbH16dzYImphr+WYP8ASGxm3xi5Pqo+WvPFAIALgrPFXHJquLU+HtRYe
TiB227DDAEULap7AOE4BE7XR4GGh7EzxWP/0+PaFMq3hI+OuGa/ZmQqYwxLfMx99HihweQN7
eXp8fnj36fXbExWukJdLk4o9zvDitAbKCKF7yuZwHc6/QIt5EQZQ336JuEswmAlBp7Yv6+Y2
/q2icOszUOciy3GPkKJbctB5UyoLh0OT7GzGN9BouNZaFTXKEEl9yKlrN6z+ur/UsAnMY8GG
gTBm4+zjA+taL2HzphBf4gmUtHyFDtLJphfRno/+0+O7qkp/xyfoKXqx9CDKGrk77T3tyFjg
ousMeAW7WNuTJSpmxaj2xMOXT8+fPz98+3uJh/324wv8/Ce058v3V/zl2fsEf319/ue7/3x7
/fL29OXx+z/MrutPu6w7sxj0fV7mKd2BfPRwkav3J3Okq/zLp9dH9v3Hp+k3wQkLePnKgjH/
9fT5K/zA8NxzhNHkx+Pzq1Tq67fXT0/f54Ivzz+1Iee8DGd2tUdNH47PkmjjE9MUENuY9PAW
+ByTuwcpURIxFgdjTlH1rb+xXIZwirT3fYe6u5jQgS/7hi3Q0vcSgqXy7HtOUqSeTzkcc6JT
lrj+Rp92KBBFkfEthPpbY8W3XtRX7ajDmXyxG/ZXjmPD1GX9PJzmuPVJEmoxzxjR+fnx6XWl
HOwukUuqhxy/G2LXYBuAQUgAQwN41ztafD0xomUcnqMwpOTluUGRK3v3y2Cjw4ZzG7gbGvz/
nD3JcuO4kr+i00T3YeZRotZDHyBuQombCVJLXxhut6rK0bZVYbveq5qvn0xwA8CEXDGHdrUy
E4mViQSQy2LEBMArxxnNXHmcrdX4Nh10s9GdMxQ45YQ2oKfOuNghP7kzfbUrE4Wf5r325RpS
sBmA1ain3mm2WEtvMoXb5eXGcllNZ/RrokJB2jooC2dFdLBB0HdUA4VLxn1T8KqPRgver9fE
zO/Eeub0Hffuny+v962MVLIUGk3IDpvlDWGVlJtkKu8zZNEYuCm7pISFT/dvX5UKlGF/fAZh
++/L8+XlvZfJRv1V7kP97pTyqVEp5NXCIM//1VTwcIUaQJjj7XdXwUgarBaznehKwxY8kTuZ
SY97M7ovTqXIarbCx7eHC+yCL5cr5iHR9xZz7FeuM5qoZDHT3LDbXa61/lCiGP4/drc+1pvR
Li222rhEs70jjg3ahRJPc4TV9biySuXBqZnI72/v1+fH/71MykMzqKrt1kCPaRzyWFFXVBxs
l1OZoNGGXc82t5Dac+iIr+oXZ2A36/XKggzYwkhrPkZbDBAUukRwx+LyqJGVM4t1mEGku26P
sJYHRJ1sRnoLG0RT19r3u3JKv02rRCdv5szWNhYnD3Olf9jYkzf/FbLkFAO7BR0DbEy4unXK
aQm9+VysSU9XjQxlherdOV58U+sYhB6sDNJU0SSa3WTxUSPbdliZBL80xqEHW+pHk56s14VY
ArvS+t1UbOOQDpq6rJhNFysbD15upqQJoUpUwD5Y0hMDq8B1pkVoXd/J1J/CyJIBW0aEW+ju
XJXllERUReXbZeIftpOwOy9122V5vT69YWx+2EYvT9dvk5fLf4ZTlSqhbYwkTfR6/+3r4wOZ
+YBFlM3TIWKYf005kzcAXN6Y90n8MVXSDSNSHHmJoeEz6mjkqyEr4QecxDGliJocAqF+DufB
U59CTsfJKGJJQkHhABnKlBcabp+INtOZ5jkDmHCLaRpJ9zuNDhMS1zC5fh3yIsGUKXTfsOFe
4OnVl6ViC4yACNNloIV11yajrTbcweizgGH2u70WtYRWi51cRwddrTdNdj7Q6ylR3xEIHk/V
CA4dHPO84Oa4WZ/M0dTQC0NsKMqMrZmN9lYklDIqxyaDD4yRbNVSeqGCgUpln1mW+BGRM5F5
+eS35mLAu+bdhcDvmOXn8+OX76/3aE+hfna/VkCvO82qQ8BoszA5npspfTiQiyEK6CxNEgnL
yDK3eGOdezxietb5Zn0do5B+VZLLNmG2GFiIrnz6jURWKuhtVUqAiEWzG3w9XhSVqO+ChIov
L6fYYwU6wu38hJt9krj44NP7P1Lcnezt3mbezjaQbVJVWD36R5KzVCY+lavDf3z79nT/c5LD
GeFptKAlKUhTYBYUAmbGjOQ8ojV7MiIwNekBEwb8jN7N4dlZObO5z2dL5jpa0PmBmGNy5z38
s3FJcxSCkoO+PPWomnmaZjHms3RWmz89RpF88nkdl9CwJHBQ+9MFXUOz52nkc5GjP/zedzYr
35lTvARLRJViPvmNEVZcGUdAR/PFitKPBqos5klwqmPPx/9NqxNPM3q8MkztIV38shKtkTb0
M8RQAP4ykaXcqw+H09QJHXee3vgImkIFE/kWk65gFqesgrXpFUFAeY2rZc4+r+BDSJbt6Z9i
nHl72fpPO2exgoZsyLdMtUC6zepiCzPmu+RsdbMglv506VumYSAK3B27vdAU2qX7yTk57u1q
gzVjdMsCvs/quXs8hNOIJJDPj/EdnGSKqTg50xtEwpm75TQOLES8hJHip1qUq9UvkKw3B2pF
lzmG2Y+mU8v0lUUVn+u0dBeLzao+3p0iepc0pJFa0bbgvmrGNzDvMZpAQ5f618/3D5fJ9vXx
7y/jzbp5aoJ+sfS0skXUl/IdU/mBBmjTqKpkK/VKnxnCBWVhHaSjB2S5qQQRw0CzGHzHz09o
+BMF9Xa9cA5uHR4tdaHykpepO1ejETYjgWpEnYv1Ug3xJ5UwjnPI18uZYyL4xtETXXTgmUsF
9JK64o6nGNrdW7rQvamjmsFKfCZ2fMsak9/Vcm5+VgaeujSWZCA/whxDwv40wCJdLmAyVPuq
TrXDy8aFarqkIVzjc1RKjFXiYbMeA1vq0aIdrzi1cFCm7MCNr6cFEkEycIEWXh5V5gDuuODw
x+YdItfWSYTUW0czgulZO+O0gPacs9X0kw63O63dxYr20epocH+dWWITqzQuGfpvaIUzW7t3
5bh9RZAz44DUoUAwLdbUUUEhWLmL0Td42GYneaFpGasYv9HzaAX7N1TQYjqjnSxaRdKuEFvy
BMvmswOLbAe6fnsP0lKeEWsMVrAX+lrCvFhNHvZOToav98+XyV/fP3/GhKD9eaYtE27hkOdj
9NaBD8Ck7c9ZBalj2h095UGUaC4yhf9CHsdF4Cn3Gy3Cy/IzFGcjBE+g/1vQ4zSMOAuaFyJI
XohQeQ0th1ZlRcCjFOS1zxmlsXQ1ao/QAPSDEDSewK9VLwqA7wKv2ur1owFHk5ZXrzuBHaI9
UFPKM1Cg5o2NhhUdkTP4tUu3S1gA4CjKMwq5wgCbJ7RFHxY8gz43s92xAQEraEEUyk3RkmMG
kHCyFNSTCa6yuW5zjYMZWWizHDdYLVszTtTU77xaVS5NNnBbiwp+sOL4ypL2AHBxsAadlP7s
cXJHSVq0Su2nfxzc8mwTKA3WhhL0XTpiRsJEw3LrIrFJKBzXIIOvilsXwv5c0D67gHNt4hSr
zDI/y+gHCESXoNRYO1qCWggy0b5uaVsy+TlYmcJhPaGTH+PgST9DfclhdNXoVM4X5HkFCPq8
COr6bT1TNFgSoB6eJYEpPLYwCuTzCzZJwIfgrIwiIllNjS++1WXIXUHKku39wz9Pj1++vk/+
awLnzc5VZ5TfFc+iXsyEaA0SB5mImHgeOqAzzkr9GV6iEgFbfxRafCIkSXlwF84d5TuC6EYF
Oek1Sp1DVX0RWPrZbJ7ohIcoms3dGZvrpONc9giFQ5y73ISRs9SpoROwBvahoxnJI6bRoaxd
g1O5C+oTJeX6XcMc157BQNFma7zJJVfTPg3gPh8MwVZmJiDbrrBN1pv5tD7GAbX3D3SCwcGU
WeqxJrXTaNbrpUN1QaJWDj00nffCbeat79PzGBUn7tJVg/gbqA3VojhfL3TvWKVBqI9Z8q0r
w9Va9N9sdu8KSzSudUEaN+0AI72Kc3omtv5y6tDpXvqxKryTl6bqUegDIdE/0aDSrSo9w9Dp
py44oGtu5/i7lhddoDOllN6uUEj1w1Lai6tyZqa2azsxeoPqeIusSrVkpiLVlnqTDhxU35FQ
BKBaDn4O2Z/KIkijko5NAYSGOXWLqBqOCr8hb21jV/Ht8vB4/ySbQ6iEWILN8UbNVm/NvKKi
dhWJy7U7XAkSldBbxCrQv2OdahvEe57qsCZNswnj8OtsDpqXVbSjLyIT5rE4HpeRj56WMt45
B91RmGVg1KNMZkO2Dk+QwFkgtKPjwMsobySJ/HMfnNXvrpnAZMsLSnZKbKhuQQgBFvKK1eSz
P1PqCWKOLEaXT22gMTu2vOY1hyA6F7aIn4jmGPNPbxAvDcAntlWj9yCoPPJ0x4wFsA9SzDpe
ZgY89pqEbzowGH1KcZBmB0oYSGQWcVzno0ItHH/k1MNyTxCGhhDhRZVs4yBn/sxYAgpNtJk7
TVEFeNwFQSwMjs3aBfU5ySoyvG1DEKP6p49Fws4hqASjJSC9HSLr3CUcwy5lYWlwy1KQSOOF
mVRxyeVSs6721BLjBnFZYbhtKDjYAvHqK84KRZopQGKk8qBkmCLaxhHkBuw8es9aIF5XmNxa
TL+r3WaLqpq+xntE4I+kSIez+WdImhh6i/frHn3wkjQFT5itw4Lh85ZZdfvKYCuDWaNgI9yb
Uy3KgNmEFuBg7cIeExhyHirKY1P4F/pLp5Qo+BTEhFUWi4QV5afsLJmpYbMV+C2RW3KrEACx
J4Kx4MDL7MjW33JXVKJscqIq15EKVPu8sUiFu3WdC1cHHzlHByx9TZ54mmRmg/4Migy7aWnS
n2cfdmUpBfRpk3G/611Fex7JzTjOjQXWGVkSikJvr0EqM3hx3ik0itGESquEdIajrcGmb1cT
1QoIkB1tjEGz6NBalZ1mJLZ1tvN4jbdlcdDe5w0TgviRHw8CQZ2FhjBR7zxtoRj+XEqJJrKg
7BESYTNM02KE519/vj0+wBDH9z/hVE1oY2mWS4YnL+AHcgoR2+Sf31qu8Uq2O2RmY/uRutEO
oxLmRwF9aVKe84C+4sGCRQaD3ZhWWWmqOOe1rQPVkRrnJNHcTPJjIYI7UL4S6ozbYoW/Xul5
zDqEtD0gCqKzUl2xQrW5SzyZXrY3pZY+TY1b0+769o6GM++v16cnvCghvK4Sz5rKFnHChzWq
2fB1QHuEt57CjBU3ZhGXYUJzz0JY6UyQV9w6VbmZWln4Ry8RO0u4mZ6wjQv9AVWI/5LZ15Hm
uBW+2YyShwkUsvLt7tRsXcxHI+9tV7YwPYA9SNfAxPLkhhQVdIEv4RuwdcO7I+a7ewylA8oi
RVLu9SXZDNkJNN7UMjmJxYtVWT7JckG97yZwpim57mPawcaLuTXGf76+/hTvjw//0L6Hbekq
FSwMMDN0lQQ3ufzKt9VxlesgsVlOt0SfpLqb1u7aEoCqIywWZKKzNDh22l2nycOv5i6OgtWN
Sq5jtgUqlykcNevdEc1G00iqI41PSkCe0WVBxsrpbEMvzYYgdZ3ZYkMpVQ1euMsm1KzWHi9Z
urqF+wBfUN53TQfNuDwNtHCc6Xw6pdaUJJDhwbRruQFMvzx1+CVpxtxjN9ptbwd1VNciCYVm
bxZ6vAcVbgsDKGnM0IdNNRhkb36j6YAn7+xa7GIxJHAa814syAysA9Y1+odANZNoC1wvVJOe
DrhWjUeGYdCvKVX4zeFBmqU7LnsjTlOL96azuXBIv7SG8zEx2jnEATNWsz8zku81fS3dxYa6
720+DDN0soS2MXaMCkqPYaARExp7i830ZC5BIihov9wXP+wjsi/92ZIUQRLNhTsNY3e6MRd3
i5jJhhgCZfL5+jr56+nx5Z/fpr9LLbCItpP2iv77Cxo5EweAyW/D6ej3kUja4smROjVJrBmw
shmS+ARzZwAxtNpokDCq+3p7Gm0R2OTy9fHLF0pIliBdI+PtvKdgnhdgYHG0A6XfSzn8TWEf
TqnLtwAWKuhCGcbzFV5RKZ4GEjWcJXp+CCc4FaWHdhhK3BQAYE665Xq6bjE9D8TJ7YRg5GOs
64MZ7GOAWvZqIBgbegAQjkiRZuiBsD42HmxVKZz7dSwqoDokU47CLC4x2kMiIsAoBk/Hmp04
UmuXjaGIYcQSagNrD4iAXGpZ2lp4xkqjXE8hIz3tsGSdRAl1qzNQKB05ytaNgri2cLKmrgyt
w+1EVTdV9FPgPT1eXt6VKWDinIIueKr1tiTMcBTpZ6ouGPcVltsqnFy/of2+6g2KTEOuZQY4
Sqh2uG2LU2dGg3Pf3OrUGjmrrzbz+WqtyFJ0FldDZjW/a/mlOD9AwhoImUTsj1kH9UIWTWfr
5VxJnjDAoP9l8MfM6ZdJgoPocV7rN3/ldLlXQ3DlrMAGtAbwCrixdy6a1hngIpODuFAOkxLR
6HCgPQpBG2ehb5C8WsQ0aNo1poqhTT8UCqlNkkSyHfaKtWm2hIGAwRiCePTUaBcXVYGgPpvG
qUB1CJZOBkmQapaKLZj+KFrkFqN2qFfaLZyneWVkLWnqSPRetB7OD6/Xt+vn98nu57fL638f
Jl++X+AEQVw37c55UBzIpf4RF+UysmTwCVKnepmirA+NMpbPzMMEObwI4kDYdqqg2Pn0BSc+
r9Uxy8uMPt35nr9lFh+SII5rkWx5dhOfrW1BSiVBsS1JO/4GV2kWJtUnXoLgu9HcjkQmALSk
SUp4nNVFuOcx7f8S5T4IFG8flNZMtbtcbv90eUwNdGs6EsFvdSHvHSRuEMEmk8MueoNCxge5
ged+wHLm3yJBRW2PNJZ7oS4t5M5nuRjvo/Dtxhkds0uuug/WbM7rY0LfWOG1e4nuTTfa3l6B
bMtbU91R7Zh5i61rBGnpOM6sPliTRDR08g32YDMOa2gOxno3q7rZkDzx7CHf0SSsKCnJ3TsG
yfEaz1TG9iXs/fQYyTf5Okoq+pqj4VBY/NzaxBX40gKQ1BbkaOgdz2l1SFRFiNGSYd90621V
luQrZMunSnmJnAa9AQ4KqsXVUPHMa94hoSgsqbTkzBLRLvcaJQkOeHlFHaaw9ajPq+y7C8M6
5znN1tsVWRL0bbPdOcUxS7OhC9TuHO/RpRd2vn2lhF/eYWY9wGHCQVBF1JiL8pYAcZ3K512f
n68voEheH/5pLPb+c339R93qkNFO+LSF48Cwj1X7C3Sb+Zo2zFPIZJzUj4gEX7gL2qZTp5rS
9ys6keUSRiey5AJQiDzfC1bOh+OAZBuLk4NKJtBiuvase0LftnG0V20O22D8H7Ex4t5SJAfv
w1a3cbs/ImsD1CWmhO3c++nF2a/zo8g57DfesJolpbh+f6USaEGNwQGExHq2UF5VAbqN/R46
VE7xUr5PkJ1biy02hx5WVIi8JmLX5fn6fsHAa+MmNuE1QeBpQXGIEg2nb89vXwgmORyXVYkv
AVKXp64SJLLXxYdKNeaqklGlPu7jo45h/rTfxM+398vzJINp+/r47ffJG14JfX58UC7fG6fz
56frFwCLq6ddWHcu5gS6KQcML39bi42xjcXx6/X+74frs60ciZcE6Sn/V/h6ubw93D9dJnfX
V35nY/IRqaR9/J/kZGMwwjVv36d8/uOHUaZbaYA7neq7JNLDyjbg1NyAuqfwMUdZ0933+ycY
BOsokXh1ZZgJqmTh0+PT44vZ/r5QmyL24FVkU6nCvbnBL603ZTuXZ6mwCO6ou7kTaiudIAl+
vD+A5Bkl4dWIR9f5LbhXIN35hnIla8lgI3TdhRIzZ4Cbd74tJi9TjFtnZ1mU683KZSOWIlks
1MB2LbizBFCrwtCYheVu06IIpyVtK3IAJWdLGqBoZuPwo88RPczVMVHTCFrCsSMV3vmFZWIW
blIX0WqdRN/IfzYQELqXRiVfLCzKDOJh072Fqw0D9+Z7L+5kjBDCWqa4Qz9f5XYUI1VwT8an
SYs/pr3q2yY2LO5UiT5i3PPNmbfHqdLstzNWYBYgj89If5MmHDCUzbxSmuYO200g4BwNP8oi
i2NLUOswGYc2zXfnifj+15v8pIdut+bINaA163cPo6SkDJfxDJHUAtmd+4zSvnYK0jE7esUj
Ea4vnpzWyd3YIkYhy0+snq3TBHRlTtqTqDTYYm3BAjKBQ9cuS4M68ZPl0nJ9goSZF8RZiePv
B7Qdlj6OfQvQABbfXNWzEOZv5+kn45DWLSNP88mEn3aDEsDFOTGll9fP19fn+xcQo6DLPb5f
X7X7tK7FN8h6RYXpAcmZQO9pyy0G6ChBsc3isfrFXv5+vT7+rdyZp36R6Ub1LajecmQzPqB2
2kbLqr/AYsp7WgriT5NKEtBIulGjdsfJ++v9w+PLl/FXL0o1x2+Z4Hm4xCtPWGhDdQMCPUu1
NyRE+VWS0GscsaDTFW1aoow2ahqIdgEc7LcBG1XR4sOyYBY7nWZjNP0TOgO88RB0tYd5pLxm
tE9COc6LkVNghJISXHGlBUY16Eo9oTANeEwK70DZc/dUrfYi1CesHsm9YO5YcJjL+pTNCGwb
guLZ6BOoLcGfwYA1Fai8kJH8qzwm0wNI1kUQcd3WJwtVjK2cH6rugy0EJHgwGrkWjl28wUyS
mP3UkH1LTSQLK7JS+nUgFEp6FvghDXDwykRGO9ceDnndGuJaDBQUil2lu6oDRtAOGhK1DUIe
Zno7Mk8zRaxSjl/tgYusoDUmwTPFNgB/4X5tOGSJmCfNLq4AmtdJzOphXgIW3o3rOVhKSEK/
5ulqceNB/ghnnmbHUZ+EPVjnQX1E+/vm8Vx72WEx91kJMkPgm5mgV67AbN4YW8VTgloEJzxb
h2IMqbd4I1Cja/3wYXHY5hDcuLwrh/jURxuQs0ZB6ysy/Epxzi2OLKEwAxr4JoA3gM5YoSvI
/q+yZ1luI9d1f77CldU9VTNzYsfJ2Lcqi1Y3JXHcL/dDsr3pchyNo5rYTtlyncl8/QVAspsP
UNZdpBwBaD5BEABB0Ke77KsusZtJAODdDqMl1NTNPRlr9vgGsJp+nTSl6q9TjPfG3eW86IaV
86SpAnH+Tioh7XKvTICo0wlL1GKK+3l7OthTpGAOaA6DgQCLNdM+clWqWokG82Ex+2d6e/fN
yTnREuPZi05xYtslXeuufIVYyrarFk3C6/qGKv7igqGoZqhMDbn0vePGraRaqpSjl83r16ej
P2HpBCsHfUCDZxMh6CLyOC0hV4W7H1pAfYyIikDtEWCYjT2nBKwTPJGuSqmeSnQbAVZInjVs
Mq4L0ZT2BBvLzmhmRe12igDTCufVOaK5SroucvmlX8DamM05wQk6F70NLxL7StkYoL+QCzwB
UP21HeX4x/DqpKaGEzbWI1sVIwEd7kRhdbmipzdUWRabCxImHjOP2D/m8/YkhkyBTSOopiqo
Jo5DgMEd5qDfmHMkRxmMC9i/v6hJ8ptqRPNmiaE7PZRumR5EeXZ6chDdTdtlLKFLZvVx/yAg
IOnzLiAMCN593fz5/Xa3eRe0idGmfRJ0ve7Dh7q0iwc+sAwO0cE+e8EzYenJXfy9OvF+O4kG
FMRfkzbSiaNCSLuOxIsr8iHyqmQF1mwZ4Wf8ErcIlT8J9lRudg0Ryh4wMIDI6wgXjLdo6GxR
NLKy7uGhCuD/xJ46AzUG2xoZ15eNffKofg+L1r17pqDxLSQV9ZJfuqn0tkiJo41bGbdLExYD
YtZ4winSvjHj50QOIdVaJHjkg6KQDwwiqr7G29BxfCCZbaTRN9xPCMqH9E542qzwcnJEDBLh
Ae3Te3NEz82SmJxNAlE6os5rfqZKO7wRfkxyYvvydHb28fzXY0tSIAGm9KPN9vQDn9LDIfr9
IKLIOxsO0ZmftJgn4ufIIzqougMafvbpkDZ94uWIR3RIwyPPBHhE/LGwR3TIEHziD4U9ovO3
ic4/HFBSkJWaL+mAcTo/PaBNZ7/HxwnsWuT9gT/Qd4o5Pjmk2UAVZwKK33yzLfHvDUV8ZAxF
nH0MxdtjEmccQxGfa0MRX1qGIj6B43i83ZlIFIVDEu/ORSXPBl6BH9F8fnBEY1w0KLeR4DxD
kYq8k7xPeCIB+7mPJBEbiZoq6eRblV03Ms/fqG6RiDdJGhF5jNJQgOGWe1cKQpqyl7wrxxm+
tzrV9c2FjCgDSNN380hWypw3nftS4rJljWHHaaRiCDZ3r8/b3c8wCB3VACsoXFBiRu1zmPRm
0bRgecMUI0UjywW/fc90ESxS+3lEFicBxJAtMWOgymzCuuxQ85IdEBaipVOxrpGp6zbXJHu+
9lwAKPwo0BVXXPiQgzGIMQKM3pMooRfob8IclqQTpoln0AdknHOrashzpVz89mlEgrYzfokp
mPx3HFg09KFbfn73n5cv28f/vL5snh+evm5+VW8jvBt9Z0prssYwsfTrvC0+v/t5+3D7y/en
268/to+/vNz+uYH2br/+sn3cbe6Rg94phrrYPD9uvlNOy80jHi4EjLVI8bnKfiFLTKDUp10O
SrEJBFDXSY+2j9vd9vb79p/pLQT9tcS4Q+hoejGUVcnrmGwNNCycXcISz64b4QT+7yEbYsow
/80KD8oiLjfnC8xrAh+wKzkyTgYdn4UxmMNf+KMRgWuxGiO8nn/+2D2pJ2LHJzWsEC8ihgFY
JPbBigM+CeEiyVhgSDrLL1JZL20u9zHhR0vnEq8FDEkb22E7wVjC0Elhmh5ticFYV2EU4qKu
Q2oAhiWg0A1JYWcB0RSOioaHH7hOcJd6yGRLMg5vLbUB1WJ+fHJW9HmAKPucBzqH7Rpe01/O
alV49KVc9qIXQYn0h2GYvluKMg3gOvODC2xlEZawyHuTxg6vgAR4fblOZ5GoX7983979+tfm
59EdrYp7TDb3M1gMTZsE1WchP4o0DchEmi0ZYJNRkfoBwt23zeNue3eLr/WKR2oKvkD43+3u
21Hy8vJ0tyVUdru7DdqWpkVQ/iItmOlKl2DCJyfv6yq/Pv4QSew5Lt2FbL1ktzxFHtROmBP7
HVPvE/hPW8qhbQXHVWPBFtkbzYDK7DL9eouq6dtPp+/DxaIRxDZxrG4og4VmRkpFjCr2Iejh
RLC/bxNdsroKu9WKS7limHCZwI66Mtw1oyBc1BBeQt6ZhWstnc9CWNdw/NSxjjbTjLCYvFkH
sMpNWj5KlhkXAaSxV4xEA3Vy3SR1MEjl0rB7KNZGFD/DFp7GP5BWmMqo68cc7kt8tzQy0EUS
jvTSu3preuf13cevvLuv+p2N+83LLqy3ST+cpMwAK4QKJ4kPNFExwhugMEU5biD+eAOyO36f
yTnHMAanP45XvGD3++hMjvOEt/7sV8jMQso4WFhOIWHx4B0sGQrypshgKTK9QsQnLrxvwqMw
DLSPInMSIZtFvUyOmUoQDFzaCt7FMFGhKAzoAqqPxyeKKmiWKoIDwzcc+EPYhYIptgMLfVYt
AuJu0Ryfh7JtXX88DqHEFgPxzlBKxb1GzqXbH9/cuwpmg2jZTab1Aq1DvGamUKttp8qZkst+
JvcIxqRJQ2ac5dWa0o6HKrFCBAcmPj7S2DTBW1AyVF8M4q0P9b4KAvBwypPYOkyTtov1BHEf
2S8+2rVzBCG7EnRfozOWKwD6YRCZ0F/FJ3FOf8NNaJncJFm4IJK8TU5CRcEoZFFErNM6e6IP
bGpRho3ScNrjYsNhaPYMtEUSnd+2CIvuRBLC1pWbZN+FGxaJoSO1u+jhwzq5jtI4HTXX+MzT
34EM0WfboUJzUwWws9MTZr/Nb/ZwEx3mB03FA3nTuOb28evTw1H5+vBl83y02DxungM3yih/
WjmkdcPeijf9aWYLkySAwSw5bUVh1LYcrBvEpfwB5kQRFPmHxKTbAoPc6+sAi+btwPkgDEK1
JhzrEd9qUz3erJGUcxqMSO3cCHZbPD2Ol70MlV2Mm6yTTN+3i+L0nhXHw7bLSq8VWIORW44T
yWXSgfF6dv7x73SvnmloU3y65SDCTycH0ZnKV3xuBa76A0mhASsuA7RF52fMcMYOdBR7XJP2
usB3PmRK3mrMuBko3unmeYeXpcBAf6H0Ti/b+8fb3evz5uju2+bur+3jvb1IVVQJbNuU4bgd
feysR/CQsk0/ZrJMmmsVvTg3Fkm+/fJ8+/zz6Pnpdbd9tO0SvK7iRDbOJGhomHrEknLm1ggo
b2VaXw/zpio8r5NNkosygi1FN/SdtA/2DWouS3olGYYCmuBwddVkkr0H0shCDGVfzJy3CtQx
gv1s23jrJZV4oTSpQ5QHpqA2jINJi/oqXaroFeU2tikw7G2Ougxdgq9z6TriUmAlEG0O6Nhx
h6TDaCRZMNn1g+Pn8qwvNLusJ6utZUCYXKZidh258W2TRC5pK5KkWXuX+R28P0lNGtGTUkcV
SH+3zh7kbLRLJ4KzieDqyjX/1FNpbuc1yo5um4pDKIby+/AbfHhNlt5mTtBgi7cj9lyoVbIF
t+PxrJRwN6csvRNtZzUQwVzLr24QbI+8gqASwwy/RtJ9pZr7TCbstGlsYr9uMMG6Jay5ANHW
sCYC6Cz9I4B5GbTGbg6LG/tKnoWYAeKExeQ3TnquCXF1E6GvIvDTUCrYp3yGB0HlHtoqrxzF
1IbioecZ/wFWuAd1bBkws9RSi+EHxUB29KKoHYx4lTRNcq3kjyWc2rZKJcjBlRiIYEKhyAJh
JwofRDm4HCGIcCf5WUntVTnPcnoexcNRYrekJo3IDxGmBHVZ1gwdKNtKephZKDCUPs0TivRc
kiY4Ydu1rLp85pKnVvK2zZ+3r993R3dPj7vt/evT68vRgzpBu33e3MJW+c/mfy1FHj5u5Y0Y
itk1sOGUV2xE1KLBuAaMYX5vyTeDbtEtRN/ywtOmm4p6m7aQ3OmzS5JY91YQk+RyURY4WmdW
8AAi8NHQSJrrdpErvrbKqvuhcaY+u7S3z7xykiDi71EEs4F7GMRoFZ/f4EG7XQTwAfOhbC7R
hWdVXdTSyc1Y0TMaC1CY7Kdp5hWatX72eIKe/W0vKgLh1YkWH4LpPA5Ffq/xYqFjbIyoXt26
GeZ53y7VnYg4UZFiZmWPgM5910luKf0EykRdeXcAURdkx3hUCgOdzj2jNxonQX88bx93fx2B
8Xj09WHzwpzck76IqZsLR/PVYIwJ5c0nFZiNr6jkoDXm4znq71GKy16K7vPpOMMqU19YwqkV
YoJhzboplJKQj5q5LhNMB8pEBeshiw7DaPhvv29+3W0ftF79QqR3Cv4cDpqKrAU9wtlSDAzf
e+lT93kLC9uCusgHGVlE2Tpp5ryaZlHNOt4sWmQzTI4qa9Y8FSUdDBc9+uKWwjZF57DJCLr1
9Pns+PzkXxZb1rC54NXbwr1BDJYxlQbISOgSaNMZfjercjZ7KnXHjqtfCrx63/ptq2pgUhSJ
ssyleytLldHCysYHdwvZFknnPjHk46iPQ1XmbKgOjUJd0S0xd3lijIq+cseHDenuVHiNV0WG
iwbl7Gc7Lc6hDDeuFXyOCE3H5tISkRNwjPVRU/v5/d/HU6NtOpVwINpsFfzvjytey/nsxvJk
my+v9/eeaUuBVeKqw+ejIok0VYFISDsRS0PFVOsykvSA0DA3mOuPdXFNdQyO4abgTQVTlwy+
BaWQ6uIZG4iW9zNDZN9aQLC5DzdqTythxhM2FR0J5dVkMHtGSTFb76cz9ahW3J3ZcVfSNPr5
Um8oImCVvYSCsixmU0C6ZgnG7iCapmp01gPbA6cHX/E8qoTs2zkJqafQxgt8+cJSGFJqNUGt
F/Q01iPeRzVUfadfy57iDQlBwoOzbhWaBv2ztXqQURRuX8zWtB6CKbhIq1XQQygOwEOn7s84
9hnSR7m6XUoSAVoBhkqP8qe7v15/KAGyvH28t7Yp9F30NXzawSzZtgw+NhZF4qZL1oZNViel
PchxGpSOvZjSqGBopFcVsof9UtNEQRKfdBGYh6JmafY12CKLNtinGRts8TDWMCwx9WOXtPwa
XV/CFgIbSVbxKkdscka9i+qGHalyblk7YH8sFRKHB9h7smBaGLbMv5OsgK6KQjBPWik6JWtE
mY2brreisdILIWpP5ConI8aXjCvg6H9efmwfMebk5Zejh9fd5u8N/Gezu/vtt9/+7fKmKntB
Gq+vxNdNtbLvm9ufYRcCuY6+uE5c2Y5zvWamBHeunOPJ12uFAdlerSnO1q9p3TrXAhVUue1d
84puvok6HE2NiC5zk98+F7GvcczohENbCpyYpSbBSunw8pobQTd10jjUrBxH/5/5NAUqSQbC
aZ4nC5u9kLEIOcFI9YKhwldohMiA/ZR/j9kl1YYcHSf4pyNvg+mQbcAitQb6+2xciTDbXRt+
lYKSLzDvqavUqsO6tHc0JIelATk1zJmdyT2U9iQjGTA/nYjB/RZGG4bVCIiTY+dLPQmT6g5A
ccm8TjClL3T64Y8ASECl5ja02fOeDmjUEiRvrvQZuh1MKa047wGnW0j3QZa64MnYyqs5KID7
CucaITqV24TTc+yUB6Ruj23kVh/0tkyvMXHwOIN0oDgtiVDq4ctzhLK2N9KW5n2pDJj92EWT
1EuexljJc281MshhLbslult8rVajC0psQoNrPxRKJJgIgZgQKcmECgrB895rD5jq0lTR1gKh
ClNXfpOPZNbP53YnKYE00TsbBvIb2CT6KbxgaOpGiAIMS7CN2BYH5RkPsV+QJmS8Ud54hzM5
MRU3jbwRNDWb+h1Jft1cgno231eQ2v5DAjM3a2DjoK+aDfRUu6koiHRoS9D8YeEzRc5A2MNE
6Icc6MKH63hS8KSENZjgBSL1gWCtMlJb/Ob1UMZM6IGxVMB6HsAM3/twr4TA1RRNKjBOoe6H
O7963LoEhHg9hB4+Y2wVsopVYPjMddjjQbJ5dcdbPMTRwwxk0bJIGn4VWWg7B6FFEGtzyI/k
p/P2J9VvAeosnRK4z6As0BIy0z4PtincNWUm6BHR4w/np+TnRuOUaUYDsgOPhrF2GiTvGYz8
Iut4NxWZeXQe33r5hl2SKHY2CXVQqeJz28wwEDKOJ58TDtR+MjxhgL01ilca5KfTiCvZ7tJS
XGGOgD19Vk5pdaki8tqppmvTmvfRKjMaKLqKezmZ0GPogg2cya5w8y0aMOzPOX+dkyj63n/E
1saq47M4HvMkzWPPMBBFg0fUdI1wz9DGUkIQVmb8Y0mKFy/2MOqqCNxnTtdRzcBriNYKpEGr
507SNYy8gIGcVn+8xrlsCtDb9/RVZUDaMx+BA9/lHbrmSBdUH7wvHW9VvIJCFClsVpxVZapA
u8kNX4CPIiJNufoG8haCZtL0ta+Mtgk+X/uGg2uROedf+Hufw66fkRcKDP0OXd2JfSZGOLuw
kJh3wRNZWU3HhkwLFNF0sOiuQlX1Q9Bc0JXx3EzqXCl2UKprEYZ6EQZfauONvDO9s8hF0uQ6
mIl7rJ4e9+kotYmbrWtCBHa9dYaaVT2sW3Pxz3d15DM66YvN67g7h32Sldn+rmsxvL86ez95
aXwcjNUxj+u917dcLClMH6wNw2CxOn5LmSgEl8VnxOuKfzKf+vdyxxHThpDdxKnl2kqnUzwT
v2DZhkn0rFp96BkK2iYvJBMGhPOuj15qZ8tXj5rgdrgna1BfrlWWWrBnubVh0OHBkH83V52+
/h/DNfWD1dABAA==

--WIyZ46R2i8wDzkSu--
