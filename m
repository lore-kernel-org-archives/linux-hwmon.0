Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D430830EF64;
	Fri, 17 Apr 2026 21:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776461840; cv=none; b=KVnKRd4eJyXSQEzwN7pBUxnT/rjxh42tIOfrVRkmg/qZd0HoHSEk3tCUYJvm2P0t2VaaBl8lM3I0RlqHLgGOYOMkBQZjjd6kG6DB2r3KTaGfOeAjI9qEENolJT/0NtqWfxMISr6WQHBPTiMsJKB+nNL51eqbWbVvn1IWWNPj3CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776461840; c=relaxed/simple;
	bh=5gozF/YVoH2brUhxMlKBeS4XSk3dhGat1AgsWEJQbMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7JiKs839gZDdQgLzrXLf1AYuE1MsNHpzWt9rpLN6bM4lAwezp3vYSZ0mmK6M/l1zsGFenH2rasG88qdtKRdIE/2ogVohYLnU+0AxJPvshbmvddvTHIk2hYfe1EAawyMoULocQO29igjBb82dei9bE22dSQxb68XnWQpMCgoajg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MtF+tXpe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtF+tXpe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776461838; x=1807997838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5gozF/YVoH2brUhxMlKBeS4XSk3dhGat1AgsWEJQbMY=;
  b=MtF+tXpe7zUhFTk0+ltNnx3qGbJgsFzNLp0nPeEEB0GSgNFOArII1D1V
   Uq//werjDh98SFU4HuLUKl3ifYwEkAf3B1joUXzaEyhzAqUp6NOMGD1YZ
   /kJF1NUlAt1wNUI7j4YKoWbdIlHhtUPxJZgMaynQtsXcabai9bM79DL1L
   p48za4FY6GajGfllyKuKpyvgmFmeP75ehIGb1Tcql1eh3JL3CC6AnCn6n
   tknwT6MIpuEqdcVQLrGIX/Ztp6aAlZ+D93HDOdp7Q5MphZNZeDlGvy//G
   W6RQL7rujLQxuZJl1yM+727V5jzkWgYCBSFRbRijsBGvXCM00TtCqu/ec
   A==;
X-CSE-ConnectionGUID: GEj7wFQ+T0KWQ9x6kjnI/g==
X-CSE-MsgGUID: c/Z69Od4T9Gq2vS6klhTZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88550793"
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="88550793"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 14:37:17 -0700
X-CSE-ConnectionGUID: LGL6QYaeSY+q1BqyDDc4pw==
X-CSE-MsgGUID: jCTR/ib3Twmdj0VE4rvLKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="232889944"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Apr 2026 14:37:14 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDqsB-000000000jM-36n5;
	Fri, 17 Apr 2026 21:37:11 +0000
Date: Sat, 18 Apr 2026 05:37:05 +0800
From: kernel test robot <lkp@intel.com>
To: Sergio Melas <sergiomelas@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, Rong Zhang <i@rong.moe>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-hwmon@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Sergio Melas <sergiomelas@gmail.com>
Subject: Re: [PATCH v1] hwmon: (yogafan) Massive hardware expansion and
 structural refactoring
Message-ID: <202604180539.EuswNnjG-lkp@intel.com>
References: <20260413060931.31091-2-sergiomelas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260413060931.31091-2-sergiomelas@gmail.com>

Hi Sergio,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master next-20260416]
[cannot apply to v7.0]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sergio-Melas/hwmon-yogafan-Massive-hardware-expansion-and-structural-refactoring/20260417-063319
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20260413060931.31091-2-sergiomelas%40gmail.com
patch subject: [PATCH v1] hwmon: (yogafan) Massive hardware expansion and structural refactoring
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260418/202604180539.EuswNnjG-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260418/202604180539.EuswNnjG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604180539.EuswNnjG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/yogafan.c:712:6: error: call to undeclared function 'wmi_has_guid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     712 |         if (wmi_has_guid(LENOVO_WMI_OTHER_MODE_GUID) ||
         |             ^
   1 error generated.


