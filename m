Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB303B6C0A;
	Mon, 22 Jun 2026 14:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782137147; cv=none; b=HaxbR2JAQUsOCRUiOeFO/KpbmbVVqG2+K3FAG89iFc/HIBFvskbgeIPEqxKcFeFOBXRta1NfgXtf0H8Lw0xTRQQiP8ZxXb887bxuvDYFMaOja+HG1daqGvR2dcvEi5WVA+I1RGVyCVJBSVC430kdyw0aMZ6fbKdLpfLTl86ut2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782137147; c=relaxed/simple;
	bh=v5l6TD+mHGHDPHkXGbx4LFPwiWn6sQjov+zeDNH/smo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aT/D3q7cCV3R3Gn6ePbsht6e8HT5zX6XIY+19sNdGBkVIWVMT+SI9pFXUeaZsuaOUXsJudOwymfDfE6D3rp4BWtn1azjH4eeLqTvEFp8JohMF4HHwUZimo6ar9ITDk05MRHDfPn6PTnEk+a4KNZvfxM+OszfY+AnCqd0poxFPhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uegxmgxl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uegxmgxl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5931F000E9;
	Mon, 22 Jun 2026 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782137146;
	bh=5i5DYZFZ8ehk0bDNTcYiJmeh8HqNWmSKGr9IxPwjit8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uegxmgxlp+sQZMQuWOdRe9xLJDzF8/HM0n1wLR8bLFLHFizuzjTAXCRbhufK7ybIO
	 HOzpFIZ09kZNYzveje4tCep9+q+NM9JtMa5EIeKPbpHbVEGlozZ7mjPE5PA7CdP8q7
	 JUrwKD4oofguiSKVXbnDm1SCu2XTN+/HviLsAPg8aVE3IqkalPN1dzL5c+jfNdO6Z0
	 xFQEp9zw0jZWtpl7BViuP5zteWINGPMQtIhOWTFVaJ/O3dL2SQekzq+A5WDw6idy5a
	 sSRQX/knrvgNEUn3na3nuiUTmYHRf8lWmsb0TRJzlOnG9cQv+ax2zCNILlKtXp45mS
	 32BNyTn1k6EQA==
Date: Mon, 22 Jun 2026 16:05:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: tze.yee.ng@altera.com
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, 
	Mahesh Rao <mahesh.rao@altera.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: firmware: svc: add hwmon property
Message-ID: <20260622-straight-honest-cuttlefish-1a88fb@quoll>
References: <cover.1781861409.git.tze.yee.ng@altera.com>
 <be798fdfb7ec76e1f7d04c1fd00126c88c8a2e31.1781861409.git.tze.yee.ng@altera.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <be798fdfb7ec76e1f7d04c1fd00126c88c8a2e31.1781861409.git.tze.yee.ng@altera.com>

On Fri, Jun 19, 2026 at 02:38:53AM -0700, tze.yee.ng@altera.com wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> Altera Stratix 10 SoCFPGA supports hardware monitor access through the
> service layer mailbox. Add an optional hwmon child node to the service
> layer binding so device trees can describe the hardware monitor.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> ---
>  .../devicetree/bindings/firmware/intel,stratix10-svc.yaml     | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml b/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
> index b42cfa78b28b..86ffdb10132f 100644
> --- a/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
> +++ b/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
> @@ -62,6 +62,10 @@ properties:
>      $ref: /schemas/fpga/intel,stratix10-soc-fpga-mgr.yaml
>      description: Optional child node for fpga manager to perform fabric configuration.
>  
> +  hwmon:
> +    $ref: /schemas/hwmon/altr,stratix10-hwmon.yaml

So hwmon is completely fake wrapper over two other wrappers... If in
doubts, please read slides from DTS101 presentations from OSS, including
the chapter about Linux driver design.

Best regards,
Krzysztof

