Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654DA37BE60;
	Wed, 29 Apr 2026 06:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444176; cv=none; b=S7rDb6hSm7CnTq9y2s2VTRuAxLDQWKuP2MnyyeIH4NuGo3vmAILjTaWCGjoo5ExywtA5FublkqIE3Ld4wfuGw73NGltnDovECaFQ55RRdFfN4maSN4OF3FtzWtQZyUw9HbEDBIbTtRMdtfwTQjv+9k0aFxdXcoxw5bZ6zMgnQBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444176; c=relaxed/simple;
	bh=h4Y2v/emr1S3IV8+k1qQLbpit4LK4eCy3pNHFH2GEBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDVoYbF3P5FtsKy3oEeTJS9GyxYjfwff0P8x/KDJx580hv6Cog1TMkWIOe6e79710rDx+YNyS4+fymxIm4GsYzYB9WFM06PT+FzkLFz+lKO/UJZQ1MtbfJai9eE7SR0jjkMw71W+a7y/qlMvTizNTSBDMgkbhXZcxadUv8DIQIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rq1vXB4o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rq1vXB4o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A8DC19425;
	Wed, 29 Apr 2026 06:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777444176;
	bh=h4Y2v/emr1S3IV8+k1qQLbpit4LK4eCy3pNHFH2GEBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rq1vXB4o7ipi+YG57JpiszH8FcOuDvavydCWx8CJpamv41NHshkPfxzQSxNg0kuen
	 KNskMKYmJ8JD2koYXIsAKqb63A+y33y46qgJSa7nPRoYnTvsm+sTugunkmMpPtxjt+
	 rdtynTk7yEX4P2zxVWq+dRlGXpY2T9S5Mg6K2AS7AiR+/8mkhAX4oreRuqYQbSL6uV
	 MdjlHiS/N9LC9ZN0W6vCiNOQx4CJQVbgjITjUOuM6QmhhdL0tQxRLNjhlleS5Ftv6G
	 3mIinSYHmwPlwP8krC0upWffl2Ki42U13XWI5qadz82okUX1WKV2+wyVhxIMBeBc9r
	 EYsJyhDH5VPfA==
Date: Wed, 29 Apr 2026 08:29:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/4] hwmon: (sht3x) Add support for GXCAS GXHT30
Message-ID: <20260429-scarlet-sawfly-of-examination-bcabaa@quoll>
References: <1777374569-59233-1-git-send-email-zaixiang.xu.dev@gmail.com>
 <1777374569-59233-5-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1777374569-59233-5-git-send-email-zaixiang.xu.dev@gmail.com>

On Tue, Apr 28, 2026 at 07:09:29PM +0800, Zaixiang Xu wrote:
> Add support for the GXCAS GXHT30 humidity and temperature sensor.
> The GXHT30 is software compatible with the Sensirion SHT30.
> 
> Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
> ---
>  drivers/hwmon/sht3x.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
> index 6437568aaf73..f52114c13edb 100644
> --- a/drivers/hwmon/sht3x.c
> +++ b/drivers/hwmon/sht3x.c
> @@ -934,6 +934,7 @@ static const struct i2c_device_id sht3x_ids[] = {
>  	{"sht3x", sht3x},
>  	{"sts3x", sts3x},
>  	{"sht85", sht3x},
> +	{"gxht30", sht3x},
>  	{}
>  };
>  
> @@ -948,6 +949,7 @@ static const struct of_device_id sht3x_of_match[] = {
>  	{ .compatible = "sensirion,sts31", .data = (void *)(uintptr_t)sts3x },
>  	{ .compatible = "sensirion,sts32", .data = (void *)(uintptr_t)sts3x },
>  	{ .compatible = "sensirion,sts35", .data = (void *)(uintptr_t)sts3x },
> +	{ .compatible = "gxcas,gxht30", .data = (void *)(uintptr_t)sht3x },

Drop, this is completely pointless. We asked for fallbacks for a reason.

Best regards,
Krzysztof

