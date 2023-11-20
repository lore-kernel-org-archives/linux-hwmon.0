Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MZqqfiBg"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8778BC5
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Nov 2023 05:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700485423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dsTV9hzS/0B5EbsiEzoDO0gYdNONcp7cbm9SpTTMYiI=;
	b=MZqqfiBgIq2BGTOh3R1xqDnZtju5FtKBH21Qvxs5FaLJ5uI0rf5lFGdD4Oy4SrXXXdEY9Q
	o/57x7doTk2XUHhvp1SJP7vd231nTBUxNovNT0ErnAHGAFOwQZpZjutKE5q1Dp6npknySg
	70sw6Q/Ic/H6FKSDmh5026LE34cBn8U=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-lb0Hxy8oPjq_H5HsVfBqrQ-1; Mon, 20 Nov 2023 08:03:42 -0500
X-MC-Unique: lb0Hxy8oPjq_H5HsVfBqrQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9fd0a58549bso155664566b.0
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Nov 2023 05:03:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700485421; x=1701090221;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dsTV9hzS/0B5EbsiEzoDO0gYdNONcp7cbm9SpTTMYiI=;
        b=eq6ozBz1+C8hRTR19VEbQV8INTbL2vdsieR8CEgdkyv9BQ2NVCaZ5rUol/yp4o8HQT
         /m5DtXY9yGU4/bv2G9iOLI82PnZfcY0c40t0koBQIcF+sORboY1Jj6nXI36EU8ZhdGI1
         B20be2BX8WA5M0XA/fyRsa+NYzbOSs2EQ1BJyr+ABW3LcG6fsUM8ddfGtChz/VBy41fe
         FPdoGtFCBJ+asr0GNwBvXZlddDBAqjPcBKEePRSCY9Cr4UdDIoaywTnU70DntIoLg4X2
         JdPYtF4M/r2N42wT4wZOU4jPj9V4VRaDgx53rIdskBnPzqEi1ndHQF2CAD8gVK1fqCwW
         ZJ8w==
X-Gm-Message-State: AOJu0YwjYpLfEfyahFKU7V1MYllSYXN7OxpewZJQeAifsWInsdtGY0TR
	o7d3KqPcB8i0xMYAbVnDQoIlPsv9LewD6aNyo4DD2WRoBcNsNW0K4t7yQ9D+Ngq2ZYZSY7RjrRu
	VnlBo3ERqh9kRj1UpylXZwj0=
X-Received: by 2002:a17:906:74d1:b0:9c7:59ff:b7fd with SMTP id z17-20020a17090674d100b009c759ffb7fdmr1654721ejl.28.1700485419639;
        Mon, 20 Nov 2023 05:03:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPjEsbuEEIaUIArhY1AgjwEjuTEwqwN5UTyYfgqM119Vssoq6o/xtThwl7pAfiCxf1Bhgg3Q==
X-Received: by 2002:a17:906:74d1:b0:9c7:59ff:b7fd with SMTP id z17-20020a17090674d100b009c759ffb7fdmr1654615ejl.28.1700485417356;
        Mon, 20 Nov 2023 05:03:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q16-20020a170906b29000b009b2cc87b8c3sm3888073ejz.52.2023.11.20.05.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 05:03:36 -0800 (PST)
Message-ID: <bee1f739-b41c-4842-bdbd-80315be2d412@redhat.com>
Date: Mon, 20 Nov 2023 14:03:36 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] hwmon: (dell-smm) Add support for WMI SMM
 interface
Content-Language: en-US, nl
To: Armin Wolf <W_Armin@gmx.de>, pali@kernel.org
Cc: markgross@kernel.org, ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
 linux@roeck-us.net, platform-driver-x86@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231106064351.42347-1-W_Armin@gmx.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231106064351.42347-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/6/23 07:43, Armin Wolf wrote:
> This patch series adds support for an alternative SMM calling
> backend to the dell-smm-hwmon driver. The reason for this is
> that on some modern machines, the legacy SMM calling interface
> does not work anymore and the SMM handler can be called over
> ACPI WMI instead.
> 
> The first four patches prepare the driver by allowing to
> specify different SMM calling backends, and by moving most of
> the DMI handling into i8k_init() so that the DMI tables can
> keep their __initconst attributes (the WMI SMM backend driver
> does not probe at module init time). The fifth patch does some
> minor cleanup, while the next three patches implement the new
> WMI SMM calling backend. The last patch adds the machine of
> the user who requested and tested the changes to the fan control
> whitelist.
> 
> If the driver does not detect the legacy SMM interface, either
> because the machine is not whitelisted or because the SMM handler
> does not react, it registers an WMI driver which will then bound
> to the WMI SMM interface and do the remaining initialization.
> 
> The deprecated procfs interface is not supported when using the
> WMI SMM calling backend for the following reason: the WMI driver
> can potentially be instantiated multiple times while the deprectated
> procfs interface cannot. This should not cause any regressions
> because on machines supporting only the WMI SMM interface, the
> driver would, until now, not load anyway.
> 
> All patches where tested on a Dell Inspiron 3505 and a Dell
> OptiPlex 7000.

Thank you for the patches.

Other then the signed int vs unsigned issue which Pali pointed
out this looks good to me, so with that fixed:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Note that the signed vs unsigned int issue needs to
be fixed in at least both struct smm_regs as well
as in the register parsing, specifically in these lines:

static int wmi_parse_register(u8 *buffer, u32 length, int *reg)

	int *registers[] = {

Also I think it might be better to use u32 instead of
"unsigned int" here. But I'll leave that choice up to you.

Regards,

Hans







> Changes since v2:
> - Rework WMI response parsing
> - Use #define for method number
> 
> Changes since v1:
> - Cc platform driver maintainers
> - Fix formating inside documentation
> 
> Armin Wolf (9):
>   hwmon: (dell-smm) Prepare for multiple SMM calling backends
>   hwmon: (dell-smm) Move blacklist handling to module init
>   hwmon: (dell-smm) Move whitelist handling to module init
>   hwmon: (dell-smm) Move DMI config handling to module init
>   hwmon: (dell-smm) Move config entries out of i8k_dmi_table
>   hwmon: (dell-smm) Introduce helper function for data init
>   hwmon: (dell-smm) Add support for WMI SMM interface
>   hwmon: (dell-smm) Document the WMI SMM interface
>   hwmon: (dell-smm) Add Optiplex 7000 to fan control whitelist
> 
>  Documentation/hwmon/dell-smm-hwmon.rst |  38 +-
>  drivers/hwmon/Kconfig                  |   1 +
>  drivers/hwmon/dell-smm-hwmon.c         | 603 +++++++++++++++++--------
>  drivers/platform/x86/wmi.c             |   1 +
>  4 files changed, 453 insertions(+), 190 deletions(-)
> 
> --
> 2.39.2
> 

