Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:38962 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751087AbeEUVGP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 May 2018 17:06:15 -0400
Date: Mon, 21 May 2018 14:06:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Alan Cox <alan@linux.intel.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>, Joel Stanley <joel@jms.id.au>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Stef van Os <stef.van.os@prodrive-technologies.com>
Subject: Re: [v4 09/11] drivers/hwmon: Add PECI cputemp driver
Message-ID: <20180521210606.GC26644@roeck-us.net>
References: <20180521195952.28073-1-jae.hyun.yoo@linux.intel.com>
 <20180521204238.GA26471@roeck-us.net>
 <f8824489-a0d7-6a13-baab-a6fc50164b67@linux.intel.com>
 <20180521210158.GH8077@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180521210158.GH8077@lunn.ch>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, May 21, 2018 at 11:01:58PM +0200, Andrew Lunn wrote:
> > >>+#if IS_ENABLED(CONFIG_X86)
> > >>+#include <asm/intel-family.h>
> > >>+#else
> > >>+#define INTEL_FAM6_HASWELL_X   0x3F
> > >>+#define INTEL_FAM6_BROADWELL_X 0x4F
> > >>+#define INTEL_FAM6_SKYLAKE_X   0x55
> > >>+#endif
> > >
> > >The entire code is very Intel specific. Why this #if instead of
> > >making the driver dependent on X86 ?
> > >
> > 
> > This code will be running on ARM kernel at this moment with a purpose
> > of monitoring remote x86 CPUs through PECI connection
> 
> How about moving what you need from asm/intel-family.h into a header
> file in include/linux/. Or move the entire header?
> 
That might be another option. The one non-option is the #if IS_ENABLED()
in the driver.

Thanks,
Guenter
