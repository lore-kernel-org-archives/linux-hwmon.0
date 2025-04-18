Received: from mail.as397444.net (mail.as397444.net [69.59.18.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE21433C4
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Apr 2025 21:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.59.18.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745010205; cv=none; b=ozlxPdQEd7qPzOSMdp0YNhIvUZqB58LLK392CK6n6p3gI5EWcm2N3wUdjtf4biczq6Mct9EQ7ArzPU2e3EeFXRBV0Y8HkECEMHZBWhn2x/m61t8yGr7KHvcdNayiHOuvNDTip15QDuMoWlkrNgDFzeg0MdxY1+VQWLy7Gq7A36o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745010205; c=relaxed/simple;
	bh=8Wyi8SFhBYyIPXlI2x63Cf8vTotjbEASD0fpvYK/5Ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tRImmNpCsVl5Fh7QQbk1FcbyB2k4u65d33uAp7mB+/8xNopHmuCeDiDkMEiA6oB/KJ0a3OwR1bcY0Ipdsd5LxM4O21xgsZVysWwAnUYVJHJloYxMLq7QbBd4i7baqhFPe4JMRhnbsI+7q03QmNBtrkgiDeEpHUiHwbxpw2g8xjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mattcorallo.com; spf=pass smtp.mailfrom=mattcorallo.com; dkim=pass (2048-bit key) header.d=mattcorallo.com header.i=@mattcorallo.com header.b=aeQlfW4m; dkim=pass (2048-bit key) header.d=clients.mail.as397444.net header.i=@clients.mail.as397444.net header.b=FEqluDto; arc=none smtp.client-ip=69.59.18.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mattcorallo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mattcorallo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mattcorallo.com header.i=@mattcorallo.com header.b="aeQlfW4m";
	dkim=pass (2048-bit key) header.d=clients.mail.as397444.net header.i=@clients.mail.as397444.net header.b="FEqluDto"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mattcorallo.com; s=1745008862; h=In-Reply-To:From:References:Cc:To:Subject:
	From:Subject:To:Cc:Reply-To; bh=RYo0jYqbU9UIO3YiYoNr88Th/slYOVx3wvxeeU5XvrE=;
	b=aeQlfW4mwFr9oQOCkdacD56lKp8ntByXHGx5DQDwSub7kq8lwsmRc1YUJodmCvXlEAhFz4fHKCz
	yImuwlvvTBJsWyhj3bWnvIwTM3abJDzFUvssBm96OCF7lFbswsncxIkwHH2dEA4jOJ+qIx2QWYf7H
	TUcTTsDHypu2WD9hhPVDY99nWR39OtWk47m9RbSPu3NuXmxILE9BZmrrTbko2tjtl7PjfLXfc3wdY
	2DFxWX3CUnh+gKD5DUfJT9O76BywmzEOu+9euiXBLGSk7l7e7axT2eSJn9KFXzNX4KsUj8k9mZQLl
	+em1da3otpYViCzjwcYpvY18kxXCuTlE6V+A==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=clients.mail.as397444.net; s=1745008864; h=In-Reply-To:From:References:Cc:
	To:Subject:From:Subject:To:Cc:Reply-To;
	bh=RYo0jYqbU9UIO3YiYoNr88Th/slYOVx3wvxeeU5XvrE=; b=FEqluDto7QlQ8Drw/lRsQVpmok
	8yERA1nMdLFXr+1sx1dxjXZliYJ2+rTJbHuJPn9Mc5Mxo/TCxaGA/ewLpk3eBud/LbK8J7AaLXmnt
	lVbjm6L9vZimTgOFICIpq7A7lLAJvg6UlKW0/IFNpPMmK2/J/O2Sbo8mbn/f7AIOOc+dsX3UHVtu5
	kF/3vIySwKtImR8y2OSjs+rPjv70mvw3swoCWyEXnao455+YBdtPfaT2juwVE9LU21rzi2Na++vJW
	x68ZjFS06WyqnptLmnh4xxzOOM2eq5VlGI7YD4ZWAfz4I6YtNYDKs+ztDeFeWq2tUlJzvLJ1n6IRL
	16/fMSMw==;
X-DKIM-Note: Keys used to sign are likely public at
X-DKIM-Note: https://as397444.net/dkim/mattcorallo.com and
X-DKIM-Note: https://as397444.net/dkim/clients.mail.as397444.net
X-DKIM-Note: For more info, see https://as397444.net/dkim/
Received: by mail.as397444.net with esmtpsa (TLS1.3) (Exim)
	(envelope-from <yalbrymrb@mattcorallo.com>)
	id 1u5srj-009XDo-3B;
	Fri, 18 Apr 2025 21:03:16 +0000
Message-ID: <1b1eccff-a306-4e17-a6bf-fd3203c61605@mattcorallo.com>
Date: Fri, 18 Apr 2025 17:03:14 -0400
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
Content-Language: en-US
From: Matt Corallo <yalbrymrb@mattcorallo.com>
In-Reply-To: <336f298f-497f-4dd9-97ee-50b81221be06@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/17/25 9:21 PM, Guenter Roeck wrote:
> On 4/17/25 11:14, Matt Corallo wrote:
>> I do not, sadly (though FSP support has been rumored to help out at least marginally, though they 
>> haven't been useful for me). Interestingly the (I guess ancient now) pmbus_peek.c script has no 
>> issues reading from it (added a quick print on the -E2BIG line and it didn't get hit). 
>> pmbuss_peek.c says the following:
>>
>> root@rackchill-refresh:~# ./a.out -b /dev/i2c-3 -s 0x59
>> PMBus slave on /dev/i2c-3, address 0x59
>>
> 
> pmbus_peek supports reading up to 255 bytes into the receive buffer.

Hmm, I'm using this version, which on L622 checks for a length > 32 (and doesn't get hit in the -s 
command) - https://github.com/jktjkt/pmbus_peek/blob/master/pmbus_peek.c#L622

> Anything above 32 bytes violates the SMBus specification. I found that
> the I2C controller driver should block that. If it doesn't, all kinds
> of chips could trigger this problem. Do you know which I2C controller
> is used by that system ? You mentioned an SMBus - USB adapter. The drivers
> for the adapters I am aware of (Diolan, Devantech) do validate the return
> length, so I assume you use something else or maybe an out-of-tree driver.

The driver appears to be in-tree (or at least was auto-loaded by the Proxmox kernel, which is mostly 
just the Ubuntu kernel). Its a 10c4:ea90 Silicon Labs CP2112 HID I2C Bridge.

Still, more generally, presumably it shouldn't be the case that a defective USB device can cause the 
kernel to memcpy past a buffer? I guess for hardened kernels it gets caught (though once the process 
gets killed by the hardening the system is still somewhat shaky, reboots dont work etc), but is 
there a build option that would turn this into a security vuln?

Matt
