Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCD44ACC6E;
	Wed,  2 Sep 2026 19:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377700; cv=none; b=C7bIDTKWyDHuQlxG1ViHLus75brqJrQMqZMXz+9Jhd2ruZVmxbj9MgehVJEmdGsd7dwGHQDRezSL+bwYzbakykiWLQRBkNJhjcJPHfttUR7Ja7iSxOqqxPQnKdmeFp4SXyEyRm46E5iPGf6gakCPUyEyVC0XeKbVihBOn/A82vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377700; c=relaxed/simple;
	bh=8lHRTosbYTkc/WK4pNhPmpryo486FHWZUAMaA2AnLUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBctSAXzbbe8v8QVa1o2dYY7XTfq1hz6tmJg5em9zh1sGFdmlwrmZj7tMthb6q3CaH60rrqqlPH06vmll0d3I5EzvQBK3U7bK5BpnzJivcMbeu6VjorGLhqObq7DVGO0DBZ0SP//EVI1ZiyAP3aCI4Bn7+qSQCjNKskqW6XYVws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/4b16Ox; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/4b16Ox"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724641F000E9;
	Wed,  2 Sep 2026 19:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788377683;
	bh=ZReqLxOAJoSaS00tn2LAKhXDpGO3aAs9GKkZjobVThk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g/4b16OxtSt1QYH5sObTEcnkaAaKUKABo2ssuBXo+gGIYBAkWASsLQOuTztou6ozr
	 BH8+HiN04eO52mhBG2dAG6Th/7RIdmmNwH0QJjevy/7tC9xOibq7n8485/6vOi2Ckd
	 TwGwGWa5WRi4sbII+iKw3XBKeHiDLND0R2t2vMKyKmABNi9hgz4YuRPeZGxV55Hg/N
	 GmCD4SL8pmS0V9eUgGb2to7T2PazmCRGtzSlVa8LsUXlrMPkX8ZSgJM3M0YYGpp8eF
	 uJezjHpIDoyv4dkIAtX4mB7bvrZaKKFhh9CAQW+bzWxWhYhECgeDu4KABoKI1WZmYJ
	 MO6f/0B3XBlGA==
Received: by pali.im (Postfix)
	id 005ACA5B; Wed,  2 Sep 2026 21:34:43 +0200 (CEST)
Date: Wed, 2 Sep 2026 21:34:43 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, pp12313124124@gmail.com
Subject: Re: [PATCH 1/2] hwmon: (dell-smm) Add Dell OptiPlex 7090 to fan
 control whitelist
Message-ID: <20260902193443.z22mz6dyhnkcijbi@pali>
References: <20260901181849.241776-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260901181849.241776-1-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716

On Tuesday 01 September 2026 20:18:48 Armin Wolf wrote:
> A user reported that the Dell OptiPlex 7090 needs to be whitelisted
> for the special SMM calls necessary for globally enabling/disabling
> BIOS fan control.
> 
> Closes: https://github.com/Wer-Wolf/i8kutils/issues/18
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Both changes looks good:

Acked-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 20920d4bd81e..a3aa398a9f8f 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1631,6 +1631,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
>  		},
>  		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
>  	},
> +	{
> +		.ident = "Dell Optiplex 7090",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "OptiPlex 7090"),
> +		},
> +		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
> +	},
>  	{
>  		.ident = "Dell XPS 9315",
>  		.matches = {
> -- 
> 2.39.5
> 
