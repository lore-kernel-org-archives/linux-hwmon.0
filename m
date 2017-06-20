Return-Path: <shilpa.bhat@linux.vnet.ibm.com>
Return-path: <shilpa.bhat@linux.vnet.ibm.com>
Subject: Re: [PATCH] hwmon: (ibmpowernv) Add current(A) sensors
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, linux@roeck-us.net,
        stewart@linux.vnet.ibm.com
References: <1497864333-16969-1-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
 <56a39618-dc4f-385c-77c3-5c9be92e2d48@kaod.org>
Cc: jdelvare@suse.com, benh@kernel.crashing.org, paulus@samba.org,
        mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, svaidy@linux.vnet.ibm.com,
        ego@linux.vnet.ibm.com, linux-hwmon@vger.kernel.org
From: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
Date: Tue, 20 Jun 2017 10:17:48 +0530
MIME-Version: 1.0
In-Reply-To: <56a39618-dc4f-385c-77c3-5c9be92e2d48@kaod.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Message-Id: <77775369-f1d6-3dde-6985-ec35c176cdc3@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

Hi Cedric,

On 06/19/2017 06:22 PM, Cédric Le Goater wrote:
> On 06/19/2017 11:25 AM, Shilpasri G Bhat wrote:
>> This patch exports current(A) sensors in inband sensors copied to
>> main memory by OCC.
>>
>> Signed-off-by: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
>> ---
>>  drivers/hwmon/ibmpowernv.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
>> index 862b832..e0557f9 100644
>> --- a/drivers/hwmon/ibmpowernv.c
>> +++ b/drivers/hwmon/ibmpowernv.c
>> @@ -50,6 +50,7 @@ enum sensors {
>>  	TEMP,
>>  	POWER_SUPPLY,
>>  	POWER_INPUT,
>> +	CURRENT,
>>  	MAX_SENSOR_TYPE,
>>  };
>>  
>> @@ -65,7 +66,8 @@ enum sensors {
>>  	{"fan", "ibm,opal-sensor-cooling-fan"},
>>  	{"temp", "ibm,opal-sensor-amb-temp"},
>>  	{"in", "ibm,opal-sensor-power-supply"},
>> -	{"power", "ibm,opal-sensor-power"}
>> +	{"power", "ibm,opal-sensor-power"},
>> +	{"curr", "ibm,opal-sensor-current"},
>>  };
>>  
>>  struct sensor_data {
>>
> 
> 
> I know why you are doing that but that is the old (cr?@#!y) way to 
> define sensor types. we should try to improve thing a little more 
> and use the "sensor-type" property only.
> 
> I think the patch below should help you adding new types without 
> too much changes to your skiboot patchset. Could you please check ? 
> 

Thanks for the patch. And yes this patch very neatly serves the purpose.
I will repost my patch on top of your patch.

Thanks and Regards,
Shilpa

> Thanks,
> 
> C. 
> 
> From: Cédric Le Goater <clg@kaod.org>
> Subject: [PATCH] hwmon: (ibmpowernv) introduce a legacy_compatibles array
> Date: Mon, 19 Jun 2017 14:29:29 +0200
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> Today, the type of a PowerNV sensor system is determined with the
> "compatible" property for legacy Firmwares and with the "sensor-type"
> for newer ones. The same array of strings is used for both to do the
> matching and this raises some issue to introduce new sensor types.
> 
> Let's introduce two different arrays (legacy and current) to make
> things easier for new sensor types.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---


>  drivers/hwmon/ibmpowernv.c |   26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> Index: linux.git/drivers/hwmon/ibmpowernv.c
> ===================================================================
> --- linux.git.orig/drivers/hwmon/ibmpowernv.c
> +++ linux.git/drivers/hwmon/ibmpowernv.c
> @@ -55,17 +55,27 @@ enum sensors {
> 
>  #define INVALID_INDEX (-1U)
> 
> +/*
> + * 'compatible' string properties for sensor types as defined in old
> + * PowerNV firmware (skiboot). These are ordered as 'enum sensors'.
> + */
> +static const char * const legacy_compatibles[] = {
> +	"ibm,opal-sensor-cooling-fan",
> +	"ibm,opal-sensor-amb-temp",
> +	"ibm,opal-sensor-power-supply",
> +	"ibm,opal-sensor-power"
> +};
> +
>  static struct sensor_group {
> -	const char *name;
> -	const char *compatible;
> +	const char *name; /* matches property 'sensor-type' */
>  	struct attribute_group group;
>  	u32 attr_count;
>  	u32 hwmon_index;
>  } sensor_groups[] = {
> -	{"fan", "ibm,opal-sensor-cooling-fan"},
> -	{"temp", "ibm,opal-sensor-amb-temp"},
> -	{"in", "ibm,opal-sensor-power-supply"},
> -	{"power", "ibm,opal-sensor-power"}
> +	{ "fan"   },
> +	{ "temp"  },
> +	{ "in"    },
> +	{ "power" }
>  };
> 
>  struct sensor_data {
> @@ -239,8 +249,8 @@ static int get_sensor_type(struct device
>  	enum sensors type;
>  	const char *str;
> 
> -	for (type = 0; type < MAX_SENSOR_TYPE; type++) {
> -		if (of_device_is_compatible(np, sensor_groups[type].compatible))
> +	for (type = 0; type < ARRAY_SIZE(legacy_compatibles); type++) {
> +		if (of_device_is_compatible(np, legacy_compatibles[type]))
>  			return type;
>  	}
> 
> 
