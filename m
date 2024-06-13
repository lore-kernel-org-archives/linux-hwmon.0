Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5922B12F581
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Jun 2024 03:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718250516; cv=none; b=JCOsEvoK59u52Kua8W4Zp/S9612SuKAnsJAfArOHJUIdW8Sh79J4z2rBrJrcCtWNwK2xrF3uO0mOGnoFG0AgsV7ax5n27NKjHq5KS+VeEiuj8tpmWqcg0j/TYurYi8BfGen6NyxOBTJKoGHovc/+ajXitG9/x2XDg12QlzJ6d7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718250516; c=relaxed/simple;
	bh=SWTs3L2l/CyjLwW4zDfO58G0cH451F92RRlK5ceEscg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hmwXGVjRAcMwLu62nkiXxF4UH42JNWE5e0SVcla32BoOcqhi1pJKkDv+9+mdkd+wlDknaz7hIWHz0zLwL4RcwrjVq5BGyvJHR9Zp/+5+i+F5TrrGcD5dyIDz9LRJJpQOHcQ6SClpxawTOSWNXwKS04urYxMlKIaG2vUxUHxB6v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bz97IEbp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bz97IEbp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718250514; x=1749786514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SWTs3L2l/CyjLwW4zDfO58G0cH451F92RRlK5ceEscg=;
  b=Bz97IEbpPs2Ehe7mWV2PrS22Kf3u9A/jvtDbsLlM4tAhooAVh0+a26Hl
   DZJ9kOOaNUW+vekSifSMfFt54qsFnci2L+Wy5RebtUFekQu44Z8UhL29s
   PLstRae2ccV5hTglqrxU0QjyRODdFNRSsfH74BYNciV1CxSH46cr2rfd9
   Ygb1epZ5f8e0z6FRrG1y9MfFr3YA388Pd5hVepgR80eh804fu451NW4Ri
   OIX6xC0BEEQaDHjNLth9lO7ZO/BQFBHq/V88c1jonvg3ZVeB44kstICrU
   rVV9ilusdk8ge1l15OGjOtO/h3FKoNV5smcqFdYMJT9YDKF7KiyaCRTBT
   g==;
X-CSE-ConnectionGUID: KIs+gsXhSna99uVwA5uzRA==
X-CSE-MsgGUID: S+cXdbqsTVGcaRMBObdx0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14767894"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="14767894"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 20:48:31 -0700
X-CSE-ConnectionGUID: TPMH6uPOSVykT7qkOSuWCg==
X-CSE-MsgGUID: jxVNspd3S0mFfoVqOV8QQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="63178584"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jun 2024 20:48:29 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHbRr-0002Bs-2F;
	Thu, 13 Jun 2024 03:48:27 +0000
Date: Thu, 13 Jun 2024 11:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: Noah Wang <noahwang.wang@outlook.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 63/63]
 drivers/hwmon/pmbus/mp9941.c:60:33: error: call to undeclared function
 'FIELD_PREP'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202406131151.XhKU0bke-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   c16fa69677811f3a33ef5d4102f106a3f8c5cbdf
commit: c16fa69677811f3a33ef5d4102f106a3f8c5cbdf [63/63] hwmon: add MP9941 driver
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240613/202406131151.XhKU0bke-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131151.XhKU0bke-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131151.XhKU0bke-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwmon/pmbus/mp9941.c:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/hwmon/pmbus/mp9941.c:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/hwmon/pmbus/mp9941.c:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/hwmon/pmbus/mp9941.c:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/hwmon/pmbus/mp9941.c:60:33: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      60 |         ret = (ret & ~GENMASK(7, 6)) | FIELD_PREP(GENMASK(7, 6), 3);
         |                                        ^
>> drivers/hwmon/pmbus/mp9941.c:84:6: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      84 |         if (FIELD_GET(GENMASK(4, 4), ret))
         |             ^
   drivers/hwmon/pmbus/mp9941.c:104:33: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     104 |         ret = (ret & ~GENMASK(3, 2)) | FIELD_PREP(GENMASK(3, 2), 0);
         |                                        ^
   7 warnings and 3 errors generated.


vim +/FIELD_PREP +60 drivers/hwmon/pmbus/mp9941.c

    43	
    44	static int mp9941_set_vout_format(struct i2c_client *client)
    45	{
    46		int ret;
    47	
    48		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
    49		if (ret < 0)
    50			return ret;
    51	
    52		ret = i2c_smbus_read_word_data(client, MFR_RESO_SET);
    53		if (ret < 0)
    54			return ret;
    55	
    56		/*
    57		 * page = 0, MFR_RESO_SET[7:6] defines the vout format
    58		 * 2'b11 set the vout format as direct
    59		 */
  > 60		ret = (ret & ~GENMASK(7, 6)) | FIELD_PREP(GENMASK(7, 6), 3);
    61	
    62		return i2c_smbus_write_word_data(client, MFR_RESO_SET, ret);
    63	}
    64	
    65	static int
    66	mp9941_identify_vid_resolution(struct i2c_client *client, struct pmbus_driver_info *info)
    67	{
    68		struct mp9941_data *data = to_mp9941_data(info);
    69		int ret;
    70	
    71		/*
    72		 * page = 2, MFR_VR_MULTI_CONFIG_R1[4:4] defines rail1 vid step value
    73		 * 1'b0 represents the vid step value is 10mV
    74		 * 1'b1 represents the vid step value is 5mV
    75		 */
    76		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 2);
    77		if (ret < 0)
    78			return ret;
    79	
    80		ret = i2c_smbus_read_word_data(client, MFR_VR_MULTI_CONFIG_R1);
    81		if (ret < 0)
    82			return ret;
    83	
  > 84		if (FIELD_GET(GENMASK(4, 4), ret))
    85			data->vid_resolution = 5;
    86		else
    87			data->vid_resolution = 10;
    88	
    89		return 0;
    90	}
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
