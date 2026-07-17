Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECCE42A177
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Jul 2026 16:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784305102; cv=none; b=h9jMkV/n+B93I+anPgmf9PNwL8q5pPMRw60o7Co6P/JTOdze3HuTPBDXo+CThmLGaZPrlsFQTOMm1RjDzleMS8CMGjZqZ88GMR1le9pvzhDDc4cXB1uIahkNd3mfq+Vc+NLULPc00jxpfU6W+GDlVP5N5ASl8y4vkTgOT9L+7/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784305102; c=relaxed/simple;
	bh=G3x2VdokuHvBJc49gsxXQXd0jFRrhnGePeW2+neHjKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zud6Xqb9HmpAgnxvgekZShi+q1u41sySx8vujH9eCHFQ5vyloePp6griJys5S98k4/eh2yjc1EJG/2G3XRvhSAmtU0oPog2Sz+tzLEvkn+RMbCJxKrEMxkQ9gT6AvlcnmcibLRANA8nCJ3ASkqqQkcfGanwTloplI1IyNyL3CII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEGRPMVK; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEGRPMVK"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c95d0a54ea5so5924451a12.0
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Jul 2026 09:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784305097; x=1784909897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxMWRdvUmb0mmdTxwk8GeSFra3jKTq+lcoNtfaRrK1Q=;
        b=gEGRPMVKMGOKoNyUhnzrpAFIrlKXohEJ+qeTMeNomMGv1+3JagYlMB8FIaBrj9MJpn
         iV6x3dpFVc3l93Lojrm4ClkMhrvVGDDIQcNosohSWeozUuDXlGfCySboxcV5jRFKED3b
         gjd9yjjPoHwgu9t+vmySp+W5H5p31esHGv9GqJA+ZYvfRJN/nzJ1jIytz4Waefbc+HKN
         eoGMW+nJqUNEwN4eSB0nyrIYCZN4JCF6PZ32UGHk0J62FmAhSJKSZ93Q6b8rUF2m6eqO
         c8NnGgCfcYwPcJ0KaYuv/8grnkLXaNFCDZBv04pjgESFHA2exZDPXluLU6vFL4fuNcMR
         y3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784305097; x=1784909897;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XxMWRdvUmb0mmdTxwk8GeSFra3jKTq+lcoNtfaRrK1Q=;
        b=gZ4qZPdgtyxPnAygt8YV9bDP18KzPVu5c+XQoMXOCZZkLdMgIDV+teRLEmLGYkwQmd
         KYD+C3oasNHinx3ihGq+H5XDe/KJQwJsmKiLpEiV4DIv7yshZsEdaSzIDqt1AhGP0yf7
         MMi19oLgRfX4hFlQ048IHqsxUz1JEor825zGlOf0upGKZiy60hWffJqpe9mZB8oBTVgA
         ONLhCbctGM7E5CSzCQAq+p+1gmVdgJGJGbT1Wb10Wtk7VNj0sDLmOc80nXv7nh6d2cLb
         GkNvn1LhbpujOHFqzSImx59p4yf/0HghUxREkzZ8bEQfFC/PmJPNYjsqY4oOyvnXK2B2
         CqSQ==
X-Gm-Message-State: AOJu0YxGxGfsWHiJ32HorSBv/cLvONWQwe8epgXNBuvd+DOZQohfNmFf
	BWwpS8HdzU6283y7igGWVByZMOSOXJOxykWACqlRg/RPJD1x6ZBfoDzvjoJeDA==
X-Gm-Gg: AfdE7cmytH0xT0Kk1HKZ7jw6IHjUTDPRsjbv+RGsSmlECXkb55UWfQaYH0UFtWI2ImH
	umS+rTTDmovioSVurRsT01Mkrypz25rIjeZQD4Mzstih+hNfQRU+Bn89g+TzXb35kzGxZqcSRly
	AIDDoLneRKhvFCt6H+f/hgS55mcCbdSUfxJnY5KsQjs8i9Nh3+2c846YlrK6G0T1V0UQP88eeHw
	eIyyV1kSaNWuCH5PXJAoIYeOfHF1fzR+XL4Tio/EYnqJdJU7l15lYf5Rb3jF24RUMYjdiJ5ZQxX
	n4n/KMsjQ/Qv7OSrMGLmWweDblfoDsQfPAWC83Kb9zq6R2VD4GwEiA26V5aB07+hVSYy1z4/0Jv
	r5GdXhYugWXNexHOzM6HxfvTaFlevZEemi+NmEAv8N3nEQupKd3jPf3rpppWBSPUbHgm5IlUOru
	5OAvDQgzDLwrf7rTkhy3Mq1lSdt7c2ywDGv78lGcIrpRCW15A+Jo0=
