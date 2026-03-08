Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A909F313522
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Mar 2026 17:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772991101; cv=none; b=BHYN+Aow3g5jGatPKNnfEUKLxxnO0BVhcre2ijfJ04j/SEfOVjT6oJOOCdVnbphAyfwXYOZmyzjHwsJ8lS9dDDAkCuXJ+wkzmeb0bFZZnIaoPyVzhIKa4z5HHxxm8J7zXL6VFizzTdgPvMSmI1AhtcGio7I78intTX3RI882CdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772991101; c=relaxed/simple;
	bh=BAd7md9tw6EfRKEG5QtWON+EHxe1egsLBG33S3XVfdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGV5eInT3a/Ep0V2llV1pKdtjBJ+yip0OxkNrfyPrnQtYiID6j6dxAYkCV7NBpOgrb0IBO5z0xre/ZFnXUfglNXzXjW14hkv7G7tFZQD5W+I6XZ+wVAVUNiCC92PmFg6NhxXTXGCtzakyrFbGJu6J2xtz9VicRFUz7/uCVDQQMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3P3wEUr; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3P3wEUr"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2be27fa54feso7867853eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Mar 2026 10:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772991099; x=1773595899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtq9/lhU2REDT28M9py6Cq5xxsx16xGsyDZF6Ur883M=;
        b=j3P3wEUrKT2eqO/PrLai6VeftX3dJG+bVwnCoB4JYCtlbhhoC5oiQuyhrqimsFg0rv
         WI16mZPjusZPyE/11UAloeNKNNgysKjDv9EV5uVjj17zq2xbX25zB0ZamFCPb0EXbDAv
         pgNlCF+h/NUmA6C81lz2VFCHt/6O6V2GkHb10rCZx5r4zvXIQI9QsPxG7r2GAE/dZTUT
         ANlyQGwescbxWJR0f/IuiLnmSWn0X8+K5HrQkLFSvr1hHNMTjGOkntIVz4xdr2Q0NAcc
         z0S1MuLgptkuQlwIVF6RgM3idLGHALJb5a70MB9aMy4u0JTvljH5U+GlbMQMYWkkdIhc
         /PHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772991099; x=1773595899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wtq9/lhU2REDT28M9py6Cq5xxsx16xGsyDZF6Ur883M=;
        b=eZS/09gz6JDI7RznIBmUIjoB24M5C3SXFAXBGjQu5ItbsD+e5yGLIGZCEP14/gcCJE
         ebLoXT/ix+ZhBPKTYSk5StmIcPMqQoTB2a+tDMsZR4+2JQbTYC5Qh/Z067AFs65wuBM2
         yxhyiGkKI7gTBO+OhD06Cs9jks+FeoON1b680cYUdU0kR+6AFxrS1aXVfPIm3/poql86
         V+xSTutgVEmCX5jpqlK/k3zkTRBgbQZ/3OSDZP36D9p5u6++4OXdmZxgJc2yIjMkSQLZ
         CZ+RCNgsWumJB7RhcCVILItxNxdm/+CQDbKmoFPPgDkYulho/HUorsvxDP6pkUKWQuca
         rsOw==
X-Forwarded-Encrypted: i=1; AJvYcCUk5rsxW+d3OkK1R0ghQ7qKyYlRpMeJ+ugcD6qQgKx8UcP6x3+B6rTtwOeWiYauBTIIwtJZUwzvJdpOIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YweTXaHTmtlxdCw1aS9OrV3fjIj8TjzkKC9GyjhQppPqrPG/ecQ
	x1NUhQ6BXhZdmDJEdxN/sxtzKrnptDPOeNdci1j7cAhY7+zhic3h62gi
X-Gm-Gg: ATEYQzyxqKpZZbeGd5S/BsMrmAm8+KNaGm1jZi6Z1GNZnrdS7ZxtlgLP7muM7d4Kt7T
	fYOKSrlxySmijzHY/heUbnJOscIY1nijg9VmPvg1fSm36QYHYtDHm80n3u0X3TqS9dNbbivLinM
	081B/ShMfLYHsjGbnGiIBPOwBWqm610kM55WJFltDTzPH3gndRQ8JD1INk4fNBe9R3Z1kto3Aqm
	2JgsbyOZ3B7/L7Vu9fGqz5WEga49nyvBeGrqfAF7Y6NgE6SA13OGuTXce9T9aNVrEY/oIPI8SJ3
	0N4tBmpKtFqwLYfYmFokKY81j9N6GlDE48V6qco+PE1utS2r+viL2hI87OXh5+MZEHF/FcSltEO
	AEly2tCmT1yJpBFaCjPccrPv+7NvTOluvwkHysWFjbH0BEqSTtlpXRJCP79xg7HNILKvDafXe3r
	3iDEVoGncTW+052nhCGr4aF2vGLDMgQrjEqcmX
X-Received: by 2002:a05:693c:8086:b0:2be:6709:3d97 with SMTP id 5a478bee46e88-2be67094029mr502015eec.17.1772991098821;
        Sun, 08 Mar 2026 10:31:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f80d6dcsm6838747eec.2.2026.03.08.10.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 10:31:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 8 Mar 2026 10:31:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Stoyan Bogdanov <sbogdanov@baylibre.com>
Cc: jbrunet@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: hwmon: pmbus/tps1689: Add TPS1689
Message-ID: <326f3dad-b2d4-44fb-a4b1-d09fb0dc5024@roeck-us.net>
References: <20260217081203.1792025-1-sbogdanov@baylibre.com>
 <20260217081203.1792025-3-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217081203.1792025-3-sbogdanov@baylibre.com>

On Tue, Feb 17, 2026 at 10:12:02AM +0200, Stoyan Bogdanov wrote:
> Add device compatible support for TPS1689
> 

The title and description of this patch are really misleading
since they don't mention that support is added to ti,tps25990.yaml.

Also, the "title" field in the .yaml file still refers to "Texas
Instruments TPS25990 Stackable eFuse" which isn't really accurate
anymore.

Guenter

> Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml          | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
> index f4115870e450..973ee00c2c49 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
> @@ -16,7 +16,9 @@ description:
>  
>  properties:
>    compatible:
> -    const: ti,tps25990
> +    enum:
> +      - ti,tps1689
> +      - ti,tps25990
>  
>    reg:
>      maxItems: 1
