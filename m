Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fsgXxWRQ"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B717FA7;
	Mon,  4 Dec 2023 05:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701695260; x=1733231260;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rwfeHVUdIJbFUBsUHDPSqcnPbouutdp0s8W6pWKb+Y4=;
  b=fsgXxWRQ89m4nUroXsW8cNZiVAFyIkyNiUyf+4W9A8wxcEl0dcf6/OHN
   0lRvV3dfulQDh/7rnREljYFb4WFLZIENwuWIdDmwgTWUnxW7HzaIfl3ex
   ZN4S3/Cs0E2w8BFR/z1H2LmDf5gdeZLaBTckYzs/aDb9SqaJvY3TSf+hb
   O+j/bt9fJDxXaxXaLLf0RjuotT1CgRHXFb17dvQheY5hqmB4jsTvnl9N5
   UTe3cthvCNNc47QmHS5r2FtuamSEk9RpQMiX4eIqHmgzvuPIckptx+4S/
   AVrdwdq/WTKLP0x45BtoDcs6XuyybGFMqnhqGK7gXRvscfaja3sJcwCWQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="15275123"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="15275123"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 05:07:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="861373354"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="861373354"
Received: from malladhi-mobl.gar.corp.intel.com ([10.249.34.28])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 05:07:12 -0800
Date: Mon, 4 Dec 2023 15:07:06 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Kunwu Chan <chentao@kylinos.cn>, 
    "hdegoede@redhat.com" <hdegoede@redhat.com>, 
    "jdelvare@suse.com" <jdelvare@suse.com>, 
    "linux@roeck-us.net" <linux@roeck-us.net>, 
    Shravan Ramani <shravankr@nvidia.com>, 
    "jiri@resnulli.us" <jiri@resnulli.us>, 
    "kunwu.chan@hotmail.com" <kunwu.chan@hotmail.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH v2] platform/mellanox: Add some null/error pointer checks
 to mlxbf-pmc.c
In-Reply-To: <BN9PR12MB5381B3408452445483B7281EAF81A@BN9PR12MB5381.namprd12.prod.outlook.com>
Message-ID: <b2fa490-4e48-44a6-64d3-45ef4f5c14b@linux.intel.com>
References: <20231201055447.2356001-1-chentao@kylinos.cn> <BN9PR12MB5381B3408452445483B7281EAF81A@BN9PR12MB5381.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1694539297-1701695235=:3149"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1694539297-1701695235=:3149
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

> > Subject: [PATCH v2] platform/mellanox: Add some null/error pointer checks to
> > mlxbf-pmc.c
> > 
> > devm_kasprintf() returns a pointer to dynamically allocated memory which
> > can be NULL upon failure.
> > devm_hwmon_device_register_with_groups return a error pointer upon
> > failure.
> > 
> > Compile-tested only.
> > 
> > Fixes: 1a218d312e65 ("platform/mellanox: mlxbf-pmc: Add Mellanox
> > BlueField PMC driver")
> > Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > Suggested-by: Vadim Pasternak <vadimp@nvidia.com>
> > Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> 
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>

> >  		attr->dev_attr.attr.name = devm_kasprintf(dev, GFP_KERNEL,
> >  							  "enable");
> > +		if (!attr->dev_attr.attr.name)
> > +			return -ENOMEM;

> >  	pmc->hwmon_dev = devm_hwmon_device_register_with_groups(
> >  		dev, "bfperf", pmc, pmc->groups);
> > +	if (IS_ERR(pmc->hwmon_dev))
> > +		return PTR_ERR(pmc->hwmon_dev);

Thank you both, applied to review-ilpo and will go into fixes branch once 
LKP has had its chance to build this.

In the end, I decided to split the devm_kasprintf() and 
devm_hwmon_device_register_with_groups() changes into separate commits.

-- 
 i.

--8323329-1694539297-1701695235=:3149--
