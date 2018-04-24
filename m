Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:1268 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751167AbeDXP4o (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Apr 2018 11:56:44 -0400
Message-ID: <1524585397.21176.502.camel@linux.intel.com>
Subject: Re: [PATCH v3 09/10] drivers/hwmon: Add PECI hwmon client drivers
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Alan Cox <alan@linux.intel.com>,
        Andrew Jeffery <andrew@aj.id.au>, Andrew Lunn <andrew@lunn.ch>,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Fengguang Wu <fengguang.wu@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        James Feist <james.feist@linux.intel.com>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Joel Stanley <joel@jms.id.au>,
        Julia Cartwright <juliac@eso.teric.us>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Milton Miller II <miltonm@us.ibm.com>,
        Pavel Machek <pavel@ucw.cz>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stef van Os <stef.van.os@prodrive-technologies.com>,
        Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>,
        Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Date: Tue, 24 Apr 2018 18:56:37 +0300
In-Reply-To: <20180410183212.16787-10-jae.hyun.yoo@linux.intel.com>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
         <20180410183212.16787-10-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, 2018-04-10 at 11:32 -0700, Jae Hyun Yoo wrote:

>  drivers/hwmon/peci-cputemp.c  | 783
> ++++++++++++++++++++++++++++++++++++++++++
>  drivers/hwmon/peci-dimmtemp.c | 432 +++++++++++++++++++++++

Does it make sense one driver per patch?

> +#define CLIENT_CPU_ID_MASK    0xf0ff0  /* Mask for Family / Model
> info */

> +struct cpu_gen_info {
> +	u32 type;
> +	u32 cpu_id;
> +	u32 core_max;
> +};
> 

> +static const struct cpu_gen_info cpu_gen_info_table[] = {
> +	{ .type = CPU_GEN_HSX,
> +	  .cpu_id = 0x306f0, /* Family code: 6, Model number: 63
> (0x3f) */
> +	  .core_max = CORE_MAX_ON_HSX },
> +	{ .type = CPU_GEN_BRX,
> +	  .cpu_id = 0x406f0, /* Family code: 6, Model number: 79
> (0x4f) */
> +	  .core_max = CORE_MAX_ON_BDX },
> +	{ .type = CPU_GEN_SKX,
> +	  .cpu_id = 0x50650, /* Family code: 6, Model number: 85
> (0x55) */
> +	  .core_max = CORE_MAX_ON_SKX },
> +};

Are we talking about x86 CPU IDs here?
If so, why x86 corresponding headers, including intel-family.h are not
used?

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
