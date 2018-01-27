Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:40044 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752108AbeA0Rvr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 27 Jan 2018 12:51:47 -0500
Date: Sat, 27 Jan 2018 09:51:45 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Jonathan Buzzard <jonathan@buzzard.org.uk>,
        Mario Limonciello <mario.limonciello@dell.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [4/4] hwmon: (dell-smm) Measure time duration of SMM call around
 inlined asm
Message-ID: <20180127175145.GA12923@roeck-us.net>
References: <20180127162351.13858-1-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180127162351.13858-1-pali.rohar@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, Jan 27, 2018 at 05:23:51PM +0100, Pali Rohár wrote:
> Measure only inlined asm code, not other functions to have as precise as
> possible measured time.
> 
> Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
> ---
>  drivers/hwmon/dell-smm-hwmon.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index bf3bb7e1adab..e001afd53f46 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -147,14 +147,16 @@ static int i8k_smm_func(void *par)
>  	int ebx = regs->ebx;
>  	unsigned long duration;
>  	ktime_t calltime, delta, rettime;
> -
> -	calltime = ktime_get();
>  #endif
>  
>  	/* SMM requires CPU 0 */
>  	if (smp_processor_id() != 0)
>  		return -EBUSY;
>  
> +#ifdef DEBUG
> +	calltime = ktime_get();
> +#endif
> +
>  #if defined(CONFIG_X86_64)
>  	asm volatile("pushq %%rax\n\t"
>  		"movl 0(%%rax),%%edx\n\t"
> @@ -208,13 +210,17 @@ static int i8k_smm_func(void *par)
>  	    :    "a"(regs)
>  	    :    "%ebx", "%ecx", "%edx", "%esi", "%edi", "memory");
>  #endif
> -	if (rc != 0 || (regs->eax & 0xffff) == 0xffff || regs->eax == eax)
> -		rc = -EINVAL;
>  
>  #ifdef DEBUG
>  	rettime = ktime_get();
>  	delta = ktime_sub(rettime, calltime);
>  	duration = ktime_to_ns(delta) >> 10;
> +#endif
> +
> +	if (rc != 0 || (regs->eax & 0xffff) == 0xffff || regs->eax == eax)
> +		rc = -EINVAL;
> +
> +#ifdef DEBUG

FWIW, the error introduced by dividing nS by 1,024 instead of 1,000 is
much worse than the improvements from moving the calls around. Using
specific numbers, the current code reports 500 mS as 488,281 uS.
So why bother ?

I would have suggested to use ktime_us_delta(ktime_get(), calltime)
instead to make the results more accurate. Sure, you get the offset from
the additional divide operation, but at least that would be a constant
and not a systematic error.

I'll hold this patch off for a bit. Please confirm that you want it
applied as-is. I applied the other patches from the series.

Thanks,
Guenter
