Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40653 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbeJLUTS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 12 Oct 2018 16:19:18 -0400
Date: Fri, 12 Oct 2018 05:46:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: kbuild-all@01.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, linux-doc@vger.kernel.org,
        openbmc@lists.ozlabs.org, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, mark.rutland@arm.com, joel@jms.id.au,
        benh@kernel.crashing.org
Subject: Re: [PATCH v5 05/10] hwmon: Add On-Chip Controller (OCC) hwmon driver
Message-ID: <20181012124658.GB11386@roeck-us.net>
References: <1535664761-86018-6-git-send-email-eajames@linux.vnet.ibm.com>
 <201809011808.kL7L1gpv%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201809011808.kL7L1gpv%fengguang.wu@intel.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, Sep 01, 2018 at 08:06:16PM +0800, kbuild test robot wrote:
> Hi Eddie,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on hwmon/hwmon-next]
> [also build test ERROR on v4.19-rc1 next-20180831]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Eddie-James/hwmon-and-fsi-Add-On-Chip-Controller-Driver/20180831-165247
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> config: arm64-allmodconfig (attached as .config)
> compiler: aarch64-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.2.0 make.cross ARCH=arm64 
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/hwmon/occ/p8_i2c.o: In function `init_module':
> >> p8_i2c.c:(.init.text+0x0): multiple definition of `init_module'
>    drivers/hwmon/occ/p9_sbe.o:p9_sbe.c:(.init.text+0x0): first defined here
>    drivers/hwmon/occ/p8_i2c.o: In function `cleanup_module':
> >> p8_i2c.c:(.exit.text+0x0): multiple definition of `cleanup_module'
>    drivers/hwmon/occ/p9_sbe.o:p9_sbe.c:(.exit.text+0x0): first defined here
> 

This will need to be fixed before I can pick up the series.
Each module must have only one set of module initialization
functions.

Guenter

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