X-Received: by 2002:a17:90b:544f:b0:38e:dc4:3fbb with SMTP id 98e67ed59e1d1-38e4b5b7637mr3573892a91.43.1784305096635;
        Fri, 17 Jul 2026 09:18:16 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d439sm10443094eec.5.2026.07.17.09.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 09:18:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <53517e5d-8fba-4f20-910b-999e1a048b6b@roeck-us.net>
Date: Fri, 17 Jul 2026 09:18:14 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (lm90) Switch channel parsing to fwnode APIs
To: Flaviu Nistor <flaviu.nistor@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260717070614.6492-1-flaviu.nistor@gmail.com>
 <20260717080027.8370-1-flaviu.nistor@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260717080027.8370-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/17/26 01:00, Flaviu Nistor wrote:
> On Fri, 17 Jul 2026 10:06, Flaviu Nistor wrote
>> On Fri, 17 Jul 2026 09:49, sashiko-bot wrote:
>>> Thank you for your contribution! Sashiko AI review found 2 potential issue(=
>>> s) to consider:
>>>
>>> New issues:
>>> - [Low] Incompatible pointer type causing build failure
>>>
>>> Pre-existing issues:
>>> - [Critical] Sysfs read triggers NULL pointer dereference via uninitialized=
>>> hwmon_dev
>>> --
>>>
>>> --- Patch [1]: [PATCH v2] hwmon: (lm90) Switch channel parsing to fwnode AP=
>>> Is ---
>>> commit 3d5d792e5529b3545ccefc21f7dfd9c2acecc999
>>> Author: Flaviu Nistor <flaviu.nistor@gmail.com>
>>>
>>> hwmon: (lm90) Switch channel parsing to fwnode APIs
>>>    =20
>>> This commit replaces OF property handling with fwnode APIs in the probe
>>> function to read channel properties. This improves compatibility by no long=
>>> er
>>> limiting it to Device Tree.
>>>
>>> Link: https://lore.kernel.org/all/20260713190659.4511-1-flaviu.nistor@gmail=
>>> .com/
>>>
>>>> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
>>>> index 4b9c0ccdf2609..7d4b8e61bec51 100644
>>>> --- a/drivers/hwmon/lm90.c
>>>> +++ b/drivers/hwmon/lm90.c
>>> [ ... ]
>>>> @@ -2701,27 +2701,27 @@ static int lm90_probe_channel_from_dt(struct i2c_=
>>> client *client,
>>> [ ... ]
>>>> -=09err =3D of_property_read_s32(child, "temperature-offset-millicelsius"=
>>>> , &val);
>>>> +=09err =3D fwnode_property_read_u32(child, "temperature-offset-millicels=
>>> ius", &val);
>>>
>>> [Severity: Low]
>>> Will this cause a build failure or compiler warning?
>>>
>>> In lm90_probe_channel(), val is declared as an s32, but it is being passed
>>> to fwnode_property_read_u32() which expects a u32 pointer. This pointer typ=
>>> e
>>> mismatch can trigger a -Wincompatible-pointer-types error in modern builds.
>>
>> This is absolutely true and I can't understand how this got into the patch since
>> I have test is. I will send a v3 correcting s32 to u32.
>> Sorry for this!
>>
>> Best regards,
>> Flaviu
>>
> 
> I have double checked and there is no warning or error when building the driver.
> Please ignore my previews reply as v2 can be used. I had in mind something different
> and it looks like not a great morning start. I am sorry for the noise on the mailing list.
> 

So how do you expect the driver to handle negative temperature offsets ?
By silently auto-converting it to s32 and hoping that the firmware core
handles it correctly ?

Yes, I know, of_property_read_s32() maps to of_property_read_u32(), but
the API at least suggests that signed values are handled correctly.
That is not the case with fwnode_property_read_u32().

Guenter

