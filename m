Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD1119F474
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Sep 2024 15:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725550290; cv=none; b=CIZuGyY2dmYKiVChLBtiNnszx3vGvJF+eRcgT9HqJD/N2KWpZgEzBl1mWa3KD5v69O294fvKEPBE1tF6aWp0SJHNjsgnV37LLIt1sVTu0iixJ8kzadYJ/7XumiMB5vJvk+dOtNQKc5IjeMhOPIzOosqrKj6CGcFUfyvqP1UlQNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725550290; c=relaxed/simple;
	bh=1Gu1g5YiyD6EX6dL7Xe2DkefGgh4Zq+aULpfDfyDcQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qg/6XzN4CEB7F9T4Nm6h5ea5QmlrsyKcqYsSKI0V2bbwuCt9fHDDt1zPCKg/UQmge8WiW+1IE8mdldMQhQ2Q+wdIUoNIHhKD2/ci4EVaidlZSYjtc1hYjVomEdOWyjHgXt/lV8ay4S/esxXTh/Kmp/f+vBNdj5OVaOGthg3JtY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jx0qzuOH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jx0qzuOH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725550287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wRzzBc66f6bsoGiNqqrtMBI2u2sVAibReQZsk3dGteE=;
	b=Jx0qzuOHEtDF/jlpU6STvLUARMjl8i03BcvAMctA1IvKKhibhp/FFsNO1PC+uMwq3AfMVU
	Sib/UUosog874SBUtQlVU8dwzfVnHoySWmIiNLlM4dqE5/UE8sSDOGglbyk5khYf/V/ZFN
	45d307A8Kj0X4WKdVAwxLDrsWrCGFDI=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-mIJsfx5MPHWIJJTKFx7yWQ-1; Thu, 05 Sep 2024 11:31:26 -0400
X-MC-Unique: mIJsfx5MPHWIJJTKFx7yWQ-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2f4075961aaso10476831fa.3
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Sep 2024 08:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725550284; x=1726155084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wRzzBc66f6bsoGiNqqrtMBI2u2sVAibReQZsk3dGteE=;
        b=qLqVoZBvn74vxtkMtWddxWDDDIn6LEjPB1yeS7rTC4i/Eplv5Ze25lrFU9Bvnjb79p
         6Jb3q2HbdOAI9HL2rMOqjunP8dgNH1IWTniWcrICAFFatnOFiCeb5RtSbPSqEmUtjKAv
         gFQ5BRN3bKdgVOe49ltRMus8rGz6FT77iCQmp2zL3TE02xL1SUtrtuuiYkiduiCrhYj+
         lxrNzojIm7Vp5P5k8F/avA9BzHarcC+4eWy5dlIrf2BO0MpuR2MMtmHHkRTcXxg1hEgx
         X/E4YlKs6EDEm+RTzXIGhfyEx096d2RLTv95dy2LY1+sO9EGyw9uT5m3HWMZugkvXPQY
         tBxg==
X-Forwarded-Encrypted: i=1; AJvYcCXKZHFSgXFLMqSsNl1HKR7bziMQrxs2DhJQ46bwH1XUNtF8ZlH2X9sG1eEVjngsAUuj/ZH4UiyIzbC31A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzALgi336gS+DZnHjhl+nbjSLMPTfLjPTYUaz5r/p58i4bDSxTi
	KiD2CKe259REAITlIIJ7x8U5YH9OKsGgtvA3Nu6Ze74y2QpPY6TJNo3eD0y96OtQjOZ4pgMNgZh
	/tthFCHQmL9iAF/fYo/ndH3K5FHBkwBR1yc+JhQHq5MxNL9qtYejqlNQi4YaH
X-Received: by 2002:a05:651c:54e:b0:2f7:4ccd:8918 with SMTP id 38308e7fff4ca-2f74cce4981mr18546781fa.43.1725550284473;
        Thu, 05 Sep 2024 08:31:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+SYsL0pTwH95+YwdB+0DpcJLiqfqdzE4OZAuAtTheZkZM75nfS9UbiWxcohiHKG7t+DcVaQ==
X-Received: by 2002:a05:651c:54e:b0:2f7:4ccd:8918 with SMTP id 38308e7fff4ca-2f74cce4981mr18546431fa.43.1725550283920;
        Thu, 05 Sep 2024 08:31:23 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc698132sm1338449a12.76.2024.09.05.08.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 08:31:23 -0700 (PDT)
Message-ID: <ea736e0a-a92e-4a2f-a06c-04f8c20aaf22@redhat.com>
Date: Thu, 5 Sep 2024 17:31:22 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] platform/x86: wmi: Pass event data directly to
 legacy notify handlers
To: Armin Wolf <W_Armin@gmx.de>, james@equiv.tech, jlee@suse.com,
 corentin.chary@gmail.com, luke@ljones.dev, matan@svgalib.org,
 coproscefalo@gmail.com
Cc: ilpo.jarvinen@linux.intel.com, linux@roeck-us.net, jdelvare@suse.com,
 rafael@kernel.org, lenb@kernel.org, platform-driver-x86@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240901031055.3030-1-W_Armin@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240901031055.3030-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/1/24 5:10 AM, Armin Wolf wrote:
> The current legacy WMI handlers are susceptible to picking up wrong
> WMI event data on systems where different WMI devices share some
> notification IDs.
> 
> Prevent this by letting the WMI driver core taking care of retrieving
> the event data. This also simplifies the legacy WMI handlers and their
> implementation inside the WMI driver core.
> 
> The fisr patch fixes a minor issue discovered inside the hp-wmi-sensors
> driver.
> The second patch converts all legacy WMI notify handlers to stop using
> wmi_get_event_data() and instead use the new event data provided by
> the WMI driver core.
> The remaining patches finally perform some cleanups.
> 
> The patch series was tested on a Dell Inspiron 3505 and a Acer Aspire
> E1-731 and appears to work.
> 
> Changes since v1:
> - Rework the hp-wmi-sensors patch
> - add Reviewed-by tags
> 
> Armin Wolf (5):
>   hwmon: (hp-wmi-sensors) Check if WMI event data exists
>   platform/x86: wmi: Pass event data directly to legacy notify handlers
>   platform/x86: wmi: Remove wmi_get_event_data()
>   platform/x86: wmi: Merge get_event_data() with wmi_get_notify_data()
>   platform/x86: wmi: Call both legacy and WMI driver notify handlers

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




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

