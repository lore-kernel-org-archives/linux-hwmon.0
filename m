Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871FD1E4119
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Sep 2024 15:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725465372; cv=none; b=T2gBgaFO8MfZ7nQhEr96cTTfqaVQTq52zhSQcWG2KjlN+ghB0ycTJL1sTITyU2Z44cuU8n718MYUwIuR+fHHljQO4ZRQt8CSVCDBjAvdFnvVk3VAF9/gIpTqoJRy8aehhKlOUaao0/HiTyqwBhxBmPhuby7USwWh59/A1VF7F6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725465372; c=relaxed/simple;
	bh=fwYk2YCG6DT8KoOFF445nqBAV32FQ79riQ+MlSChfnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hOm+KDmrxI+pLhoSpj1UZWQhOBlzb+cm33nkKTfXekRjuyh/KPdWSwSV73APr/wOPUORIg1xYPg9QNM5NM+KIsrWPTB2fezlJjBxTcsD4iNeg/u0rXi+ge5n839Qxd8pBZawbTLJcDi4irhb82D51pq/cy7EHu9b90IWE92Dcns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzDGOb7d; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzDGOb7d"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7d4f8a1626cso1237208a12.3
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Sep 2024 08:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725465370; x=1726070170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8jbflLYqIFNVmS+Wc2+II3ndaWj8OVVixWOqRqUwSwo=;
        b=FzDGOb7dDydRLGMMwwc8FPWQVsl1zNM5iqtHu8uFTEkGE9/Xo94huvxKvixn0i5W8U
         wD+dUWHKEaJ/plcj0JlMkkiE3882c+N41jHH3BY/wkNkQQ8ETum4Y3nHwLbBWRAX5BCR
         xPvuKQ62au0KwMDDtdLmiQM4dNhGpriO8HAS1YaTVwLNfqtFPZLnb/E/ztGEGYMLE78C
         iYW89aV5MRFaSjaJFz5g9xOJSVSCDvMzHjsMq8uP48TyA0heNUWwDsDIiakR6y/sVqB3
         Ff3Fi7gyoSYKh6byOFbdPJWtKl3BmX20BaITB5dsgRCBHu0iNxz15Z6PeaIlph8NJQIm
         Yywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725465370; x=1726070170;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jbflLYqIFNVmS+Wc2+II3ndaWj8OVVixWOqRqUwSwo=;
        b=DxuzjoLHE7DhiMp8TOw2mNvTv7OIVH9480xuOit4FYNr9hrQcutIMNv9Tzl4JiektE
         +k4GAjOsja9Muw97kXKjcayCRNPnPiDYCqITLHv2KnMbulHdBXPNvUfinPDGA174b0oP
         9cs3qfLIUosdqNDV1ZbEOHHmTC2wnOQhFTqFvP30CVyP35pyabi4uUMY404biHRCIv30
         ppD69KKzRmv/nFa1qgVoavuv5/1KHIvZYFwgbcMqDxz5P2ftqeHSXRvUPm9zuSiLgNq2
         m3g/h1pgYThdwyJcwbFf+rCkldzgARYK4EGXLd344+TyiT7nJDzquU5ox58wBYekbz17
         3BbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqpVia+YqbU4/PaF7GbrbgMpl91Fmbw2QcI3ZjdbYaUsypcdkVTG8gSLr/A9OVL87BTUhGd4wNoargjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwfJTiRXPLUksU/T+fMvkDZoOpf23+6PTqLG9St8WvO56RLo4S
	VlWdhXdUq2vurleLZB1O1RbpBbiZN84eq2L0S2Qr6AD4ftDHeSlteiU/RQ==
X-Google-Smtp-Source: AGHT+IEwAsTk26SmfO6S+C9XK2KeCblrovr7srtVkGV5Wcjodu3q2nInzY957KXKTLHErqL1tMeddw==
X-Received: by 2002:a17:90b:196:b0:2d8:6e9c:a765 with SMTP id 98e67ed59e1d1-2d88d4d6832mr17901755a91.0.1725465369671;
        Wed, 04 Sep 2024 08:56:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2da8497d5e6sm2082944a91.52.2024.09.04.08.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 08:56:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7e3cb7af-384a-4004-a96a-a59c1d7a0c2c@roeck-us.net>
Date: Wed, 4 Sep 2024 08:56:07 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding write-back operation to STATUS register
To: Patryk <pbiel7@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <CA+DkFDb--ow-Nc35bDh2Nmrf23B2wsrWW82uAQmu9U3_O4r0XQ@mail.gmail.com>
 <97098eef-880d-483c-a6c7-1aa0e46b7c42@roeck-us.net>
 <CA+DkFDaaqvBDdC-tikGotyKDx+KheRrhaCYatfpMdzReNsHyUQ@mail.gmail.com>
 <9724dc83-8bdc-4b93-ad14-bb561805909d@roeck-us.net>
 <CA+DkFDY5r4cNS86W6oGAg_g8GJunLRO455hnpTQG9A42t6Mn0g@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CA+DkFDY5r4cNS86W6oGAg_g8GJunLRO455hnpTQG9A42t6Mn0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/24 08:24, Patryk wrote:
[ ... ]
>  >>> We'll need to add some code to detect that condition and
>  >>> refrain from clearing the status register if the chip doesn't support
>  >>> writes (or maybe ignore errors from the clear operation). Ignoring the
>  >>> error might be the easiest fix.
>  >>
>  >> I will apply this fix to our codebase then, unless I come up with a better idea.
>  >>
>  >
>  > If yyou don't mind and have the time, it would be great if you can send a
>  > patch to be applied to the upstream kernel. If not, please let me know and
>  > I'll write one myself.
>  >
>  > Thanks,
>  > Guenter
>  >
> 
> Sure, I'll send a patch.
> 

Thanks. Additional background: The ability to clear status registers was
added with PMBus version 1.2, so it is not surprising that older chips
don't support it. The best fix would probably be to read the revision
register and use its content to decide if the individual status register
should be cleared or if the clear_faults command should be executed.
Something like

struct pmbus_data {
	...
	u8 revision;
	...
};

In pmbus.h:
	#define PMBUS_REV_10	0x00
	#define PMBUS_REV_11	0x11
	#define PMBUS_REV_12	0x22
	#definw PMBUS_REV_13	0x33

In pmbus_init_common():

	ret = i2c_smbus_read_byte_data(client, PMBUS_REVISION);
	if (!ret)
		data->revision = ret;

In pmbus_show_boolean():

	if (regval) {
		if (data->revision >= PMBUS_REV_12)
	                ret = _pmbus_write_byte_data(client, page, reg, regval);
		else
			ret = pmbus_clear_fault_page(client, page);

                 if (ret)
                         goto unlock;
         }

Thanks,
Guenter

