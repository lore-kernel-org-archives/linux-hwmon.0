Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9270248A8AC;
	Thu, 15 Oct 2026 08:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053253; cv=none; b=X5Qfn/QkFV6jGmbAMOqqAlAphjdwDjyoWwZL1OJMwve8JKho5jVjEXj6wl37DbsL9qh8+KaJbhynu7F3GXNu81HrexBKPXbadiiyYXMnGgYxfSOS3Nz9nlJgt98gC8FdqkQo4eRmnLFcPBiBABtyU4R2xFnEKGGDbx41dFvrzE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053253; c=relaxed/simple;
	bh=k2sSbTkjQLwGLF6viSP3bGG2Qok8OdtCO6konSZ+934=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVVCr/L96NjjoSG21oTrMH/sV3vQdd4RlJ3Qgu+ZGPKY73FzDeZ+dSTK60P6Z2z4utEM584CeibFIuzXJi8GBQ++rrZoLem5w8fcKSrY7YbEgtl+7KLDWtxszYQLfNG6wpWZ1zbG/qPzTIfjOwnuULq07FYRsp6VVh/rjEBmmnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=LAqkHJUu; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="LAqkHJUu"
Received: from L30177.local (unknown [78.240.198.129])
	(Authenticated sender: vjardin@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 9AB882003EF;
	Thu, 15 Oct 2026 10:33:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1792053243;
	bh=k2sSbTkjQLwGLF6viSP3bGG2Qok8OdtCO6konSZ+934=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LAqkHJUuw+F33a7FwpgJ3VOICTM1/c3O3D4+pKF+G8lJN3S7g5LWOZ1rRO+uaPc0e
	 ryjvZqsb3gCoRjb83LxNr3IZdMjo96MiT3gETXuqZBB0ZRnIRsffoUxd7I8p3cn3sU
	 9sfKWjLu7afmAjQRDUCj9I1wiJJ/YCKD7RwZHj7kF6VWqUtusvSkcTeF16BiUcYDYv
	 O2IQ3Q24xBd2rSb5CVB2NAZmQAwhB0EeE6lZSTEMIslSIibKTwZ9aogFxQ1LPd3ACs
	 Jd2mF7vUWWRRVMihcd0N4Plz5Wk5xTG4335OuHzFXGiGyXhNj87VlPTXfg3xazWBYn
	 Cgv83xRHNTNIg==
Date: Thu, 15 Oct 2026 10:33:51 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: hwmon: jedec,jc42: add
 #thermal-sensor-cells
Message-ID: <atCP74Clfba-EKpR@L30177.local>
References: <20261001-for-upstream-dt-jc42-thermal-sensor-cells-v2-1-6edd30b082f3@free.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-for-upstream-dt-jc42-thermal-sensor-cells-v2-1-6edd30b082f3@free.fr>

Hi Guenter,

It is a gentle ping for this patch:
  https://lore.kernel.org/all/20261001-for-upstream-dt-jc42-thermal-sensor-cells-v2-1-6edd30b082f3@free.fr/
  https://patchwork.kernel.org/project/linux-hwmon/patch/20261001-for-upstream-dt-jc42-thermal-sensor-cells-v2-1-6edd30b082f3@free.fr/

It has Krzysztof's Reviewed-by. Could you take it into hwmon-next for v7.4 ?

Thank you,
  Vincent
