Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A404225A2C6;
	Sun, 13 Sep 2026 20:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789330608; cv=none; b=KD53bb/FhUE5pReETIEjkCpHvNoMw7KsLhvQUcJY1ISSQVzdgZw7dWAhl+qAgnmUgTInFUJukXf1uCJ8G131iJn3TqfLsrH1B/AcTBcgg6emagz/yxtdh8PwF3//LsnOApVxngxbjqM5b+J9swapi6FeiiMJlFNmyPfQyVhu1Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789330608; c=relaxed/simple;
	bh=IMkiUvzRBFjUPd9uICPeSor56OyY6WFQq7caQRmrbbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hf9whwxpUNSIMBFthbNKWPITdzhXJkLIaj1wivZbOlqZSNJss4FK/jvtjzDNLkmVT0GjRGMgzEmdiz3UPtIQbv+tdiHgyi0O805fnZ8QAk5b8sUNwqCHMve6Sp8sf3yVeyB24/PzQ/RLwxomOofNNt4CeQBk3nAYF/cA2C/OgXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=cvrXXx2E; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="cvrXXx2E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1789330584; x=1789935384; i=w_armin@gmx.de;
	bh=yPSAdWZEpG86MkmcfavJu73calVaiZS6VXTkCCAb4P0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=cvrXXx2E0O4w1HcDI3/Fm9FaN89XZL+xpWdrScX+98iCMVzc0QEGM6JAK//PdBSF
	 7Ll3q3FPzeBSplGFYlLXunq9fMt18o2PSAeXQE4MbifX7kMOVIDcjh3GpBxbk+COm
	 FRawLmZLKrRpI5gaFF/IUiRzNB7pO75eLNbFKYJELlk94z1mou7jDQkgLKb6kLGm+
	 VP4Mfbtz7kwLhoyu01q7NCr4ADIXYKZXtWYXj9diRqWA3L+L+2y58Ur+aTCLFohaD
	 CcfcNrN2iLJWr2VYd9zg+aNmkkTpNIL+WxRDtGAkUIm9U1qG+/eeYvTkFM32HaViO
	 DWozVarHCsriJBGRZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuUnK-1wnuIX42mw-012fpy; Sun, 13
 Sep 2026 22:16:24 +0200
Message-ID: <c276dd95-8d35-476b-8ffd-5bd78bd3a689@gmx.de>
Date: Sun, 13 Sep 2026 22:16:23 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell Precision 3650 Tower to fan
 control whitelist
To: Patrick Pepin <patpep@me.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260913112925.11393-1-patpep@me.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260913112925.11393-1-patpep@me.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:snAH06Ed0BJgYPTA3wW3pXMFY/JtnhtDuChyEC24K9VK4H3Qo9M
 QN3DYns5qVwR95c6kWvr2ipLQnBCZjlaeoVRNg9xIa3Y4bXOd9cHM7WQJw+brnkPcIkNLj7
 JHQE/51eXCkpZEgG4463rnYLd2S2NIQ+V3YU9NJtMZ7YEUZCQs2dJ84wPCitEYbIWAfx5w+
 7UsSvYf2nzSeoVkkJENdQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6SZqUYWnFGE=;g0Xhs7ZcZZ2mS7ke8CvkJEMtvmF
 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
 nXhR0sTR1RsDT

Am 13.09.26 um 13:29 schrieb Patrick Pepin:

> On the Dell Precision 3650 Tower, the EC ignores fan speed writes unless
> automatic BIOS fan control is disabled first. The same SMM code pair as
> the OptiPlex 7000 (I8K_FAN_34A3_35A3) works on this machine through the
> WMI-SMM backend: after writing 1 to pwm1_enable, all three fans (CPU,
> front, top) accept the three fan states and report matching RPM.
>
> Tested on BIOS 1.48.0 with kernels 7.0.0-30 and 7.0.0-31 (Ubuntu 26.04).

Hi,

can you try if I8K_FAN_30A3_31A3 works too? Those are the commands used by
recent releases of the OEM software, so i would prefer using them.

Thanks,
Armin Wolf

> Signed-off-by: Patrick Pepin <patpep@me.com>
> ---
>   drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 7ed94a3db..47668634f 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1639,6 +1639,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
>   		},
>   		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
>   	},
> +	{
> +		.ident = "Dell Precision 3650 Tower",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Precision 3650 Tower"),
> +		},
> +		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
> +	},
>   	{
>   		.ident = "Dell Optiplex 7090",
>   		.matches = {
