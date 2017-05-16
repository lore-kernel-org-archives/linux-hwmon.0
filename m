Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:36679 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751045AbdEPWAc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 16 May 2017 18:00:32 -0400
Date: Tue, 16 May 2017 15:00:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: kbuild test robot <lkp@intel.com>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] hwmon: (adt7475) temperature smoothing
Message-ID: <20170516220027.GA18668@roeck-us.net>
References: <201705161614.nmuA5Qiv%fengguang.wu@intel.com>
 <247018ef273f4af9bedd77e63417daf0@svr-chch-ex1.atlnz.lc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <247018ef273f4af9bedd77e63417daf0@svr-chch-ex1.atlnz.lc>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, May 16, 2017 at 08:30:52PM +0000, Chris Packham wrote:
> On 16/05/17 20:23, kbuild test robot wrote:
> > Hi Chris,
> >
> > [auto build test ERROR on hwmon/hwmon-next]
> > [also build test ERROR on v4.12-rc1 next-20170516]
> > [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> >
> > url:    https://github.com/0day-ci/linux/commits/Chris-Packham/hwmon-adt7475-fan-stall-prevention/20170515-093530
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> > config: x86_64-rhel (attached as .config)
> > compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
> > reproduce:
> >         # save the attached .config to linux build tree
> >         make ARCH=x86_64
> >
> > All errors (new ones prefixed by >>):
> >
> >    drivers/hwmon/adt7475.c: In function 'set_temp_st':
> >>> drivers/hwmon/adt7475.c:622:9: error: implicit declaration of function 'find_closest_descending' [-Werror=implicit-function-declaration]
> >       val = find_closest_descending(val, ad7475_st_map,
> >             ^~~~~~~~~~~~~~~~~~~~~~~
> >    cc1: some warnings being treated as errors
> >
> > vim +/find_closest_descending +622 drivers/hwmon/adt7475.c
> >
> >    616			shift = 4;
> >    617			idx = 1;
> >    618			break;
> >    619		}
> >    620	
> >    621		if (val > 0) {
> >  > 622			val = find_closest_descending(val, ad7475_st_map,
> >    623						      ARRAY_SIZE(ad7475_st_map));
> >    624			val |= 0x8;
> >    625		}
> >
> > ---
> > 0-DAY kernel test infrastructure                Open Source Technology Center
> > https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> >
> 
> I'm not sure how this is failing. find_closest_descending() is a macro 
> defined in linux/util_macros.h which is explicitly included in 
> drivers/hwmon/adt7475.c. Aside from the include guards there's nothing 
> conditional about it.

I suspect it was tested out of sequence, without the preceding patches,
and the header file include was missing.

Guenter
