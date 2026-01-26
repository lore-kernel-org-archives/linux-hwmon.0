Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D849713C918
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Jan 2026 15:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769440806; cv=none; b=ZnJKYY+Yez6LwUKDCK72z74KGnXS8bJaO+Ux4+5gNS87sDS/14TKq9zIBM169xGPzGOmzpVYW+7HLpUtZPiidywnLOsREB0AJFQZFtJLLGQ9i9w8npDpj3ZGLJbiU/qUxb/uclr80iFdcoWn6AN8s4HyEoH49s4gvmeXdsczC2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769440806; c=relaxed/simple;
	bh=gGQrITJHkDC3vqnmF3Be6NPFtsyZvsTKZKIwYlsB3kM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RUvLnvQLW164kwdq3t4/4s3wh3hIZV1vbpmvaVR3uULCxkTbc2rJB6owLtJFFVIkzKRkrlsJgWq8dzU5TkQ2M8i4z1bQCsBCRhiMt7UO1vMaVtiSp5sICz+70scY10KZvoMe0k4cFGgUxLLSfwU9lrZrPSBGDwbPCMJjhHTqkxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaPUYdUi; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaPUYdUi"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b4520f6b32so7173065eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jan 2026 07:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769440804; x=1770045604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UNBAMwRhemNwG+CjH3UoYrK4fGsWifJVAhXcl4rskiU=;
        b=BaPUYdUii4XXUjdMbb9hayD/N7Yi+1VaK5JXgOskjfZ1IhMLTBWtfsVq9+t5XQ4+dI
         eDx0t4M2oHs63XWdbiXHcO8MhtkoPN8kDj9RCoWVxbwAu/hWX44J1xh5bpoRHj1pSBUO
         crHgkHGuyNQZdJnLXtLKQj66WF1mvkcdxq8H6ILErLIJADtqsJpruz5f8DO1c1AmWf4d
         BLEppIe7cfQab/RnMuv4iUB96RFgneTrxtxBOX576JZt8FkqZIGBH1cs1BO+IjBrNDT0
         I0oPJIfCwNjTOy5J0x2Rfwro5cHzfTs1az7qak+tciOTeoA9cf/far0+lvPuYr1TN8Ot
         h0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769440804; x=1770045604;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNBAMwRhemNwG+CjH3UoYrK4fGsWifJVAhXcl4rskiU=;
        b=SFN2LztmNKfJzv1Mb8f2Q5BoCDzpoL21nagdbwSek6oZCrIoVkSKb+31ubo4Mpl34m
         Vatoncl/cm5tckHcz2szEOSWi90APy1F0UHBHib0jt3BM6++FKjd2YYh5dJqwVXexeLF
         NycLk12Mx+oKhOOgg3RfUo2NMwh1ARD1dDBLud6LlNVOAsfcS45wbXpfqw/340xB6WuM
         uoEXkl8jFYbRvet9W5x/7bRuD4JR4WmnDDpL4u7ubeGgvXSFdfxQ59GTJarxuE/lm3kc
         ABmfQbt0iHxjAsVzmrjWAPZ1obaf4ANHKfbJMrR8xCtSjQaEF6AxX72WKVMXDfjoAw4q
         rdEg==
X-Gm-Message-State: AOJu0YxP9M2zi8lsDjsUlLv4CMKPuXsghXKm8Ei05VUc9UWTn3TxplRZ
	AmVyZE+m0wyfxw/rGes2c2W6maJDlvFTmaqJW5lSnPFdUCiviUED5yUD
