Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45E62D59E8
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Feb 2026 16:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770395516; cv=none; b=pjILAxZH2fF3sgnQvYX25vZpY8hTDpJR2SkX8s87v1p6nfFomqCrE73PY5npgiOHpqiSi/hJ4rYFSiq5SKZSlq4OEg2Rqsf3tgrMBfjgzYPYtoJVMWOBwgb6Cpf/Vzxfu31Cnyl3VQ6SekCk8rtrRRMPNLDUYmAhA/j7Bn5jwRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770395516; c=relaxed/simple;
	bh=2zB7HekGKrFnGNzWWAGcA2J5iO+2U396GYLL/gI9dLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fMOIXmbn96fiM4vTUHFjKMfdP15phQ8KWvJodNU1sfjHPEBgi6LtUBE6nW3DGITvrY4669PkaFR6D0KSvRLOot4EZB53xtMP9+YgXWHxLeen4TNGnSP+QUQM1+1iNhhp/78e+ys4WJ3Czb+lygo3mlOMmPahRUXykFF6GmSpuVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFIOoIcc; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFIOoIcc"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12336c0a8b6so140366c88.1
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Feb 2026 08:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770395515; x=1771000315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=B5VaLgdl0sc/lc6dY2l3XCuB72osV9uT0bSdbO107cc=;
        b=IFIOoIccK6wwwso5oScbI4vUiZ2NSyIuo8S/oF5aw1xrRfZ1jWx0RD0GS/l3QZI69S
         4lENTsPoCwKhZb77MVaOPGAlvO1rG5JHNLy3okyNC5YaA8eTCKg3nEHX+Ba8P8pnqOYA
         vakcOINJ55IZQnpmiDmySaEK59sA/Tk/s6B/SKeX4ystsQpi46AkQu1vgm2l3lYQq+BA
         2X91ZxFwHPvQYJCmAqrloWG2v/Uj5xAAXFnkh9e8UFEcilXLN0GO4l+g0roXAbZpNUzb
         8MaJ3jWLg4OYoaP6ZoP55ekPwk46xkeQbkfSQmIbKJKuNE+/mbS2ykBwLho2JSNsCfPk
         mopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770395515; x=1771000315;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5VaLgdl0sc/lc6dY2l3XCuB72osV9uT0bSdbO107cc=;
        b=GmFdTyAmzkQZJ8Tj63wcZbaQNTuCdFmhLzbB5n2+PJgOP32CCtxJ0n5QEgVc7HpV5g
         KGrMQn57CPvPn+DniWAMidwVkUNGlfBvc4vvuBO7h3xv4aRP5cVnruMSHnpq84sLa/ib
         HaJDPa8wNHK8C2c2FwqV/RgJJ5RQV0UaBBjWaDC7OUBvo8udGeUkn3dXMW7H5BrTWD/x
         qSrDXJc4RrNjUH2Tj25LEXYgEESjpsZjGm/vu//oM/CfIlvTKgX76A8zLIj1VEmffe4l
         yXWybwZcVGcgdy4uQI4n3L/znOOwJQbysBd0vf294fTeZbzGyNtTI7tJ2u1kOcDEFd9L
         jcmA==
X-Forwarded-Encrypted: i=1; AJvYcCV9YBqcm1405fmO5PSdKAW91lg7cSudbjufw9uRG/E0FnDhBnM6r7E87iWc/nEqkJT8gPGaJlHLfh0K/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0qLFNMJ8sO3nygEV0zheI6KZkFQqsBEuTvoXsqSMmQe0w12lU
	GYDA/qySLacIdKwzrZ0K0tP4Plh6HRsmjdfgiEcpxmgDTFznXm3+KevH
