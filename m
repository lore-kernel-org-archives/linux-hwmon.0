Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4659AC433B4
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Apr 2021 12:27:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A97B6128A
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Apr 2021 12:27:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238331AbhDLM2F (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 12 Apr 2021 08:28:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:42220 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231138AbhDLM2F (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 12 Apr 2021 08:28:05 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 38B24AE5C;
        Mon, 12 Apr 2021 12:27:46 +0000 (UTC)
Date:   Mon, 12 Apr 2021 14:27:44 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/2] hwmon: (amd_energy) Restore visibility of energy
 counters
Message-ID: <20210412142744.54c55d06@endymion>
In-Reply-To: <20210409174852.4585-2-linux@roeck-us.net>
References: <20210409174852.4585-1-linux@roeck-us.net>
        <20210409174852.4585-2-linux@roeck-us.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri,  9 Apr 2021 10:48:52 -0700, Guenter Roeck wrote:
> Commit 60268b0e8258 ("hwmon: (amd_energy) modify the visibility of
> the counters") restricted visibility of AMD energy counters to work
> around a side-channel attack using energy data to determine which
> instructions are executed. The attack is described in 'PLATYPUS:
> Software-based Power Side-Channel Attacks on x86'. It relies on quick
> and accurate energy readings.
> 
> Limiting energy readings to privileged users is annoying. A much better
> solution is to make energy readings unusable for attacks by randomizing
> the time between updates. We can do that by caching energy values for
> a short and randomized period of time.
> 
> Cc: Naveen Krishna Chatradhi <nchatrad@amd.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Simplified code by using unified function to accumulate energy data
> 
>  drivers/hwmon/amd_energy.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> index 93bad64039f1..1bf0afc2740c 100644
> --- a/drivers/hwmon/amd_energy.c
> +++ b/drivers/hwmon/amd_energy.c
> @@ -18,6 +18,7 @@
>  #include <linux/mutex.h>
>  #include <linux/processor.h>
>  #include <linux/platform_device.h>
> +#include <linux/random.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
>  #include <linux/topology.h>
> @@ -35,6 +36,7 @@
>  struct sensor_accumulator {
>  	u64 energy_ctr;
>  	u64 prev_value;
> +	unsigned long cache_timeout;
>  };
>  
>  struct amd_energy_data {
> @@ -74,17 +76,14 @@ static void get_energy_units(struct amd_energy_data *data)
>  	data->energy_units = (rapl_units & AMD_ENERGY_UNIT_MASK) >> 8;
>  }
>  

Add a comment stating that this function must be called with accum's
&data->lock held?

> -static void accumulate_delta(struct amd_energy_data *data,
> -			     int channel, int cpu, u32 reg)
> +static void __accumulate_delta(struct sensor_accumulator *accum,
> +			       int cpu, u32 reg)
>  {
> -	struct sensor_accumulator *accum;
>  	u64 input;
>  
> -	mutex_lock(&data->lock);
>  	rdmsrl_safe_on_cpu(cpu, reg, &input);
>  	input &= AMD_ENERGY_MASK;
>  
> -	accum = &data->accums[channel];
>  	if (input >= accum->prev_value)
>  		accum->energy_ctr +=
>  			input - accum->prev_value;
> @@ -93,6 +92,14 @@ static void accumulate_delta(struct amd_energy_data *data,
>  			accum->prev_value + input;
>  
>  	accum->prev_value = input;
> +	accum->cache_timeout = jiffies + HZ + get_random_int() % HZ;

Needs #include <linux/jiffies.h> maybe?

> +}
> +
> +static void accumulate_delta(struct amd_energy_data *data,
> +			     int channel, int cpu, u32 reg)
> +{
> +	mutex_lock(&data->lock);
> +	__accumulate_delta(&data->accums[channel], cpu, reg);
>  	mutex_unlock(&data->lock);
>  }
>  
> @@ -124,6 +131,7 @@ static int amd_energy_read(struct device *dev,
>  {
>  	struct amd_energy_data *data = dev_get_drvdata(dev);
>  	struct sensor_accumulator *accum;
> +	u64 energy;
>  	u32 reg;
>  	int cpu;
>  
> @@ -140,10 +148,15 @@ static int amd_energy_read(struct device *dev,
>  		reg = ENERGY_CORE_MSR;
>  	}
>  
> -	accumulate_delta(data, channel, cpu, reg);
>  	accum = &data->accums[channel];
>  
> -	*val = div64_ul(accum->energy_ctr * 1000000UL, BIT(data->energy_units));
> +	mutex_lock(&data->lock);
> +	if (!accum->energy_ctr || time_after(jiffies, accum->cache_timeout))
> +		__accumulate_delta(accum, cpu, reg);
> +	energy = accum->energy_ctr;
> +	mutex_unlock(&data->lock);
> +
> +	*val = div64_ul(energy * 1000000UL, BIT(data->energy_units));
>  
>  	return 0;
>  }
> @@ -152,7 +165,7 @@ static umode_t amd_energy_is_visible(const void *_data,
>  				     enum hwmon_sensor_types type,
>  				     u32 attr, int channel)
>  {
> -	return 0440;
> +	return 0444;
>  }
>  
>  static int energy_accumulator(void *p)

Very nice. This will make the driver useful again :-)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