X-Gm-Gg: AZuq6aLWQ8ftNy55IgE57iLW1TEiM2NuTVvGL5IEDuJ6uUkYg83DwAxIDhK0wziwUE4
	edb/64ijnVbA7zL24lfywOOZNgUcNvsCuYXHy3Qv7zLMMfXwCSTX50+PDoCalRPatJ7Qv2CLkmu
	guffZOh7c3rJ8naiJOH5sF6pbL2MdSgDuWtjpU/Q0pw7mtoqYDoJUI6vmmSjayHNLFpo9X3PHRL
	Wppr77z7mFEnHbb2PCLD4za7mN5PZkOG9DvDYCqqupqc67crg3yIC9X1qSskXYOvLHw7WlbihcA
	bZqT5egXhXo8x8IhUEQ+p5vrJsHYGj+VGXP0lObdA3ML9Zr03bfun7R3lcm1tzJOozGQ4yBAX6q
	j3fe8K8keW/E4WQmGyZ0rdmt9EUkkuIuvklOC4kNi8gEejdDbu5IjuqO+sSIbAjRecr+6Eqa8cb
	Ydm9FNskKpqJNTF6uXB7BR5EQN52Zd7utCvWFE1Y6NYCLkDCd1gMpl/caW/z9PK3vCdKiudx8=
X-Received: by 2002:a05:7300:e82e:b0:2b0:4fcc:4c69 with SMTP id 5a478bee46e88-2b76432c56bmr1821558eec.16.1769440803937;
        Mon, 26 Jan 2026 07:20:03 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73aa08964sm13593041eec.28.2026.01.26.07.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 07:20:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <adaff9d6-4539-49ed-af9b-932ac146bf6b@roeck-us.net>
Date: Mon, 26 Jan 2026 07:20:02 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C
 errors
To: Armin Wolf <W_Armin@gmx.de>, TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 linux-kernel@vger.kernel.org
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
 <c36306c5-2426-4a9c-9abd-9f3cdab17ed5@roeck-us.net>
 <CAJ12PfNkde6__QQXMiyBbEoHMbY3efmtsqgbyiKBtBmyfpX5Jw@mail.gmail.com>
 <2740c3ab-7cb0-4931-81a2-30b85e8615f9@roeck-us.net>
 <CAJ12PfP+Dbxd5fFAx-zAaJQ0B53Z1nXAiPbkmivk6smKajf1=Q@mail.gmail.com>
 <e994308a-389a-4d67-9ec9-39a5f0d3f4b6@roeck-us.net>
 <CAJ12PfMC_Potx9aNxaJJ3y=sX=rzyhm-6LJ8Z8OjUyDxiDUNsA@mail.gmail.com>
 <39b48803-e236-4acc-84e9-18162770f9ae@roeck-us.net>
 <CAJ12PfMN5SOcYc6vBJEz57YVcxXAOker4WA61Xh1znP=i8aBRg@mail.gmail.com>
 <5ecc96da-0c87-45f6-ab57-c3ea8eb28de1@gmx.de>
 <b4ce70ec-7a7a-4ee4-a9bf-55d0a64f8644@roeck-us.net>
 <995092ad-7b99-4edc-b0eb-b4a3d3f5b1fd@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <995092ad-7b99-4edc-b0eb-b4a3d3f5b1fd@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/26/26 01:40, Armin Wolf wrote:
...
>>> Besides that: did the spd5118 driver load automatically on your device?
>>>
>>
>> I thought that was disabled. The i801 driver is supposed to detect if write
>> protect is enabled and, if so, it is supposed to not instantiate the spd5118
>> driver for DDR3. Support for this was added with commit 4d6d35d3417d ("i2c:
>> smbus: introduce Write Disable-aware SPD instantiating functions"). Apparently
>> the code to do this never made it into the i801 driver.
>>
>> The i801 driver needs to be fixed to inform the spd initialization code
>> that the spd5118 address range is write protected. The patch to do this was
>> "i2c: i801: Do not instantiate spd5118 under SPD Write Disable". I have no idea
>> why that patch didn't make it upstream.
>>
>> Guenter
>>
> Good question, do you want to send the message to the i2c maintainers about this
> or should i do it?
> 

Please go ahead. I am so far behind with everything :-(.

Thanks,
Guenter

