Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBB6422E2E;
	Mon, 14 Sep 2026 09:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379207; cv=none; b=qKYDpFOtHdFgUn1olYnw4zIlkx+ztmL7ofQ5J17Pi8K4Plw8ukO7qz223Qb8zKjnvvOEykV1JfeFvfvl40u/O1ZhEsqmDq01vEfz/KyoS3CrhKJKV9RR2ZWfYNARpcCC30bIZY1cb8ffRhWDecitfFYYBlHyPwJy4COwZtSiJbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379207; c=relaxed/simple;
	bh=lS+9XuTpjBom2DBKwddJE40XyjbOHHwWOXaEGTwDF+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFM1AQlCjXXiyDANka+884/znC9XKUKmeR20OPBxFXrdw6082vC68O1O2cSeRVc0kSmbSJnSIBaYUXOG3ElQnNS7Ra4W4p6B6W5bg90lbOnm+Y+eoBvEjYGzeidaASYun1w9S723eZ70eQ3pk3gadrBsl+3lhNDnUYMg8T6hHBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FdIR3Vn9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FdIR3Vn9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11FD1F00893;
	Mon, 14 Sep 2026 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789379206;
	bh=mhz5uzgtNMHH22QP1l+pb1CqZKxxvnMWNnipmr2o8ik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FdIR3Vn94ThITfC5TvmEMIRAgzK5NS123SHDHHrWqWwPjzvDlvqhmARM2ujsWRz9g
	 MdRWnXlK7xSdJVsOJy3LdIq7FunIepDbq7fY1yCXXIK0P+h6tkK5fnfA67jP3nbWOW
	 +MLWPiCSY4HzqKVFrxtp1E1EoUTs7yQeFY18e+SQiZunsGobRK8CWxkSpQCSQKenxV
	 9orVwhpE2XbGhvoTl7cduoGCX5QY71SQufgz3jq1+YQmRmUEdSFeZs/mNXXMo/xM3c
	 g9DhM2djPtCYcONeHaTac+Iub5dWdvqsBR3TnQIKJK+gvl/KVMJshwMSZR6vtTlu1a
	 COoaUIsAIBY6Q==
Received: by pali.im (Postfix)
	id CBBA452C; Mon, 14 Sep 2026 11:46:46 +0200 (CEST)
Date: Mon, 14 Sep 2026 11:46:46 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Patrick Pepin <patpep@me.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Armin Wolf <W_Armin@gmx.de>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (dell-smm) Add Dell Precision 3650 Tower to
 fan control whitelist
Message-ID: <20260914094646.ver5js7ffkzilk27@pali>
References: <20260913112925.11393-1-patpep@me.com>
 <20260914080955.87925-1-patpep@me.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260914080955.87925-1-patpep@me.com>
User-Agent: NeoMutt/20180716

On Monday 14 September 2026 08:09:55 Patrick Pepin wrote:
> On the Dell Precision 3650 Tower, the EC ignores fan speed writes unless
> automatic BIOS fan control is disabled first. The I8K_FAN_30A3_31A3 SMM
> code pair works on this machine through the WMI-SMM backend: after
> writing 1 to pwm1_enable, all three fans (CPU, front, top) accept the
> three fan states and report matching RPM, and writing 2 hands control
> back to the BIOS. I8K_FAN_34A3_35A3 was tested as well and also works;
> I8K_FAN_30A3_31A3 is used since it matches recent OEM software.
> 
> Tested on BIOS 1.48.0 with kernels 7.0.0-30 and 7.0.0-31 (Ubuntu 26.04).
> 
> Signed-off-by: Patrick Pepin <patpep@me.com>

Acked-by: Pali Rohár <pali@kernel.org>

> ---
> v2: use I8K_FAN_30A3_31A3 instead of I8K_FAN_34A3_35A3 as suggested by
>     Armin Wolf (both pairs tested working on this machine). Pali's
>     Acked-by from v1 is not carried over because of this change.
> 
>  drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 7ed94a3db..99a58ed26 100644
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
> +		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
> +	},
>  	{
>  		.ident = "Dell Optiplex 7090",
>  		.matches = {
> -- 
> 2.53.0
> 
