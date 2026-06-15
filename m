Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD7438552C;
	Mon, 15 Jun 2026 06:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781503760; cv=none; b=KNJRhhIzfX9RHkz+AArhwiE1pMChmhC7nZiYWHOARf2L5lv3FS1aI16wz4fTYs4R9SQUQHaWriROVPyNyclm9HEnJZW41aCEGxqt37wY7Dv9vPjmvkstyykI8QFFnJi5pqVhDpl+t+sE8NRMx0mPqiTIGpaoa7He1YUXm4mjvSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781503760; c=relaxed/simple;
	bh=FJw2U6Y57lgMHCPzse+56i3TTlezam+Ru3HFM8n6o9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjcOMLs3lAHIfifjNec+zsV/OS/uWsqt7/BFGzudOrEkrH5zTYXUr3z38Tl7/jQGrnVkza+hCSTnjxBL+FnLc2/eL1+L2P7KbD5JTznOP+Vv5gsYPmuzjjDyr/codSvtL7/XwutYHzZX8jB80y1d55FCX7QiZVbtaztaOn+ZxIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VrT7FcTL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VrT7FcTL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5D11F000E9;
	Mon, 15 Jun 2026 06:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781503758;
	bh=FJw2U6Y57lgMHCPzse+56i3TTlezam+Ru3HFM8n6o9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VrT7FcTLsV1nBMUO3OGc49IG6jQCkg/z0AMw8zHpxaoonYVZYKlBALIXUDKxuxb6d
	 sbB40bhhQnQv41bk893KAk1diumZgNjOw/B4txgFTzwXCqT+GFgxmUUmwZpXcPGDrS
	 UMPZV4ZrR7GcuGRwQgKReUMH0KXDWx8QOVa1Je1bBGLl2D2WqNP4pZT6ma6ekjDnU7
	 EHJeKc5InvETNlc/q07VNEMe/rg4ctajm9kZuMYmTi9beQwOszFhZSUZ0iVsst0XI8
	 Gj+lnhciGDcA406Uupoo98P3dhIGYg2+T30ScHUUz8PqGvThNoptKNraA+LNMIUJ/R
	 yWIdUaqsYRCOA==
Date: Mon, 15 Jun 2026 08:09:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Potin Lai <potin.lai.pt@gmail.com>, conor+dt@kernel.org, 
	linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: ti,lm25066: add
 current limit properties
Message-ID: <20260615-adorable-whippet-of-dignity-e679a0@quoll>
References: <20260615-lm25066-cl-config-v2-1-59be46e67d5a@gmail.com>
 <20260615031628.ADC9C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260615031628.ADC9C1F000E9@smtp.kernel.org>

On Mon, Jun 15, 2026 at 03:16:28AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Device Tree Schema Type Conflict: The new `ti,current-limit` property is defined as a string, which conflicts with its existing global definition as a `uint32`.
> --

Actually HIGH.

Properties can have only one type in general.

Best regards,
Krzysztof

