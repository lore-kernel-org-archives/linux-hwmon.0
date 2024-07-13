Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128DE1448DC
	for <linux-hwmon@vger.kernel.org>; Sat, 13 Jul 2024 21:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720905169; cv=none; b=hyDnsmr8VhYNiUuGAKgBI4gMXWLPE01GWHmaJqcGzYkInYnQVg2GXVtkyAuf5djkdRxPOIjxodxwtqI7juvS89D6mk809XTrTKrsYAGxpMMoB6GjJJovtEcsfyDvuyD4Ocf8KFUfaeRf3QZE/OF6oTLc/fLW8GPAWlLC87s8HGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720905169; c=relaxed/simple;
	bh=OHdB2EOIsbKMToubj5nhEqq8SrZ7xvFa8o/dicF6Gr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OU9lrNm0yDM8HHaFJzVY+axyIccjFXCbTBheilAT580ClYDxBVkMQZwA5iqM/MB1yCUDKmStR0A0McDnwTp1T48D/Y3+NeXGcmXJoFiHvYMjJ+5u4MxgeT3cqVt1kTQKRNZD6fb4wVcDEh2sCJaadeuN8GCv9gOw22ynY3z1zGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fsjORkCg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fsjORkCg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720905168; x=1752441168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OHdB2EOIsbKMToubj5nhEqq8SrZ7xvFa8o/dicF6Gr8=;
  b=fsjORkCgad7GpqxrotvmT06VpzZ1eNp9lb5DmAEz/W8m8RKftIROz4R/
   qoMhZ6yT4lzk1TpAXwmmbghGSdKN9k7L/XLzEYYqzNveblxmw3kGm7Ywh
   BMrdtM8aNJnaS1iiNdNyZ42wjSq5u3zV1UToiKEFtW8FOgIcuVxQ/3Tn7
   qHis8pt1HAbdpy2NnvzDOkYvYDyqK9J1KCRj9eOiAlsUX7uk1lIke6asf
   tjeuubJd3yHYaRoHnv0G4DwWqZfiJFNZuNZj+xmsBerBnfPf6WIUe1ofG
   XnmozLr9GoiSdDj0WvxOJcUKbl5/5oeQjb/uO8QRjLFqNroFyyqXIW6IE
   Q==;
X-CSE-ConnectionGUID: BmP+UXr7Q4mf9wswtzEjEw==
X-CSE-MsgGUID: q8mjLIioRUKIH0eYe/f0XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="29002884"
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="29002884"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 14:12:47 -0700
X-CSE-ConnectionGUID: o/5523AmSw6NxKOfxKmYgw==
X-CSE-MsgGUID: jqRL+JbZQLiaCnqGxjbagg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="49315084"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Jul 2024 14:12:46 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSk2t-000ckW-2p;
	Sat, 13 Jul 2024 21:12:43 +0000
Date: Sun, 14 Jul 2024 05:11:50 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging 104/137]
 drivers/hwmon/emc2103.c:380:2: warning: unannotated fall-through between
 switch labels
Message-ID: <202407140515.mXPztiXi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guenter,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
head:   a8f382d6e448547fa649f47443668d4a5336e271
commit: bb44b8b0b1e1bae9123fef3cbcf0b4a40887e3a3 [104/137] hwmon: (emc2103) Convert to use regmap and with_info API
config: i386-buildonly-randconfig-004-20240714 (https://download.01.org/0day-ci/archive/20240714/202407140515.mXPztiXi-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240714/202407140515.mXPztiXi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407140515.mXPztiXi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/emc2103.c:380:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     380 |         default:
         |         ^
   drivers/hwmon/emc2103.c:380:2: note: insert 'break;' to avoid fall-through
     380 |         default:
         |         ^
         |         break; 
   drivers/hwmon/emc2103.c:188:18: warning: unused variable 'pwm_base_frequencies' [-Wunused-const-variable]
     188 | static const u16 pwm_base_frequencies[] = {26000, 19531, 4882, 2441};
         |                  ^~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +380 drivers/hwmon/emc2103.c

   338	
   339	static umode_t emc2103_is_visible(const void *_data, enum hwmon_sensor_types type,
   340					  u32 attr, int channel)
   341	{
   342		const struct emc2103_data *data = _data;
   343	
   344		switch (type) {
   345		case hwmon_temp:
   346			if (channel >= data->temp_count)
   347				return 0;
   348			switch (attr) {
   349			case hwmon_temp_input:
   350			case hwmon_temp_fault:
   351			case hwmon_temp_min_alarm:
   352			case hwmon_temp_max_alarm:
   353				return 0444;
   354			case hwmon_temp_min:
   355			case hwmon_temp_max:
   356				return 0644;
   357			default:
   358				break;
   359			}
   360			break;
   361		case hwmon_fan:
   362			switch (attr) {
   363			case hwmon_fan_input:
   364			case hwmon_fan_fault:
   365				return 0444;
   366			case hwmon_fan_div:
   367			case hwmon_fan_target:
   368				return 0644;
   369			default:
   370				break;
   371			}
   372			break;
   373		case hwmon_pwm:
   374			switch (attr) {
   375			case hwmon_pwm_enable:
   376				return 0644;
   377			default:
   378				break;
   379			}
 > 380		default:
   381			break;
   382		}
   383		return 0;
   384	}
   385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
