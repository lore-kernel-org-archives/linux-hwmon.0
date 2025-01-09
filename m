Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AFA205AA4;
	Thu,  9 Jan 2025 23:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736465082; cv=none; b=GXfRLF75qOk1kIn7TKgvgf1nB6fk3HVzNnW0Um9raBX+panGxQcU+NoDfS5QNJVa7THQlBdNFDHKQXDE1dREBb2IESTE+nwrd+l0bc6KmpL6tkbT0CQbq8e+bOOTUC0Djz2leBp0pnlaDBWu8rcF+WqGxTWYx3TTDRYhoCT4lSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736465082; c=relaxed/simple;
	bh=Gl9lmZ2a79oaoLsc1dz1GhJ+30NrCC6WBkkQ7+S75Z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPiymwK6UmofwCjFfDs/UVa/+Wcfmus/2MlL62V1vcVud2Kcxou2vwoKTl+Q1nrHSaDE+qx6MUySdkxVZMXhkXOzin5viApzippG9jOusIKSTOI8KwBiHElfT5d+Cx8xSge+kwO7IUIAsAcLrq4aEcBcln44H2zcbiBQdm1whCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=LXAEvdoI; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="LXAEvdoI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736465065; x=1737069865; i=w_armin@gmx.de;
	bh=bSTm8ueLmPgu+c77HaQhcGZ5tRS8niar/GIbqm/qFZU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=LXAEvdoI+Pf+54dahNeJ0jiSQRpz7//aFydngMqXtMKcCgovqSgcQ0varCmRGbAy
	 ZNb+K9WtZHxjI0D0+JX03yKugkDtquqpiCPLmknSW24K1czlBXux+EZOsheoObTpX
	 tJ7u02MOLZx2vM2XZ0CRg9bpRNW5c2MR+axx/qUFit16vKK64vd37K6pR3k3k1F/P
	 2qgNGc9KB4X5R6rOOxN7Uwa7bhr8g0snK/RmSsRhtWa7FC7ojC/A9jpPUDEczEnqn
	 lhnQXj69KJXrlqpIhhVeUUjpJ6A1Io01ARhLlrwLItACmiDAFCA2odOV48LeTLAu/
	 dU2nsoWcFDFWpne8DA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLiCo-1tnYls2v5s-00VYr7; Fri, 10
 Jan 2025 00:24:24 +0100
Message-ID: <e0793623-ab74-49b1-b648-ec5297f2c037@gmx.de>
Date: Fri, 10 Jan 2025 00:24:22 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (dell-smm) Add Dell XPS 9370 to fan control
 whitelist
To: Povilas Kanapickas <povilas@radix.lt>, pali@kernel.org
Cc: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <6e6b7a47-d0e3-4c5a-8be2-dfc58852da8e@radix.lt>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <6e6b7a47-d0e3-4c5a-8be2-dfc58852da8e@radix.lt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:NNp1fvNhVDQ1ibL3jfQbWEIs1t3eU2aQJa9yegUo1/HW4ttE076
 kt50N1qvwRV6bRcYWOOtrKqpqVKqwRQWsiLTUbmZSH0UeuY6AXdwx08T85Mvi33o+TteY/8
 pQS27q6P8+6CaedQv2iHgdbOLnFTKL98BxngFHUnVDW1VYJWuSI7tKlHFTU+rzd5Q3IUl9K
 oSJV1niVER3IURC7zy3/Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oVDYIQHZ9p8=;SvW91QeU+swlhQ0OjxsWoY2G0vg
 1ukplzfSXN+UDiRzmRn6ARMUDOwmM59jLfPIFO4LOc1Hr90xKuhEwVkbmaWwWYYmNLX86RFJW
 qvJgmN4g/aKFDa44xrimFtIAafVdRD8tDX6r8ZcNi0FDad6NL26Q1FUYlKHnOi1qDReOLMNUF
 ELMBc1+3r6lIdp8bi9jJ63UepUghR8GHHed3XgCPUXI1iw7yaDuHp67zWhtwokYsMq3hYPBZV
 SdCR5MfYO6cOEQVvXZS2FuJL7hs4m+bn+u3yZ0tpX+CuSjTWLdKqeseMh7YGcJTeI+JqqVUTf
 aUL8kzAVy1LEqB6GYgjtoci2QDlK8u7HrBo4S9Na5TZoH/3TpJ/XdocYuBh0l3Mnr69G9myTD
 zMgE2SzuF+HBwqMsIJLAQvidmtTQk/2oLfdSD0R5ZpoTpOKD9oYmf73zro3yREznFpHrjhXCy
 b8buVr2YoE/+JEwkTENRBu0cnIpOdi3YD2sx7pF/RnBR7xBHLKiM2Lc7EvKFMDuPyHE08YYbp
 MpA9imX4HwgX1MGLMhNMOQFu+v+P1viMSMfWTGlLkxftRFoemNZlJPJwth+JECaRd3scimAQO
 TBNYRXIeyZa25dGwUdhHdL66kBmy4E1uYKbnGV0Hg5Mfcqa+J5+4cSCfWwAecmKi9L9391/nm
 e23HbbDJv3ZmQUceii6g9jx7WFDKeb5Ed9yKwTq7FU5s20i/c1jsm5WQ7VusucBGiNhStAZZ3
 BXSF7xtGA/mQ8tJ7JzPBbeR6iIWpRy2tTx950hpdbEqzd4Yqxso3fLt8EXgx2mHNiS7kdQzSo
 h//v3IYNzBIyMQZF/WT5bAXw9DSx97zkQlG1ZfVHB0u5IUc7EPYzAgp+wLT99CKuJeyHwSuBO
 qBBZR2E9xCQ/rKwI4yxO+JubMRvc4+5NuaHPl9EWKPTaLivFoIQbEiFryiU6G72DAnbawwwk0
 IYT0Esn/DRj0RE/tpognzKWxS5io0ZBqN4ZW5GMfpzfeWZH60tYGDS7+MHfWYt2fWAIUFEStw
 VfH3e0qZNRHpYJXi5UFcrBdq1PEJdymrebg9pSymgQhFk7YeRvDdiyFtRiM1nV2mXlVlCK9fC
 qIl3fo1KIwrqaSJ4E/yby7IH26AWXW

Am 09.01.25 um 22:07 schrieb Povilas Kanapickas:

> Add the Dell XPS 9370 to the fan control whitelist to allow
> for manual fan control.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>
> Signed-off-by: Povilas Kanapickas <povilas@radix.lt>
> ---
>
> Notes:
>      v1->v2:
>      * Use I8K_FAN_30A3_31A3 call instead of I8K_FAN_34A3_35A3.
>
>   drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index f5bdf842040e..cd00adaad1b4 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1544,6 +1544,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
>   		},
>   		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
>   	},
> +	{
> +		.ident = "Dell XPS 13 9370",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 13 9370"),
> +		},
> +		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
> +	},
>   	{
>   		.ident = "Dell Optiplex 7000",
>   		.matches = {
