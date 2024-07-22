Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D274437
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2024 03:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721620137; cv=none; b=qvKRu/oJrFl7VaybxKryfbn+BVXJoP+srcUDVVqqlsEh3UmB5acdHcM0FSpIKtG2aNQS/BP0jXxryowJX+sSvb0NhdvjsMBC54rlg6HiM6lBrMEfpIYbwTuameuZzNDuojeD8pRaN4Wikdtc1Hifla63WzF9oOBsHVrLz6D7Ejs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721620137; c=relaxed/simple;
	bh=EgwYcWp7mxyRc8NAyZOtPlusHE5vPj40sNG2QqqIgJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KicSmue7Lh0G9O1Sq4Q06oqcu7DVEGE/2L0cvG/9W2jZQz9Rc97HFR9R6xYRpJccSF9YAiy2QlOr6yevp6k5CaURKyCuHykuQzfUm148B/hMzgsRBhZoRDCt/ZLkkNEJT6CIp1rH7ogPBrUK4BdwiFOIVNFpYPCnN2uzfsY5+EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+/xaf6+; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+/xaf6+"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dfe43dca3bfso3507660276.0
        for <linux-hwmon@vger.kernel.org>; Sun, 21 Jul 2024 20:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721620133; x=1722224933; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Gy+wk+TxCWG5bEvlwqM7Tn+7XkxrUNUaytggeXNcCzQ=;
        b=Z+/xaf6+Q2Kze8KCx7OCMivZeQuqvB4cCo2BqKNhs3P6OnsSCwP2MbcF1OuiY226Pv
         f/pu+HLVKNTtWV4BQz5XPxmFmA6GcTvE2JmaZjhT95TVpw8SW+bgavBlWaUggOXukJtO
         RGwrPHKXL0prUV1822oI+mn6B9mk6RyEfkPCianlm9AzXSBqwpZrbgIWGEhHqL/zo6Uk
         ViSaRntKnnCgO+8M4TnE1jwld1XWyCErklOJu15+Mkn4XAcZA19TCzDzOyYIcn7lLtyo
         LTa6X6yHhvvwXXQ8E0ydqb/sxigBKqtZXsj5+rjLWl5AivvxwbIeVEFj9EYBrc9wH+Sm
         rF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721620133; x=1722224933;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gy+wk+TxCWG5bEvlwqM7Tn+7XkxrUNUaytggeXNcCzQ=;
        b=XCNUb1NmXFeBvT/FgDyuQ6psCFDE9idsMhOaCeM0I5TWwTdTAC9jVjuS9V7mDftPBX
         0AbUBg3TPdUlyxPyBhXHWByKjbss65WZIw+8fJg3burtkOO3M8GnThiEjmDih+To0NkT
         NvQv5YHOqXzWmANEePV/1cCnT+VYUAmfr1EwAWKsxQYp3kP8pEcR00rGrwrekru1ZY/s
         MvqFOoT2x7tnVqbEsCxUw8UzCfTPyy8/hUDOCUrQBgI6ZCU++zozy6DFe0JYJzd3GN2B
         x8y0bO2JJvXHhMLaNQaQx5hbltEr4KUvGTzwzSFjQ4mogTR6zh8bNBWqruo4K4KpKu4Z
         qzuw==
X-Gm-Message-State: AOJu0YzhWDWiIAYblxceRTYkwGkSKTeQ1jWlSY8OIH+YawL7OOIGjc3k
	3WLNgroG7OD2sUN/RiCCJg66GgcRXSwIU7+T7lIpakM5awtFE05gGcagLg==
X-Google-Smtp-Source: AGHT+IECNWI2mVbNnsgT7kOxU1+5UOUZ/8Y8g26Tm5AZPmipALbtpA/NTQVB1uhlWcaEmtjAs9AIXA==
X-Received: by 2002:a05:6902:d48:b0:e06:6e0c:5dc with SMTP id 3f1490d57ef6-e0870074c17mr4700708276.17.1721620133343;
        Sun, 21 Jul 2024 20:48:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-79f0e8b235esm3210747a12.70.2024.07.21.20.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jul 2024 20:48:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3335085f-7ab5-436f-b358-f53a3763b63b@roeck-us.net>
Date: Sun, 21 Jul 2024 20:48:51 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (max16065) Fix alarm attributes
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240721193506.2330006-1-linux@roeck-us.net>
 <20240721193506.2330006-2-linux@roeck-us.net> <Zp3ScBZOJQixuFN9@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Zp3ScBZOJQixuFN9@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/24 20:30, Tzung-Bi Shih wrote:
> On Sun, Jul 21, 2024 at 12:35:06PM -0700, Guenter Roeck wrote:
>> Chips reporting overcurrent alarms report it in the second alarm register.
> 
> I can't understand the sentence.  Not sure whether it needs to be rephrased or
> not.  s/overcurrent/overvoltage/.
> 

No, it is over-current. Not all chips support current measurements.
Those who do support it also support reporting over-current alarms.
Over-current alarms are reported in the second alarm register.

Do you have a suggestion for better wording ?

Thanks,
Guenter

>> That means the second alarm register has to be read, even if the chip only
>> supports 8 or fewer ADC channels.
>>
>> MAX16067 and MAX16068 report undervoltage and overvoltage alarms in
>> separate registers. Fold register contents together to report both with
>> the existing alarm attribute. This requires actually storing the chip type
>> in struct max16065_data. Rename the variable 'chip' to match the variable
>> name used in the probe function.
>>
>> Fixes: f5bae2642e3d ("hwmon: Driver for MAX16065 System Manager and compatibles")
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

