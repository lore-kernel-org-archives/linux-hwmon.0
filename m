Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E968B19F48D;
	Fri,  6 Mar 2026 07:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772782361; cv=none; b=d7CZVNNnZvN7zrC0MNkq1Aua/gdMal5wBkUfhgCYvuEQsBc8LnPkek90EK9J04mndEq8p1n+xsfl2pisf9m1WHS9PrNBB0/RzeWWhyujRMfdRXi2+QF6F0cYnzGE8vMhDkV65coUx8Fk4CUayosf56BPsdWMBBB/vYiW9mFi4HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772782361; c=relaxed/simple;
	bh=DVzgvb8y4ShBZBiB5XfsC+MoSBbpxmPP73ac6hYIeNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5xVqMIGmdnsFn03KpcgkiGCTnoLY5sZ6jEfZEQZR0fcPQKLc53hXlR7ZuTFuIgh4/8mryqNM273PLPtcDa+M4LTQlsEjf09nbG2bgNpB8KBHrCGM+9i7Hi7fy9CSqAtQsj/1KJBtN49nyDGKsIBynybze6PyAZqdi6LfREKhA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FF3w4aOI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FF3w4aOI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF94C4CEF7;
	Fri,  6 Mar 2026 07:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772782360;
	bh=DVzgvb8y4ShBZBiB5XfsC+MoSBbpxmPP73ac6hYIeNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FF3w4aOIbJ0brVEkGQQ8zRx/LmvMFUFfe+HepOLyVKtX6t8j4Hr05bu7jWXzBg29U
	 ZAK7AX/EPaBCIzwaMMAXHLRNspS6SXkmezALwpZJxDMJ1RGjq8vghPamP/gdvbyFeM
	 x0NfDtL6+zean8JYahUdtrb9FuovZycdTwXcfp76mXZkO63/k3pCI47VY0T0NSogtz
	 3TXo5/stD4BmQ8FjTSSyurTj9ADgXeV2dif2n9C/MWM29+kOOwaepxmk720OrjdJsB
	 rys+OZ9ClJsOO+E6yombFnOAzumbpBss3D2yT4oKvYnxMDwybmVkWS0ipWHVttFw75
	 10o/nokcY59kw==
Date: Fri, 6 Mar 2026 08:32:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Victor Duicu <victor.duicu@microchip.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, marius.cristea@microchip.com
Subject: Re: [PATCH v11 1/2] dt-bindings: hwmon: add support for MCP998X
Message-ID: <20260306-mellow-warthog-of-security-d12ae3@quoll>
References: <20260305-add-mcp9982-hwmon-v11-0-6e914ba63239@microchip.com>
 <20260305-add-mcp9982-hwmon-v11-1-6e914ba63239@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305-add-mcp9982-hwmon-v11-1-6e914ba63239@microchip.com>

On Thu, Mar 05, 2026 at 05:26:04PM +0200, Victor Duicu wrote:
> Add devicetree schema for Microchip MCP998X/33 and MCP998XD/33D
> Multichannel Automotive Temperature Monitor Family.
> 
> Signed-off-by: Victor Duicu <victor.duicu@microchip.com>
> ---

Why you are making it every time DIFFERENT changeset? Just look at your
change-ids. You made it impossible to compare your work!

b4 diff '20260305-add-mcp9982-hwmon-v11-0-6e914ba63239@microchip.com'
Grabbing thread from lore.kernel.org/all/20260305-add-mcp9982-hwmon-v11-0-6e914ba63239@microchip.com/t.mbox.gz
Checking for older revisions
---
Analyzing 4 messages in the thread
Could not find lower series to compare against.

This is completly broken way of using b4.


...

> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - microchip,mcp9982d
> +              - microchip,mcp9983d
> +              - microchip,mcp9984d
> +              - microchip,mcp9985d
> +              - microchip,mcp9933d
> +    then:
> +      properties:
> +        interrupt-names:
> +          items:
> +            enum: [alert-therm, sys-shtdwn]

You need to list the items, so the first item is fixed.

Best regards,
Krzysztof

