Return-Path: <SRS0=ZZGB=ZA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5942BC5DF60
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Nov 2019 20:04:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F3A6207FA
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Nov 2019 20:04:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732027AbfKHUEU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 8 Nov 2019 15:04:20 -0500
Received: from mga12.intel.com ([192.55.52.136]:8889 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731106AbfKHUET (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 8 Nov 2019 15:04:19 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Nov 2019 12:04:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,283,1569308400"; 
   d="scan'208";a="404565293"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Nov 2019 12:04:18 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iTAUU-0002qb-69; Sat, 09 Nov 2019 04:04:18 +0800
Date:   Sat, 9 Nov 2019 04:03:54 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     kbuild-all@lists.01.org, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [hwmon:watchdog-next 22/24] drivers/watchdog/imx7ulp_wdt.c:115:31:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <201911090453.Hn6woLpS%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
head:   1fc86924bf1dd70aa4d6379e799f79d4723d1d0e
commit: bcf0eed581f50ad18f1dbcba8595f39c98fad306 [22/24] watchdog: imx7ulp: Fix reboot hang
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-21-gb31adac-dirty
        git checkout bcf0eed581f50ad18f1dbcba8595f39c98fad306
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/watchdog/imx7ulp_wdt.c:115:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct watchdog_device *wdog @@    got struct watchdog_device *wdog @@
>> drivers/watchdog/imx7ulp_wdt.c:115:31: sparse:    expected struct watchdog_device *wdog
>> drivers/watchdog/imx7ulp_wdt.c:115:31: sparse:    got void [noderef] <asn:2> *base

vim +115 drivers/watchdog/imx7ulp_wdt.c

   109	
   110	static int imx7ulp_wdt_restart(struct watchdog_device *wdog,
   111				       unsigned long action, void *data)
   112	{
   113		struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
   114	
 > 115		imx7ulp_wdt_enable(wdt->base, true);
   116		imx7ulp_wdt_set_timeout(&wdt->wdd, 1);
   117	
   118		/* wait for wdog to fire */
   119		while (true)
   120			;
   121	
   122		return NOTIFY_DONE;
   123	}
   124	

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
