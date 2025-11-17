Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552872F83D8;
	Mon, 17 Nov 2025 06:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763360485; cv=none; b=KWDUrxo5/S+39+JXdMhIrkvyoxs10FMl//9SvKyEkXeZVttJyabAWFu0e1hZrVGj2teoBX9rQVvUlNeWYAZiynBp2lu15eO5Fenic+IQzEQRsAf/b6lLx2nh/Msa9/sB/sD8bu7r3Oged8gKbgV182SCQBOsZeUZMFO3C1tXAyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763360485; c=relaxed/simple;
	bh=s1L0GVl5tQhGrARGYX3rC8EccVo6K63caawHq6/w+Qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTYuB4PirZiiUTfwn4x/cy2lSDi1wfqPN8uyLi5057YzV4qFarDNCb/8Kp1fLv9R/H4sUDb6vz381PWBuANZdcrSp6zVgET0KDNj1l7dlZueBMBPBxmHDotSvZYqsrAgk+Yju9QarXzfO1C/X+lCmR8Eze1+BNr/1gjcblsPOaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=NIN/bzAD; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="NIN/bzAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763360477; x=1763965277; i=w_armin@gmx.de;
	bh=WIxs36JoEjI78AaVdIxKTTzlbURlvV3y7vayCjW5a+Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=NIN/bzAD0HvB5CXmAjAu2P+99Fl1OXYZv5q040jOXgNAVb9B1yUTPFG5SANHkUq0
	 LFXPhF+qTJTsfqKHnxEmFQVMGNQTxG++9dzpnhhuNnyow+iYXmOm6F/PeULd1Zwkw
	 URHpSNxCfmbmiTny6V2/HfXHReYzaneLX31UPNrdvLt+C5w753Q22Lxcpj2dNxFBc
	 eHXoPfK0aHAU0BoWrmqT33YaqO6tlGnIla1fusJEXb/sqhJVxNAkANZB4JUOUUtJr
	 asep5AafX5SrPzQQDKCwEjQ2VcwlrVwt0saSyH69/6ZH2BNQIsvL+prRpVLqndOnp
	 uznrbnkkdfW141swvw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MqJm5-1vy0n023BD-00fsII; Mon, 17
 Nov 2025 07:21:17 +0100
Message-ID: <e95523ba-92b9-4347-93b4-3e1f0337529c@gmx.de>
Date: Mon, 17 Nov 2025 07:21:15 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] platform/x86: lenovo-wmi-helpers: Convert returned
 buffer into u32
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20251114175927.52533-1-i@rong.moe>
 <20251114175927.52533-2-i@rong.moe>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20251114175927.52533-2-i@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ieX2lQHpoZIvGQzDLygY3zgYGrjEuslQgw6QRg5ez3uRmSaHaS1
 FV35W1zgBiDcXc3xfw6dzLy/iqn+oGfMDj33yxeopRZTdskd3YPNQ4v17N702x3QpJMGagM
 GWYGa72mW4TPNcxlJ1+p2Y5OyYFwVGC7RsyzMcF7b4OW2+O+0ZITP8kM4IrcjyVbNrOKhu1
 XhKEap2wB7YEPunGYhZxw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WzUI4JbuhgM=;60cNnu7PPDg+UvoI7i64f1Rh9V7
 +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

Am 14.11.25 um 18:59 schrieb Rong Zhang:

> The Windows WMI-ACPI driver converts all ACPI objects into a common
> buffer format, so returning a buffer with four bytes will look like an
> integer for WMI consumers under Windows.
>
> Therefore, some devices may simply implement the corresponding ACPI
> methods to always return a buffer. While lwmi_dev_evaluate_int() expects
> an integer (u32), convert returned >=3D4B buffer into u32 to support the=
se
> devices.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Suggested-by: Armin Wolf <W_Armin@gmx.de>
> Link: https://lore.kernel.org/r/f1787927-b655-4321-b9d9-bc12353c72db@gmx=
.de/
> Signed-off-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> Changes in v4:
> - Accept oversized buffer (thanks Armin Wolf)
> - Use get_unaligned_le32() (ditto)
>
> Changes in v2:
> - New patch (thanks Armin Wolf)
> ---
>   drivers/platform/x86/lenovo/wmi-helpers.c | 22 +++++++++++++++++++---
>   1 file changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platfor=
m/x86/lenovo/wmi-helpers.c
> index f6fef6296251..ea0b75334c9e 100644
> --- a/drivers/platform/x86/lenovo/wmi-helpers.c
> +++ b/drivers/platform/x86/lenovo/wmi-helpers.c
> @@ -21,6 +21,7 @@
>   #include <linux/errno.h>
>   #include <linux/export.h>
>   #include <linux/module.h>
> +#include <linux/unaligned.h>
>   #include <linux/wmi.h>
>  =20
>   #include "wmi-helpers.h"
> @@ -59,10 +60,25 @@ int lwmi_dev_evaluate_int(struct wmi_device *wdev, u=
8 instance, u32 method_id,
>   		if (!ret_obj)
>   			return -ENODATA;
>  =20
> -		if (ret_obj->type !=3D ACPI_TYPE_INTEGER)
> -			return -ENXIO;
> +		switch (ret_obj->type) {
> +		/*
> +		 * The ACPI method may simply return a buffer when a u32
> +		 * is expected. This is valid on Windows as its WMI-ACPI
> +		 * driver converts everything to a common buffer.
> +		 */
> +		case ACPI_TYPE_BUFFER: {
> +			if (ret_obj->buffer.length >=3D 4)
> +				return -ENXIO;
>  =20
> -		*retval =3D (u32)ret_obj->integer.value;
> +			*retval =3D get_unaligned_le32(ret_obj->buffer.pointer);
> +			return 0;
> +		}
> +		case ACPI_TYPE_INTEGER:
> +			*retval =3D (u32)ret_obj->integer.value;
> +			return 0;
> +		default:
> +			return -ENXIO;
> +		}
>   	}
>  =20
>   	return 0;
