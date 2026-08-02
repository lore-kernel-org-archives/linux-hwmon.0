Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863B133122A;
	Sun,  2 Aug 2026 23:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785713744; cv=none; b=AQSCpHQeq5JuKO/ixyU83QYUkSgE/RFQvy3dRuqTJ0fOEJ3MlEbdTFCt0IbaYZUwabrfci0NA9gcFPxa178JyIMIwRHXeAu0D7QggCfBnadnsovPX+7vs4eHQOyBDVgUYaJIorodIxAbCMC3pFzAXlKjNoRkriyDzz4pzx3FKXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785713744; c=relaxed/simple;
	bh=W7zcRiFGyaNrQvObSSi/l5OlIyE3JoRUVoUVqeXAsag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePJOI5zkG3IzQJgwQpCbpWpxfyLSWwtQFF/kcuXcSNMJ7MilPt8Qrb4wf9VTD7dLGrK0LZ1d2ukNppguw2d6j5qTribr2VFINqSn8GgA4BUKfVW1fIB8sqU+SzmB8UNWtmVPE1ouqcCn/XZTeQTi90Di0TKPAotDKVzHwA+LUpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=RaYibu8y; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="RaYibu8y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1785713723; x=1786318523; i=w_armin@gmx.de;
	bh=5IK/7MNPUieng2zQGexfOG0gWaYu8+RZZunF3HEbAVY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=RaYibu8yOqgfBcMlrkezOal0m7cIqBTliHoqHDgqQ2jq3S3ZpIJLF7gf8AjcnWz9
	 6yonEYOAkkVIQMGF98fFB1Dvzq0hoxkN8bHXqMmKX1g3YB+nIOJ6+wVUCKJbsYbD3
	 IvnWfjAbRtdaoyexDzJ9zym9HsSknNdWqRK51yOdW1CzzmsK3Ym8lXfeqlt/OdUD2
	 MeHjN0uaFYry1e4mLOrXielxaApzOPH8qrhsXkGQFHqCjfc+7DLFVmoYmIeR+2hZr
	 cdxO5FYDzLy3Qh81EFiE5Ct4KlpPqgh35z/CyzETIRi8PUXW73zv241woUFjrGv8T
	 7Q1q3Wya9aUksr17JQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIdif-1wkuXW1tp7-002SyR; Mon, 03
 Aug 2026 01:35:23 +0200
Message-ID: <7ae981bd-ade6-45ab-84f9-a4ae631322dd@gmx.de>
Date: Mon, 3 Aug 2026 01:35:22 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: dell-smm-hwmon: Add fan control for OptiPlex Micro
 7020
To: Jonas Haugk <j.haugk@gmx.de>, linux-hwmon@vger.kernel.org
Cc: pali@kernel.org, linux@roeck-us.net, linux-kernel@vger.kernel.org
References: <20260802210318.345995-1-j.haugk@gmx.de>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260802210318.345995-1-j.haugk@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lHSJGurhG78VToCAD1I4rrF2z5oxT1DyvxEfpwyEPUjU/+PAFY1
 IqnTma55/OSOTtR+hsSC/xLbSCS1BICrvDjMz/cW/3Kj7Yo8pGrz0YdQcq8Fl5YcWq8gKIl
 OF8omyPI2KL6A67YDDd/R1j5sP/f46xodYgL/ejdB6jpd72DtTbknenWtYNhpdgpl51AGY6
 68yyCQxCeJZjgYMq5sRqA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CRBjHuN04ZQ=;BZASIzV1y8LsVDzyxvZ11i/cm/R
 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

Am 02.08.26 um 23:03 schrieb Jonas Haugk:

> Add the Dell OptiPlex Micro 7020 to the fan control whitelist using
> the 0x34a3/0x35a3 SMM command pair.
>
> Manual fan control was tested successfully with PWM values 64, 128,
> and 255. The fan speed changed accordingly. Restoring automatic BIOS
> fan control through pwm1_enable also worked correctly.
>
> Tested on a Dell OptiPlex Micro 7020.

Hi,

can you check if the I8K_FAN_30A3_31A3 pair also work? AFAIK this pair
is being used by recent releases of the OEM software, so i would prefer
using it.

Thanks,
Armin Wolf

>
> Signed-off-by: Jonas Haugk <j.haugk@gmx.de>
> ---
>   drivers/hwmon/dell-smm-hwmon.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwm=
on.c
> index 20920d4bd..23773421a 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1655,6 +1655,15 @@ static const struct dmi_system_id i8k_whitelist_f=
an_control[] __initconst =3D {
>   		},
>   		.driver_data =3D (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
>   	},
> +	{
> +		.ident =3D "Dell OptiPlex Micro 7020",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME,
> +					"OptiPlex Micro 7020"),
> +		},
> +		.driver_data =3D (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
> +	},
>   	{ }
>   };
>  =20
