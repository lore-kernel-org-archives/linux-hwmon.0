Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:42156 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751446AbeBVHCJ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Feb 2018 02:02:09 -0500
Date: Thu, 22 Feb 2018 15:01:10 +0800
From: kbuild test robot <lkp@intel.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: kbuild-all@01.org, joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de,
        gregkh@linuxfoundation.org, jdelvare@suse.com, linux@roeck-us.net,
        benh@kernel.crashing.org, andrew@lunn.ch,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH v2 1/8] [PATCH 1/8] drivers/peci: Add support for PECI
 bus driver core
Message-ID: <201802221429.9znwFmb7%fengguang.wu@intel.com>
References: <20180221161606.32247-2-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180221161606.32247-2-jae.hyun.yoo@linux.intel.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Jae,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v4.16-rc2 next-20180221]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Jae-Hyun-Yoo/PECI-device-driver-introduction/20180222-054545
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/peci/peci-core.c:773:29: sparse: symbol 'peci_match_id' was not declared. Should it be

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
