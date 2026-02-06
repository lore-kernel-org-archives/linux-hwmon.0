Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E9B329E76;
	Fri,  6 Feb 2026 08:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770365629; cv=none; b=R1ClmRo/4IdV8TGjUukl/DkbNGvN9y31siYLPVFDfYr7yRQfZwN6ZYQppiEXcKcjCdCkgDJgG+COrwJtHKZ6KQ2PvSqQ4ks3/X5smbiUkKiDpgeLoEfi2Z2IOf4Wv0UgaBtLoY9xPlYQSSMvRsUtr8fOc8N4S0znuQyZ+hHv9P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770365629; c=relaxed/simple;
	bh=XNd/ROqNyRqr73VdIsPaszFD6uulu/C2d7UO1LLQVMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7o3rUK3f8EiYgYJq8COrGbQdj0nMO30Ssp7/YspjpuEloBc+94q2AeJ6p8d2HlhV8juptLtDLCzFN/kCq4evQi/gHN19WqF9iDlYRaWnZ9ySTrlQ5YmH7fC2e2DHWWfWMJdeJBdrtprwpXVSn16gmYJzZlJ9IkakR3rdN9mPPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSdLnLKN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSdLnLKN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD4DC116C6;
	Fri,  6 Feb 2026 08:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770365628;
	bh=XNd/ROqNyRqr73VdIsPaszFD6uulu/C2d7UO1LLQVMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cSdLnLKNFicB/wGv9USjTmGWdswlkUQKYsSxCk59qtANCXuOZW3vTQAcKRQufyB1P
	 sJaTgnpAk/YxC74veb0YNZxPQbz1urocsqDz6PsK3BpQJc0VzzfUC+E0hU5Ab+ktFe
	 C9IlYpkSQV2nYMrdrIVHkMGvWFJBhkiQ5MtGicg/poorHGhVPLH0em9ip9XIwkoGQa
	 5UfkvZgzVGeR7HT1yl+xkcMBVcDvsF7MmYhmS2HXUGfMRkhGg8w3eQFTG9mG8TncYy
	 0RdaqBixwGouflZGkmGuUBiP3nhvuNt892lUJB6HrYgwnk3/2/d7bR3bDRezaur3Os
	 9/BEQ0GAFeXTw==
Date: Fri, 6 Feb 2026 09:13:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	amit.kucheria@oss.qualcomm.com, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pm7250b: Enable Qualcomm BCL device
Message-ID: <20260206-tidy-aquamarine-cheetah-2badc0@quoll>
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>

On Fri, Feb 06, 2026 at 02:44:07AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> Enable Qualcomm BCL hardware devicetree binding configuration
> for pm7250b.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm7250b.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> index 0761e6b5fd8d..69ad76831cde 100644
> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> @@ -202,6 +202,16 @@ pm7250b_gpios: gpio@c000 {
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  		};
> +
> +		bcl@1d00 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

Plus, I doubt this was ever tested. Considering lack of internal review
I do not think this should be posted.

Best regards,
Krzysztof

