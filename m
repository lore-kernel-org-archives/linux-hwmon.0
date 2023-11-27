Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GDop1Sx/"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A1CD4D;
	Mon, 27 Nov 2023 05:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701091027; x=1732627027;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2pAaMh0cJn8v4EHY52uAptTzkL/1qOHMD953Lt40J/E=;
  b=GDop1Sx/Lfg1WOHUj+V+FGP0+fKMXv/LBB/j17BzvIIoYPUGQ8fkqjAw
   IHoFqTB5Fph8dPe75HLH+6Lfq+uUKK3KyOAbUekOPTZJJa4h+PmbQCuyx
   TAPJmutJBwQx8TBvzqommLDs/3yEa+BCkd8nVd8wAfEevc/E24CWiKNCi
   /Rhzewgo2/GxMTOy/EPsAnLPBfl+n25a6l8VgpR1LpOn8wQhtDTOtsa/G
   gORQ3uSQA6KBttexbaCNS7AcHucWGiSnc28z6zPlLHJU00To9k3TOvbZm
   1yn8r5C+MFh5gjVUxZMPK+quNUriUQwkwJAXCgOmMLAzttDMyXAKzNVc2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="423833664"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="423833664"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:17:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="718031604"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="718031604"
Received: from zhipengw-mobl1.ccr.corp.intel.com (HELO rzhang1-mobl7.ccr.corp.intel.com) ([10.255.29.237])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:17:04 -0800
From: Zhang Rui <rui.zhang@intel.com>
To: linux@roeck-us.net,
	jdelvare@suse.com
Cc: fenghua.yu@intel.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] hwmon: (coretemp) Fix core count limitation
Date: Mon, 27 Nov 2023 21:16:48 +0800
Message-Id: <20231127131651.476795-1-rui.zhang@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, coretemp driver only supports 128 cores per package.
This loses some core temperature information on systems that have more
than 128 cores per package.
 [   58.685033] coretemp coretemp.0: Adding Core 128 failed
 [   58.692009] coretemp coretemp.0: Adding Core 129 failed

To get rid of the fixed length pdata->core_data[] array,
  Patch 1/3 and 2/3 removes the dependency of array index in sysfs
  attribute callbacks.
  Patch 3/3 removes the pdata->core_data[] array and use a per package
  list to maintain the per core temperature infomation instead.

-rui

----------------------------------------------------------------
Zhang Rui (3):
      hwmon: (coretemp) Introduce enum for attr index
      hwmon: (coretemp) Remove unnecessary dependency of array index
      hwmon: (coretemp) Fix core count limitation

 drivers/hwmon/coretemp.c | 137 +++++++++++++++++++++++------------------------
 1 file changed, 67 insertions(+), 70 deletions(-)
