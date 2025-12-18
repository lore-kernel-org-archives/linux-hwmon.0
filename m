Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E8A330664;
	Thu, 18 Dec 2025 08:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766046412; cv=none; b=ihOVKRBEjq3J4MhY0d7lFSpspEwtjMaSNMC4TDSdWMPQrq2Et5l+K9jtLrSH+PE2ZAykl3se4HUUOpYbF7kWekgkCKNsCs5U9L3CCGyC/jG0dZdsUD0ekZKWzpi+SUgN/UV06/+ROs/fQLW8EeQgd4mZ3QM3enN91jo+LXwt/oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766046412; c=relaxed/simple;
	bh=SmdKK4J+8y1roYO2pJI+9g6OBIm+UnndmmHGLFdzIE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOPE7My0CQxXAedtb6uqD27RRXVDIf9GjkH+/pR/OT1FQIrMYv8eTfUZW5hzpY8vbayKC2/CdRoT9DhLykdgO8CAPym+JsP3TgY4Wyx1AATZu+ijTMWwOflwFFgHnoW02plUiR/Ttd0XT9Xfz9X6IhBUM/nauum4uoyYcOJZ5dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ef969Z+D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ef969Z+D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99100C4CEFB;
	Thu, 18 Dec 2025 08:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766046412;
	bh=SmdKK4J+8y1roYO2pJI+9g6OBIm+UnndmmHGLFdzIE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ef969Z+D4fYRFM7EBtD0guD5dRaT5Am4Fcaa605JZeExvqMDyp0TEFQZtGh86+EfM
	 OWDt9ZPLeZCKG8aPk0NUCdpiv+ZRfiQsXICwDPef8D8nT8Bz44pjTaol5U6RcL4EY0
	 frOQdmmiymLhKYmZpsM8u+rU0mfcbiLpgL6EKtzK7Wfz4ZKLHxjF4f+0TagNgrQbNP
	 7PPgRyk2ASrLJMEiOxLOJGJ1xu9p35+97gB129aT3FAWWED7W5/o1jO4nl/0Vh7EV8
	 3GKB3yyWBdxovbt14Gzn2+95jjQtBS84gNz921h0oYrU3D7j4pj0ceK4wVOsuaREwy
	 vI97nmHj9zCag==
Date: Thu, 18 Dec 2025 09:26:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: muhammadamirulasyraf.mohamadjamian@altera.com
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ang Tien Sung <tien.sung.ang@altera.com>, 
	Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Subject: Re: [PATCH v1 2/5] dt-bindings: firmware: svc: add hwmon property
Message-ID: <20251218-imported-satisfied-beetle-ace590@quoll>
References: <20251216064926.15817-1-muhammadamirulasyraf.mohamadjamian@altera.com>
 <20251216064926.15817-3-muhammadamirulasyraf.mohamadjamian@altera.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251216064926.15817-3-muhammadamirulasyraf.mohamadjamian@altera.com>

On Mon, Dec 15, 2025 at 10:49:23PM -0800, muhammadamirulasyraf.mohamadjamian@altera.com wrote:
> From: Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohamad.jamian@altera.com>
> 
> Altera SoCFPGA support hardware monitor feature through mailbox. Hence,
> hwmon property has to be added to the DT to enable the feature beside the
> hwmon bindings and driver.
> 
> Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
> Signed-off-by: Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohamad.jamian@altera.com>
> ---
>  .../devicetree/bindings/firmware/intel,stratix10-svc.yaml     | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml b/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
> index b42cfa78b28b..4767904c7b76 100644
> --- a/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
> +++ b/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
> @@ -62,6 +62,10 @@ properties:
>      $ref: /schemas/fpga/intel,stratix10-soc-fpga-mgr.yaml
>      description: Optional child node for fpga manager to perform fabric configuration.
>  
> +  hwmon:
> +    $ref: /schemas/hwmon/altr,socfpga-hwmon.yaml

This cannot be applied alone and you did not describe merging
dependencies anywhere.

Squash the patches or be explicit how this must be merged.

Other patches from Altera have exactly the same problem, so you keep
repeating the same.


Best regards,
Krzysztof

