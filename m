Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D307222D780;
	Mon,  1 Dec 2025 19:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764616107; cv=none; b=UK7Fi/OziFoyXiWUywxk42BTe2rklqt8ZaQIvluCCqiyHiESPbaDs3FC0hblxjFqNi/5Cfprm7H0+V4bYaRwPneQAWfiCF8ipaB1WMsL4IXQdy9+gmzRsf7s2vZSaurbkXgTVvPF6Rp224kca5N3KX8lxJG2OLr7vFf9jIy07f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764616107; c=relaxed/simple;
	bh=6qGX9Os7lze/wnVFGAkH/o0d7iQaTOrifP7WUaadYRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8oUMTHW75uNb0pbIiH8uFOxwnEijAG8oNiO5XViBArmXaTsYKUoocsxoWCMFPV7L08wImNQhAAI+vc2GVWMiVHq/TJKI8tgp7233JCh8mHrvaOY8gZNxXYD00wNqcm8wftmbpL/s2PLgrKb2IKlSLL6jsFTVIj4iDZiYawmIBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/icLxbP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/icLxbP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45963C4CEF1;
	Mon,  1 Dec 2025 19:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764616107;
	bh=6qGX9Os7lze/wnVFGAkH/o0d7iQaTOrifP7WUaadYRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V/icLxbPMp7yHUNBx+yOtoE2WYwDEhAepf+uBqh8bMp+Ks4Zi6muGEr+JUGYBVgsx
	 gq1kg5FaQ4d8V2R5iU5hCB9hq9Lzxxtp0GndCd+Ey6P0CkPFO0DmBHGSioAJHxsmpA
	 qoZor6SBZwZfonZxzkOCiHJJisusM3zlaPqkA5vUoa1lMO+Ne5vzD3gN2hTWf8Nqa+
	 85e/iPjgKA3ek3Yz8FpZk3QfkdfFXBMd56/jaeVimn7P3H4qIUK/YgX2ykgJDldlNy
	 mf8kWkKtHlJJ7hNqIck7oyKguLwcE1celul14Jnh2Af4pV+lkuAc+yaBfHBS8m7X82
	 OjkWrnQtcRHiw==
Received: by pali.im (Postfix)
	id E2805700; Mon,  1 Dec 2025 20:08:19 +0100 (CET)
Date: Mon, 1 Dec 2025 20:08:19 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Gabriel Marcano <gabemarcano@yahoo.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell G5 5505 to fan control
 whitelist
Message-ID: <20251201190819.sum3d3b7tixxkzzj@pali>
References: <20251128191650.6191-1-gabemarcano.ref@yahoo.com>
 <20251128191650.6191-1-gabemarcano@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251128191650.6191-1-gabemarcano@yahoo.com>
User-Agent: NeoMutt/20180716

On Friday 28 November 2025 11:16:44 Gabriel Marcano wrote:
> Allow manual PWM control on Dell G5 5505 (and SE).
> 
> Signed-off-by: Gabriel Marcano <gabemarcano@yahoo.com>

Acked-by: Pali Rohár <pali@kernel.org>

> ---
> I tested this on my Dell G5 5505 SE, although there only seem to be
> three fan speeds regardless of the actual PWM setting (off, somewhere in
> the middle, and max).
> 
>  drivers/hwmon/dell-smm-hwmon.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index cbe1a74a3dee..683baf361c4c 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1533,6 +1533,15 @@ static const struct i8k_fan_control_data i8k_fan_control_data[] __initconst = {
>  };
>  
>  static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
> +	{
> +		.ident = "Dell G5 5505",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G5 5505"),
> +
> +		},
> +		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
> +	},
>  	{
>  		.ident = "Dell Latitude 5480",
>  		.matches = {
> 
> base-commit: 765e56e41a5af2d456ddda6cbd617b9d3295ab4e
> -- 
> 2.52.0
> 
