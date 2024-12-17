Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2CD1F706C
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Dec 2024 15:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734448104; cv=none; b=KrO86IhtOv+bO6gmVQ0Lr6+hhsszP+Je40tDs4sKuu+INQ9QWjGPYW5HhZwOkSAG9YPR/6VoupANQlX9OK1TLXsWNfb2Kc6+oVKtIkY1Q4KS5WIHha9pa2eowMPrYPODa1UPPdoEqZvuPbIUUbmLhrYzj1sJ4GtjlOhALHWx1Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734448104; c=relaxed/simple;
	bh=EnOLx/nHKpZaAJE5Zlhn7nWmQRH3Q2HYlAAYXXmpiJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KY462TPmh2NLjmJGZu4B5aHzWDyq1ChO9g2aDQwup8BbHoBHshb4pylfB5NAxYwW0LlhFpfCbN5eSTsAsxh23gUw3XU5+cxP1EOL7CWkmbdJy5/S/tzzinViL1gQXP6aRelf4K+tmeMG7v3c8+a041u+FNgh3Tm9NLbOeUqt1jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S5qLMCar; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S5qLMCar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734448099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D7ABiOnpBEGx89PJw5n4fgFhL0VnSY3UoS2smPvphwQ=;
	b=S5qLMCaroKOv72Ui+nrTCrRXB60mhldBWu99hVNLarud+aJgpkhGUGD4cW1yI5j7DBY0TO
	BXPgevqoWyepubYSu6DUXF+pQRrMvH92KpX/vHJ7t8dw9fpIL6hZtuC6BCC7zZcAweIRfb
	6xqT1YYic5rg05fVv8liCtunZWyq3pM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-tPSdamFwM3qJbUHxlkHJYw-1; Tue, 17 Dec 2024 10:08:17 -0500
X-MC-Unique: tPSdamFwM3qJbUHxlkHJYw-1
X-Mimecast-MFC-AGG-ID: tPSdamFwM3qJbUHxlkHJYw
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa6a1595fdaso431234866b.0
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Dec 2024 07:08:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734448097; x=1735052897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D7ABiOnpBEGx89PJw5n4fgFhL0VnSY3UoS2smPvphwQ=;
        b=qEE9IoLu8v1JPblgqml2Hx0cKeoqXl6SWJP0Lk5aZPSAW3Oe42i9LwG+wVzvKEPCrU
         v/NUBtZ51KITVyJ+xdtGTMI6ddOuH87Vc9XrrBeN/mp59Z5DzYef05ucYxSH0DDO1hpD
         itEGmxqo/inOD4GQBucZ8ullDJ6t5Pl8CLF+GpZ9IjzwDBZtk9VYPU5ekcCVFnoX7py2
         HvCbtlGQzLjviTNBb4+LfAT1Ju0jSBfverwkP0lmIAKjFTZh0zxOIESkfZL7goMgntFH
         t3iguDyiko2n7jFEMlV1q6uJov/9FlczmH2y7ar/KFtFwXLzNdDtXMNH2khRQB+eNagd
         x5yg==
X-Forwarded-Encrypted: i=1; AJvYcCUGdsIJbyOoK7BXXxO80bRk6kCOvTq2rE7j6gmpUg1pvRX4zQnQaezMIFdI6pqcsI4k0OE2mI2x2tf0lQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWF0IQLfn1pAfTgveAJePROb6gSozokVZXsZ6b3sBXS+PstE+y
	WAWerLPXncWVAqS0QniQqhKQYxPG4BZuBAeB2AQqwGCqJ+guImt2+1PDj6JLenznxK2oacHmKNT
	/w1ZC1P26ZTnpFEms1U17VzECYOMzIaat9e8/bKajwU6lK6LliiMM7Jf5huk+
X-Gm-Gg: ASbGncsEBaeWlfN7ll9cwlIeagDIZYEoRhWr4pieMtv5/NBflcXh0rm5BbgO0RQw4na
	6QibyHgRvusg3dPOedFQijjQKMTFHTOtYdAD3lXAvc6beEQEsAGINY5UxOKf+p12Y3HRCyb4UNs
	N31DYAFv8vBvICm+9y1FhMifqdokQhGSAX94Esga5BMYw61NTUSbi5PM3/XYaWiAXtrwz+XvXk7
	dG/Oes0KUMynDLPx1VxdQsFxxlFP6PG167xpAoyVso8tFI7IzeBjk5M3FKRlkvD
X-Received: by 2002:a17:907:2d26:b0:aa6:691f:20a9 with SMTP id a640c23a62f3a-aab778d9db3mr1484535866b.4.1734448096602;
        Tue, 17 Dec 2024 07:08:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDWHkMPveAxZ0xKYxQGkeagwKHAxrWPUWCyDh6esu0iO6udkUJ+rwK5j9MucJziPskb6Bquw==
X-Received: by 2002:a17:907:2d26:b0:aa6:691f:20a9 with SMTP id a640c23a62f3a-aab778d9db3mr1484531766b.4.1734448096173;
        Tue, 17 Dec 2024 07:08:16 -0800 (PST)
Received: from [192.168.162.203] ([109.36.231.174])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9639363asm452932366b.169.2024.12.17.07.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 07:08:15 -0800 (PST)
Message-ID: <1aecf86b-6e3b-4755-8f1f-d3dbc8d13644@redhat.com>
Date: Tue, 17 Dec 2024 16:07:49 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: samsung-galaxybook: Add samsung-galaxybook
 driver
To: Armin Wolf <W_Armin@gmx.de>, Joshua Grisham <josh@joshuagrisham.com>
Cc: ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 corbet@lwn.net, linux-doc@vger.kernel.org, jdelvare@suse.com,
 linux@roeck-us.net, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241209163720.17597-1-josh@joshuagrisham.com>
 <53c5075b-1967-45d0-937f-463912dd966d@gmx.de>
 <CAMF+KebYQyN+gkHayAdZZHPU7DbghwpmVQaLFaf0TiBb-CVp7A@mail.gmail.com>
 <44cd9966-e24a-4386-a0cb-20b1022adcee@gmx.de>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <44cd9966-e24a-4386-a0cb-20b1022adcee@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-Dec-24 2:41 AM, Armin Wolf wrote:

<snip>

>> Regarding the keycode do you mean that this should send something to
>> the input device via the sparse keymap or that the i8042 filter should
>> emit a key event, or? And/or that it could be handled with a hwdb
>> update in systemd so that this key gets mapped to the right event?
> 
> Please send the input event through the input device with the sparse keymap.
> 
>>
>> Regarding the specific keycode I assume that maybe the appropriate one
>> would be KEY_CAMERA_ACCESS_TOGGLE ? (though I have not seen any OSD
>> notification with this keycode but maybe it was only with older
>> versions of userspace tools I was originally testing this with..).
> 
> Depends, that will happen if recording gets disabled?

Since the driver handles the toggling of recording on/off itself
KEY_CAMERA_ACCESS_TOGGLE should not be used. As mentioned in my
reply to the v3 posting:

"It would be good to report the camera state to userspace using
a separate input/evdev device which reports SW_CAMERA_LENS_COVER
as discussed here:

https://lore.kernel.org/linux-media/CANiDSCtjpPG3XzaEOEeczZWO5gL-V_sj_Fv5=w82D6zKC9hnpw@mail.gmail.com/

the plan is to make that the canonical API to reported "muted"
cameras."

Regards,

Hans



