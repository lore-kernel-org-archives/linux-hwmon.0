Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675B97640E
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Feb 2026 01:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770166918; cv=none; b=rf5rnrhOhsQSV6K8uLctyGFflcDWj2naIFPS9WmWBGBZ0NtBW5Ga8iwDKHde95WcNW5LjCF1biwBNoaCQZ6yG+35QVTZvuYgI5lkuxULqErWNzZD+ElKmNIYwH4UUeg8uCyWUj2NvbvX3SVJ7J9/mhAjxiuQCuRyndL6ZAHKid0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770166918; c=relaxed/simple;
	bh=X0P8kRSPiEqhVTA0iM66aOFhmyKm0iJxQuRYsW4bCIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TqppII7kSusTstfROfagvCpKEp8tqog5TJDLycvaqCmZ9vjK6fBQ9HGOP5lYh/15AZ0SOovI/UcnEIQzkWOxHdkBpWDUKB5nIVeI9MHMhYZ7Ey85+Oo07AN9vMJMXZrou/cMUzeAcSOkBiRPrDifRdiuoAP9IUV6RB1WjPymAFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTbxroMC; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTbxroMC"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b740872a01so1559859eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Feb 2026 17:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770166915; x=1770771715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=u5KPwUE8ha6aoraCan36DE2nt1d/y1XBeYGhUUjKG2A=;
        b=OTbxroMChZizH1WkeSyjyhkLzKPmA86oFEcgu27MthTA7j8E6C3UGSSCECpYaxwHZI
         aXKKYJB/ueslWAv1a35zebrYe1ODSHP1w9r3i2JymkfkkFCgBG/7jI3SbRwVD0Qtvk6I
         1lUJWypwQaKIpNizgBBRayDRZaZPY/5G39bzc3Tae63YX77hx5XqYCJo6tj25dJXdo31
         ZB21+syV+vGFzLJW5zfmWhp6OHX3ahOI/kB5353APTLFGw7oRRVQ6qQiQeRfLpXNYNwc
         t4uqkWK3eG12NlBj3sV2FHsZEw1+rUrLCzsJZ/2efspyM/swEcDdttZRyoHMSbvs9bCS
         GFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770166915; x=1770771715;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5KPwUE8ha6aoraCan36DE2nt1d/y1XBeYGhUUjKG2A=;
        b=GoBGGUCdREc5gRaHObn8tWDrXidk4JjEmvswQmUwEt9E3p5D+Gy756PJ4A65ONfa9L
         y8ZEYcD8wxwzt42C+s5YjT41DhMzJDVa2S31rRsKzeFRDip5sqqxtRXbQvD9vBERFdXY
         ZozAXukQ7mfSuXB2bu+WIo48sm9IXn8R5Wu+DH8iKpQwaJh3RZCXVRe2frk+74/PqShN
         dwEvlcKz1jAcxvdOxvK1Bq0w1gMaWfG1f+RQJb09fUdeRzpBZX9EHWpvnKttlLCa2FzO
         VMeITIdtsREcvp9FjAquaUA3e8FqjfSEVM+5tCYIkwqHZHG6QXpuqikkrkaQVHYxhD3X
         2otQ==
X-Forwarded-Encrypted: i=1; AJvYcCUepMUdHpnKBmjE13mbjmRIdCw53LX8hgj4Pb9SsDJW+4QmUi3ggWoQvKRVrWo/M/fBSLzOwJIpOlUudQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhu+cgAONELse6AkdkzUkVL4XzBRBmDQtGJir2htAR3vglhjdr
	GnUOqli6/LlEU/D8H7rDiFSObtrHZICwRSNIOMSpEWDLphrmsHvoXV3d
X-Gm-Gg: AZuq6aJ4On4ZiqMXGEEJqB3N1vbRN5TnKqgikUNLU71VlgxIeVdvNSsZqzKabiObbTI
	sgGHc/OTRNJdCXYNLb0+PtNrDAS0XAupcLPeyFYpPPFOawnDx6E9eTQ+CoqMowgct3P7QTm+Fl9
	mX4oR81FrlIw4SlU5RQPOy5vHI5ckVsm7zl0YhF9C7Jc6ZTaI33QCohjp/1v4LLA5v+wcytLLRx
	OcRY+gprLoYU8PIgNi8sM3J9RB9XmnXN1gcGKuMRWQF+M7RkmlAZUDbvrCfWvqnMAhTq6tUiQRV
	mq7eOWB2bkBlN7Wggsnp6YQeCv2EG+qhGAChbOYF9kaS26fgJzwKrfM1GiGPA52Z1cF18CUaqp+
	ArmB0JWGG2TzSj7fv6zeCm35IxkKPFzxJgFQ8kEQPrDogReMvAeeB+YSUdGIPF7EMeg180QKGnq
	ROScsSnGgHBbm22jSwt/J5vLjOdmwnUujksVlwWgR4zLYyOYKfiDppU9JCOV0v
