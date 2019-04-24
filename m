Return-Path: <SRS0=3aKW=S2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5331C282E1
	for <linux-hwmon@archiver.kernel.org>; Wed, 24 Apr 2019 07:36:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E87C218B0
	for <linux-hwmon@archiver.kernel.org>; Wed, 24 Apr 2019 07:36:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727055AbfDXHgV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 24 Apr 2019 03:36:21 -0400
Received: from mga02.intel.com ([134.134.136.20]:56296 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726232AbfDXHgV (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 Apr 2019 03:36:21 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Apr 2019 00:36:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,389,1549958400"; 
   d="scan'208";a="151896945"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Apr 2019 00:36:19 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hJCS2-0001co-Nn; Wed, 24 Apr 2019 15:36:18 +0800
Date:   Wed, 24 Apr 2019 15:36:01 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     kbuild-all@01.org, linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-playground 130/134] drivers/hwmon/max6650.c:602:10:
 sparse: symbol 'max6650_pwm_modes' was not declared. Should it be static?
Message-ID: <201904241520.vay0jaT0%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-playground
head:   05d763050bbaa40daa4b60a3912c9311ca5791a5
commit: 77d270a1d4db919db0b02fec1d85ad5a57d556d7 [130/134] hwmon: (max6650) Convert to use devm_hwmon_device_register_with_info
reproduce:
        # apt-get install sparse
        git checkout 77d270a1d4db919db0b02fec1d85ad5a57d556d7
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>



sparse warnings: (new ones prefixed by >>)

   drivers/hwmon/max6650.c:160:16: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:160:16: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:160:16: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:160:16: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:160:16: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:160:16: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:160:16: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:280:15: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:280:15: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:280:15: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:280:15: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:280:15: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:280:15: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:280:15: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:490:17: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:490:17: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:490:17: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:490:17: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:490:17: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:490:17: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:490:17: sparse: expression using sizeof(void)
>> drivers/hwmon/max6650.c:602:10: sparse: symbol 'max6650_pwm_modes' was not declared. Should it be static?
   drivers/hwmon/max6650.c:622:42: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:622:42: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:622:42: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:622:42: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:622:42: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:622:42: sparse: expression using sizeof(void)
   drivers/hwmon/max6650.c:622:42: sparse: expression using sizeof(void)

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
