Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0475A4D5
	for <linux-hwmon@vger.kernel.org>; Sat, 19 Apr 2025 22:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102984; cv=none; b=lgUZkeFwkeJ8caJAnqI3XBf4jmMNTMxt+OfllrxH4G5q+NRkJYc65gHQON65h/gbNjym9O7NPnvequy60chAUintjxTTYNuTzyFe1BCHRpp8/LD6ED/Ru4Wi3jkQcog6h12p09JbtFYNbAg2gkMuPn+ZYrUaeXBIaeo/qxchEss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102984; c=relaxed/simple;
	bh=74IexXGtm4++yyIlsnazgjVz5Nbvk6b0x5ILfuxYmjE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HmireNxFWLa4p68IDSDAH6M17JPTz8aLy0FW6jg/sQ0jHBgem7prpTmAIH0Y06M2rJmuuBLnT5iSxukedF9tidumuhh7TezjouLriW7kvEq0DSrO9EQt/fdKwv2fktRWsGcpAFn3VUnp6PuaANRK1ojT5RgU2z9dNO0EzrFXfUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZKQj3Df; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZKQj3Df"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7370a2d1981so2373454b3a.2
        for <linux-hwmon@vger.kernel.org>; Sat, 19 Apr 2025 15:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745102981; x=1745707781; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=498/1VYWrb+d+KWOrjLGCZuYFZ6ojx6MH4Vm5Lb7dBo=;
        b=CZKQj3DfmQ5PD+KXob7htf2YV4haD1BYiVCsIZfU+c6zhO2IR8j158f2R4qRhRePrd
         jtestrlApPzMFZ+VYqO/NEvib/UMD1aB7e3JSeuP9zpzqgaPPwYGIutDcIczeCFF/II4
         TASPVardVEkJWQhol8FZpBEnNrH/aK/kfNB8OzgQzrG8k3jOxXFqQiXYg978oruczD9O
         D6iJS9NfKDoySF0peIDFcBDfWVVOjLqwGfQNk3yhtrM+U8bXbR+zDFKSj0mGE2VRsIQ3
         AvZ43rZJO5uQtRkTejMeQ6RVq0AoxzfPKdjEI/RwkI0OFrDoUWBbw4/6g6aBnkWdP8ac
         U/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102981; x=1745707781;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=498/1VYWrb+d+KWOrjLGCZuYFZ6ojx6MH4Vm5Lb7dBo=;
        b=LmbLa6yp7bWJIPICsaiKe6zIsJK1qEXMZ8sUXihfH49x6uu7fNfN1BTTixswZhxL0s
         SQynTii96NQKEdyAJQVxeWRmzOk4hjTgqUYm9ibpHRoHcuFhMkj6sDXiTEvBt2NZGMqx
         PEfGLTEw3Rb2QxHdtuTwXs4sLXMTTnwd7Pl42uNPGuWDOlkpxCXOCTeJUnhrdLgBEXiJ
         iQXau4swGr6ounsT9A4UZ1OkxsKdV/BUAnMbzQBY8HaYG3Aw6hUz+eQyFI9aBGdW2VeR
         9KUULjmfk6w3UgGRP+OnlFT8Vc9AO/BKm7vqQGoSTd+cJ4T/wuoTpuxRIAfN+k9HQIB1
         Lv8A==
X-Gm-Message-State: AOJu0YyWZHvOiUwfuEYGFmFwlpGlNH6/Q61RYS0oqZXw2JScp/e+Y7N/
	WhIraUmPXGZu5WTc0PNEV+yF9cdi/X/RRkTzWX6LLLc+y/ZkkxQwS7O2CA==
X-Gm-Gg: ASbGncsekQ+rucWf7ueH7VCvk7DiIJHyVbO0B7U/pKE+kN4XkL/Dz7VIQnJtNUjkZsv
	/oDIgcpcsqTpNEZ6HqkEdmPgxInI7KBj9qvY0h0O0+dCrOZ4PIIFaCOhSfkd7IvydtCO5ucBzZn
	JxkUW/d3wW5sfYpCrphGA4D6bl/mZnLJxZrRl5ORfPzFZbwqUafWYiEgpvRtUllGsASVnyQclgB
	5+zmj6GrjMbvz6yEL4B3QoKSObOOQM26ZeG+QLLE+If/dCUTJjvRbanUmBlhfNhFHQaNYLToicl
	4acN800J0v8SqqordXPMRv4bYEzCX+zm3UrDf3r0T7svCjHhenpISSzlNmfLY7RjhwjdGkcRIh4
	WqT4WiGWSNN5zGQ==
X-Google-Smtp-Source: AGHT+IFx7zP/MgNp0t8gTFjDMYofaRMMLTv1sVZJ7JRxJuWF7wtIhXMHdLBQ59fKN4LHiBKYu9mSeA==
X-Received: by 2002:a05:6a00:9281:b0:736:9f20:a175 with SMTP id d2e1a72fcca58-73dc1442ee6mr9796450b3a.2.1745102981515;
        Sat, 19 Apr 2025 15:49:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e42c0sm3829922b3a.71.2025.04.19.15.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Apr 2025 15:49:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <284466fd-39e8-419e-8af5-41dbabb788af@roeck-us.net>
Date: Sat, 19 Apr 2025 15:49:40 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PMBus memory overflow
From: Guenter Roeck <linux@roeck-us.net>
To: Matt Corallo <yalbrymrb@mattcorallo.com>
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
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <eb5796e8-de76-4e91-9192-65b9af7a4d49@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/19/25 15:38, Guenter Roeck wrote:
> On 4/19/25 12:29, Matt Corallo wrote:
> 
>> Hmm, doesn't seem to trigger it at least with pmbus_peek.c, the following diff still doesn't hit the too big prints:
>>
> 
> Only idea I have at this point is to either enable smbus tracing in the kernel
> or (better) to add test code into i2c_smbus_read_block_data() to see what
> exactly triggers the problem.
> 

You could try this:

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index e73afbefe222..b2856f88431d 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -233,6 +233,9 @@ s32 i2c_smbus_read_block_data(const struct i2c_client *client, u8 command,
         if (status)
                 return status;

+       if (data.block[0] > I2C_SMBUS_BLOCK_MAX)
+               return -E2BIG;
+
         memcpy(values, &data.block[1], data.block[0]);
         return data.block[0];

and maybe temporarily dump the entire buffer if that is seen.

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index e73afbefe222..3dcb8b6b2427 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -233,6 +233,12 @@ s32 i2c_smbus_read_block_data(const struct i2c_client *client, u8 command,
         if (status)
                 return status;

+       if (data.block[0] > I2C_SMBUS_BLOCK_MAX) {
+               print_hex_dump_bytes("Bad SMBus block data: ", DUMP_PREFIX_NONE,
+                                    data.block, I2C_SMBUS_BLOCK_MAX);
+               return -E2BIG;
+       }
+
         memcpy(values, &data.block[1], data.block[0]);
         return data.block[0];
  }

If that doesn't trigger I am going to be really puzzled.

Guenter

