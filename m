Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2402FDC50;
	Fri, 14 Nov 2025 09:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763113703; cv=none; b=lAxhpq1galawBImcNCno7bY9YyI92iVsQaFLGUDp+XC73if1GMf89WABESrGYFvg5aXqERzbEyFVHI67ovCEEOPyuHaJO5xrWInZ3KAbHbtn0krnw1Swo0I4yrt3LTXlDN+PHtOi8zlTP33y2pVZKmFkTSy2SNQGRO2y3U0D54Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763113703; c=relaxed/simple;
	bh=i0AO/1x25+/6QKCMietX23awnET86FLiB4tDhthcWSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fLBswPZgbh3svw87WVAggeuwjVz73XIg5zHCwtYnIGBb2FQC4DLN6RouOGyWULwSCWmLpsd0qv/PrmUiMrPB1aXoTQTRjwYJuU/1PI7bLaIjZUMozg2BV/MX+zT+owG1sZZcI/ZD4pYTk80IqwecEO2X59FxaD4CSRg4TTUMHco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5ZY3uCf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5ZY3uCf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763113701; x=1794649701;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i0AO/1x25+/6QKCMietX23awnET86FLiB4tDhthcWSY=;
  b=V5ZY3uCfQ6+zSiKKPNniBmeReWwvlrA7Zg4kQw1ilYhPTCj4rWK+gFdB
   3T+G9rk9ayLg8JD4Vcn1eRt6Xc8gRvsv32NMBgaqOxkkD8Z0yYbXJdeLE
   gkGqPzERLfJYaP6eD4EgXeWFQJgsJWEiBiiyVEcFKqm9A0g1e6wBOzlH6
   JFntNvdgAn62834W1BazCNzpj6THC1J/ZoBULtYaJrkpOeKKkdOd34G+/
   auC1TCnX3pSLkNUpOcXB6jTp0zyu7MmdBTiYYS3gj6s+hdRtRBWGtYFsV
   4zGNUv9nqGuOyMtXJb723xa9Z9SFjj5NFe33YMzS0VZX7qZuKL0nHDoQZ
   g==;
X-CSE-ConnectionGUID: idRAKr59SUuPb3Jp8iX/Dw==
X-CSE-MsgGUID: pl+2M4dLSZ2Iul1oc+Qzpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="68830701"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="68830701"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 01:48:21 -0800
X-CSE-ConnectionGUID: SNkso/WIRq2ZT3syf1c/7Q==
X-CSE-MsgGUID: K+bjzMawQiaolwjQeOCS6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="194886979"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Nov 2025 01:48:18 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJqPf-0006Qb-2R;
	Fri, 14 Nov 2025 09:48:15 +0000
Date: Fri, 14 Nov 2025 17:48:08 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rong Zhang <i@rong.moe>, Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4 6/7] platform/x86: lenovo-wmi-capdata: Wire up Fan
 Test Data
Message-ID: <202511141750.9JubdfJr-lkp@intel.com>
References: <20251113191152.96076-7-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113191152.96076-7-i@rong.moe>

Hi Rong,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2ccec5944606ee1389abc7ee41986825c6ceb574]

url:    https://github.com/intel-lab-lkp/linux/commits/Rong-Zhang/platform-x86-lenovo-wmi-helpers-Convert-returned-buffer-into-u32/20251114-032343
base:   2ccec5944606ee1389abc7ee41986825c6ceb574
patch link:    https://lore.kernel.org/r/20251113191152.96076-7-i%40rong.moe
patch subject: [PATCH v4 6/7] platform/x86: lenovo-wmi-capdata: Wire up Fan Test Data
config: x86_64-buildonly-randconfig-001-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141750.9JubdfJr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141750.9JubdfJr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141750.9JubdfJr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/lenovo/wmi-capdata.c:124:27: warning: cast to smaller integer type 'enum lwmi_cd_type' from 'void *' [-Wvoid-pointer-to-enum-cast]
     124 |         enum lwmi_cd_type type = (enum lwmi_cd_type)data;
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/lenovo/wmi-capdata.c:711:40: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     711 |                 ret = lwmi_cd00_get_data(priv->list, LWMI_ATTR_ID_FAN_TEST, &capdata00);
         |                                                      ^
   drivers/platform/x86/lenovo/wmi-capdata.c:56:3: note: expanded from macro 'LWMI_ATTR_ID_FAN_TEST'
      56 |         (FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |                \
         |          ^
   1 warning and 1 error generated.


vim +/FIELD_PREP +711 drivers/platform/x86/lenovo/wmi-capdata.c

   685	
   686	static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
   687	{
   688		const struct lwmi_cd_info *info = context;
   689		struct lwmi_cd_priv *priv;
   690		int ret;
   691	
   692		if (!info)
   693			return -EINVAL;
   694	
   695		priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
   696		if (!priv)
   697			return -ENOMEM;
   698	
   699		priv->wdev = wdev;
   700		dev_set_drvdata(&wdev->dev, priv);
   701	
   702		ret = lwmi_cd_setup(priv, info->type);
   703		if (ret)
   704			goto out;
   705	
   706		switch (info->type) {
   707		case LENOVO_CAPABILITY_DATA_00: {
   708			enum lwmi_cd_type sub_component_type = LENOVO_FAN_TEST_DATA;
   709			struct capdata00 capdata00;
   710	
 > 711			ret = lwmi_cd00_get_data(priv->list, LWMI_ATTR_ID_FAN_TEST, &capdata00);
   712			if (ret || !(capdata00.supported & LWMI_SUPP_VALID)) {
   713				dev_dbg(&wdev->dev, "capdata00 declares no fan test support\n");
   714				sub_component_type = CD_TYPE_NONE;
   715			}
   716	
   717			/* Sub-master (capdata00) <-> sub-component (capdata_fan) */
   718			ret = lwmi_cd_sub_master_add(priv, sub_component_type);
   719			if (ret)
   720				goto out;
   721	
   722			/* Master (lenovo-wmi-other) <-> sub-master (capdata00) */
   723			ret = component_add(&wdev->dev, &lwmi_cd_component_ops);
   724			goto out;
   725		}
   726		case LENOVO_CAPABILITY_DATA_01:
   727			priv->acpi_nb.notifier_call = lwmi_cd01_notifier_call;
   728	
   729			ret = register_acpi_notifier(&priv->acpi_nb);
   730			if (ret)
   731				goto out;
   732	
   733			ret = devm_add_action_or_reset(&wdev->dev, lwmi_cd01_unregister,
   734						       &priv->acpi_nb);
   735			if (ret)
   736				goto out;
   737	
   738			ret = component_add(&wdev->dev, &lwmi_cd_component_ops);
   739			goto out;
   740		case LENOVO_FAN_TEST_DATA:
   741			ret = component_add(&wdev->dev, &lwmi_cd_sub_component_ops);
   742			goto out;
   743		default:
   744			return -EINVAL;
   745		}
   746	out:
   747		if (ret) {
   748			dev_err(&wdev->dev, "failed to register %s: %d\n",
   749				info->name, ret);
   750		} else {
   751			dev_info(&wdev->dev, "registered %s with %u items\n",
   752				 info->name, priv->list->count);
   753		}
   754		return ret;
   755	}
   756	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
