Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8C9347BD9;
	Wed, 25 Mar 2026 08:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774428316; cv=none; b=UfSCc7vIlIkMy60UFOG6ilXwtWXldefl8XkEXiVqYfvdOlqVvf2He6OZM1C4zqOCrkvlu6FoYVOYmADsebFkANukNrp/TOrLZhNipmrQ8veBIQESrYeoD+SjZtCrPF3LQhYlM/PO1gCgJTA/GB4NUfvi8HztKCGKwvk0rXT2sF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774428316; c=relaxed/simple;
	bh=RaxfN/o8jLEUzXDbWswxoJsPvsxzdUtRAYEbKG1akDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3N27mC1qwV0eA0iDwUl8LP8P7RmEZvlOfxui7Iyux6THjdeZwPiT3QkVv0NKgnSBi9o5nktlWgebQNvuK/MeDqACgM2Qz4wPikvxLGZbFDoFtyRtTcSiki14TR0T3n2sn7RcgOIbMocjylMuaaXByqdtc74Ye6RrGbHzLnJL48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOMiIoxA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOMiIoxA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B03F8C4CEF7;
	Wed, 25 Mar 2026 08:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774428316;
	bh=RaxfN/o8jLEUzXDbWswxoJsPvsxzdUtRAYEbKG1akDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kOMiIoxAdEp4GiakbpZiotB6tttGuzKnmpwV5f122bWFZT4n+YXYNbueEGFar8GEo
	 26HrmBtMrCCtzs3kpSbPXpmd3hzPCbO/wWEod7/BHSoOQh91sfbirmA+VLh4jwTUZM
	 li6gHqcocH98Jzu29B8ThzMW4+4+a43wv/oPhPbPM1170d+cTQBXVwvpaskvo3OQlC
	 XW1Uiz/eSitKTJK5AAVjWOfT9KDJAIA+8l3zk7Wf9ugeufBHzECBDCoXonteEJbvDI
	 InfGswTfcfp4iKXq2sFnpOEPR84I0/06Xr7IM7RiGDR7JKaFTSehIHlHFrjoxIxB1L
	 cAjw90taooKxw==
Date: Wed, 25 Mar 2026 09:45:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
Message-ID: <20260325-true-glistening-mole-a49303@quoll>
References: <1774354869-119736-1-git-send-email-zaixiang.xu.dev@gmail.com>
 <1774354869-119736-3-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1774354869-119736-3-git-send-email-zaixiang.xu.dev@gmail.com>

On Tue, Mar 24, 2026 at 08:21:07PM +0800, Zaixiang Xu wrote:
> Add YAML devicetree binding schema for Sensirion SHT30 series and
> GXCAS GXHT30 sensors. Wildcards are replaced with specific model
> names as per maintainer feedback.

Which wildcards? I do not see your patch replacing any wildcards. Your
patch only adds new code, so what "are replaced" means?

> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202603212044.BRPaiz86-lkp@intel.com/

What kernel test robot exactly report? That SHT30 is missing?

> Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
> ---
>  .../bindings/hwmon/sensirion,sht30.yaml       | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml b/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
> new file mode 100644
> index 000000000000..1b5ce822b37b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/sensirion,sht30.yaml#
> +$schema: http://devicetree.org/meta-schema.yaml#
> +
> +title: Sensirion SHT30 Humidity and Temperature Sensor
> +
> +maintainers:
> +  - Zaixiang Xu <zaixiang.xu.dev@gmail.com>
> +
> +description: |

No improvements. More comments were also ignored.

<form letter>
This is a friendly reminder during the review process.

It seems my or other reviewer's previous comments were not fully
addressed. Maybe the feedback got lost between the quotes, maybe you
just forgot to apply it. Please go back to the previous discussion and
either implement all requested changes or keep discussing them.

Thank you.
</form letter>

Best regards,
Krzysztof