X-Gm-Gg: AZuq6aJ6nDAzun8D7IbK86bHf17xytJSEX4Q7JTAh2NxHDvJE96AA/9WL8XLvaqx7cB
	bzmi03tpoOUDDLX3jGKaW652ru8V3CQP4e1cmSodnDV7jdKcuvG56NydhJw1wnumhwqQlt0iN06
	oIn+uZnAR4mpO270fjtwoeWCgmb2NJPxSo7jKxSl2ADMVWuwQlnWB17Q37W0L18RZLFP0Y1C30T
	bV9KrDm8mt7hVhYJVnmyVkzS8XDiVqeNJJZTWH2gTd2/Uq8/o3kHWWK+tVvlNoMK+d24jSDJH+y
	YVLelyA/lBf9E3T6C3ZOYfkB9vs8iv6QSIi7wDHTy8pXe3RVnqiryw/M4BdIWmPkigSsJh7DS3p
	9WKa5V/FR/L1+KEVWNipd3RYnd3FlBL6lH5dJpfDyRtY4yWoMiVd6Dj68brr/rrEqYUwuQ3B2u8
	Ua8hGS+3L3tGgNnvbcCBwrOZx84Yf83pWNXdCT8zcPog6Xp4noAsSiEEusG46s
X-Received: by 2002:a05:7022:6092:b0:11b:9386:a3ce with SMTP id a92af1059eb24-127041a239fmr1388232c88.47.1770395514664;
        Fri, 06 Feb 2026 08:31:54 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041d9c91sm2560985c88.2.2026.02.06.08.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 08:31:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c9ecdbd1-cc50-4e3a-9540-6a4917dc07d6@roeck-us.net>
Date: Fri, 6 Feb 2026 08:31:52 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BISECTED - impi related]: acpi_power_meter: power*_average sysfs
 read hangs, mutex deadlock in hwmon_attr_show since v6.18.y
To: corey@minyard.net, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Igor Raits <igor@gooddata.com>,
 Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
 linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Daniel Secik <daniel.secik@gooddata.com>,
 Zdenek Pesek <zdenek.pesek@gooddata.com>,
 Jiri Jurica <jiri.jurica@gooddata.com>, Huisong Li <lihuisong@huawei.com>
References: <CAK8fFZ65Vro5nQqJq_cvsY93hgDbfTdibWnNr5b0Bixzc-ESfg@mail.gmail.com>
 <CAK8fFZ6Vi4xayvdKh-_eLi-nDNMLuEoMsvwEnb33QqnwS7o4BA@mail.gmail.com>
 <1c8f748a-5c5d-4234-ae86-7bb12045a373@roeck-us.net>
 <CA+9S74i+BC3=E0opOPMff0cuC1OPYSecii0C8fVZ+NM7bptNcQ@mail.gmail.com>
 <fee01c19-2711-487e-91e9-d57f9be04b98@roeck-us.net>
 <CA+9S74jR9jRRE-DNMxNg=6Uv2uDAUar2n-RkVDJqzkDfNu3eog@mail.gmail.com>
 <39100538-a1f3-48dc-82d6-5e3314a43b4d@roeck-us.net>
 <CAJZ5v0jo4CV__AoUfqxuhVgkw6hA=hM_fBU+W=pTzqDLmNmytw@mail.gmail.com>
 <1642aec8-e8c1-4ad4-a5b7-556feeedfd93@roeck-us.net>
 <CAJZ5v0i_BmeGROzQFpUCyF5MkA7sFkP3y8jjqH0mD2r2Wqj_xA@mail.gmail.com>
 <aYYSDWaeiCnkwqAF@mail.minyard.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aYYSDWaeiCnkwqAF@mail.minyard.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/6/26 08:08, Corey Minyard wrote:
> On Fri, Feb 06, 2026 at 01:08:56PM +0100, Rafael J. Wysocki wrote:
>> On Thu, Feb 5, 2026 at 11:34 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>
> 
> snip..
> 
>>
>>> 2. Excessive Polling (Timer Overwrite):
>>> In `smi_timeout()`, the timer is unconditionally reset to a short timeout (e.g., 10ms) at the end of the function, unless the state machine is IDLE. When the state machine returns `SI_SM_HOSED`, `smi_event_handler()` correctly sets the timer to a long backoff (1 second). However, `smi_timeout()` subsequently overwrites this with the short timeout. This causes the driver to poll the hosed BMC every 10ms instead of backing off for 1 second, resulting in unnecessary CPU overhead.
>>
>> Well, that's not nice, but it doesn't seem to be related to the
>> observed symptoms.
> 
> I have a fix for this, too.  Thanks for the report.
> 

Thanks is due to Gemini 3, really (I would not have seen that problem),
and to the AI model used by Igor.

Guenter

