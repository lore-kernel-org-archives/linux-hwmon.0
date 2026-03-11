Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82543BED1D;
	Wed, 11 Mar 2026 10:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773223282; cv=none; b=Jy8wBN7aep3jwjkREuj+ASFxyALPhS9h98N4ke+nGqeKzww8kk49JTBEWpirbfFqqCPG7/SGt3UMyFHmDnOL5O1pAJ/9J9M1l23rGI1apRBefGfQGn/JNHzVL4/96OhoJ60YR0Nvzv7xkZxIGcJNoNBXocbODArvchdGt4D3qO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773223282; c=relaxed/simple;
	bh=ulffV5/BKejV+qrmCDDCsRkAG0zi1YZGHgeohqakI2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9ay13fj9aZ9QsN7KlDzK/PBM08hqWEhhgb9s6p8vM+ISmg51jc2VtdClnVvkzrf+4Sq/ZtMvDi6JsgYHNZKLCNys+JBfGDfdSiFHIpriisxoSWlKJ23EB02f4osVn9BYz40POJ/bWTgJ1t/KQgpcCI1iuSb7oXeycKfcsJrTxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mkp32s1z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mkp32s1z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0ACEC4CEF7;
	Wed, 11 Mar 2026 10:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773223282;
	bh=ulffV5/BKejV+qrmCDDCsRkAG0zi1YZGHgeohqakI2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mkp32s1z/qDMTAsc90120NuWxDNSf3SdwpTtuZQ13SuRtVcqTTICS5kFnBpJkkMd0
	 hC3U+4H5OvgUZvmLBhZF+bY5HpH/RS7LcxMRaC8Vz4NjiKH5Ht/SsCXpDikklH+hUx
	 TIRI1x5RQeixIu9C2CTxYg8Y438kB4gSLaBNr5PPfrvYOoA8cXPqJ2GXYsSoyYCrwd
	 gjX0KWIS0owrN63vpfZKEXLwWaPfFagXUIvbm+r0gnA/pc5ZRjbKPJbL1YnsB1k0cs
	 gmOnmfk6OL9M69yKCx5tcDe5DgjCom7LJ6vRsHyLZmzdwQUeNLLisQp4r+ax0OyvkE
	 GXJG4802s6L8g==
Date: Wed, 11 Mar 2026 11:01:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux@roeck-us.net, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add MPS mp2985
Message-ID: <20260311-provocative-vehement-macaw-45f9c1@quoll>
References: <20260309090041.452957-1-wenswang@yeah.net>
 <20260309090215.453396-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309090215.453396-1-wenswang@yeah.net>

On Mon, Mar 09, 2026 at 05:02:14PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS mp2985 controller.
> 
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Please version your patches correctly. This looks like v2. You also need
to provide changelog under --- or in cover letter. I will ignore further
versions which are just same postings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof

