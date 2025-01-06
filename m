Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301141DF242
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jan 2025 16:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736180449; cv=none; b=YHmpRJBCOVriXjlVShLoe/wRH4sOWqyZWENXmblGtkvhA1Ei39X7Tr7GxPCbZpslwzJ+dw134Cbx/ZLCBi5mkjga3VwXbdmxIDUX8nslLd+a6QC9OxIgQR2DMm9M2W1pdXef+ytmFg3mA8NGCQk4EhDHVC7yrWjwfu2BSbZ66tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736180449; c=relaxed/simple;
	bh=m/RN2MkA8Xh321ZVfvj911pkCc6JaHs+UsgrKSZbu3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FimlIJH6wxSUQP+1GVhOT91rAagdcD22CG8T4yziqeRzLYrPDOtFz8sc28kSVr1fOMed/t8jxA27hg14Ob8dtjGPSNZxlfYDWc9I437bsNczdus66rK5wXh2mCUJcKs95mR3dktKkf/0g9hps4Vb9cw+36188c3eMdPn9AwCWaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGUInN0N; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGUInN0N"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21644aca3a0so27882375ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jan 2025 08:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736180447; x=1736785247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iW0Fax7nAjzO8YLFntDH+C4GWJqP2XxYjHbhg/9K4C4=;
        b=iGUInN0NagEEe6WFvcScsjIeUh9GHSB5PgorXL11Zb/8V/AfF0F06IRL3b+mvgR+SF
         GACYFXDVGMbtoxuD/lSi46yXRNa26InylkQCbc7Ns3CgGqLcXrqcxZJyokCgZ6KDljBV
         AxDbC5qCKmcDGdtfaVfG5QN9CzAymfg2I9zYXuik0kIa0//6t972MOFfDkzaXvdtu27R
         rNNrKay8F3EUIGsEeWD0K9t0RkS0crxHCEd1+PNO/zEWNxB3DTqd3zg7b6X/zgxGxgNx
         Ru50x7rqpv9b0BDkSvVh1H8Vr3yKfBqZMxBp6W0jv5an5TI1gAb8G5RhS6GHhN7/KUP8
         fSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736180447; x=1736785247;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iW0Fax7nAjzO8YLFntDH+C4GWJqP2XxYjHbhg/9K4C4=;
        b=sYi6ZNHLH6neO4Y59rQp3jhOpqFg/EIWkfDCCblwKeWWabAxnRR/vHXm2B3V7bFKwd
         U7sumSzqk4ui3YGpDScgcOmahoIffV4vP2poQ5nEgIHZ5zDO8YW+AZQ7g9UNhYtUNs9u
         eYknIdlgEXoq6rJZV9X/LZgNw9//efZS2di0Y2Ltnh03KcuQyxpTXK+KXiQeNKeQ36vO
         3J07diGxKIpjCYslCZUK3WytPtA8pLoTY5TJiq8RTnahafwWKb8qcx9R3Gqnxo8Wqf2E
         KmAVWKb8ePiOfM1KuK7HLESegBYfQm0am/RAp5bgq3igvC6FjB5dbsl/5wlVrHd31Lt1
         nPvw==
X-Forwarded-Encrypted: i=1; AJvYcCVXJzZM77oDwQoVykGAIcLOWVmPxxrRhpMMTyGJdITWY2gbcr/dCnbLwYXTsxAlVGa0HribbJJtPeyNig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgeaKAO+piAUu6KQ5ulB+R+8RORss+mbN9Xa27Xs7KUNAdZJpg
	7HdhD15XOvzwM6JxTP3VWYCKqOlxDWqszSebZzmgYxg9b5qtnkjRcQ/TTA==
X-Gm-Gg: ASbGncvKX6ednNdn8zlBOUB37HFhZPynw8su6rXn61MdrkCDcK+L/EGpw2Ox0ypwbXK
	A+eFC1T44OWeN2gkjgAHEol7Md6VN0nXQowYNW10a3XjbCn/7z54OKRtGxLuHQW2iiZ1pxvYc6p
	bx2cYszsCMAqtC1z+pCHCaz+o3w+xVlemTGDGShgR7cxrItQMIcF+NIWMxMMzsZmkn8eF03VRkv
	/u3fTmrL5c4Q5gwpmiPtjpUnZ9dRbzr0iKzcupmBr8O/Nw2ZLMl+IVvyW3sluRSFnUyXETI6qRK
	8DfkvTzt5FdnffiOGwOGaXf0tYEuNw==