X-Received: by 2002:a05:7300:dc08:b0:2b7:fdb6:ccdf with SMTP id 5a478bee46e88-2b83287dcabmr720794eec.4.1770166915422;
        Tue, 03 Feb 2026 17:01:55 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832fb363esm743146eec.26.2026.02.03.17.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 17:01:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1c8f748a-5c5d-4234-ae86-7bb12045a373@roeck-us.net>
Date: Tue, 3 Feb 2026 17:01:53 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BISECTED]: acpi_power_meter: power*_average sysfs read hangs,
 mutex deadlock in hwmon_attr_show since v6.18.y
To: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org,
 linux-hwmon@vger.kernel.org
Cc: Igor Raits <igor@gooddata.com>, Daniel Secik <daniel.secik@gooddata.com>,
 Zdenek Pesek <zdenek.pesek@gooddata.com>,
 Jiri Jurica <jiri.jurica@gooddata.com>, Huisong Li <lihuisong@huawei.com>
References: <CAK8fFZ58fidGUCHi5WFX0uoTPzveUUDzT=k=AAm4yWo3bAuCFg@mail.gmail.com>
 <CAJZ5v0hvKzKTWA8jFYVDHttd+hDv1juu87vgyhf2udOGbqrQdg@mail.gmail.com>
 <d7f34e0f-e258-4fef-93eb-1ef0a3123d95@roeck-us.net>
 <CAK8fFZ4izdX_HDtGN60CZ3Ta61nqkUg7ncViM=mGgxKki_5FoQ@mail.gmail.com>
 <a7334568-13ce-4600-8650-607273e67976@roeck-us.net>
 <CAK8fFZ6gKs7s2rJ=f7bt24f+_cY-jGU33TvX3UP=U58uK-1KaQ@mail.gmail.com>
 <fff54ec8-496e-4c26-b652-358dc4de0de0@roeck-us.net>
 <CAK8fFZ4wEUdMAHkfdC_z8ohYB_rEXZ=dHArc75jDibgQ_-ozKw@mail.gmail.com>
 <4f151d4c-fdc6-4281-87b0-b7120eeb1b46@roeck-us.net>
 <CAK8fFZ401-nez_CgDTTnQiPT=oBRRJuYooXyEKFuCdHpGCPXtA@mail.gmail.com>
 <27d60756-d33e-4926-9a02-f52505339de6@roeck-us.net>
 <CAK8fFZ43wrQ8A_bO_g+rKN9O31sxULtqA0hUieZSzEH5KqeW1Q@mail.gmail.com>
 <CAJZ5v0hEu_io2BAzp9weUDHwHngorjZ37GRUK=ngSXNjtp38qw@mail.gmail.com>
 <CAK8fFZ65Vro5nQqJq_cvsY93hgDbfTdibWnNr5b0Bixzc-ESfg@mail.gmail.com>
 <CAK8fFZ6Vi4xayvdKh-_eLi-nDNMLuEoMsvwEnb33QqnwS7o4BA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAK8fFZ6Vi4xayvdKh-_eLi-nDNMLuEoMsvwEnb33QqnwS7o4BA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/26 15:21, Jaroslav Pulchart wrote:

> ...
> $ git bisect bad
> bc3a9d217755f65c137f145600f23bf1d6c31ea9 is the first bad commit
> commit bc3a9d217755f65c137f145600f23bf1d6c31ea9 (HEAD)
> Author: Corey Minyard <corey@minyard.net>
> Date:   Wed Aug 20 14:56:50 2025 -0500
> 
>      ipmi:si: Gracefully handle if the BMC is non-functional
> 
>      If the BMC is not functional, the driver goes into an error state and
>      starts a 1 second timer.  When the timer times out, it will attempt a
>      simple message.  If the BMC interacts correctly, the driver will start
>      accepting messages again.  If not, it remains in error state.
> 
>      If the driver goes into error state, all messages current and pending
>      will return with an error.
> 
>      This should more gracefully handle when the BMC becomes non-operational,
>      as opposed to trying each messages individually and failing them.
> 
>      Signed-off-by: Corey Minyard <corey@minyard.net>
> 
>   drivers/char/ipmi/ipmi_si_intf.c | 29 +++++++++++++++++++++++------
>   1 file changed, 23 insertions(+), 6 deletions(-)

Now that is interesting. Does reverting that patch on top of 6.18.8
(or any other 6.18 release) solve the problem ?

Thanks,
Guenter

