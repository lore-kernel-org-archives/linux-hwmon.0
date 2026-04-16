Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE2933B97A
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 04:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776314946; cv=none; b=Ry70Hm4X1QBChqsB2WEYVz6lmpdw5u14tX9FCPDkJeDp7HcByma0rVfPYSJUPgA0Dr7aORefTK3+u++9dQYNaM8GGi5RVZ8dj24WY0VMvbx1QhobNF+lisXfQzfnEc7uKFrz9G8SDumTbKNL387zsgeA+oNXWTXC3S4TUcaXCIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776314946; c=relaxed/simple;
	bh=58a1ou5dTzlBCcmc8gPgcsCSwZyWrOcRK+6vEMo8G5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZEUHZdOVRrsnZfOZz8YqBaMPXoxE2veVX+lkF46pCFcWktm28e2+CaARw9zB4+vULaNfUTfDWcXC3fDYgfuor+zm0fF17bfLJrae/h6veuq0Ry/L5kZy/4hNbBOKAeuf4o9cwbqcnDr6ImDEXqNo62m4gZ1sSeUSNKGoTRaHhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOcDI8fJ; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOcDI8fJ"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2d96243c91fso806916eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Apr 2026 21:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776314943; x=1776919743; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=l5qZNIb399Xzo4308jp71ye0p5c2WwoKVKHEs2lDIQ4=;
        b=mOcDI8fJ5s3GIZn4taDIcR+CoMPmBwvsjAHu0lDS0DPIDSdokpxA2ykYgUBnbWqdsx
         JYkzXdThgZlyvA8QF50j8xPNEq7WQ9H1x25//RGbMv6uNNtYY29jKul4pDlKsfVJUCUJ
         Ewdd0TLU2ndctAnOGfsdbmqJpwt2F5EVWyiaZat4c8Fgqduayy9gf5cmo92DFUJ67diw
         lCX/zuFHEBwPYmPTMDCWio8DXWqcavX2DSD91TkQMkd25yyhF9zKVljF9LlGIN5B8czU
         p+wMyzXrP4S/3sDM5GuX/5MXtoS8F7nz1IO6UWSh2UaJKNNmYUPVXmM9XxzosMgp2Kll
         Qf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776314943; x=1776919743;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5qZNIb399Xzo4308jp71ye0p5c2WwoKVKHEs2lDIQ4=;
        b=C7DB/Zg4zEj6fXihBwY71dSKyAJMVaxc8hmg1RUBzrpwI45H7xcxZGqAlTjnYhJF5M
         OzVCNeh8SH9gcIr/5RkfKGhe06DQgRMMTOgedSx3og/8oPeeSOJw09DqadQKoeHap8Rd
         E/bsWcaAR3HYPU/xz8ls06hunAhNXWQlskduvqu0yixXlU175fZhK8FIQPi8ymMqKoiJ
         JTeuqNbh1IByDQ+Q1UNz/ybvtxIb2eDwosslCKid4TiMovXwwIf892ieZ1TE1JJmEi/6
         kKYe+O7MSm7g5gtthU8VR73eyds/LIO5yOyknZsBC7CppSQQk4+unanSFTH09tlEqwTQ
         5Y4w==
X-Gm-Message-State: AOJu0YzKNWZN2b822Lbso6JPwhSnq2DrIhKET/+ogsuKINlsAQ8M52Ym
	HzprsqAaeH1KV3zK8wo2fCSKZEMBg/2kyoxl6uBPxvwp4XbDLMSi51jV
