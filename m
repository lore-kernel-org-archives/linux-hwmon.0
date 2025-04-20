Received: from mail.as397444.net (mail.as397444.net [69.59.18.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B11218D
	for <linux-hwmon@vger.kernel.org>; Sun, 20 Apr 2025 02:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.59.18.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745116187; cv=none; b=u67NwV1GhnhX9vdCkXMTdoW1c9NZiThw5WY0+K3SxHpHC69HjtCaOzchqfc2AMFtMood1+n4Hx4GdonSHp7PYcSLH4SjjF+WNgajJ91IPnJlCv+cLCKLlGKvBqlq/vm6pHeH1XJtiIOmnTOqyfecB6nLWy3BZ+ZaYNsINIW2shI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745116187; c=relaxed/simple;
	bh=5UvlBHz4hLKuKzmHfaG0GyQ6GSB85EvuJPH9fR5/zvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XqPiYMC3/OI221bywYRFthQjI4zoSlmFFUtYuOSMf5bBcsqSx7hmwEEncALwGaOkTH9I3latJIawCsytBAq0+UPU+KqWMTTm6zax++pRYvjD5xUU8fCOlnSa30Jg2+ydPVim7ZVN+tr5CdCeIzZ358PNm/7ruT9R2oGRxVIXSB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mattcorallo.com; spf=pass smtp.mailfrom=mattcorallo.com; dkim=pass (2048-bit key) header.d=mattcorallo.com header.i=@mattcorallo.com header.b=IyQ9cSk+; dkim=pass (2048-bit key) header.d=clients.mail.as397444.net header.i=@clients.mail.as397444.net header.b=hWgxTwrP; arc=none smtp.client-ip=69.59.18.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mattcorallo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mattcorallo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mattcorallo.com header.i=@mattcorallo.com header.b="IyQ9cSk+";
	dkim=pass (2048-bit key) header.d=clients.mail.as397444.net header.i=@clients.mail.as397444.net header.b="hWgxTwrP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mattcorallo.com; s=1745114463; h=In-Reply-To:From:References:Cc:To:Subject:
	From:Subject:To:Cc:Reply-To; bh=cydb70x1zNT4PzvifSUH95EzZvmZ1DuTyNWBF3agtSY=;
	b=IyQ9cSk+wtoKnO7H091Ps8AmdDSd7xbhiT/5rCpp7ow0gnGzjzLYUSMggdugJbcPyxeVnC93iA0
	nlBO2cn7k5XcitBab0ebbCQy+y0PUM9xrcGq/CmWVfcZly/0LTt0kA0uwiUCYsEluwdE//275/Ez0
	zocS4e2W82GakgP3R/EXTo1U4E52eSyI9vT0tksJ/QN0ndAxEo6FPyKDh1yBnrcH5mKKu3ZbtTRKT
	1gULSoq1K2AHAsZ7cIXjeA1N/y82m2B6Y30GIrOGjmBA6AMUF/vRuzxzH7xPPW9eZpCR05vrGgEet
	KoF0tAi6YV4vtlvCWHx3i2fTSrastW/hfduA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=clients.mail.as397444.net; s=1745114465; h=In-Reply-To:From:References:Cc:
	To:Subject:From:Subject:To:Cc:Reply-To;
	bh=cydb70x1zNT4PzvifSUH95EzZvmZ1DuTyNWBF3agtSY=; b=hWgxTwrPHuVwHaf1lMg5205A/Z
	Rpk2A1XD/myqa8lgkRbVHl95UP/zm/pqcg2vQyCGLdj3KMMiNZc0u0x79XzVGysJ8+emkjJr91eJG
	pLdWeZxVNCF4SwSPlNwXPcpmdNlgDnUHvCMLbTkI7PUN3EIrX6tMW8PQF3Xc+1JgRDM2ZCdzUYvLl
	LJjczKuF3bqXViq6okV0iKmMYr0V9fzPtgjVcYG64y2rsdN/DYtE5x6Gta5X8d87LQvG6tMu+D4lQ
	eCeJe32a3uyxyLPXN3woCILieokX+w5CXbWMgb/SgwsKVTC/xXJeqZMymwOXeNVtsgg+eFwZXokev
	RIfaurfA==;
X-DKIM-Note: Keys used to sign are likely public at
X-DKIM-Note: https://as397444.net/dkim/mattcorallo.com and
X-DKIM-Note: https://as397444.net/dkim/clients.mail.as397444.net
X-DKIM-Note: For more info, see https://as397444.net/dkim/
Received: by mail.as397444.net with esmtpsa (TLS1.3) (Exim)
	(envelope-from <yalbrymrb@mattcorallo.com>)
	id 1u6KR8-009k2g-0c;
	Sun, 20 Apr 2025 02:29:38 +0000
Message-ID: <d5abeb59-8286-425c-9f78-cd60b0e26ada@mattcorallo.com>
Date: Sat, 19 Apr 2025 22:29:36 -0400
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: PMBus memory overflow
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
References: <985cd95f-155b-4b8a-9fe7-59938d0c2b8f@mattcorallo.com>
 <9e01e3ec-3ac5-4d83-a065-d00d568b9cc7@roeck-us.net>
 <e030f44f-11ee-4739-b9d3-c22883bbbf02@mattcorallo.com>
 <336f298f-497f-4dd9-97ee-50b81221be06@roeck-us.net>
 <1b1eccff-a306-4e17-a6bf-fd3203c61605@mattcorallo.com>
 <1edc8396-535d-4cdf-bbb7-11d559d4c257@roeck-us.net>
 <cfc2b3c8-3f94-407a-a4d5-e7d81686eb2d@mattcorallo.com>
 <84258b48-03b5-4129-bed5-f8200996f2eb@roeck-us.net>
 <fcfd78d2-238d-4b68-b6ec-5ee809c4ef08@mattcorallo.com>
 <eb5796e8-de76-4e91-9192-65b9af7a4d49@roeck-us.net>
 <284466fd-39e8-419e-8af5-41dbabb788af@roeck-us.net>
Content-Language: en-US
From: Matt Corallo <yalbrymrb@mattcorallo.com>
In-Reply-To: <284466fd-39e8-419e-8af5-41dbabb788af@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/19/25 6:49 PM, Guenter Roeck wrote:
> On 4/19/25 15:38, Guenter Roeck wrote:
>> On 4/19/25 12:29, Matt Corallo wrote:
>>
>>> Hmm, doesn't seem to trigger it at least with pmbus_peek.c, the following diff still doesn't hit 
>>> the too big prints:
>>>
>>
>> Only idea I have at this point is to either enable smbus tracing in the kernel
>> or (better) to add test code into i2c_smbus_read_block_data() to see what
>> exactly triggers the problem.
>>
> 
> You could try this:
> 
> diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
> index e73afbefe222..b2856f88431d 100644
> --- a/drivers/i2c/i2c-core-smbus.c
> +++ b/drivers/i2c/i2c-core-smbus.c
> @@ -233,6 +233,9 @@ s32 i2c_smbus_read_block_data(const struct i2c_client *client, u8 command,
>          if (status)
>                  return status;
> 
> +       if (data.block[0] > I2C_SMBUS_BLOCK_MAX)
> +               return -E2BIG;
> +
>          memcpy(values, &data.block[1], data.block[0]);
>          return data.block[0];
> 
> and maybe temporarily dump the entire buffer if that is seen.
> 
> diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
> index e73afbefe222..3dcb8b6b2427 100644
> --- a/drivers/i2c/i2c-core-smbus.c
> +++ b/drivers/i2c/i2c-core-smbus.c
> @@ -233,6 +233,12 @@ s32 i2c_smbus_read_block_data(const struct i2c_client *client, u8 command,
>          if (status)
>                  return status;
> 
> +       if (data.block[0] > I2C_SMBUS_BLOCK_MAX) {
> +               print_hex_dump_bytes("Bad SMBus block data: ", DUMP_PREFIX_NONE,
> +                                    data.block, I2C_SMBUS_BLOCK_MAX);
> +               return -E2BIG;
> +       }
> +
>          memcpy(values, &data.block[1], data.block[0]);
>          return data.block[0];
>   }
> 
> If that doesn't trigger I am going to be really puzzled.

With this patch the device works fine. With debug enabled I see:

[  273.730583] i2c-core: driver [pmbus] registered
[  276.585423] pmbus 1-0058: probe
[  278.925878] Bad SMBus block data: ff ff b8 ff ff ff ff ff ff ff ff ff ff ff ff ff  ................
[  278.925881] Bad SMBus block data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................
[  278.937859] Bad SMBus block data: ff ff da ff ff ff ff ff ff ff ff ff ff ff ff ff  ................
[  278.937861] Bad SMBus block data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................
[  280.353885] i2c i2c-1: client [pmbus] registered with bus id 1-0058
[  280.353888] i2c i2c-1: new_device: Instantiated device pmbus at 0x58
matt@psu-kern:~$ sensors
pmbus-i2c-1-58
Adapter: CP2112 SMBus Bridge on hidraw1
vin:         123.00 V  (crit min =  -0.50 V, min =  -0.50 V)  ALARM (MIN)
                        (max =  -0.50 V, crit max =  -0.50 V)
vcap:        -500.00 mV
vout1:        12.05 V  (crit min = +128.00 V, min = +128.00 V)
                        (max = +128.00 V, crit max = +128.00 V)
fan1:        5304 RPM
fan2:          -1 RPM
fan3:           FAULT  ALARM
fan4:           FAULT  ALARM
temp1:        +27.0°C  (low  =  -0.5°C, high =  -0.5°C)
                        (crit low =  -0.5°C, crit =  -0.5°C)
temp2:        +32.0°C  (low  =  -0.5°C, high =  -0.5°C)
                        (crit low =  -0.5°C, crit =  -0.5°C)
temp3:         -0.5°C  (low  =  -0.5°C, high =  -0.5°C)
                        (crit low =  -0.5°C, crit =  -0.5°C)
pin:         102.00 W  (max =   1.60 kW)
pout1:        88.00 W  (max =   0.00 W, crit = -500.00 mW)
                        (cap = -500.00 mW)
iin:         988.00 mA (max =  -0.01 A, crit max =  -0.50 A)
iout1:         7.39 A  (crit min =  -0.50 A, max =  -0.50 A)
                        (crit max =  -0.50 A)
