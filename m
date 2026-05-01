Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4492A3D3483
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 16:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777652930; cv=none; b=SRUuvOH+T35yPi2wLlsz6/RxeQmdnFOmYA1KFUeDqob87Be2rEvl7JSaNr+OdHCKvT444PRtitSj3omTU3VjNkpBiiMSX0eAT+Oyoz/zjvhP/ygSyFOYd4OX2z4vapft1mTTVM2Cak7poY5GCmJnpzIvCqw41ZBSeNmFQGQAkrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777652930; c=relaxed/simple;
	bh=hB419DZqwfY2q35KZGxZWsJnMWCpetjqbhyF8YbS8rc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dFtJzwLo2IPCsYCHHRHmlAQsxHVakXV8j95VwO3ISybGK4sF+Dw3P0xESXhZj/TlDriBBH5rU9DjwK3H3MZ5J52Zd85LT7u3sW7F+sA0mHeTWPoRYTIWIHqEsjGQ+hULXTkM6JCKk5sgqNMuQZ3tIHtHxySPHOiJeIrkRGGdffg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sGbCOsk1; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sGbCOsk1"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so2691255eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 01 May 2026 09:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777652923; x=1778257723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fer6cYUwO7XAK+aFDpBnPHY14BNIPlazBoLp2o7Ghzw=;
        b=sGbCOsk1JzpV3o/edhjn5kYQb3ICFEiL4+b7UL7woxR60kCgajsKokTQwvepkJiBcb
         KQTbBckvmFdZ7cmuBNQkfUpoiQDCs+MqpK81bIt6CmYfEwaJUS+MpqUArlv/M6zUZHEU
         70IKByyhmmo+AqSdLrkJWqJPuCqzj7Htd7q93kg2PEMMATTynYJFn5P79lyX1fAHV3Ku
         scwFeE4w0iFB5AuUxtJoCo9WDPvKimeCfGcRNYk1rrqvc0efVPZzMEnZu6kmf2lbuaKV
         Viud5j+pUJ0ykfSQ/QFssaK4+ZG0s7HCbrG3tq884LUjulelrR0JIBuc6VJ3dRtKrRx/
         Tv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777652923; x=1778257723;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fer6cYUwO7XAK+aFDpBnPHY14BNIPlazBoLp2o7Ghzw=;
        b=BReA9KDpBQ8l0JFilXhP01QnRs1x9CEr6z5JonSOjlZq/66kbG5gZyCJ5vEAABYVgv
         H5KVdk3Sj5I4lYzDpa5ZBI7ONIDlh4MbMOpwrx8HrWuTAagis7Ko1HvT7pfupXA0veev
         BCxP0lQ0r2di0tXq5YcwmQ0jq7xV471K+HH9laLcLqxRze3IRZZ8EZLuqodiV4ku54nL
         HWY6W3znBUOy6jxVI9TozU45DPjrKxGZkrsBVUVDNiTUq34hSCS9ac4Ye4IfKDgaSuH0
         02CeUOHxJC4Z1cnW99mzvyyEU0stvHJdFTbAU5T4yvguqOUkf2oBSSKup4qklYmnjSOT
         StRQ==
X-Gm-Message-State: AOJu0YwI5KtDRmDQnemw/LDiMOac8QO3dfIg4QBs0VPxK1W+AzHAaJt8
	4IzIbGeiREv9e2WpCuN3bHr7lpyFseu7BOaLBGUw8pCx4/zkPuyzDG12
