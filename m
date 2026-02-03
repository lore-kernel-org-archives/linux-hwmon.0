Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39813207DE2
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Feb 2026 08:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770105983; cv=none; b=W7JE+OiiBomG5BEjhVccKHS5s96elTclIkLyNWQKUbVX0PDvxyVQbubR2hWS/Dg6jHbbMnyHp8JkUU/OCPNnIoqx3Ed1eHpxbEwpIGLu9b5xlqLlLZ1Xmh1Bw8gY+ekUiCjG7Iw4psJPkADbBgMLx4bgBDGDf/hkOrtcILhksCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770105983; c=relaxed/simple;
	bh=NJIJqQS8cW4RoEtwWgdI7cpX88OpnhDxAQGZxVt7VFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTlktqLRp+P+/7p9ZO8Z65SYWGEYWZGaPUSYEN28zc4Cg9r8PD2oq9iBTNjxlpsDwLV+GY9+2NeB/7wWHgXH5ZYz2taqsR1X3FiaTiVDQC+mKv9pEsV2tKeAdGC2iH7mBu2nbKGcgREF1j8QO27IwM/AiWVk6b+4ZCgUFxX940c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmZFHtA4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmZFHtA4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B284CC19425;
	Tue,  3 Feb 2026 08:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770105982;
	bh=NJIJqQS8cW4RoEtwWgdI7cpX88OpnhDxAQGZxVt7VFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OmZFHtA4Em/ABMPaiFDXAPCYlIzlpvVejoHEV8NdQR1K3t1SD9/N++dCJbb8DHzzz
	 7hb1ticVk7KnHBgjW6jm8uk1SQTSQZqnr/OsCqqJVT8q0IijqBjSg9vTodWZFLc1oU
	 D71qlpaD7CVNU2awUCL1pjD2hCFyU6phNyBdBexSWDcXgE5FeKKYuS5KqqmaY2Ocfg
	 Jg5D07mQRuah6k1Y77qUuP6XaFW++W0TXj1Vy6kk+YYRqf9/A2w7Bm78fWRfCcClMf
	 ZvDa35wgPqLe+YkvXC6UpdknO8ZS8FX848jG9dZvA0ytEIpsRD5a6FmU+wi3CQQ19J
	 kX4al/9U33Img==
Date: Tue, 3 Feb 2026 01:06:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
	James Calligeros <jcalligeros99@gmail.com>,
	Neal Gompa <neal@gompa.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 1/2] hwmon: (macsmc) Fix regressions in Apple Silicon SMC
 hwmon driver
Message-ID: <20260203080619.GA1329615@ax162>
References: <20260129175112.3751907-1-linux@roeck-us.net>
 <20260129175112.3751907-2-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129175112.3751907-2-linux@roeck-us.net>

On Thu, Jan 29, 2026 at 09:51:10AM -0800, Guenter Roeck wrote:
> The recently added macsmc-hwmon driver contained several critical
> bugs in its sensor population logic and float conversion routines.
> 
> Specifically:
> - The voltage sensor population loop used the wrong prefix ("volt-"
>   instead of "voltage-") and incorrectly assigned sensors to the
>   temperature sensor array (hwmon->temp.sensors) instead of the
>   voltage sensor array (hwmon->volt.sensors). This would lead to
>   out-of-bounds memory access or data corruption when both temperature
>   and voltage sensors were present.
> - The float conversion in macsmc_hwmon_write_f32() had flawed exponent
>   logic for values >= 2^24 and lacked masking for the mantissa, which
>   could lead to incorrect values being written to the SMC.
> 
> Fix these issues to ensure correct sensor registration and reliable
> manual fan control.
> 
> Confirm that the reported overflow in FIELD_PREP is fixed by declaring
> macsmc_hwmon_write_f32() as __always_inline for a compile test.
> 
> Fixes: 785205fd8139 ("hwmon: Add Apple Silicon SMC hwmon driver")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://lore.kernel.org/linux-hwmon/20260119195817.GA1035354@ax162/
> Cc: James Calligeros <jcalligeros99@gmail.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Neal Gompa <neal@gompa.dev>
> Cc: Janne Grunau <j@jannau.net>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Thanks, I build tested this with all affected clang versions and saw no
errors. I cannot say if it is correct from a hardware perspective
though.

Tested-by: Nathan Chancellor <nathan@kernel.org> # build only

> ---
>  drivers/hwmon/macsmc-hwmon.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hwmon/macsmc-hwmon.c b/drivers/hwmon/macsmc-hwmon.c
> index 1c0bbec7e8eb..40d25c81b443 100644
> --- a/drivers/hwmon/macsmc-hwmon.c
> +++ b/drivers/hwmon/macsmc-hwmon.c
> @@ -228,25 +228,22 @@ static int macsmc_hwmon_write_f32(struct apple_smc *smc, smc_key key, int value)
>  {
>  	u64 val;
>  	u32 fval = 0;
> -	int exp = 0, neg;
> +	int exp, neg;
>  
> +	neg = value < 0;
>  	val = abs(value);
> -	neg = val != value;
>  
>  	if (val) {
> -		int msb = __fls(val) - exp;
> +		exp = __fls(val);
>  
> -		if (msb > 23) {
> -			val >>= msb - FLT_MANT_BIAS;
> -			exp -= msb - FLT_MANT_BIAS;
> -		} else if (msb < 23) {
> -			val <<= FLT_MANT_BIAS - msb;
> -			exp += msb;
> -		}
> +		if (exp > 23)
> +			val >>= exp - 23;
> +		else
> +			val <<= 23 - exp;
>  
>  		fval = FIELD_PREP(FLT_SIGN_MASK, neg) |
>  		       FIELD_PREP(FLT_EXP_MASK, exp + FLT_EXP_BIAS) |
> -		       FIELD_PREP(FLT_MANT_MASK, val);
> +		       FIELD_PREP(FLT_MANT_MASK, val & FLT_MANT_MASK);
>  	}
>  
>  	return apple_smc_write_u32(smc, key, fval);
> @@ -663,8 +660,8 @@ static int macsmc_hwmon_populate_sensors(struct macsmc_hwmon *hwmon,
>  		if (!hwmon->volt.sensors)
>  			return -ENOMEM;
>  
> -		for_each_child_of_node_with_prefix(hwmon_node, key_node, "volt-") {
> -			sensor = &hwmon->temp.sensors[hwmon->temp.count];
> +		for_each_child_of_node_with_prefix(hwmon_node, key_node, "voltage-") {
> +			sensor = &hwmon->volt.sensors[hwmon->volt.count];
>  			if (!macsmc_hwmon_create_sensor(hwmon->dev, hwmon->smc, key_node, sensor)) {
>  				sensor->attrs = HWMON_I_INPUT;
>  
> -- 
> 2.45.2
> 
