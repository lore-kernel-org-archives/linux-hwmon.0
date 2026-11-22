Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376183;
	b=nMMDRnbAsszyeQ2V/3KF5h1wPcMbp6NuOU3oRqEW5wOtFUKpCP8KV0UJz9oB/Il8IXaB
	 aJkmrAYrqm10N+AdRXu1q1ZaWvQ5hqUQr8v2/Hnw71ZyTvrDmA2DMNkwa/n5aHdQuecJS
	 TqnV2VssYDUmT9F/db1dKoa6d5LEA1S75YdStvPeRhDvuf4VMf9bs+uweaKfvNOdCd62T
	 oe+ix4TEjm6t8AEXKoGWwoxuFsEFJlnRQ8IYyHobMB4uNMpdmkL6S63niZ9cOna8Erp4Z
	 APPgXNJqGtYeT8+8kLHdAN8TPl/l21Ev1Yb2fx1uK0SJj3VL5bcCA2r3YTf78pQJpsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376183;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:User-Agent;
	bh=0tIgsMPaa6i9Oo7K90W8akAeNnb4ZgWkJss9muDKODY=;
	b=uvC/TxK5EZFH/gwUJi6piiGVfeslLSnBAxYTgIj0iAiJwtELqqTPFu4DNfx0ftlE4CHI
	 2O9U8eD4GrHtmwTZfeLfuuJRPDuZR+jFY72T+3dzKGDAINA8MzOuPc7VimBz/Xrx+b1bi
	 x0749TUe08Yq2R9XAEqzjGflkW+jmoKy5uVh8WXaZtXhQs1Ym1QgQJrWCSRtmfGxWCcXg
	 uSEtb3KWEq4qKg3ZcdWxVpcWMWcKi4s/5M0qGk6CVH1BdgkhTya4Wr49AlMp6wRLkQqiQ
	 EBXoPfCehhDC46+iGYDLsJsKXL5niruEulOHad8Gi12rHqjuMIIcBQ3nd1xIUNHZyXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="D/VeIyVR";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E8E606A336;
	Sun, 22 Nov 2026 19:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D/VeIyVR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8A21F000C4;
	Sun, 22 Nov 2026 19:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795376182;
	bh=0tIgsMPaa6i9Oo7K90W8akAeNnb4ZgWkJss9muDKODY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D/VeIyVR0qQKVn0r3dFlix/qES6GAP80dBVh3RC+88Lkw9oeYWKIPJYHHjbvsZhyW
	 6p434NnvC1G+l+SPnx1ppHUQNv1MNSGp60dFiqF/AVLsNW+wtrYIn7ThNQtzE2HaKB
	 ZB5IvlMmvWGmoLMP8bZPdmQMmcV+Iejy94+nXh+6d2KX2OkVDNw/CCZ2Oes5Cwj+S7
	 hT7mxAy6DLvKUHGTWYElVbXg+AE/cV/CjboLilG1+ghw6aX8hvEY8tNBGaUHxoGPia
	 0PrDSqJ998JcjAENor3anox3sU3dCnOoY6y/Leh6f7JFxFpveUDvv1SNFDfPoHsrbg
	 LXjlHp7hp35OQ==
Received: by pali.im (Postfix)
	id 9FC8D812; Sun, 22 Nov 2026 20:36:18 +0100 (CET)
Date: Sun, 22 Nov 2026 20:36:18 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Ivan Popovych <ivan@ipvych.com>
Cc: linux-kernel@vger.kernel.org, linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (dell-smm) Add Dell XPS 15 9550 to fan control
 whitelist
Message-ID: <20261122193618.vzk3hnhqngpi2gtc@pali>
References: <e4e133c6-db41-4776-a73e-e8e051eadec4@gmx.de>
 <20261121230738.4970-1-ivan@ipvych.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261121230738.4970-1-ivan@ipvych.com>
User-Agent: NeoMutt/20180716

On Sunday 22 November 2026 01:07:38 Ivan Popovych wrote:
> Confirmed on my own Dell XPS 15 9550 running BIOS version 1.14.0
> running "echo 1 > pwm1_enable" disables automatic fan control and
> "echo 2 > pwm1_enable" enables it back.
> 
> Both 30a3/31a3 and 34a3/35a3 commands work on this laptop, using
> 30a3/31a3 as these are the commands used by the official Dell
> software.
> 
> Signed-off-by: Ivan Popovych <ivan@ipvych.com>

Acked-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 5963f908972f..3645157620fd 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1640,6 +1640,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
>  		},
>  		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
>  	},
> +	{
> +		.ident = "Dell XPS 15 9550",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 15 9550"),
> +		},
> +		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
> +	},
>  	{
>  		.ident = "Dell Optiplex 7000",
>  		.matches = {
> -- 
> 2.56.1
> 