X-Gm-Gg: AeBDiesmNz5z9eYaNguaN/PxOpIfuw/omWJTygGLMVavI3SqWdM49XLHHp1+SI1WGIq
	sbYEQXfPwFiiKTXlVj6H/MUIIWPeCQI48xZH8hCiXxTe0zmdNxOOhRB7jGRFGnqp1swTCqIVR6X
	EmwiyxeAeArwX1a2T5rKEOkOeWbCS708MdMpC+YpUSN68RnX7buVmHCoWzLHd4LbaiUpE6N8wGf
	IejPKSOaL9tWznpBCZaGB736Sc6OZJiS1y20oNf+/Pa8pVSx9+mqLiFeEJipYCwRdKFaUH0KRfe
	BVIWfodUsAx3DrnGGh9BPyce9aBXk4mjaJ1VU02+Thyf2rbEMgBNfJs6D+CdYQ2F+lqkkIFvegi
	9orYge/N6mD+KDkbx/GAweYNHhmYyD5MpkMLTu5/kiU2GEyvH9YvseIIQHbdXuB1wgWzgrl69lc
	NK6NihWcp/Fe1SAmcaUmDMk+1ZZNN4LfFi8sto3LEOxHLGjFS7pjcrAISLo4BngVZ9K4ezjJSE5
	kaD/XnfnmCHQjrGUSZyHw==
X-Received: by 2002:a05:7301:38a8:b0:2e2:d94d:6186 with SMTP id 5a478bee46e88-2efb94ab893mr32369eec.11.1777652922758;
        Fri, 01 May 2026 09:28:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm6511627eec.0.2026.05.01.09.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 09:28:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1fdad9e4-8a6e-4d17-912a-44e12f33c7eb@roeck-us.net>
Date: Fri, 1 May 2026 09:28:40 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] hwmon: (ads7871) Fix endianness bug in 16-bit
 register reads
To: David Laight <david.laight.linux@gmail.com>,
 Tabrez Ahmed <tabreztalks@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, me@brighamcampbell.com, Sashiko <sashiko-bot@kernel.org>
References: <20260501023530.31160-1-tabreztalks@gmail.com>
 <20260501023530.31160-2-tabreztalks@gmail.com>
 <20260501094902.05ce6d37@pumpkin>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260501094902.05ce6d37@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/1/26 01:49, David Laight wrote:
> On Fri,  1 May 2026 08:05:28 +0530
> Tabrez Ahmed <tabreztalks@gmail.com> wrote:
> 
>> The ads7871_read_reg16() function relies on spi_w8r16() to read the
>> 16-bit sensor output. The ADS7871 device transmits the Least Significant
>> Byte (LSB) first.
>>
>> On Little-Endian architectures, spi_w8r16() correctly reconstructs the
>> 16-bit value. However, on Big-Endian architectures, the byte swapping
>> causes the first received byte (LSB) to be placed in the most significant
>> byte of the u16, resulting in corrupted voltage readings.
>>
>> Replace spi_w8r16() with a manual spi_write_then_read() into a byte array,
>> and safely reconstruct the integer using get_unaligned_le16() to ensure
>> correct behavior across all architectures. Additionally, use a u8
>> variable for the command byte to ensure the correct instruction is
>> transmitted on Big-Endian systems.
>>
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Closes: https://sashiko.dev/#/patchset/20260418034601.90226-1-tabreztalks@gmail.com
>> Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>
>> ---
>>   drivers/hwmon/ads7871.c | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
>> index 9bfdf9e6bcd77..d77eff430935b 100644
>> --- a/drivers/hwmon/ads7871.c
>> +++ b/drivers/hwmon/ads7871.c
>> @@ -59,9 +59,9 @@
>>   #include <linux/hwmon-sysfs.h>
>>   #include <linux/err.h>
>>   #include <linux/delay.h>
>> +#include <linux/unaligned.h>
>>   
>>   #define DEVICE_NAME	"ads7871"
>> -
>>   struct ads7871_data {
>>   	struct spi_device *spi;
>>   };
>> @@ -77,9 +77,17 @@ static int ads7871_read_reg8(struct spi_device *spi, int reg)
>>   static int ads7871_read_reg16(struct spi_device *spi, int reg)
>>   {
>>   	int ret;
>> +	u8 tx_cmd;
>> +	u8 rx_buf[2];
>> +
>>   	reg = reg | INST_READ_BM | INST_16BIT_BM;
>> -	ret = spi_w8r16(spi, reg);
>> -	return ret;
> 
> Isn't it enough to just byteswap the result? so:
> 	return le16toh(ret);
> The whole thing can be:
> 	return le16toh(spi_w8r16(spi, reg | INST_READ_BM | INST_16BIT_BM));

This would convert error codes to some random value.

Guenter