vim +/wmi_has_guid +712 drivers/hwmon/yogafan.c

   697	
   698	static int yoga_fan_probe(struct platform_device *pdev)
   699	{
   700		const struct dmi_system_id *dmi_id;
   701		const struct yogafan_config *cfg;
   702		struct yoga_fan_data *data;
   703		struct hwmon_chip_info *chip_info;
   704		struct hwmon_channel_info *info;
   705		u32 *fan_config;
   706		acpi_status status;
   707		int i;
   708		const struct hwmon_channel_info **chip_info_array;
   709	
   710		/* Check for WMI interfaces that handle fan/thermal management. */
   711		/*  If present, we yield to the WMI driver to prevent double-reporting. */
 > 712		if (wmi_has_guid(LENOVO_WMI_OTHER_MODE_GUID) ||
   713		    wmi_has_guid(LENOVO_CAPABILITY_DATA_00_GUID) ||
   714		    wmi_has_guid(LENOVO_WMI_FAN_GUID)) {
   715			dev_info(&pdev->dev, "Lenovo WMI management interface detected; yielding to WMI driver\n");
   716			return -ENODEV;
   717		}
   718	
   719		dmi_id = dmi_first_match(yogafan_quirks);
   720		if (!dmi_id)
   721			return -ENODEV;
   722	
   723		cfg = dmi_id->driver_data;
   724		data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
   725		if (!data)
   726			return -ENOMEM;
   727	
   728		/* * 1. Hardware Calibration & Inertia Scaling (Note 3):
   729		 * Dynamic parameters (TAU and SLEW) are calibrated relative to fan diameter
   730		 * based on the moment of inertia relationship (J ∝ d²).
   731		 */
   732		data->config = cfg;
   733		data->device_max_rpm = cfg->r_max ?: 5000;
   734		data->internal_tau_ms = cfg->tau_ms ?: 1000; /* Robustness: Prevent zero-division */
   735	
   736		/* Calculate Slew Rate based on time-to-max-RPM physics */
   737		data->internal_max_slew_rpm_s = data->device_max_rpm / (cfg->slew_time_s ?: 1);
   738	
   739		/* * Log physical parameters for safety traceability (IEC 61508):
   740		 * Provides a deterministic baseline for the RLLag filter verification.
   741		 */
   742		dev_info(&pdev->dev, "Identified hardware: %s\n", dmi_id->ident);
   743		dev_info(&pdev->dev, "HAL Profile: [Tau: %ums, Slew: %u RPM/s, Max: %u RPM]\n",
   744			 data->internal_tau_ms, data->internal_max_slew_rpm_s, data->device_max_rpm);
   745	
   746		/* * 2. Deterministic Multi-Path Discovery:
   747		 * We iterate through the available paths to find physical handles.
   748		 * This loop tests variations until data->fan_count matches the
   749		 * cfg->fan_count expected for this model profile.
   750		 */
   751		for (i = 0; i < MAX_FANS && data->fan_count < cfg->fan_count; i++) {
   752			acpi_handle handle;
   753	
   754			/* Integrity check: End of defined paths in the quirk table */
   755			if (!cfg->paths[i])
   756				break;
   757	
   758			status = acpi_get_handle(NULL, cfg->paths[i], &handle);
   759			if (ACPI_SUCCESS(status)) {
   760				data->active_handles[data->fan_count] = handle;
   761				data->fan_count++;
   762			} else {
   763				/* Log variation failure for troubleshooting */
   764				dev_dbg(&pdev->dev, "Fan path variation %s not found\n", cfg->paths[i]);
   765			}
   766		}
   767	
   768		/* Integrity Check: Fail probe if no fans were successfully registered */
   769		if (data->fan_count == 0) {
   770			dev_err(&pdev->dev, "Hardware identification failed: No fans found\n");
   771			return -ENODEV;
   772		}
   773	
   774		/* * 3. HWMON Configuration:
   775		 * Dynamically build the HWMON channel configuration based on the
   776		 * number of fans actually discovered. We allocate one extra slot
   777		 * to serve as a null terminator for the HWMON core.
   778		 */
   779		fan_config = devm_kcalloc(&pdev->dev, data->fan_count + 1, sizeof(u32), GFP_KERNEL);
   780		if (!fan_config)
   781			return -ENOMEM;
   782	
   783		for (i = 0; i < data->fan_count; i++)
   784			fan_config[i] = HWMON_F_INPUT | HWMON_F_MAX;
   785	
   786		info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
   787		if (!info)
   788			return -ENOMEM;
   789	
   790		info->type = hwmon_fan;
   791		info->config = fan_config;
   792	
   793		/* 4. Wrap it in chip_info for registration */
   794		chip_info = devm_kzalloc(&pdev->dev, sizeof(*chip_info), GFP_KERNEL);
   795		if (!chip_info)
   796			return -ENOMEM;
   797	
   798		chip_info->ops = &yoga_fan_hwmon_ops;
   799	
   800		chip_info_array = devm_kcalloc(&pdev->dev, 2, sizeof(*chip_info_array), GFP_KERNEL);
   801		if (!chip_info_array)
   802			return -ENOMEM;
   803	
   804		chip_info_array[0] = info;
   805		chip_info_array[1] = NULL; /* Null terminated */
   806	
   807		chip_info->info = chip_info_array;
   808	
   809		/* 5. Finalize registration with the accurate hardware description */
   810		return PTR_ERR_OR_ZERO(devm_hwmon_device_register_with_info(&pdev->dev,
   811					DRVNAME, data, chip_info, NULL));
   812	}
   813	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
