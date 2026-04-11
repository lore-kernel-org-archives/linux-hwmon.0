Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C2C3A7F78
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Apr 2026 15:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775922992; cv=none; b=AvcJA757HG7t7pWSDV5I5hg++sFP8kYE7MPKSnWA+k6vm6Io4BxITTigosnN3sW8IT5maBU1V2OoPQPZT/+z2JTYLpPebvi7+pcsb1O10Nsqkj0j5iQx4R1UG3Ldg+kYhgVuhdZWT4G5z58T/1p+5ET05r6hpgXXYx44oYpRhKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775922992; c=relaxed/simple;
	bh=zmm20FAEZWTHtPUEhdkWyeNT7WutfYAtNm9+L21TLBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VOrM6FCq4l3Omf2wWOPg2IL6CbdyKAtgaLzBZ90wZZ5hJagsyz5QAHlnFVSawAEhnwdQzPnq4HLuV18NtJRo7AVBP3DxWpjJngfYIjZkN9LodeZWXx4xGFSVfd3moHCm2wOmnwQo0Yg65bn4ES4kAjHDT4BJoTeVOjt3UolNrKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brkUMsz6; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brkUMsz6"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b24fede2acso17480105ad.3
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Apr 2026 08:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775922990; x=1776527790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DVrkaIEUqPuIb+vzkFm+RwXcE+fiPv+6EDt7LTGcx90=;
        b=brkUMsz6qtfjABioTbiLmUL9oXf14AjU1NqvZMK4d1tMghVPImjXRTLFae12m7s4Dp
         gFQ1cnaYrAEcWMnOhjulT+1k8BcUPhJNHRZYPIdJzNBHp+8etD706U3tvWDi+vbnmAyM
         rVVRslnzH8S1nzD7b0xnPf0dvVrAKZ1Pv4KrF0MIb0EC6VXfOc6r5zzICBXBNrjilATq
         dhSc1VF6+b1G7gX1Ap8ArQiZ8iVSvS3de2OpHSQi1NT6uWTTWXxO2YaImnO+ghnC7Wj0
         CFr2SE3KeGfybPVnUwIRRZiuU0EbnALOHW1mYEabWO3PMCVNw8/y6wUvoIkjkIwV7eFc
         EtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775922990; x=1776527790;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVrkaIEUqPuIb+vzkFm+RwXcE+fiPv+6EDt7LTGcx90=;
        b=WulV2QFIB0DKBG3fZYaSmxLbv5TNnBHC8cXBnHTgbNMBKOw/t3+DbrNem3O7+x7LZN
         CR5I26NKUhVnXilQvXEZST6nbuANBtRjdz7tO4ALIVvHfdx58D/GKUbfIZdAOOdC+COm
         ozRHalE6X8mrceOb28YbNmQxuXNQhrT3cnClJai8xtaNDGqJlu1fKhyx53v72k1UF1Es
         vYbhsnMbRv1xcLtBe9SuE/eyVnam002KathinO5K3eOZxNlcj5Vakt+f9sMhUb5thG+t
         6Bl2mAUYc+ejG+r/hspDzQG2JdkFOVTuFdtRng+NmblHn/aRe5bx0yzvSDj8EpOGe6Vn
         QC3g==
X-Forwarded-Encrypted: i=1; AFNElJ+JBYl1dVX/4HMXLbMColXg+eASn+Z6D3Z8X866kWNKvN/97n30ERluEF7aojscVy8uULuJGl2Qtg/HKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYb7lL1ud1BtPcFS6NPb/cw0aYaDB+AqLHHOU0Y+IEHWeutF17
	dmDHrUpOPLyJOxKeJcd+XM+MuEXn8FSUScsh/u/1GO2ZPFw60csHBZjo
X-Gm-Gg: AeBDievfFKhVGCpgDvwJ/D9GM4tKuEdivcF4ujmk1jW09nMoGJWyiyyKl5RqBi2rU3r
	BCv0Q8x2/Zc53OqJfNkziyZB3YxFFUfrutxq5S9hHPGoJtKRwHBknPeKzSxTAeWxiAqNMflSnT3
	LytI1++fVS0uqJKD81LJ6d6l7fJLXmaYBWgBr6aID1x4u3n5la9Buoe/TTHjb2qcn/CV9EtXA3o
	8ob9Fet51JXqxmRpz3/SzwlDIOHsUIUV166wEV5KtmKJuRJPOO/aF2icGNxLWKP/6VN3sa/kcS+
	g4bKUF19whu9KBA4zg0OktlHXyxUb/Z10Z1C2bWkQI2f8B213Ys/vNqwV00XJkWwFbaIFdW0Gv6
	A3kqYnqNm6jL3cRLFN/BU/Ao3yK8GMF49oZlpK1uX33UrLfJKWJlkJ/2j9uK22PC2wWXqb9TkIS
	Pa4JNcXL/QWEakoB4A5s6upF3pB2zNsMO8xmShOhCnknVNDfCUgHQ6oI1HTN8R/SWq8jGwIYrg
X-Received: by 2002:a17:902:a982:b0:2b0:445a:8c7b with SMTP id d9443c01a7336-2b2d59a0c3cmr57057695ad.15.1775922990251;
        Sat, 11 Apr 2026 08:56:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f48cfdsm65623585ad.82.2026.04.11.08.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 08:56:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8f7812ec-3c8a-4673-8222-28ba22796e22@roeck-us.net>
Date: Sat, 11 Apr 2026 08:56:28 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14] Subject: [PATCH v14] hwmon: (yogafan) Extend support
 to more Lenovo consumer models
To: Rong Zhang <i@rong.moe>, Sergio Melas <sergiomelas@gmail.com>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf
 <W_Armin@gmx.de>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86 <platform-driver-x86@vger.kernel.org>
References: <20260404164339.119023-1-sergiomelas@gmail.com>
 <ae53b7783787975caa973dcde337f20aee9b0b40.camel@rong.moe>
 <CAP8e=s+TcnikqHtTaXdsDUmOreLP5MYNQN1gDWvrQa-smbh_9w@mail.gmail.com>
 <4c627b63e40d1a3b2923ebe8b42fedde176f35cd.camel@rong.moe>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <4c627b63e40d1a3b2923ebe8b42fedde176f35cd.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/26 07:31, Rong Zhang wrote:
> Hi Sergio,
> 
> On Fri, 2026-04-10 at 22:14 +0200, Sergio Melas wrote:
>> Hi Rong, Hi Guenter,
>>
>> Thank you for the review and for pointing out the overlap with lenovo-wmi-other.
>>
>> 1. WMI Coexistence and Bogus Fans
>> I completely agree that double-reporting is suboptimal. I will
>> implement a check in the probe function using
>> wmi_has_guid(LENOVO_WMI_FAN_GUID). If the WMI interface is present,
>> yogafan will return -ENODEV and yield to your driver. This ensures my
>> driver only covers models where WMI reporting is unavailable.
>>
> 
> You may also want to add a module parameter to override the WMI GUID
> check as some devices do not support the fan reporting/tuning interface
> despite having the WMI GUIDs.
> 

Please, no new module parameters. If there are devices not supporting this,
add them to an exclude list. Or make sure that only devices supporting
the functionality are instantiated in the first place.

Thanks,
Guenter

