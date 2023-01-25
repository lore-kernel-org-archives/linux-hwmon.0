Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F58CC54E94
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Jan 2023 09:30:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235260AbjAYJaN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Jan 2023 04:30:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233965AbjAYJaM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Jan 2023 04:30:12 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2468B26863;
        Wed, 25 Jan 2023 01:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674639004; x=1706175004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iib1gOh8mT+FDy8DZl6H+FgLTsEkN7huold2ibuCi1o=;
  b=MmYOXEjXXgze7IxYzMptRkXvPQ+yRjb+GNsJO4lOH1KOcyPkWM524dlj
   LroVUmgQr6hkYstkiuk1qfMtXuSyGrhhVpMzjRDKKgpVpAd4WN/EJ8wG4
   pemaxGtEfvarb4KnUl+jl+VzJ+lFM4K/bqUpMtM37w+BUjy/p5cJz2M1t
   H2rSlwQpecA7+0GhFN7jGE4wrC3aBNinfSgzoGisznT9wvm3AoclDsOfE
   afE1mimBbUHMiaGabY12M5y3eWsauZ/ELOCLKJt82ALk1IHP9RbZthuwd
   DyXT5I60M/LHCxtT6PZdp/KCh2BGwIXBKTFxbKmeIL298rOAULAdcBkpY
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="310092166"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="310092166"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2023 01:29:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="804938298"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="804938298"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 25 Jan 2023 01:29:52 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pKc6J-0007CY-26;
        Wed, 25 Jan 2023 09:29:51 +0000
Date:   Wed, 25 Jan 2023 17:29:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mario Kicherer <dev@kicherer.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>, linux-doc@vger.kernel.org
Subject: [groeck-staging:hwmon-next 40/41] htmldocs:
 Documentation/hwmon/mc34vr500.rst: WARNING: document isn't included in any
 toctree
Message-ID: <202301251734.bFyrYeeG-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   ecabca1a36d59ec32fa315f3dc2e81784670b25b
commit: be5d5218ef86618ad7b0cd7abf34550e048944a8 [40/41] docs: hwmon: add docs for the NXP MC34VR500 PMIC
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=be5d5218ef86618ad7b0cd7abf34550e048944a8
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging hwmon-next
        git checkout be5d5218ef86618ad7b0cd7abf34550e048944a8
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/hwmon/mc34vr500.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
