Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52334 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751906AbdBGXJP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Feb 2017 18:09:15 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v17N6ZLq103786
        for <linux-hwmon@vger.kernel.org>; Tue, 7 Feb 2017 18:09:14 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
        by mx0a-001b2d01.pphosted.com with ESMTP id 28fewd98dk-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Feb 2017 18:09:14 -0500
Received: from localhost
        by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Tue, 7 Feb 2017 16:09:14 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 07 Feb 2017 17:11:25 -0600
From: eajames <eajames@linux.vnet.ibm.com>
To: "Edward A. James" <eajames@us.ibm.com>
Cc: linux@roeck-us.net, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
        mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de,
        andrew@aj.id.au, joel@jms.id.au, benh@kernel.crashing.org
Subject: Re: [PATCH linux v6 1/6] hwmon: Add core On-Chip Controller support
 for POWER CPUs
In-Reply-To: <201702070705.HAlnLg64%fengguang.wu@intel.com>
References: <201702070705.HAlnLg64%fengguang.wu@intel.com>
Message-Id: <20a5cf57f31190f76db1dbdf018c86ed@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Pushing up v7 to fix this compile warning. No other changes.

On 2017-02-06 17:21, kbuild test robot wrote:
> Hi Edward,
> 
> [auto build test WARNING on hwmon/hwmon-next]
> [also build test WARNING on v4.10-rc7 next-20170206]
> [cannot apply to linux/master]
> [if your patch is applied to the wrong git tree, please drop us a note
> to help improve the system]
> 
> url:
> https://github.com/0day-ci/linux/commits/eajames-linux-vnet-ibm-com/drivers-hwmon-Add-On-Chip-Controller-driver/20170207-043353
> base:
> https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
> hwmon-next
> config: openrisc-allyesconfig (attached as .config)
> compiler: or32-linux-gcc (GCC) 4.5.1-or32-1.0rc1
> reproduce:
>         wget
> https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross
> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=openrisc
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/hwmon/occ/occ.c: In function 'parse_occ_response':
>>> drivers/hwmon/occ/occ.c:127:6: warning: unused variable 'rc'
> 
> vim +/rc +127 drivers/hwmon/occ/occ.c
> 
>    111		struct device *dev;
>    112		void *bus;
>    113		struct occ_bus_ops bus_ops;
>    114		struct occ_ops ops;
>    115		struct occ_config config;
>    116		unsigned long last_updated;
>    117		struct mutex update_lock;
>    118		struct occ_response response;
>    119		bool valid;
>    120		u8 *raw_data;
>    121	};
>    122
>    123	static int parse_occ_response(struct occ *driver, u16 num_bytes)
>    124	{
>    125		int b;
>    126		int s;
>  > 127		int rc;
>    128		unsigned int offset = SENSOR_BLOCK_OFFSET;
>    129		int sensor_type;
>    130		u8 num_sensor_blocks;
>    131		struct sensor_data_block_header *block;
>    132		void *sensors;
>    133		struct device *dev = driver->dev;
>    134		u8 *data = driver->raw_data;
>    135		struct occ_response *resp = &driver->response;
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology 
> Center
> https://lists.01.org/pipermail/kbuild-all                   Intel 
> Corporation