X-Gm-Gg: AeBDiesgMQZuFVbxXFyOCMaJ6pM9KsK5r2GKmyqrfgHsXjmNAopNTchLrFeXfqAFynv
	+LN6T7qOtrWn3qGi07OdYr7R2s/Uaog5WJSM5JD5cRzW6bVn3SwiC5xLdgoHzhS9E9fkw+VAKyn
	RlSTm8aoltLViVA6gehkWJyWyhGyoE37IcniDbrJokfwmcaOfE6Z/dXcyBAG/Wjjo3J5KZxydkp
	WIQEomUXtExtW17u/qGkwGY92TdNbz5Oe4zFig83lIUalJxBHMLi0OjqcfvnWHSvq6ftpzEeJ1W
	plROzhx+Hx+A0+n/43QxXePsDNveynSoVC5Seng1WBKVMbnv/YYx1j4JEJHzj8rNzSFwby02uL1
	R/EoixBjc1V8SHu8cBq85hycXYIrQTqxXKPKFxC/0xKESVx+PpJr7FFpYcfdDM3C6gNb8rBx92X
	QDtBQ20F+EdAhXqjI7Vw0IQDVBkxV5jUF7kLGMy8YCvaSqKeRAy346ZFgXPqnVr7AG2AWla40XP
	Y/rqe9WBZvSlGFh9PUGnw==
X-Received: by 2002:a05:693c:2c92:b0:2df:7b88:a1b0 with SMTP id 5a478bee46e88-2df7b88a90cmr1341945eec.27.1776314943264;
        Wed, 15 Apr 2026 21:49:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb84673sm5905125eec.19.2026.04.15.21.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 21:49:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <49e4ae2a-85a0-44c9-99e6-dc38d5cd60cf@roeck-us.net>
Date: Wed, 15 Apr 2026 21:49:01 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (pmbus/max20830) add driver for max20830
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
 "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <20260414-dev_max20830-v1-2-210d3f82c571@analog.com>
 <20260414045647.4AACCC19425@smtp.kernel.org>
 <69f893bd-bb38-439c-b7e3-30d17c6b8cd3@roeck-us.net>
 <PH0PR03MB635179B8E59E60DB994415A7F1222@PH0PR03MB6351.namprd03.prod.outlook.com>
 <e4a4c2a6-e757-49f8-8fbc-215a74c7a9b5@roeck-us.net>
 <PH0PR03MB6351026955AFF2D037BF0266F1232@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <PH0PR03MB6351026955AFF2D037BF0266F1232@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/26 20:04, Torreno, Alexis Czezar wrote:
>>>
>>> I may need to keep i2c_smbus_read_i2c_block_data. I'm testing this on
>>> an rpi4 and it seems i2c_smbus_read_block_data isn't supported by the
>> adapter.
>>>
>>
>> Odd. I can see that the bcm2835 controller driver sets
>> I2C_FUNC_SMBUS_EMUL but not I2C_FUNC_SMBUS_BLOCK_DATA. That
>> makes me wonder if the controller really does not support block reads. Any
>> chance you can try setting that flag in ./drivers/i2c/busses/i2c-bcm2835.c and
>> see what happens ?
>>
> 
> I tried using i2c_smbus_read_block_data, and here's some log messages
> 
> [ 6857.261998] max20830: adapter does NOT support I2C_FUNC_SMBUS_BLOCK_DATA
> [ 6857.262006] max20830: adapter supports I2C_FUNC_SMBUS_READ_I2C_BLOCK
> [ 6857.265228] max20830: i2c_block_data read 32 bytes: '        MAX20830'
> [ 6857.265648] max20830: smbus_block_data read 9 bytes: ''
> 
> i2c_smbus_read_i2c_block_data returns 32 for 32 bytes read
> and the buffer content is expected "MAX20830"
> 
> i2c_smbus_read_block_data returned 9 so I think it read the payload length of 1byte
> but no data beyond it, hence buffer = ''
> 

Ok, worth a try. The "correct" fix would be to implement support for the command
in the I2C controller driver, but that would be too much to ask for.

Ok to use i2c_smbus_read_i2c_block_data, but please add a comment describing
the reason, i.e., that this is to support drivers/controllers which don't support
i2c_smbus_read_block_data(). Also, please implement code to address the
differences: The first returned byte is the real length, so please check that.
Also, please fix the "Unsupported device" log to not print the first byte.

Thanks,
Guenter

