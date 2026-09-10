Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4635947FE
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 19:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066818; cv=none; b=QSvu812xV2bdzj36LUwgWcMouBQWTB7W3hmxA6U4KR1xBDtEUY0SVsN3EWFv8cDO2Df9r7LdaoulF75D+VdhXqVAKASDzDWU39HkdQOBtKvimxxgj+MlVzdeh8R1bMO3S8j1pKg2rs61dFbJIXVhugDhJGuc++DZ5P+jpryi/Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066818; c=relaxed/simple;
	bh=XsWWzJ3IPV9YHVEnX8wdPH+IKbTWzfHSnvzKc+j31FA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bFA28RlF9rGn7n/xHoILAlEY6wxVyFf0zj32kmxmFAXSvJfTvzCZ3egyaelTj4X095JfGMO8/JdiSZcsHWnvbNHPNjMXvf6WUELNlD6OXTt15A7TKhS3xypZCFRLWPBhhfI/KTNN361J0LvP0VTu6Iac80Jx3xtJoI41Sm8hcIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=POlXFFrj; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POlXFFrj"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc147d86bebso196544a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 12:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789066816; x=1789671616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MbRV6E8Gg+PMhfe4AgURv+79xV19fYMyihA7ZKo+a9I=;
        b=POlXFFrjixHIGR6Bu/9r5WMFTFPOetGjD34RXwPeQ2LF4kQfEwm+jO25U2R2u4w5Ar
         V1KO7N8D3QiuQLGHfchfEyIDsU/5F32zi8sbcw4XbmbNU6MRyz1/qcV4MB4/+IW1VGp3
         yZ6B2SXnbQYHml1xW+57PO088dFqe4qSlugN5m7WRBzZIXByQCBUufEjraxGtB2qV9lD
         uOENiPs09V5apLvJlmCX8RnXghY1UqPf2jZSVeYJ0kYlPKV3z8NK5qKUlr6ua0vk1804
         vDQ95PRxvWtLG6S/IHJQXH23S9aTUbFMXfv1VSCxYvRXePwQo7lGHEQbsMfWHsnMmhin
         zw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066816; x=1789671616;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MbRV6E8Gg+PMhfe4AgURv+79xV19fYMyihA7ZKo+a9I=;
        b=IgR/cir7aLKFDK1LrM7iu0d/sgjhdTH87SJO1wmFEAAs8lSIPX5iv9X2t2++fcqjxl
         5xi7q1SsoIBJP8gol6eA3speq5kW1rY3HouNZxPXogtPjlYfb5sCWrkhsLpTJ3WCB/Xc
         Vxs270VgSTy9A2zJwoLtd3euHOHbNxb0mxBWq7Uw4NQKyG2U23Q3fyVJkFWdO0zCfPtY
         4+qSMK/r/CHDrBlABzGV2UczF0jz0mK+XtTbvQUznptx/HS3k55RTng2nJslZEZZ1Rbz
         qI9UwL/I7thtOYzgIqb8XOVL54S0zVvbDKQtYFDhU6GhTrOiWe//slsLjpEhSxh42vs0
         S5lg==
X-Forwarded-Encrypted: i=1; AKwUvBxXvKvxT4R8OtYV4Rao9m3615XbiWQXYyJ024nqDOo4YJ2W6kEU/n+8Cuvjg2hLOF93BcXc5izdNTd5/A==@vger.kernel.org
X-Gm-Message-State: AFuF++myu3u+MkT6NZz/xp4RtmrTl1G2EBKrBhivC878N4XW37k7hKmZ
	a0qwkakxS9mVAmwKHWWn601yUDVFcVj1CmWepaxV3o9Pomf/rfbO08cyiRIzlsWq
X-Gm-Gg: AYBFou00nZdH60zwISpqOgaTlWs9ODvfdnd6OoL5YxWuhG18gnCwKbvvXtCoofH80Ln
	lOWKLsKB6Cd0fpt+Mx3vb1WwaUb+qLe29uwx8w0gnnyokEQZXFRz2V7I6fUW/+/EniHeWh9CCgP
	VI3vE9yjimUKtgmbWSlihBSXs3yU0vcSzS6ZQ0nQqSiJ6ErVJeVix5TlyTXTlFao0xmjRlFjlIZ
	qPfef5E0E/yxXI5dbKPNnm2+tY6wpsWVTOr6X39BZXKd2ettLAqULxXEdWT7d/eW3BNihVswxMd
	KR8haWR9D560sL0L0UT3wMBBZ/SHJaxyc90RoymjrVgA9B2ITwaF1FuqEsdHnjxhjKzLn8+ORzZ
	8yVFdcj8kYixQ1aZyiZqs44eunsM/cYHJLbesGg6SJTzl8wp+fyfpD0VluyAy8ZNRdXwKyc+we6
	gqCCNpQ/WsNnNsH0eWMyJMLPTNTTRoQ6s7CrlhMfw76rdekdzvhwtqxDotR5fja4OXNtOWRum0P
	QIbA2z0B26cxE1F6D0kuEKdQpNV0IS2GXLCC2jOctJJWKJY
X-Received: by 2002:a05:6a20:258b:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3dad26bda32mr7053932637.2.1789066815615;
        Thu, 10 Sep 2026 12:00:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6549ec0sm134989a12.15.2026.09.10.12.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 12:00:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <54a5620c-36cb-4dc1-bbd8-9647ff7cb708@roeck-us.net>
Date: Thu, 10 Sep 2026 12:00:13 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (k10temp) Fix model id range of Zen5 Turin
To: Rong Zhang <i@rong.moe>, Clemens Ladisch <clemens@ladisch.de>,
 Gabriel Ford <gabriel@gford.dev>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260911-k10temp-fix-zen5-epyc-v1-1-643f5a248ae1@rong.moe>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260911-k10temp-fix-zen5-epyc-v1-1-643f5a248ae1@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/10/26 11:39, Rong Zhang wrote:
> Model 20h-2Fh are mobile processors with single CCD. For example, model
> 24h is Strix Point, i.e., Ryzen AI 7 (PRO) (H/HX) 360/365/370.
> 
> Including mobile processors in the model id range of Zen5 Turin
> processors leads to bogus reporting:
> 
>    k10temp-pci-00c3
>    Adapter: PCI adapter
>    Tctl:         +54.1°C
>    Tccd4:       +148.6°C
>    Tccd6:       +148.4°C
>    Tccd7:       +149.1°C
>    Tccd8:       +149.2°C
>    Tccd9:       +149.2°C
>    Tccd12:      +149.1°C
>    Tccd14:       +22.0°C
>    Tccd15:       +22.0°C
>    Tccd16:       +22.0°C
> 
> Fix it by removing the said range.
> 
> Fixes: 8440d5aca227 ("hwmon: (k10temp) Add per-CCD temperature monitoring for Zen5 Turin")
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>   drivers/hwmon/k10temp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index 75a45010d687..3e7e63edc6a3 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -523,7 +523,7 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   		}
>   	} else if (boot_cpu_data.x86 == 0x1a) {
>   		switch (boot_cpu_data.x86_model) {
> -		case 0x00 ... 0x2f:	/* Zen5 Turin */
> +		case 0x00 ... 0x1f:	/* Zen5 Turin */

Doesn't that drop _all_ CCD temperature reporting for those chips ?

Guenter

>   			data->ccd_offset = 0x1F0;
>   			k10temp_get_ccd_support(data, 16);
>   			break;
> 
> ---
> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
> change-id: 7b515a4b-k10temp-fix-zen5-epyc-14334e85a3b9
> 
> Thanks,
> Rong

