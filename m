Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C37F314B62;
	Thu, 22 Jan 2026 08:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769069430; cv=none; b=kip9F2EIfmSgSyjXL1Ra9OOBEOZZEooPgwWCkPXKsY78P357ZKW0SdGCx4wZtrmlYld1qoNB3jet+Ed0mFdxB7uyxqaStGHGeVRwGENl8DTnM/+WYLzXJ7yHSuINpqp1BPNegbkELbvUrsKZS+z51IF4WXq4c03r5noJ3wSrtJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769069430; c=relaxed/simple;
	bh=xtiAKioPF55Csp+syPDDXWp4DrqoYErvhMbJETv9olY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ivt0CIf69ksVCfB5l/XmzT7YlhBYkMGU2gf9/0o52WMoJJAnKP383ebp5XXOK4EFnMdDnrhoTGuv8y+3CrIifZE8iVGhGfwkfMYuG1+wqPNIhq5tL3YYufdS0/RfzoVqJwHX8vGEzHh/I3c1mmLg7aZlE6l4gt6eLOfkedOmOjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOFIQx06; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOFIQx06"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE7FC116C6;
	Thu, 22 Jan 2026 08:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769069429;
	bh=xtiAKioPF55Csp+syPDDXWp4DrqoYErvhMbJETv9olY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WOFIQx06vreMNLR7fzsvnpfx8h8oqeK+VSOP7e8dKogDkDe1UgZzEJEBLWPuw84Sr
	 dYqBigINwkPW7KTAGzfoM2sJN2Vv8d7M7L3ka05FN2OWHIXhPmSNNNcIzfDRZKK7h4
	 BhX5H4LheHIRPHxXFz7/u74Y9oC/3jElrM0bIWbR0W4klzbtvxKb7X/ko0VQrpnIvX
	 55Rr3vTbvguuq6JLDIO9J/oPnlWMhU5WM6mJASvg9AfwYWCNE5TEXPJAc+P+Y20ER6
	 n+sXE1HZbuLxDPM21ocaIwCtxGYbOAIAL1fr0PmYpRvBaKCHpHUB4zKRVQU2BpjnNH
	 rJGjRr1OpxDdQ==
Date: Thu, 22 Jan 2026 09:10:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Almog Ben Shaul <almogbs@amazon.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, itamark@amazon.com, talel@amazon.com, 
	farbere@amazon.com, ayalstei@amazon.com, dwmw@amazon.com
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: Add jedec,pmic50x0
Message-ID: <20260122-fair-aloof-dove-0f1fe3@quoll>
References: <20260121151947.37719-1-almogbs@amazon.com>
 <20260121151947.37719-2-almogbs@amazon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260121151947.37719-2-almogbs@amazon.com>

On Wed, Jan 21, 2026 at 03:19:46PM +0000, Almog Ben Shaul wrote:
> Add devicetree binding for JEDEC PMIC50x0 compliant I2C DDR5 PMICs.
> https://www.jedec.org/standards-documents/docs/jesd301-1a03
> 
> Signed-off-by: Almog Ben Shaul <almogbs@amazon.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)

You did not Cc any maintainers, but you Cc-ed 5 Amazon people. Great.

Drop unrelated Cc list and start using kernel tools for development.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument, so you will
not CC people just because they made one commit years ago). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about 'b4 prep --auto-to-cc' if you added new
patches to the patchset.

> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index d0f7dbf15d6f..fb16bd91c76c 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -171,6 +171,8 @@ properties:
>            - isil,isl76682
>              # JEDEC JESD300 (SPD5118) Hub and Serial Presence Detect
>            - jedec,spd5118
> +            # JEDEC PMIC50X0 DDR5 Power Management ICs
> +          - jedec,pmic50x0

Mis ordered. s > p

Best regards,
Krzysztof

