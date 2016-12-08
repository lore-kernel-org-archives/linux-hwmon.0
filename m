Return-path: <jdelvare@suse.de>
Date: Thu, 8 Dec 2016 14:29:10 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 01/17] hwmon: (adm9240) Fix overflows seen when writing
 into limit attributes
Message-ID: <20161208142910.425f1b0f@endymion>
In-Reply-To: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,

On Sun,  4 Dec 2016 20:55:24 -0800, Guenter Roeck wrote:
> Module test reports:
> 
> in0_min: Suspected overflow: [3320 vs. 0]
> in0_max: Suspected overflow: [3320 vs. 0]
> in4_min: Suspected overflow: [15938 vs. 0]
> in4_max: Suspected overflow: [15938 vs. 0]
> temp1_max: Suspected overflow: [127000 vs. 0]
> temp1_max_hyst: Suspected overflow: [127000 vs. 0]
> aout_output: Suspected overflow: [1250 vs. 0]
> 
> Code analysis reveals that the overflows are caused by conversions
> from unsigned long to long to int, combined with multiplications on
> passed values.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/adm9240.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
> index 2fe1828bd10b..347afacedcf5 100644
> --- a/drivers/hwmon/adm9240.c
> +++ b/drivers/hwmon/adm9240.c
> @@ -98,12 +98,14 @@ static inline unsigned int IN_FROM_REG(u8 reg, int n)
>  
>  static inline u8 IN_TO_REG(unsigned long val, int n)
>  {
> +	val = clamp_val(val, 0, INT_MAX / 192 - 12000);
>  	return clamp_val(SCALE(val, 192, nom_mv[n]), 0, 255);
>  }

I understand the idea of clamping before the conversion to avoid the
overflow. However I would have hoped that clamping the input makes
clamping the output unneeded. Clamping is full of tests, which aren't
cheap as they break the CPU instruction prediction, so we should not
abuse it.

Would the following work?

static inline u8 IN_TO_REG(unsigned long val, int n)
{
	val = clamp_val(val, 0, nom_mv[n] * 255 / 192);
	return SCALE(val, 192, nom_mv[n]);
}

This should be more compact and faster.

>  
>  /* temperature range: -40..125, 127 disables temperature alarm */
>  static inline s8 TEMP_TO_REG(long val)
>  {
> +	val = clamp_val(val, INT_MIN + 1000, INT_MAX - 1000);
>  	return clamp_val(SCALE(val, 1, 1000), -40, 127);
>  }
>  
> @@ -122,6 +124,7 @@ static inline unsigned int FAN_FROM_REG(u8 reg, u8 div)
>  /* analog out 0..1250mV */
>  static inline u8 AOUT_TO_REG(unsigned long val)
>  {
> +	val = clamp_val(val, 0, INT_MAX / 255 - 1250);
>  	return clamp_val(SCALE(val, 255, 1250), 0, 255);
>  }
>  

Same comment and same suggested solution for these two functions:

/* temperature range: -40..125, 127 disables temperature alarm */
static inline s8 TEMP_TO_REG(long val)
{
	val = clamp_val(val, -40000, 127000);
	return SCALE(val, 1, 1000);
}

/* analog out 0..1250mV */
static inline u8 AOUT_TO_REG(unsigned long val)
{
	val = clamp_val(val, 0, 1250);
	return SCALE(val, 255, 1250);
}


-- 
Jean Delvare
SUSE L3 Support
