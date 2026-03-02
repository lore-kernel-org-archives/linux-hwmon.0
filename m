Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B083F423A8E
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 16:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772467327; cv=none; b=is3gHkGdzQLt5wYryB62/jJs1NICqmdaHuZ79DES5O5eKmbgtFHo1m/K0sqXOHnqnZjLy2WnIMOG8PBeSpKkSPDCuecvTwCqPsLLaY+qsxj3ynwY8j81HhDV/W4D59RtRGtcn1oOLVo5GhiVcGiBK+dt2py1KMBhmMhb006KoK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772467327; c=relaxed/simple;
	bh=dV3DweFUW+56//zhzCjbQ2jw96Mv/BWKYQU/HzV0I9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f9laGlvck1x82Rb5vOYVG7w942UIUyvm93bU7kOB1B43mtrtS0SZAdr9ryLHSmLv7bDCZxbAR6DG/Ri65+Sfc+9zvoNa9cgO1qKZzSAZnkhN18P7Rc9fi8s6zkokmakxuVIeyvwnMJ9SdqVAZXl2QcxVrpsUqcp9krHisa/FSLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1vx5id-0001cQ-Rt; Mon, 02 Mar 2026 17:02:03 +0100
Message-ID: <b55cb982-6431-4db7-84d1-d64145bf4a66@pengutronix.de>
Date: Mon, 2 Mar 2026 17:02:03 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] (ina2xx) Drop bus_voltage_shift configuration
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ian Ray <ian.ray@gehealthcare.com>
References: <20260302-ina2xx-shift-v1-1-4ff5b7b76d51@pengutronix.de>
 <58c0e46e-fa58-40ba-91f0-235a4cef034c@roeck-us.net>
From: Jonas Rebmann <jre@pengutronix.de>
Content-Language: en-US
In-Reply-To: <58c0e46e-fa58-40ba-91f0-235a4cef034c@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

Hi Guenter,

On 2026-03-02 16:50, Guenter Roeck wrote:
> Hi,
> 
> On 3/2/26 07:26, Jonas Rebmann wrote:
>> The INA219 has the lowest three bits of the bus voltage register
>> zero-reserved and the bus_voltage_shift ina2xx_config field was
>> introduced to accommodate for that.
>>
>> The INA234 has four bits of the bus voltage, of the shunt voltage, and
>> of the current registers zero-reserved but the latter two were
>> implemented by choosing a 16x higher conversion constant instead of a
>> separate field specifying a bit shift.
>>
>> For consistency and simplicity, drop bus_voltage_shift and adapt the
>> conversion constants for INA219 and INA234 accordingly, yielding the
>> same measurement values.
>>
> 
> This isn't about simplicity, it is about correctness.
> 
> The datasheet for INA234 says for the lower 4 bits:
> 
>       Always returns 0. Remove these bits from the full result by doing a
>       right arithmetic shift
> 
> which is what we should do for all chips with reserved bits instead of
> assuming that the reserved bits always return 0.

It says that for the reserved-zero bits at the lower end of the shunt
voltage and current registers of INA234 as well as for the bus voltage
register.

If bus_voltage_shift is kept, wouldn't a shunt_voltage_shift and
current_shift need to be introduced to support those registers of the
INA234 with the same notion of correctness?

Regards,
Jonas

> Thanks,
> Guenter
> 
>> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
>> ---
>>    drivers/hwmon/ina2xx.c | 15 ++++-----------
>>    1 file changed, 4 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
>> index 836e15a5a780..d7c894d7353c 100644
>> --- a/drivers/hwmon/ina2xx.c
>> +++ b/drivers/hwmon/ina2xx.c
>> @@ -151,7 +151,6 @@ struct ina2xx_config {
>>    	bool has_update_interval;
>>    	int calibration_value;
>>    	int shunt_div;
>> -	int bus_voltage_shift;
>>    	int bus_voltage_lsb;	/* uV */
>>    	int power_lsb_factor;
>>    };
>> @@ -172,8 +171,7 @@ static const struct ina2xx_config ina2xx_config[] = {
>>    		.config_default = INA219_CONFIG_DEFAULT,
>>    		.calibration_value = 4096,
>>    		.shunt_div = 100,
>> -		.bus_voltage_shift = 3,
>> -		.bus_voltage_lsb = 4000,
>> +		.bus_voltage_lsb = 500,
>>    		.power_lsb_factor = 20,
>>    		.has_alerts = false,
>>    		.has_ishunt = false,
>> @@ -184,7 +182,6 @@ static const struct ina2xx_config ina2xx_config[] = {
>>    		.config_default = INA226_CONFIG_DEFAULT,
>>    		.calibration_value = 2048,
>>    		.shunt_div = 400,
>> -		.bus_voltage_shift = 0,
>>    		.bus_voltage_lsb = 1250,
>>    		.power_lsb_factor = 25,
>>    		.has_alerts = true,
>> @@ -196,8 +193,7 @@ static const struct ina2xx_config ina2xx_config[] = {
>>    		.config_default = INA226_CONFIG_DEFAULT,
>>    		.calibration_value = 2048,
>>    		.shunt_div = 400, /* 2.5 µV/LSB raw ADC reading from INA2XX_SHUNT_VOLTAGE */
>> -		.bus_voltage_shift = 4,
>> -		.bus_voltage_lsb = 25600,
>> +		.bus_voltage_lsb = 1600,
>>    		.power_lsb_factor = 32,
>>    		.has_alerts = true,
>>    		.has_ishunt = false,
>> @@ -207,7 +203,6 @@ static const struct ina2xx_config ina2xx_config[] = {
>>    	[ina260] = {
>>    		.config_default = INA260_CONFIG_DEFAULT,
>>    		.shunt_div = 400,
>> -		.bus_voltage_shift = 0,
>>    		.bus_voltage_lsb = 1250,
>>    		.power_lsb_factor = 8,
>>    		.has_alerts = true,
>> @@ -219,7 +214,6 @@ static const struct ina2xx_config ina2xx_config[] = {
>>    		.config_default = SY24655_CONFIG_DEFAULT,
>>    		.calibration_value = 4096,
>>    		.shunt_div = 400,
>> -		.bus_voltage_shift = 0,
>>    		.bus_voltage_lsb = 1250,
>>    		.power_lsb_factor = 25,
>>    		.has_alerts = true,
>> @@ -281,8 +275,7 @@ static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
>>    		val = DIV_ROUND_CLOSEST((s16)regval, data->config->shunt_div);
>>    		break;
>>    	case INA2XX_BUS_VOLTAGE:
>> -		val = (regval >> data->config->bus_voltage_shift) *
>> -		  data->config->bus_voltage_lsb;
>> +		val = regval * data->config->bus_voltage_lsb;
>>    		val = DIV_ROUND_CLOSEST(val, 1000);
>>    		break;
>>    	case INA2XX_POWER:
>> @@ -387,7 +380,7 @@ static u16 ina226_alert_to_reg(struct ina2xx_data *data, int reg, long val)
>>    		return clamp_val(val, 0, SHRT_MAX);
>>    	case INA2XX_BUS_VOLTAGE:
>>    		val = clamp_val(val, 0, 200000);
>> -		val = (val * 1000) << data->config->bus_voltage_shift;
>> +		val = val * 1000;
>>    		val = DIV_ROUND_CLOSEST(val, data->config->bus_voltage_lsb);
>>    		return clamp_val(val, 0, USHRT_MAX);
>>    	case INA2XX_POWER:
>>


-- 
Pengutronix e.K.                           | Jonas Rebmann               |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
