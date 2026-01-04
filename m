Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F43D1391;
	Sun,  4 Jan 2026 00:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767485777; cv=none; b=gDbx69PIJ1+Q23HrFXMnWvYNkuqceAhILvkJxvJoM0UirmTW471nlAiO8t9oEZiP+aGp89KNNLvBM1uhprt//vvTrk3tHHSrmutLgn0c1XoI5m8apL/7W4hPywQTZuN46cUYgzngoVrke3hXmTdlEZQ77VU2OwtJYDpudc9eD/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767485777; c=relaxed/simple;
	bh=k6H0RQiZ4x6myzRO3Lod1Ko0I5CxPTUuogszp14z48I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxSg9FWn7TWvNxCyD+w8OpCm0fBSdA2X1maTehTx4mrAOIto8MkChXechC4O6s+GHf9FPxeTvel0aoqx3jIij1GIUP1wpy8Nb2iYNrnWBcAdo2UlIvzm3wlDkwDtlJ0At1SYmOslZpQsxDgJr/FirOQ0A3k55v3jyr8fmCnjoMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRGeTTEF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRGeTTEF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76164C113D0;
	Sun,  4 Jan 2026 00:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767485776;
	bh=k6H0RQiZ4x6myzRO3Lod1Ko0I5CxPTUuogszp14z48I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kRGeTTEFeWH3b0N2BNRxNv3XBNfKvp1J4MM4m3H9WSHuDt8Y9Xn+Nyq2fNxUQXeEV
	 Pz/xvt6U0T62UUAcwIXtMCE4ExhZB+0iDHCdV/67gacGDiIjegNmrwYnESUJy3P47+
	 KYkjgEQxCYCuNSBrz8Dp/wSQSoD6sj85YvaD9Lqld7K85oGkSBNdsBl0UZ7zWyEhPI
	 eYG8R8Jb8yBH+MznCMMydTiv6yVg6TUQ2I6fq4J/KW2dI0E+lLo8w0dAQ1cSuXXDKE
	 VIUQ3jHWYrLCOa2eRh6i6Ho+5Ye5Q8BB5qsQZIyBkWCQ2gdjG3HtqcEytxdK008R7l
	 YJH5c+w8tjR2Q==
Received: by pali.im (Postfix)
	id CF5CA7DE; Sun,  4 Jan 2026 01:16:07 +0100 (CET)
Date: Sun, 4 Jan 2026 01:16:07 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add support for Dell OptiPlex 7080
Message-ID: <20260104001607.yzr5xxabtnkrccls@pali>
References: <20260104000654.6406-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260104000654.6406-1-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716

On Sunday 04 January 2026 01:06:10 Armin Wolf wrote:
> The Dell OptiPlex 7080 supports the legacy SMM interface for reading
> sensors and performing fan control. Whitelist this machine so that
> this driver loads automatically.
> 
> Closes: https://github.com/Wer-Wolf/i8kutils/issues/16
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Acked-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index a34753fc2973..b9941e8d2c2d 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1316,6 +1316,13 @@ static const struct dmi_system_id i8k_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "MP061"),
>  		},
>  	},
> +	{
> +		.ident = "Dell OptiPlex 7080",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "OptiPlex 7080"),
> +		},
> +	},
>  	{
>  		.ident = "Dell OptiPlex 7060",
>  		.matches = {
> -- 
> 2.52.0
> 
