Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3309CA48
	for <linux-hwmon@vger.kernel.org>; Sat, 23 Dec 2023 11:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kxaJVxYi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159CBC433C7;
	Sat, 23 Dec 2023 11:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703331997;
	bh=CJFo2fyaZeAasywUA76iXWyXdfT7HxVeZinb4ToXUnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kxaJVxYilHYbyqJ50ctMitgZ8Imxy/jNQ1AkO9cieZ41h8U0E5Ap30MX0yXbqmvWL
	 DkC/jiXdi1dyJS0tULggXglhGnkAkx3P2icqhH/QVmS+1Mm63eSGM/anv/WMnOOF/X
	 4UKPtRvQlyxrNUDmiT5AvnoFTIHx3syf9m0JjTLY94EIa9pmYkbwKvGhtgRCuLyrw3
	 KWCaJzlBY0VIujcAnyTI9qyHNN0+i9PHPnQMir0n4pAKItSMcqwdfN+pzt/FpIujLa
	 ufxPagLfIR9Vn6y/B2/xNJuJ8OvEqdR+ZaKzGOz+wu6FdL9sN/9ALFCelr2iZGfmdZ
	 lVTglMESGiV5g==
Received: by pali.im (Postfix)
	id F18A5A3B; Sat, 23 Dec 2023 12:46:33 +0100 (CET)
Date: Sat, 23 Dec 2023 12:46:33 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Seiji Nishikawa <snishika@redhat.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Also add Dell Precision 7540 to fan
 control whitelist
Message-ID: <20231223114633.qnhtxesp43qv7coh@pali>
References: <20231223073658.354773-1-snishika@redhat.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231223073658.354773-1-snishika@redhat.com>
User-Agent: NeoMutt/20180716

On Saturday 23 December 2023 16:36:58 Seiji Nishikawa wrote:
> This patch, in addition to 95d88d054ad9 that added Dell Precision 7510 to fan
> control whitelist, also adds Precision 7540 to the whitelist, which allows manual
> PWM control on Dell Precision 7540. It has been confirmed that the same SMM
> commands work to enable/disable manual PWM control on Dell Precision 7540.
> ---

Acked-by: Pali Rohár <pali@kernel.org>

>  drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 44aaf9b9191d..f946257f72c6 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1330,6 +1330,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
>  		},
>  		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
>  	},
> +        {
> +                .ident = "Dell Precision 7540",
> +                .matches = {
> +                        DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +                        DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Precision 7540"),
> +                },
> +                .driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
> +        },
>  	{
>  		.ident = "Dell XPS 13 7390",
>  		.matches = {
> -- 
> 2.42.0
> 
