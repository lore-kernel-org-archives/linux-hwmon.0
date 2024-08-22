Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFC01CFEC1
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Aug 2024 18:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724349891; cv=none; b=BYyUTuG0llelTe/Pyry8NPaFMCocZ+IBg8ssKGzAXbEuoEY9hDyhTv44quFWxRo8NzgCNR9hmfoFcixJKet/D0at/F4FZIEtzMmiw0JywQUJv6evYg8KZ31n17fCrxT1nwK2wT8MCQCtJSMy0XISgbVNbnpIvXFePC5d8D0YRSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724349891; c=relaxed/simple;
	bh=22LkK5Q1Veaz9Mb1zYBbVIj2dXiCPlbXlwB1IfPgj7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zklu+lnxYX8y3Lz2m9sBbHwn3RuxTFKJbLR3Nv5QfbG5j0QDwkc1tH7Szv2E80quEh43MB0gT9gMmRZ0aIyfaCwM01/gYMIebFMgc/C10NyUv/KnBW+MEsNktF4rx0kRIY/EO0a8KRIGXD2lNlzEGkozKOfx4LUr0qCWZMogyBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WpgqPYXo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WpgqPYXo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724349888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SEQT24HTH/UP2orz6Wh0q+3NPw1eci4EU9RHhKZFX2g=;
	b=WpgqPYXo1vw5PYjOCyV4jU1ekIndJ2P8qZflFt/VGSPwjhpohJphnrJeuWSXf5aIw0il3l
	lRgJpBiy9MCAppT0hHih39U5B5pA7xEJLSywn3/hT5Xja9+4yqMiOp474Bp1pwU90N/ltr
	8CoYl75ZNrAvVS4tPeUXbuN2EzZ0sD8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-cy53YKETOe2JncfJ05u8eA-1; Thu, 22 Aug 2024 14:04:47 -0400
X-MC-Unique: cy53YKETOe2JncfJ05u8eA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3718a4d3a82so512529f8f.2
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Aug 2024 11:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724349886; x=1724954686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SEQT24HTH/UP2orz6Wh0q+3NPw1eci4EU9RHhKZFX2g=;
        b=mL8ZEuxjACDMG2T1Bj0adoMc3JvpjwicQejm3RVFTB8YIjLftllLlSEeABaESeWmqs
         6BTZAutUMBZhdjaseEfOwap0BLs9muRE65IuxK70hoCUma5fdZRCoq9kZB0ycwyiQtC4
         uK1FBEnF0IltfVrHoaz6cyLqKSeCtnyg9caw0rEZNI90/ArqgC/ZuXZsCP/ZPRsqLC8G
         9scRMit2l4QAT5jAJJ1zofA6hPIxYXP8syeoONBJtfaunStIVg8jgEafvdRLnp8421iQ
         3x7az+/0pSrEohzmMw/0A7aBSiZuWrJLdCZrzIDKcIYaAheD98ptBPafT1b+4x5NtbTx
         xT9w==
X-Forwarded-Encrypted: i=1; AJvYcCXML0qToBuVhGGJxP7jR1jkjccOEZA64ou6bgyuq6iwi0kezP18aCV/zgYCr1ukT/ji41OahVjrkl7LFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yygo6LfxcZ/FCZGtoQDdqpQo3Uu+CJDdNmybDKTWPEe+U1Q/04s
	0pJC9Zwioq84BAG9fkGmp8SGLr2F+DLBBzdX7rjFuyeUOvCyP65LfEj5w/4VyESzRkU42vWMwhJ
	T0uK9TzXZA4CQMVDsuraq0f81EGC4h9y1T/C0SSXzl09HFPIolHdwhmHOKtSZ
X-Received: by 2002:adf:f24d:0:b0:367:9088:fecd with SMTP id ffacd0b85a97d-37308c08c62mr1716044f8f.7.1724349886333;
        Thu, 22 Aug 2024 11:04:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6SUIKLE1JQjtqs6HrdTaFyqHHZmF+U8ofr6ynQWzY+vpqwb/HUy6nOYotftRU637wSsXYJg==
X-Received: by 2002:adf:f24d:0:b0:367:9088:fecd with SMTP id ffacd0b85a97d-37308c08c62mr1716018f8f.7.1724349885823;
        Thu, 22 Aug 2024 11:04:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a4c9064sm1152586a12.73.2024.08.22.11.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 11:04:45 -0700 (PDT)
Message-ID: <f3baa8c0-3363-4f0c-be86-83be2ec4d373@redhat.com>
Date: Thu, 22 Aug 2024 20:04:44 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] platform/x86: wmi: Pass event data directly to legacy
 notify handlers
To: Armin Wolf <W_Armin@gmx.de>, james@equiv.tech, jlee@suse.com,
 corentin.chary@gmail.com, luke@ljones.dev, matan@svgalib.org,
 coproscefalo@gmail.com, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: ilpo.jarvinen@linux.intel.com, rafael@kernel.org, lenb@kernel.org,
 platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240822173810.11090-1-W_Armin@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240822173810.11090-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/22/24 7:38 PM, Armin Wolf wrote:
> The current legacy WMI handlers are susceptible to picking up wrong
> WMI event data on systems where different WMI devices share some
> notification IDs.
> 
> Prevent this by letting the WMI driver core taking care of retrieving
> the event data. This also simplifies the legacy WMI handlers and their
> implementation inside the WMI driver core.
> 
> The first patch converts all legacy WMI notify handlers to stop using
> wmi_get_event_data() and instead use the new event data provided by
> the WMI driver core.
> The second patch fixes a minor issue discovered inside the
> hp-wmi-sensors driver, and the remaining patches perform some cleanups.
> 
> The patch series was tested on a Dell Inspiron 3505 and a Acer Aspire
> E1-731 and appears to work.

Thanks, the entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Guenter / Jean may I have your ack for merging the small
drivers/hwmon/hp-wmi-sensors.c changes through the pdx86
tree ?

Regards,

Hans


> 
> Armin Wolf (5):
>   platform/x86: wmi: Pass event data directly to legacy notify handlers
>   hwmon: (hp-wmi-sensors) Check if WMI event data exists
>   platform/x86: wmi: Remove wmi_get_event_data()
>   platform/x86: wmi: Merge get_event_data() with wmi_get_notify_data()
>   platform/x86: wmi: Call both legacy and WMI driver notify handlers
> 
>  drivers/hwmon/hp-wmi-sensors.c           |  20 +---
>  drivers/platform/x86/acer-wmi.c          |  16 +--
>  drivers/platform/x86/asus-wmi.c          |  19 +--
>  drivers/platform/x86/dell/dell-wmi-aio.c |  13 +--
>  drivers/platform/x86/hp/hp-wmi.c         |  16 +--
>  drivers/platform/x86/huawei-wmi.c        |  14 +--
>  drivers/platform/x86/lg-laptop.c         |  13 +--
>  drivers/platform/x86/msi-wmi.c           |  20 +---
>  drivers/platform/x86/toshiba-wmi.c       |  15 +--
>  drivers/platform/x86/wmi.c               | 143 ++++++-----------------
>  include/linux/acpi.h                     |   3 +-
>  11 files changed, 53 insertions(+), 239 deletions(-)
> 
> --
> 2.39.2
> 

