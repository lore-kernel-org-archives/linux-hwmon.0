Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4683E5A36;
	Sun, 13 Sep 2026 11:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789299357; cv=none; b=e7fd/l9E0JMnylBIlAC4vCCbatOLjSBQ3KOT1apUv5GSHVXH65zj3Bnp1PNGxAMiRByRribfBF/79NsLiNTaO0GV/Sq0+hK2hjhTuLtkfwPT7vF0SgKj/qbW84NJ1KcWJ+8EogrKdXdR9Cq/JH/YVUKNiVY9+PEd2TJAlUaRMUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789299357; c=relaxed/simple;
	bh=978h5LoPCk7irylEPLFHX2c/2Rs7zx1ZBRSZXobpLdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awZDC4tq5zrAOEdZrY+BQoyB0OHqLFJELS1hTiU75uypkVYOn2baFt+K3hZPljmUtKfJR9+fIDZS634EHptmCPfViS66VVP6MfjJkl6/f7TGGr4NkTUX8axGYnSg8FZbZwpz7J27J7ux++waOMFmmIFjoDxi7fbavnbyESDjPHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PNOOd1hJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PNOOd1hJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 139241F000FF;
	Sun, 13 Sep 2026 11:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789299355;
	bh=1K2ULV56zNV9k9zDn3PKBVdYut5BOmHywUu4m95P7VU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PNOOd1hJobMeDY3GXAq9nX/kdfKofVb0WXAQFaiPTyOGjmpLbVrrlwIflk6V5wrLI
	 sXvuA0k3XDPTY+WYNWxJw/N6ZOE2llsRJX58bhr6ZIyS7keLw0oPcJjUpsMC+z13d3
	 /FA2po3Ltbutdw80Ikf7Cb/cosleG0wKYwIpr810+OfPVFwRnu1WALtTrmT87NNJo3
	 jQoI9MnuvxwjHIEAIpiKsclTOYRLfIkrFw0I4Rzoc/W8BA3zhyTuUsa5OfMXbUiOSM
	 HGMb1nHAk/gcqOKSCvS4J6pGHxnEKA1GNbgqKq2N6UkjESYHSd+m4Qaw7tA68aod0g
	 lPRd3m8g1h8tg==
Received: by pali.im (Postfix)
	id 89BC7A17; Sun, 13 Sep 2026 13:35:56 +0200 (CEST)
Date: Sun, 13 Sep 2026 13:35:56 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Patrick Pepin <patpep@me.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Armin Wolf <W_Armin@gmx.de>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell Precision 3650 Tower to fan
 control whitelist
Message-ID: <20260913113556.llwdz2mgtinpsima@pali>
References: <20260913112925.11393-1-patpep@me.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260913112925.11393-1-patpep@me.com>
User-Agent: NeoMutt/20180716

On Sunday 13 September 2026 11:29:25 Patrick Pepin wrote:
> On the Dell Precision 3650 Tower, the EC ignores fan speed writes unless
> automatic BIOS fan control is disabled first. The same SMM code pair as
> the OptiPlex 7000 (I8K_FAN_34A3_35A3) works on this machine through the
> WMI-SMM backend: after writing 1 to pwm1_enable, all three fans (CPU,
> front, top) accept the three fan states and report matching RPM.
> 
> Tested on BIOS 1.48.0 with kernels 7.0.0-30 and 7.0.0-31 (Ubuntu 26.04).
> 
> Signed-off-by: Patrick Pepin <patpep@me.com>

Acked-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 7ed94a3db..47668634f 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1639,6 +1639,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
>  		},
>  		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
>  	},
> +	{
> +		.ident = "Dell Precision 3650 Tower",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Precision 3650 Tower"),
> +		},
> +		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
> +	},
>  	{
>  		.ident = "Dell Optiplex 7090",
>  		.matches = {
> -- 
> 2.53.0
> 
