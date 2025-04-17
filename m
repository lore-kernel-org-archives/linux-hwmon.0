Received: from mail.as397444.net (mail.as397444.net [69.59.18.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3DC2561DA
	for <linux-hwmon@vger.kernel.org>; Thu, 17 Apr 2025 18:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.59.18.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744913704; cv=none; b=CQ/rtzDp3X96eCvA/8LVh1//fBNN1zEqE4T/NKaWnKuR3/bGOPuIXoLAJcGW7jpor9sb6304qeusVJtFGkmBl7sVchuwuNZnOG6l5gOiiQpNx163yYAxrIAOs9ixBba4RIGNIaVGeHplxEQqQnx006fg44qCNcWVVPFN+lc9CKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744913704; c=relaxed/simple;
	bh=gzc41iy/6cqVKdCd2ovApy4An1ft5QIWQd1oe7vO274=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ki8Qvsp+PWq0/n08ADu2DrKt6rqCdueg+tfMfQKdaHZF7XrAlZgfUys+t+ibotkjYuIP2eh4t1bFeUivMY9al6Bm1l8rv7NFeNg2X3vYTlvjZ2x3+LZzjeSDMy3ZHuJM5gS7ytWDkIXTbRTU2I6LGWOafwGAg0VjvyNqvHRa63w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mattcorallo.com; spf=pass smtp.mailfrom=mattcorallo.com; dkim=pass (2048-bit key) header.d=mattcorallo.com header.i=@mattcorallo.com header.b=NBommfko; dkim=pass (2048-bit key) header.d=clients.mail.as397444.net header.i=@clients.mail.as397444.net header.b=kJokpgVJ; arc=none smtp.client-ip=69.59.18.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mattcorallo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mattcorallo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mattcorallo.com header.i=@mattcorallo.com header.b="NBommfko";
	dkim=pass (2048-bit key) header.d=clients.mail.as397444.net header.i=@clients.mail.as397444.net header.b="kJokpgVJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mattcorallo.com; s=1744911662; h=In-Reply-To:From:References:Cc:To:Subject:
	From:Subject:To:Cc:Reply-To; bh=mgxzKp2nk5QGVeNjeEyAZKZqgpNB8LfYmQEBNvvGEYk=;
	b=NBommfko14vIYnEySB5G/Czt4E541Ob6K4hUoNeWlVtk9/S/KC4lq743Tx/oFDNr05ZHpicNuU/
	UMoMa/FBnucvJ0vENe4qpoP99Ot/Ko5cF6iKc2SlAOTiLIAC1/fuN8EjpaXe+iVjnDM8RXY55bJ31
	NiRBUmz5ek5XzBKNLiTno+RpcsudNHjY0MzRlu2JfbceOR34GEOnJsIk09/RmSZTMNZGVf2A1dVqB
	Y1GcuwTq2JNfkFt0PBKVx0K8HjnHAAckHjHpa27qeLoU2lqbOsGg207EvH3Wm+W8LofVuaAoCLwda
	UNRWBaEpnVTw8rL3pi4QwM2fh19/VjfeP/2A==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=clients.mail.as397444.net; s=1744911664; h=In-Reply-To:From:References:Cc:
	To:Subject:From:Subject:To:Cc:Reply-To;
	bh=mgxzKp2nk5QGVeNjeEyAZKZqgpNB8LfYmQEBNvvGEYk=; b=kJokpgVJPHahDBVTRKitWk3Xwu
	0opuesw0+KIp/nWtzxtb0c5x0wqPipoTk/cigLnut0zMHtBxRIZrVtZF897W0/mZOgSDIxFAiXnQ8
	eCXZxbT9V+aOknsgHOVajt+PLFprBBQUjPqW1lHaEbrZUiMew5LlVU8Ljs1Ov9hdrugVlZ23WfuiG
	N/gRjeJ/vqsbAyNlASXn1CbedY36mABzD1+W+IRkY4STil6sHUk828jcZ6ULSbHn9CQvi9ELlqrBz
	Cgad6wKeIkQQRVtsctv68d1UTXjP0wvrUEAQay0v8y69OzUfnr4HJtne4LzD320sz8W5jReN9Sykj
	uSJwD2kQ==;
X-DKIM-Note: Keys used to sign are likely public at
X-DKIM-Note: https://as397444.net/dkim/mattcorallo.com and
X-DKIM-Note: https://as397444.net/dkim/clients.mail.as397444.net
X-DKIM-Note: For more info, see https://as397444.net/dkim/
Received: by mail.as397444.net with esmtpsa (TLS1.3) (Exim)
	(envelope-from <yalbrymrb@mattcorallo.com>)
	id 1u5TlN-009LiM-0P;
	Thu, 17 Apr 2025 18:15:01 +0000
Message-ID: <e030f44f-11ee-4739-b9d3-c22883bbbf02@mattcorallo.com>
Date: Thu, 17 Apr 2025 14:14:58 -0400
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
Content-Language: en-US
From: Matt Corallo <yalbrymrb@mattcorallo.com>
In-Reply-To: <9e01e3ec-3ac5-4d83-a065-d00d568b9cc7@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/17/25 2:00 PM, Guenter Roeck wrote:
> On Thu, Apr 17, 2025 at 11:39:14AM -0400, Matt Corallo wrote:
>> When adding the PMBus entry for a FSP520-20RAB (actually FSP Twins Pro but
>> it appears to be identical hardware with a provided SMBus -> USB adapter and
>> it self-reports as an FSP520-20RAB when queried over PMBus using the old
>> pmbus_peek.c script) with `echo pmbus 0x59 >
>> /sys/bus/i2c/devices/i2c-3/new_device` I got the following BUG_ON (on
>> Proxmox's 6.8.12-8-pve kernel). Its redundant and reports back fine on 0x60
>> and 0x59 for both of its modules (using pmbus_peek.c) and I'd already added
>> 0x60 and it BUG'd adding the second module at 0x59.
>>
> ...
>> Apr 17 15:31:19 rackchill-refresh kernel:  i2c_smbus_read_block_data+0x116/0x120
>> Apr 17 15:31:19 rackchill-refresh kernel:
>> pmbus_check_block_register.constprop.0+0x77/0x100 [pmbus_core]
> 
> Interesting. That function reads into a buffer which is larger than the
> largest valid PMBus transaction. I can only imagine that the controller
> returns invalid data in that transaction, where the first returned byte
> is not the length of the transfer but something else.
> i2c_smbus_read_block_data() does an unconditional
> 	memcpy(values, &data.block[1], data.block[0]);
> which of course will go haywire if data.block[0] (or in other words the
> first data byte returned from the device) exceeds the size of the
> data buffer. Do you happen to have a datasheet ?

I do not, sadly (though FSP support has been rumored to help out at least marginally, though they 
haven't been useful for me). Interestingly the (I guess ancient now) pmbus_peek.c script has no 
issues reading from it (added a quick print on the -E2BIG line and it didn't get hit). pmbuss_peek.c 
says the following:

root@rackchill-refresh:~# ./a.out -b /dev/i2c-3 -s 0x59
PMBus slave on /dev/i2c-3, address 0x59

Inventory Data:
   Manufacturer:		FSP-GROUP
   Model:		FSP520-20RAB
   Revision:		(null)
   Built on:		
   Serial:		
   IC Device:		PIC24FJ32GA004

PMBus revisions (0x22):	part I, ver 1.1; part II, ver 1.2
Capabilities (0x90):	PEC, SMBALERT#, 100 KHz

Status 0000:

Attribute Values:
   page                  00: (BITMAP)
   operation             00: (BITMAP)
   on_off_config         15: (BITMAP)
   vout_mode             17: (BITMAP)
   fan_command_1         0000: 0
   ein                   ba4ba00938ba: 5.26211e+06
   eout                  1e56a12038ba: 5.29753e+06
   vin                   f1e8: 122 Volts
   iin                   c09c: 0.609375 Amperes
   vout                  1869: 12.2051 Volts
   iout                  caad: 5.35156 Amperes
   temperature_1         001c: 28 degrees Celsius
   temperature_2         0024: 36 degrees Celsius
   fan_speed_1           1a1f: 4344
   frequency             f0ec: 59
   pout                  f108: 66 Watts
   pin                   f128: 74 Watts
   mfr_vout_min          0000: 0 Volts
   mfr_iout_max          0000: 0 Amperes

root@rackchill-refresh:~# ./a.out -b /dev/i2c-3 -s 0x58
PMBus slave on /dev/i2c-3, address 0x58

Inventory Data:
   Manufacturer:		FSP-GROUP
   Model:		FSP520-20RAB
   Revision:		(null)
   Built on:		
   Serial:		
   IC Device:		PIC24FJ32GA004

PMBus revisions (0x22):	part I, ver 1.1; part II, ver 1.2
Capabilities (0x90):	PEC, SMBALERT#, 100 KHz

Status 0000:

Attribute Values:
   page                  00: (BITMAP)
   operation             00: (BITMAP)
   on_off_config         15: (BITMAP)
   vout_mode             17: (BITMAP)
   fan_command_1         0000: 0
   ein                   0574e89f8070: 7.63164e+06
   eout                  613f88b78070: 4.47254e+06
   vin                   f1e8: 122 Volts
   iin                   c039: 0.222656 Amperes
   vout                  1871: 12.2207 Volts
   iout                  c11e: 1.11719 Amperes
   temperature_1         001b: 27 degrees Celsius
   temperature_2         0024: 36 degrees Celsius
   fan_speed_1           13e5: 3988
   frequency             f0ec: 59
   pout                  f038: 14 Watts
   pin                   f050: 20 Watts
   mfr_vout_min          0000: 0 Volts
   mfr_iout_max          0000: 0 Amperes
