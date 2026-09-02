Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78083DFC6D
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Sep 2026 18:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788373538; cv=none; b=MxhqNNcyfSziJdkdHbow+agEIweI3TIGBl8J/BjfkWLFheaOftVn872WPh4Sm0HvP8W7GdDBSE1MwDiuV1xDHrjYvR4UyJ2uI9mhWmtCjplIdNcH+kiQ7M240ZUD+dj/cZ6Fk2NC3rYaBeCTmooJYONOKRkkVQbB7YU9wFSP+aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788373538; c=relaxed/simple;
	bh=EY81+LUMRlLftcXR+yt8rdRM0g0yTbWWkgVNitXrkmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=unTPfAl3MmtExUQPMXmLFBpCN/wQxO35j9VIshu7HXggab68C1hDC2akiQ/3tFpGUeGyNuuJmbaqFHt/DzH5SvW28JCpH1O4xvFttTsEZQbYwLTThADSp5/xvWA8kXcdnffnTBZj3MHEqP0jOgCJolzkanbSumedbclPBuKR61Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n5QEvDfW; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n5QEvDfW"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1765732a91.0
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Sep 2026 11:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788373537; x=1788978337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=onIevTHm9XOi2DbVBEyKTyLxorf7340AOFc5ca8t3y0=;
        b=n5QEvDfWZbKP+TO9jZNMCU2XAUpjv+5Ung4jiDbpLTFJ30igAnwFU7ooGduFB6m0IJ
         z2ApN3VTY9SBNILWqMwM1FTh079FrEhExll3xdyKIwFfum7BVBmkqkFoR1fDWFUdGxKa
         9oXsqrEzRtOGXM1uO1JtQYQ/7FSirggOFwtBXA+P+xoiyfaTr9fcId9YspDPZTjCRrjC
         dHi0/z3c0wV9+thI1pPgk0n1tpueI7Kd1zZkdM89TNnVUICkbrsA4F5iRkNC5mSbTgTp
         NDFeKvAa35iiNEt8Xv1Jk+E8wLcasSeOSaxfkYUiHv3haXRW/Fb7uV/ZOPy2LvXzv2DE
         BWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788373537; x=1788978337;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=onIevTHm9XOi2DbVBEyKTyLxorf7340AOFc5ca8t3y0=;
        b=sRp+yyG5oDFMaDltESp51jWtpzjTYqHvAk7/qS3o+8V1vc7lyNRLvRCXsZpwWF2IAX
         xPFXxvqrW5mwWUhHvcunLWYLAigmyDtzMEiGuD6tx597faltuhQTGWdFfcQtEn/Rvqyk
         1c32EOZ3QGSCkAVenVElZrJCVXZcYte0kVJZroljobUYIghDdjBCi5nZhAsp0ktcIxQ5
         Gges1xxAN1eRLPNRiu0pPpWQe0HmB00Zh5aL8MPt0d88aDRESsa+T3dk3RKt3kHrw9Eo
         QewfDFCgzvEytoudKbbJ1f4RgWMF2z7bB1dk0aT+qhdCMWtk5AwcbIH+EUO7XAjThJrW
         Twlg==
X-Gm-Message-State: AFuF++m9kA9jGQojoSSvTSxVJBhSKQM+Zstyt2UD3FjeQFIPTWA3HCRl
	0yOCMqzwTXQBhVGy1Up0vc+fDJ/WS/LjRuQ0hHHsP0bdE48x0kTMYOMD
X-Gm-Gg: AYBFou2wVNaIvPx6bUAw26RjIPp8nFM7C26b5B+H1ZmGcieZsOeg4SbKXftNtOAE/Hq
	pPstuATfd3BGG5f19EaHKQxHLh66nocbMGNIm3HnwUsfo6s+dL3EZjNn4fvYQ0VYXwwOQOhz93v
	u7CSaZz4iS2MUA+OPgdIErRJ96LYJSGp50emEkptr/qx3alCWYoYUDCQ8tu4IZuVLoMWa+N7ir0
	aJE/KX+2ozcYQf2d96Swc67JfdvemQXl+K4zsABkOdpIPggjOff8F0Wail/urtvcKvcSwPU16Kz
	qQL7dzpv+GS3spdxMVulFOw92+78mpWN4VDac7N7nScNsHhI84ar9P8UQELW54/N27++J05GatR
	9zrCuwQjOYHlsjMt7P+YccQPEPFjhZjlSEFrtEvDJO6Qtco8vJaN6VAM9Cz90RX4D3hlRVGiRXF
	T8Tth0cvymLGWGDedVyYjOfZOk8j2XmBu78WkvAvVsAIOvosyPL1FLCrIALFsAOdhyrWuU0LxFr
	ORh9U5X5k6uqN+F4TNYbRHS/sQoYnaAWvOerQ==
X-Received: by 2002:a17:90a:c10e:b0:398:9be8:ea6a with SMTP id 98e67ed59e1d1-39aee27cbf3mr10622089a91.23.1788373537014;
        Wed, 02 Sep 2026 11:25:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacba5sm603768a91.12.2026.09.02.11.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 11:25:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <01989b5a-9997-4110-9398-6359a7343f6e@roeck-us.net>
Date: Wed, 2 Sep 2026 11:25:35 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] hwmon: (spd5118) Avoid probing when 16-bit
 addressing is enabled
To: Armin Wolf <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 ggirouard@bungeetaco.com
References: <20260901200142.495319-1-W_Armin@gmx.de>
 <20260901200142.495319-2-W_Armin@gmx.de>
 <b2174e73-79ad-4462-93d0-2e69582636b1@roeck-us.net>
 <42d55fce-65ee-49d7-9892-451a72710a63@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <42d55fce-65ee-49d7-9892-451a72710a63@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/26 09:56, Armin Wolf wrote:
> Am 02.09.26 um 01:04 schrieb Guenter Roeck:
> 
>> On Tue, Sep 01, 2026 at 10:01:42PM +0200, Armin Wolf wrote:
>>> Support for 16-bit addressing was removed when support for i3c
>>> was added to the driver. Switching between 8-bit and 16-bit addressing
>>> might confuse the system firmware, so we are forced to bail out if
>>> 16-bit addressing was configured during boot.
>>>
>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> Applied.
>>
>> Thanks,
>> Guenter
> 
> Thank you :)
> 
> Hopefully the suspend issues on DDR5-based Intel systems are finally solved.
> 
I hope so too. I'll let the patches rest in -next for a couple of weeks and
then flag them for backport into stable.

Of course now we have the AMD suspend problem. Never ending story :-(.

Guenter