X-Google-Smtp-Source: AGHT+IF8MCqoeZK0P8tXXhROx7PolnXlEk86OD/ew5CxDG+3qFZccgVjhLzVyJH2+UyXT4VtsRD0WQ==
X-Received: by 2002:a17:903:320a:b0:216:6901:d599 with SMTP id d9443c01a7336-219e6e9e86emr895942195ad.13.1736180447328;
        Mon, 06 Jan 2025 08:20:47 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca0194bsm295842505ad.248.2025.01.06.08.20.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 08:20:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3c830a7a-6c2d-42d8-b5ee-739330bc9c06@roeck-us.net>
Date: Mon, 6 Jan 2025 08:20:45 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] hwmon: Add RAA229621 for renesas spec
To: =?UTF-8?B?Q2hpYW5nQnJpYW4g5rGf5rOz57e7IFRBTw==?=
 <chiang.brian@inventec.com>, linux-hwmon@vger.kernel.org
References: <CAJCfHmXcrr_si4HLLCrXskuZ4aYmqAh0SFXNSkeL78d2qX2Qcg@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAJCfHmXcrr_si4HLLCrXskuZ4aYmqAh0SFXNSkeL78d2qX2Qcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/25/24 01:33, ChiangBrian 江泳緻 TAO wrote:
> From: Brian Chiang<chiang.brian@inventec.com>
> 
> According to the RAA229621 datasheet, add support for reading.
> 

Please read and follow Documentation/process/submitting-patches.rst,
"The canonical patch format".

Neither subject nor description meet the requirements listed in that
document. Subject should be something like "hwmon: (pmbus/isl68137)
Add support for RAA229621", and the description should be something like

  RAA229621 is a <describe chip here>.
  Add support for it to the isl68137 driver.

> Signed-off-by: Brian Chiang<chiang.brian@inventec.com>
> --- This modification is added RAA229621 chip to isl68137 list ---
> drivers/hwmon/pmbus/isl68137.c        | 9 +
> 1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
> index 2af921039309..43e860d95280 100644
> --- a/drivers/hwmon/pmbus/isl68137.c
> +++ b/drivers/hwmon/pmbus/isl68137.c
> @@ -63,6 +63,7 @@ enum chips {
>          raa228228,
>          raa229001,
>          raa229004,
> +       raa229621,
>   };
> 
>   enum variants {
> @@ -72,6 +73,7 @@ enum variants {
>          raa_dmpvr2_2rail_nontc,
>          raa_dmpvr2_3rail,
>          raa_dmpvr2_hv,
> +       raa_dmpvr2_hvt,
>   };
> 
>   struct isl68137_channel {
> @@ -412,6 +414,12 @@ static int isl68137_probe(struct i2c_client *client)
>                  info->read_word_data = raa_dmpvr2_read_word_data;
>                  info->write_word_data = raa_dmpvr2_write_word_data;
>                  break;
> +       case raa_dmpvr2_hvt:
> +               info->pages = 2;
> +               info->func[0] &= ~PMBUS_HAVE_TEMP3;
> +               info->func[1] &= ~PMBUS_HAVE_TEMP3;
> +               info->read_word_data = raa_dmpvr2_read_word_data;

I don't have a datasheet, but it seems unlikely that the write
command does not need an override. Also, it is somewhat unlikely
that m/R do not need to be set if the chip is indeed similar to
raa_dmpvr2_hv.

Otherwise, please explain why the existing raa_dmpvr2_2rail_nontc
variant would not work.

> +               break;
>          default:
>                  return -ENODEV;
>          }
> @@ -465,6 +473,7 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
>          {"raa228228", raa_dmpvr2_2rail_nontc},
>          {"raa229001", raa_dmpvr2_2rail},
>          {"raa229004", raa_dmpvr2_2rail},
> +       {"raa229621", raa_dmpvr2_hvt},
>          {}
>   };
> 

