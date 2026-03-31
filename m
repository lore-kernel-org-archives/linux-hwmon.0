Received: from juniper.fatooh.org (juniper.fatooh.org [173.255.221.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE332E413
	for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 05:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.221.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934149; cv=none; b=DS4ktci8AsT9pacx0hgmjbalthi6smuDZ++j8Oii5vSZGK+Z1Nu9D6biZvIwbq+HsoP80ngY4oXrfCriIw0q7YQhGGppv4RUrj21eVKeM2jNq3oHY9bxfEeqtIebRaejZSLeUauDsBOjPZltejgR+TBSz0GwcAmdCXZvxExRWXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934149; c=relaxed/simple;
	bh=DaVaS5Vkqc8IMg281zgeF6AtL7z4x+87BFfXjFkqTqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=o+Ip0UffcY0+rvOWLiCmEy9bacHrLifkNX0JNxD408jWBK9FxEr0NpnEShZDKQn7woDPIIsCUZ5qaaqtLqzWRkZGKH4mi0PT0/1iqGKZBF4cFcn4fsNp2G56WNn3E881/M/pikBeYWSW7wz/XuV1Dlu/xiZUPYsSr1nkaoI/HKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org; spf=pass smtp.mailfrom=fatooh.org; dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b=cLk3sw+3; arc=none smtp.client-ip=173.255.221.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fatooh.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b="cLk3sw+3"
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPS id 298E4401B3;
	Mon, 30 Mar 2026 22:15:47 -0700 (PDT)
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	by juniper.fatooh.org (Postfix) with ESMTP id E8F8B401F4;
	Mon, 30 Mar 2026 22:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding; s=dkim; bh=i+N+05Hv9/s5
	pzMdeM3kgP01VKY=; b=cLk3sw+3c8/GBH3vh1eWDyBYqTv1foFUAvVtcF682eVQ
	OmPBa45iCQaDd9vAKv7AZwlhugBH17ADxwucreIVEHmvVWyjB13z+8hYOrnyzEV/
	Ak/P7AlOCXZYuCLAXG4GBL6hbxreM/jbc2iqwbw45Ygia7+LtrmtoPkTrmqBD4Y=
DomainKey-Signature: a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=dkim; b=TlL8cW
	xCiyjnGSuIoa8ZBPrnWP/bltEv26S88dbR+s9BgdANJXi88BiBzG17/BwKax+nTa
	jzCdIz3nYR0FVpl2ZD4g6Esqy/AYTXS6oJhgU4YuN6Ln3HZWJ3keQ5t/Jdod7IQu
	l+z7Znw9xcA87AuhI68gaadZw8CORe7IJaijk=
Received: from [198.18.0.3] (unknown [104.184.153.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPSA id 96DFE401B3;
	Mon, 30 Mar 2026 22:15:46 -0700 (PDT)
Message-ID: <bcf66ff8-3a0e-4879-a33f-aa7b4c009a0c@fatooh.org>
Date: Mon, 30 Mar 2026 22:15:45 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] hwmon: (asus-ec-sensors) fix T_Sensor for PRIME
 X670E-PRO WIFI
To: Guenter Roeck <linux@roeck-us.net>,
 Eugene Shalygin <eugene.shalygin@gmail.com>, linux-hwmon@vger.kernel.org
References: <20260330230836.314311-1-bugfood-ml@fatooh.org>
 <a3d5942a-cf3d-42c7-9ae8-494fc34cac23@roeck-us.net>
Content-Language: en-US
From: Corey Hickey <bugfood-ml@fatooh.org>
In-Reply-To: <a3d5942a-cf3d-42c7-9ae8-494fc34cac23@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026-03-30 19:58, Guenter Roeck wrote:
>> To fix the "PRIME X670E-PRO WIFI" (0x37) without breaking the "ROG
>> Crosshair X670E Gene" (0x36), define an alternate T_SENSOR. The "PRIME
>> X670E-PRO WIFI" only has one T_SENSOR documented, so replace the
>> original T_SENSOR in the driver rather than specifying an additional
>> one.
>> * If there are any other boards using 0x37, those can be changed to use
>>     SENSOR_TEMP_T_SENSOR_ALT1 instead.
>> * If there are any other boards using an entirely different address, an
>>     additional alternate T_SENSOR can be defined without altering the
>>     naming scheme.
>
> 
> Is it off by one, or do Asus boards possibly support [up to] two such
> sensors ?

Apparently at least two boards do support two sensors, such as:

$ grep -A1 'static.*board_info_strix_z790_i_gaming_wifi' \
 > drivers/hwmon/asus-ec-sensors.c
static const struct ec_board_info board_info_strix_z790_i_gaming_wifi = {
	.sensors = SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_T_SENSOR_2 |

Neither of those boards are in sensors_family_amd_600, though, so I 
didn't see any precedence for using SENSOR_TEMP_T_SENSOR_2 for this 
sensor. I can't find any evidence that the board I have supports two of 
these sensors.

I don't have any other prior knowledge, though, not having looked into 
this before today. My patch is based on correct-seeming observations and 
hopefully reasonable rationale; I would definitely defer to anybody with 
more knowledge of this.


One other reason I do not think 0x36 is a "T_Sensor" on this board is 
the value of "+0.0°C":

1. If there were a sensor plugged in, there's no reasonable way any 
component I have could be so cold; ambient temperature inside the house 
never gets nearly that low.

2. If there is not a sensor plugged in, then 0.0°C would be a poor 
default value, since 0.0°C is a valid value within the sensing range.

For even more hopefully-correct details:

The type of sensor is a 10k thermistor (nominally 10k ohms at 25°C), NTC 
(negative temperature coefficient--resistance decreases as temperature 
increases). I think the exact resistance values can vary by 
manufacturer, but not so much as to significantly affect readings of 
this precision (1°C) and far from the extreme ends of the supported 
range. Somebody with an electronics background could probably confirm or 
refute this. I've measured the resistance of the sensor directly, 
though, and it does reasonably match an example table I found for 
temperatures in the vicinity of 22-30°C.

https://cdn-shop.adafruit.com/datasheets/103_3950_lookuptable.pdf

Most importantly, the resistance definitely decreases with higher 
temperatures. Thus, it makes sense to me that having an unplugged sensor 
gives the -62.0°C reading I observed; this is probably at or below the 
minimum supported value and is a result of finding effectively infinite 
resistance (open circuit).

>>    	EC_SENSOR("Motherboard", hwmon_temp, 1, 0x00, 0x32),
>>    	[ec_sensor_temp_vrm] =
>>    		EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x33),
>> +	/* The address of T_Sensor can vary; only one of the following T_Sensor
>> +	 * addresses will be used, depending on motherboard model.
>> +	 */
> 
> /*
>    * This is not the networking subsystem. Standard multi-line comments are expected.
>    */

Ah, I missed that, but I see the difference now. I will submit a v2 
patch. I'm mostly a newbie at kernel patch submission; please let me 
know if I missed anything else.

Thanks,
Corey
