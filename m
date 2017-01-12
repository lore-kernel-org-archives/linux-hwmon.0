Return-path: <fengguang.wu@intel.com>
Date: Thu, 12 Jan 2017 15:39:56 +0800
From: kbuild test robot <lkp@intel.com>
To: eajames.ibm@gmail.com
Cc: kbuild-all@01.org, linux@roeck-us.net, devicetree@vger.kernel.org,
	jdelvare@suse.com, corbet@lwn.net, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, mark.rutland@arm.com,
	robh+dt@kernel.org, wsa@the-dreams.de, andrew@aj.id.au,
	joel@jms.id.au, benh@kernel.crashing.org,
	"Edward A. James" <eajames@us.ibm.com>
Subject: Re: [PATCH linux v2 2/6] hwmon: occ: Add sysfs interface
Message-ID: <201701121526.IGSXKGUP%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1484158237-10014-3-git-send-email-eajames.ibm@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

Hi Edward,

[auto build test WARNING on hwmon/hwmon-next]
[also build test WARNING on v4.10-rc3 next-20170111]
[cannot apply to linux/master]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/eajames-ibm-gmail-com/hwmon-Add-core-On-Chip-Controller-support-for-POWER-CPUs/20170112-150440
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next


coccinelle warnings: (new ones prefixed by >>)

>> drivers/hwmon/occ/occ_sysfs.c:265:9-16: WARNING: ERR_CAST can be used with hwmon -> dev

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
