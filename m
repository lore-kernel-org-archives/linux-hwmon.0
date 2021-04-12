Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A840DC433ED
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Apr 2021 12:14:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7872661278
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Apr 2021 12:14:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238443AbhDLMOv convert rfc822-to-8bit (ORCPT
        <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 12 Apr 2021 08:14:51 -0400
Received: from mx2.suse.de ([195.135.220.15]:54292 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237718AbhDLMOu (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 12 Apr 2021 08:14:50 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id BF08CAE5C;
        Mon, 12 Apr 2021 12:14:31 +0000 (UTC)
Date:   Mon, 12 Apr 2021 14:14:30 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/2] hwmon: (amd_energy) Use unified function to read
 energy data
Message-ID: <20210412141430.64f20061@endymion>
In-Reply-To: <20210409174852.4585-1-linux@roeck-us.net>
References: <20210409174852.4585-1-linux@roeck-us.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

On Fri,  9 Apr 2021 10:48:51 -0700, Guenter Roeck wrote:
> The driver implements two separate functions to read and update
> energy values. One function is called periodically and updates
> cached enery information to avoid loss of data, the other reads
> energy data on demand to report it to userspace. The second
> function reads current energy data, adds the difference to the
> data previously obtained by the first function, and then discards
> the updated data.
> 
> Simplify the code and always call the first function, then report
> the energy data obtained by this function to userspace.

I like the idea.

> Cc: Naveen Krishna Chatradhi <nchatrad@amd.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Added patch, simplification
> 
>  drivers/hwmon/amd_energy.c | 31 ++++++-------------------------
>  1 file changed, 6 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> index a86cc8d6d93d..93bad64039f1 100644
> --- a/drivers/hwmon/amd_energy.c
> +++ b/drivers/hwmon/amd_energy.c
> @@ -118,35 +118,12 @@ static void read_accumulate(struct amd_energy_data *data)
>  	data->core_id++;
>  }
>  
> -static void amd_add_delta(struct amd_energy_data *data, int ch,
> -			  int cpu, long *val, u32 reg)
> -{
> -	struct sensor_accumulator *accum;
> -	u64 input;
> -
> -	mutex_lock(&data->lock);
> -	rdmsrl_safe_on_cpu(cpu, reg, &input);
> -	input &= AMD_ENERGY_MASK;
> -
> -	accum = &data->accums[ch];
> -	if (input >= accum->prev_value)
> -		input += accum->energy_ctr -
> -				accum->prev_value;
> -	else
> -		input += UINT_MAX - accum->prev_value +
> -				accum->energy_ctr;
> -
> -	/* Energy consumed = (1/(2^ESU) * RAW * 1000000UL) μJoules */
> -	*val = div64_ul(input * 1000000UL, BIT(data->energy_units));
> -
> -	mutex_unlock(&data->lock);
> -}
> -
>  static int amd_energy_read(struct device *dev,
>  			   enum hwmon_sensor_types type,
>  			   u32 attr, int channel, long *val)
>  {
>  	struct amd_energy_data *data = dev_get_drvdata(dev);
> +	struct sensor_accumulator *accum;
>  	u32 reg;
>  	int cpu;
>  
> @@ -162,7 +139,11 @@ static int amd_energy_read(struct device *dev,
>  
>  		reg = ENERGY_CORE_MSR;
>  	}
> -	amd_add_delta(data, channel, cpu, val, reg);
> +
> +	accumulate_delta(data, channel, cpu, reg);
> +	accum = &data->accums[channel];
> +
> +	*val = div64_ul(accum->energy_ctr * 1000000UL, BIT(data->energy_units));

Is it considered safe to read accum->energy_ctr while not holding
data->lock?

>  
>  	return 0;
>  }

If the answer to the question above is "yes" then:

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
