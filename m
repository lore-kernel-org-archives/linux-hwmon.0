Received: from mail.as397444.net (mail.as397444.net [69.59.18.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FE7647
	for <linux-hwmon@vger.kernel.org>; Sat, 19 Apr 2025 17:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.59.18.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745085224; cv=none; b=c6VI5oB3gUS+c6aZ0Vikc9jcW5C04yeZ/bwCgMEbbObKldcjf+lYeDMbgEXtCXnQ9LWPuBHiRZ5QexH2QGVWEot52lI3kubQc2O6fOMVkrmt8hWS1ZFPoeayCQbphaZPnhKpbicyfT6WTkezO8EfdXbTYgu8npDfZk3VGEKzEMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745085224; c=relaxed/simple;
	bh=zqHAsr1SZ9WA0psG9NqaSp1o7kVGReU5BDV4xAcLJ0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WBjm30fVH7f7gvNx6D3hjTDWakHZCogjAhQLmcPluUrV3dJe50Ko3k19vz6i2zKhlLJN1mBFNxSdoUQ/23LPP8uTJXQArN4nGQMbGC/qYDiGZsutjJnoAKXBi8JAgLmdnQJrwfEr1CzYWdH5wx/vRrPpDyt6rk5BZ79LcpyNj6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mattcorallo.com; spf=pass smtp.mailfrom=mattcorallo.com; dkim=pass (2048-bit key) header.d=mattcorallo.com header.i=@mattcorallo.com header.b=dq4GuIaA; dkim=pass (2048-bit key) header.d=clients.mail.as397444.net header.i=@clients.mail.as397444.net header.b=xWZ0MeQg; arc=none smtp.client-ip=69.59.18.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mattcorallo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mattcorallo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mattcorallo.com header.i=@mattcorallo.com header.b="dq4GuIaA";
	dkim=pass (2048-bit key) header.d=clients.mail.as397444.net header.i=@clients.mail.as397444.net header.b="xWZ0MeQg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mattcorallo.com; s=1745083263; h=In-Reply-To:From:References:Cc:To:Subject:
	From:Subject:To:Cc:Reply-To; bh=g2fJTgbT2uJuzIcDouXqUFyhFSeZFXQ7+jMIkTcce7s=;
	b=dq4GuIaAAOhJrtn7rjuW8t8kNKhpo/3rilvfgURD4rL33r+m3jgO2xfa/svBlUvDtz5mfeHwhxF
	AAocaK+cbEITce5Um9nJ0Wf87l80UFgKQ9OuQBJS0/0TlY/7ZCM1A48JTqxFdr7RhAIIg6Ti7qO5o
	/joTbPH9l8U7rdKlV2zRjqSSYxKQiRwgBBVLA34vFi3ozgO4OhyQ7TYi2qbMfNiHx+yBR1PjCTb/u
	Wk6lHLRrfORaSmUrSJfKiOQR3UETk122evPqiI88ptotx/7EBPbch41dX+933dQJUUDmL6yq95oFS
	xIKZQbtAeIoNFKAgxpjUHR3P5ECf2Ml/RbHg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=clients.mail.as397444.net; s=1745083265; h=In-Reply-To:From:References:Cc:
	To:Subject:From:Subject:To:Cc:Reply-To;
	bh=g2fJTgbT2uJuzIcDouXqUFyhFSeZFXQ7+jMIkTcce7s=; b=xWZ0MeQgypsZ1vhPjfKnqGO3Np
	CJhbeIaOzvCriRlxYD43Me6mK9cK48/WW4stJlbjwZw4bnt5qhMhUP0cKVViZQxDztoApX9CWOTYu
	S2/wJudNlD32+eVYjiEMXLXQQajc74ADfwpU8nwN/5m0HmHu71RI/K9uqoZ3/LKcrJbQYkd+Tta25
	yp/ZtCmK/L4hj+NWYk+oOpqYAONecaXitG5u5KGAAwEjA+YzsOq/o+4mJPVBJyMNiCxvgOn5kIc87
	uEm8g4hodD6kOimDPAiNX0PLcXP5XB+hYlP4jjA7kYI2IiS+Q0n2LM3nDSej7/6FUxACJuMzYH+yo
	wwuyEC4g==;
X-DKIM-Note: Keys used to sign are likely public at
X-DKIM-Note: https://as397444.net/dkim/mattcorallo.com and
X-DKIM-Note: https://as397444.net/dkim/clients.mail.as397444.net
X-DKIM-Note: For more info, see https://as397444.net/dkim/
Received: by mail.as397444.net with esmtpsa (TLS1.3) (Exim)
	(envelope-from <yalbrymrb@mattcorallo.com>)
	id 1u6CNo-009gck-0s;
	Sat, 19 Apr 2025 17:53:40 +0000
Message-ID: <cfc2b3c8-3f94-407a-a4d5-e7d81686eb2d@mattcorallo.com>
Date: Sat, 19 Apr 2025 13:53:38 -0400
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
Content-Language: en-US
From: Matt Corallo <yalbrymrb@mattcorallo.com>
In-Reply-To: <1edc8396-535d-4cdf-bbb7-11d559d4c257@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/18/25 6:30 PM, Guenter Roeck wrote:
> On 4/18/25 14:03, Matt Corallo wrote:
>>
>>
>> On 4/17/25 9:21 PM, Guenter Roeck wrote:
>>> On 4/17/25 11:14, Matt Corallo wrote:
>>>> I do not, sadly (though FSP support has been rumored to help out at least marginally, though 
>>>> they haven't been useful for me). Interestingly the (I guess ancient now) pmbus_peek.c script 
>>>> has no issues reading from it (added a quick print on the -E2BIG line and it didn't get hit). 
>>>> pmbuss_peek.c says the following:
>>>>
>>>> root@rackchill-refresh:~# ./a.out -b /dev/i2c-3 -s 0x59
>>>> PMBus slave on /dev/i2c-3, address 0x59
>>>>
>>>
>>> pmbus_peek supports reading up to 255 bytes into the receive buffer.
>>
>> Hmm, I'm using this version, which on L622 checks for a length > 32 (and doesn't get hit in the -s 
>> command) - https://github.com/jktjkt/pmbus_peek/blob/master/pmbus_peek.c#L622
>>
> 
> Sorry, I am only guessing here. The code in pmbus_peek.c is a bit odd, though:
> It does validate the first byte, but then it jumps to try_i2c: and tries again,
> this time reading up to 255 bytes. I am not really sure if that ends up reporting
> an error or not. The comment "NOTE:  this probably won't be visible" doesn't
> really improve my confidence that it will report the problem.

Sure, that's why I `printf("BAD LEN\n");`'d there but didn't see it get hit.


> If you are up to compiling code, it would be great if you could add some debug logs
> into pmbus_peek.c and/or into the hid-cp2112.c driver to see what is actually
> returned from the chip.

Sure, of course. Obviously easier to do in pmbus_peek if you have any suggested logs you want. The 
device caps output is (and still never hit my BAD LEN printf):

./a.out -b /dev/i2c-3 -l -v 0x58
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

Supported Commands:
   00 page                      rw u8 (bitmask)
   01 operation                 rw u8 (bitmask)
   02 on_off_config             rw u8 (bitmask)
   03 clear_fault                w nodata
   05 page_plus_read             w block
   19 capability                r  u8 (bitmask)
   1a query                     rw process_call
   1b smbalert_mask             rw block
   20 vout_mode                 r  u8 (bitmask)
   30 coefficients              r  process_call
   3b fan_command_1             rw s16 (LINEAR)
   79 status_word               r  u16 (bitmask)
   7a status_vout               r  u8 (bitmask)
   7b status_iout               r  u8 (bitmask)
   7c status_input              r  u8 (bitmask)
   7d status_temperature        r  u8 (bitmask)
   81 status_fans_1_2           rw u8 (bitmask)
   86 read_ein                  r  block(6), Energy counter (DIRECT)
   87 read_eout                 r  block(6), Energy counter (DIRECT)
   88 read_vin                  r  s16 (LINEAR), Volts
   89 read_iin                  r  s16 (LINEAR), Amperes
   8b read_vout                 r  x16 (VOUT_MODE), Volts
   8c read_iout                 r  s16 (LINEAR), Amperes
   8d read_temperature_1        r  s16 (LINEAR), degrees Celsius
   8e read_temperature_2        r  s16 (LINEAR), degrees Celsius
   90 read_fan_speed_1          r  s16 (LINEAR)
   95 read_frequency            r  s16 (LINEAR)
   96 read_pout                 r  s16 (LINEAR), Watts
   97 read_pin                  r  s16 (LINEAR), Watts
   98 pmbus_revision            r  u8 (bitmask)
   99 mfr_id                    r  block, ISO 8859/1 string
   9a mfr_model                 r  block, ISO 8859/1 string
   9d mfr_date                  r  block, ISO 8859/1 string
   9e mfr_serial                r  block, ISO 8859/1 string
   a4 mfr_vout_min              r  s16 (LINEAR), Volts
   a5 mfr_iout_max              r  s16 (LINEAR), Amperes
   ad ic_device_id              r  block, ISO 8859/1 string
   d1 mfr_specific_01           r  (UNKNOWN call syntax)
   d2 mfr_specific_02           r  (UNKNOWN call syntax)
   d4 mfr_specific_04           r  (UNKNOWN call syntax)
   d5 mfr_specific_05           r  (UNKNOWN call syntax)
   d7 mfr_specific_07           rw (UNKNOWN call syntax)
   d8 mfr_specific_08           r  (UNKNOWN call syntax)
   d9 mfr_specific_09           r  (UNKNOWN call syntax)
   da mfr_specific_10           r  (UNKNOWN call syntax)
   db mfr_specific_11           r  (UNKNOWN call syntax)
   de mfr_specific_14           r  (UNKNOWN call syntax)
   e0 mfr_specific_16           r  (UNKNOWN call syntax)
   e1 mfr_specific_17           rw (UNKNOWN call syntax)
   e2 mfr_specific_18           rw (UNKNOWN call syntax)
   e3 mfr_specific_19           rw (UNKNOWN call syntax)
   e5 mfr_specific_21            w (UNKNOWN call syntax)
   f0 mfr_specific_32           rw (UNKNOWN call syntax)
