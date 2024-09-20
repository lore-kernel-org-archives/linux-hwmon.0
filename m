Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A58414A636
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Sep 2024 12:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726834240; cv=none; b=HhfFmqUX7JeOBVj+cLlNLRF0fwCmWliK/67nlOdq9+PJFDZa+BjOKaUNd6cB3XkxQQxOcG1NlBKA9N74eccxW9NjT7u/tyO/xN5zBne890XJMQT+SvyIbBSYwXdxFxl093mCYn0VUnpmz+7TlZqtppE57Ccmpxuw8rhxp6k0EFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726834240; c=relaxed/simple;
	bh=XYFh4DLN6/r6Sq85qf4bYLjUAqp38/Hg/NQArtbjRpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jwXESobQWtqwAnB5rktvFGsIfXpDnj5oVoVMpzHt48Jk+zK5D8MCPRL0W9jga3gWYMUGGgr/VHdyJfdcGCcwU0DzyUjrtCNZT5ObHpO7sAdEWyaHoI+AhKT5QFEHIhyIbSh80DLg79Wd7kXqBmzxj1iTgv5LDUFeI9v0NANHqlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GjnDrqgi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GjnDrqgi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726834237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eM2fNaRDFas29zMKWdtqBon+bSwbaG6Nc3FOrqL+huI=;
	b=GjnDrqgigaDRLgoCH7yy89nJx5JbyfW0PWFP4+lCFJ+A0M2a/X6feWbAUtBj+0hFzQLSkw
	im1ptW+/pGUOQBQiOdZq8sdYwTSRLE/fu79tAB/zuDyMO8tTJog4C3j2FVDnde7QywnrI0
	WQxzWry2rlU4sVrqoZt0M6eu329CQNk=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-KWYaIin1M8KtKrwUzLXxKA-1; Fri, 20 Sep 2024 08:10:36 -0400
X-MC-Unique: KWYaIin1M8KtKrwUzLXxKA-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5365b801741so2073927e87.2
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Sep 2024 05:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726834234; x=1727439034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eM2fNaRDFas29zMKWdtqBon+bSwbaG6Nc3FOrqL+huI=;
        b=IQnm08+DsD+J6bS0KT/pkMcxtYbad6yFLKUvJplGpC4v8B1+sZL8OFtoEWVKYbpVGm
         Qt4vbNY1s2THTPdo46UboSGcDnm4HAOScPZYJJEzy+du16PC5jAcM4wrsrCv4Qn/kJ0p
         cevn2eePH9FJSmakUQmx/0O4Y19edWYyekhsY93zugM1o2niPx+6X0Y7ugrY9W875bZk
         lad1Jg6ZVGQ+3ggcXwYa6dDoLsiFCgitlq2jdeY/su1+bw3deqxPEbihzYqE/Pfk9wG2
         Pv2ZGkaLIOG55CgS0dEIcxPVzqTq4xqZnMpRqDpOr1Q2tGjWYOyGabdt+wo7VnQLw6CE
         J6cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXicpGCzMpydmtCscsP8pZzuspmvTxw00LfqmPmblym0FhGGHcGGWsOth0OApsBo+ER1ZvTOworRwZtaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfyble4RzbHswD2qXOiM7aGj5UTsLPLdaxYFoR8S3uFdn5umYY
	5DtAdhqEOMEluTPBU0WD+aNzO9JDkhDmIER/WXctykZscNaMuoFmL2VuvZWBo6ow3PNq+O3ifcf
	pn9DlumrZyWNfrYgZT6oHaPy6rRtKDHkLuzjrj5mQqY/WGJyPLf+vPlL/xPJ3pbfxXP3s
X-Received: by 2002:a05:6512:3dac:b0:533:71f:3a3d with SMTP id 2adb3069b0e04-536ac2e86ccmr1961532e87.24.1726834234237;
        Fri, 20 Sep 2024 05:10:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHQogLeRmFy/+WuPOpcbeCnoGIHILmzzS/u0ArVVZxjQgjr3rXN2lc/s8QND0gPFH+ZQKkNA==
X-Received: by 2002:a05:6512:3dac:b0:533:71f:3a3d with SMTP id 2adb3069b0e04-536ac2e86ccmr1961499e87.24.1726834233833;
        Fri, 20 Sep 2024 05:10:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612e1a55sm838937166b.157.2024.09.20.05.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2024 05:10:33 -0700 (PDT)
Message-ID: <e893f91f-6f78-46ac-b28d-1e45fab892e2@redhat.com>
Date: Fri, 20 Sep 2024 14:10:32 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: abituguru: Remove unused
 ABITUGURU_TEMP_NAMES_LENGTH macro
To: Ba Jing <bajing@cmss.chinamobile.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240903025037.9711-1-bajing@cmss.chinamobile.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240903025037.9711-1-bajing@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3-Sep-24 4:50 AM, Ba Jing wrote:
> The macro ABITUGURU_TEMP_NAMES_LENGTH is never referenced in the code. Remove it.
> 
> Signed-off-by: Ba Jing <bajing@cmss.chinamobile.com>
> ---
>  drivers/hwmon/abituguru.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/hwmon/abituguru.c b/drivers/hwmon/abituguru.c
> index 93653ea05430..58072af4676b 100644
> --- a/drivers/hwmon/abituguru.c
> +++ b/drivers/hwmon/abituguru.c
> @@ -95,11 +95,6 @@
>   * in??_{min,max}_alarm_enable\0, in??_beep\0, in??_shutdown\0
>   */
>  #define ABITUGURU_IN_NAMES_LENGTH	(11 + 2 * 9 + 2 * 15 + 2 * 22 + 10 + 14)
> -/*
> - * sum of strlen of: temp??_input\0, temp??_max\0, temp??_crit\0,
> - * temp??_alarm\0, temp??_alarm_enable\0, temp??_beep\0, temp??_shutdown\0
> - */
> -#define ABITUGURU_TEMP_NAMES_LENGTH	(13 + 11 + 12 + 13 + 20 + 12 + 16)
>  /*
>   * sum of strlen of: fan?_input\0, fan?_min\0, fan?_alarm\0,
>   * fan?_alarm_enable\0, fan?_beep\0, fan?_shutdown\0

ABITUGURU_TEMP_NAMES_LENGTH is used further down buy only in a comment:

/* IN_NAMES_LENGTH > TEMP_NAMES_LENGTH so assume all bank1 sensors are in */
#define ABITUGURU_SYSFS_NAMES_LENGTH    ( \
        ABIT_UGURU_MAX_BANK1_SENSORS * ABITUGURU_IN_NAMES_LENGTH + \
        ABIT_UGURU_MAX_BANK2_SENSORS * ABITUGURU_FAN_NAMES_LENGTH + \
        ABIT_UGURU_MAX_PWMS * ABITUGURU_PWM_NAMES_LENGTH)

So IMHO ABITUGURU_TEMP_NAMES_LENGTH should stay so that someone
reading the comment will actually be able to understand things,
removing ABITUGURU_TEMP_NAMES_LENGTH makes the comment very
hard to understand and we want to keep the comment.

So NACK from me for this change.

Regards,

Hans


