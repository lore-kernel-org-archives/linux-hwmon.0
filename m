Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9A7C433E0
	for <linux-hwmon@archiver.kernel.org>; Sat, 13 Feb 2021 01:16:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3BE660203
	for <linux-hwmon@archiver.kernel.org>; Sat, 13 Feb 2021 01:16:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbhBMBPx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 12 Feb 2021 20:15:53 -0500
Received: from mga17.intel.com ([192.55.52.151]:48897 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229708AbhBMBPx (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 12 Feb 2021 20:15:53 -0500
IronPort-SDR: 66UHp97mbimJIjXo+aytlY/Fs5NNKxBjLFgFfqEcLCqvFKkU0+0w2F9jWuXOl4BPXTK0Mt1N5w
 SDlrGftFjTCw==
X-IronPort-AV: E=McAfee;i="6000,8403,9893"; a="162256737"
X-IronPort-AV: E=Sophos;i="5.81,175,1610438400"; 
   d="scan'208";a="162256737"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2021 17:15:12 -0800
IronPort-SDR: /27sA+2+Iu35epihV9U8MxfrLenKI0RA0XUmKqKwNMitCIdOwCouVX7YuQnyI/ojw2/riK3rvE
 EX3G7D2gWhFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,175,1610438400"; 
   d="scan'208";a="423403964"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 12 Feb 2021 17:15:10 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lAjWg-000508-43; Sat, 13 Feb 2021 01:15:10 +0000
Date:   Sat, 13 Feb 2021 09:14:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD REGRESSION
 de3a46504a58426f1c91117be601ae270180bc93
Message-ID: <602727f7.1ucv4X4AIKBfAkyH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: de3a46504a58426f1c91117be601ae270180bc93  MAINTAINERS: Add entry for Texas Instruments TPS23861 PoE PSE

Error/Warning reports:

https://lore.kernel.org/linux-hwmon/202102122211.QIGWxrQn-lkp@intel.com
https://lore.kernel.org/linux-hwmon/202102130038.Vo68Vu7N-lkp@intel.com

Error/Warning in current branch:

drivers/hwmon/npcm750-pwm-fan.c:494:51: error: 'flags' undeclared (first use in this function); did you mean 'flag'?
drivers/hwmon/npcm750-pwm-fan.c:494:51: error: use of undeclared identifier 'flags'; did you mean 'flag'?

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- alpha-randconfig-p002-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- alpha-randconfig-r004-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- alpha-randconfig-r013-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- arc-allyesconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- arc-randconfig-r016-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- arc-randconfig-r024-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- arc-randconfig-r032-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- arm-allmodconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- arm-allyesconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- arm-randconfig-p001-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- arm-randconfig-r012-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- arm64-allyesconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- arm64-randconfig-r031-20210212
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- arm64-randconfig-r032-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- c6x-allyesconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- c6x-randconfig-r011-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- c6x-randconfig-r015-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- c6x-randconfig-r022-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- csky-randconfig-c004-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- h8300-allyesconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-allyesconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-a002-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-a002-20210212
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-a003-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-a005-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-a005-20210212
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-a006-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-a006-20210212
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-a011-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-a011-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-a013-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-a013-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-a014-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-a014-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-a015-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-a015-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-a016-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-c004-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-m021-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-m031-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-r004-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-r015-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-s002-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- i386-randconfig-s031-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- ia64-allmodconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- ia64-allyesconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- ia64-randconfig-r001-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- ia64-randconfig-r015-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- ia64-randconfig-r021-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- m68k-allmodconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- m68k-allyesconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- m68k-randconfig-r001-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- m68k-randconfig-r003-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- microblaze-randconfig-r013-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- microblaze-randconfig-r014-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- mips-allmodconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- mips-allyesconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- mips-randconfig-r016-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- mips-randconfig-s032-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- nds32-allyesconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- nds32-randconfig-r002-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- nds32-randconfig-r011-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- nds32-randconfig-r035-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- nds32-randconfig-s031-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- nios2-allmodconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- nios2-allyesconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- nios2-randconfig-r012-20210212
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- nios2-randconfig-r014-20210212
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- nios2-randconfig-r021-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- nios2-randconfig-s031-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- nios2-randconfig-s032-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- openrisc-randconfig-r002-20210212
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- openrisc-randconfig-r003-20210212
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- openrisc-randconfig-r005-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- openrisc-randconfig-r012-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- openrisc-randconfig-r024-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- openrisc-randconfig-s031-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- parisc-allyesconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- parisc-randconfig-p002-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- parisc-randconfig-r035-20210212
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- powerpc-allmodconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- powerpc-allyesconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- powerpc-randconfig-r004-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- powerpc64-randconfig-r002-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- riscv-allmodconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- riscv-allyesconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- riscv-randconfig-p001-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- s390-allyesconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- s390-randconfig-m031-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- s390-randconfig-r033-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- sh-allmodconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- sh-randconfig-r002-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- sh-randconfig-r014-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- sh-randconfig-s032-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- sparc-allyesconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- sparc-randconfig-r011-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- sparc-randconfig-r013-20210212
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- sparc-randconfig-r014-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- sparc-randconfig-r035-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- sparc64-allyesconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- sparc64-randconfig-c003-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- sparc64-randconfig-r001-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- sparc64-randconfig-r006-20210212
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- sparc64-randconfig-r026-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- sparc64-randconfig-r034-20210212
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- sparc64-randconfig-s032-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- x86_64-allyesconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- x86_64-randconfig-a002-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- x86_64-randconfig-a004-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- x86_64-randconfig-c002-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- x86_64-randconfig-c002-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- x86_64-randconfig-m001-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- x86_64-randconfig-m001-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- x86_64-randconfig-r005-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- x86_64-randconfig-s021-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- x86_64-randconfig-s022-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- x86_64-randconfig-s022-20210212
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
|-- xtensa-allyesconfig
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)
`-- xtensa-randconfig-r004-20210209
    `-- drivers-hwmon-npcm750-pwm-fan.c:error:flags-undeclared-(first-use-in-this-function)

clang_recent_errors
|-- arm-randconfig-r001-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:use-of-undeclared-identifier-flags
|-- arm-randconfig-r036-20210212
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:use-of-undeclared-identifier-flags
|-- arm64-randconfig-r025-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:use-of-undeclared-identifier-flags
|-- powerpc64-randconfig-r026-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:use-of-undeclared-identifier-flags
|-- x86_64-randconfig-a003-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:use-of-undeclared-identifier-flags
|-- x86_64-randconfig-a005-20210211
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:use-of-undeclared-identifier-flags
|-- x86_64-randconfig-a011-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:use-of-undeclared-identifier-flags
|-- x86_64-randconfig-a012-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:use-of-undeclared-identifier-flags
|-- x86_64-randconfig-a013-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:use-of-undeclared-identifier-flags
|-- x86_64-randconfig-a014-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:use-of-undeclared-identifier-flags
|-- x86_64-randconfig-a015-20210209
|   `-- drivers-hwmon-npcm750-pwm-fan.c:error:use-of-undeclared-identifier-flags
`-- x86_64-randconfig-a016-20210209
    `-- drivers-hwmon-npcm750-pwm-fan.c:error:use-of-undeclared-identifier-flags

elapsed time: 725m

configs tested: 155
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         shannon_defconfig
arm                     davinci_all_defconfig
arc                        vdk_hs38_defconfig
sh                        sh7763rdp_defconfig
c6x                        evmc6474_defconfig
nios2                         3c120_defconfig
powerpc                     tqm5200_defconfig
arm                           u8500_defconfig
mips                        nlm_xlp_defconfig
sh                      rts7751r2d1_defconfig
m68k                            q40_defconfig
arm                            lart_defconfig
arm                            pleb_defconfig
arm                   milbeaut_m10v_defconfig
h8300                            alldefconfig
arm                         axm55xx_defconfig
sparc                            allyesconfig
sh                        apsh4ad0a_defconfig
mips                       bmips_be_defconfig
powerpc                  iss476-smp_defconfig
sh                           se7705_defconfig
m68k                          hp300_defconfig
powerpc                 linkstation_defconfig
sh                            migor_defconfig
mips                      maltasmvp_defconfig
m68k                                defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                 mpc832x_rdb_defconfig
m68k                        m5407c3_defconfig
c6x                              allyesconfig
mips                           jazz_defconfig
powerpc                 mpc832x_mds_defconfig
mips                       capcella_defconfig
arm                       netwinder_defconfig
powerpc64                        alldefconfig
powerpc64                           defconfig
arc                              alldefconfig
microblaze                      mmu_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                        fsp2_defconfig
powerpc                      ppc64e_defconfig
mips                           ci20_defconfig
powerpc                   bluestone_defconfig
sh                          rsk7203_defconfig
nds32                               defconfig
powerpc                    gamecube_defconfig
mips                          ath79_defconfig
s390                          debug_defconfig
powerpc                       holly_defconfig
powerpc                     kmeter1_defconfig
powerpc                     mpc5200_defconfig
openrisc                  or1klitex_defconfig
arm                       cns3420vb_defconfig
arm                           h5000_defconfig
arm                        clps711x_defconfig
arc                        nsim_700_defconfig
powerpc                      pmac32_defconfig
openrisc                 simple_smp_defconfig
powerpc                        icon_defconfig
xtensa                         virt_defconfig
mips                         bigsur_defconfig
arm                        magician_defconfig
mips                            e55_defconfig
parisc                              defconfig
parisc                generic-32bit_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210209
x86_64               randconfig-a001-20210209
x86_64               randconfig-a005-20210209
x86_64               randconfig-a004-20210209
x86_64               randconfig-a002-20210209
x86_64               randconfig-a003-20210209
i386                 randconfig-a001-20210209
i386                 randconfig-a005-20210209
i386                 randconfig-a003-20210209
i386                 randconfig-a002-20210209
i386                 randconfig-a006-20210209
i386                 randconfig-a004-20210209
i386                 randconfig-a003-20210212
i386                 randconfig-a005-20210212
i386                 randconfig-a002-20210212
i386                 randconfig-a001-20210212
i386                 randconfig-a004-20210212
i386                 randconfig-a006-20210212
i386                 randconfig-a016-20210209
i386                 randconfig-a013-20210209
i386                 randconfig-a012-20210209
i386                 randconfig-a014-20210209
i386                 randconfig-a011-20210209
i386                 randconfig-a015-20210209
i386                 randconfig-a016-20210211
i386                 randconfig-a014-20210211
i386                 randconfig-a012-20210211
i386                 randconfig-a013-20210211
i386                 randconfig-a011-20210211
i386                 randconfig-a015-20210211
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210211
x86_64               randconfig-a002-20210211
x86_64               randconfig-a001-20210211
x86_64               randconfig-a004-20210211
x86_64               randconfig-a005-20210211
x86_64               randconfig-a006-20210211
x86_64               randconfig-a013-20210209
x86_64               randconfig-a014-20210209
x86_64               randconfig-a015-20210209
x86_64               randconfig-a012-20210209
x86_64               randconfig-a016-20210209
x86_64               randconfig-a011-20210209

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
