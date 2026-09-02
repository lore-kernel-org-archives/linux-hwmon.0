Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7D437C11C;
	Wed,  2 Sep 2026 14:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358317; cv=none; b=pEVx9rQq1AiAUUSQh/aWExMBbuvmoXHa4rVHUVytMsnAF/1PP+CmrzZDbCzC3kiKZrr1XiTdbg2r3KhB8tGf/4V5HJ7v80WgE4mLBZg7ma/xE4oCuu58IgNSZm0hDXFBw1GeL3CtHi/H2yCPiqEUtcgewb6mYXUm1aiNyPp/up0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358317; c=relaxed/simple;
	bh=4+x6I3GDnTnaewL1Qzj9t64McNjltuAsX/Zvw3byRF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ka85S0jKn0l06Jcm+4G2opRVBMGVaFy+tD+Q6Kns0nYojevSVwjHLYlHyYa4ntHK55CLGzDXa4NTnbfo52MfJM+NkViHbWZJRMGJsalQ7u2TvxTrCYtTniSWoeIGM4/vAnjdx8hJ1Lbt4yNwM6BUFBAKCQseBTSeAHGxVlP8kN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=Ztz5tDXG; arc=none smtp.client-ip=212.27.42.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="Ztz5tDXG"
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 0FE9A834AFD;
	Wed,  2 Sep 2026 16:11:43 +0200 (CEST)
Received: from L30177.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 5916A78050A;
	Wed,  2 Sep 2026 16:11:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1788358294;
	bh=4+x6I3GDnTnaewL1Qzj9t64McNjltuAsX/Zvw3byRF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ztz5tDXG+F00/9yhONzfakMK3aLmnf3PyT+zgOACeDwVgn5rb4SHlS7xQzPZDS/qf
	 G4M0IXgyEe2pwd422eRXI7pfn7B4aCikt57DiwkbP1R3ZMXoT1fXojxfUGcfT6nXik
	 vX9IQ9fSuMexJzeVzWR3zSgeA9HzQ/Y1BreTuD8wwHznesXHCSiz9M/vlLiNA7AJrs
	 OG8ePSUjw0Ipd+Y10sgJf/87aqI4V6urj8EoVgOtpvnVx8l481mf6U8bb0wb0fIeZf
	 S/9UDv2YhhFYLFedBsS2f2K/QB/xKBLn749c8ECsrOKM6BNTEehHPhq9qzc9vnieVt
	 wYJcI8AkdIzIw==
Date: Wed, 2 Sep 2026 16:11:25 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: hwmon: ti,tmp401: add
 #thermal-sensor-cells
Message-ID: <apgujdI08Pp2BC4b@L30177.local>
References: <20260825-for-upstream-dt-tmp401-vcc-tsc-v2-1-cbc360ec51d9@free.fr>
 <20260828-weightless-ferret-of-pluck-ef2baa@quoll>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260828-weightless-ferret-of-pluck-ef2baa@quoll>

Hi Krzysztof,

Le 28/08/26 12:02, Krzysztof Kozlowski a écrit :
> On Tue, Aug 25, 2026 at 12:13:18AM +0200, Vincent Jardin wrote:
> > The property is missing, so a board that uses it with a thermal zone fails
> > with dtbs_check:
> > 
> >   tmp411@4c (ti,tmp411): '#thermal-sensor-cells' does not match any of the
> 
> Cannot find such node.
> 
> How can I reproduce this warning? If it is non-reproducible, then it is
> not a valid reason for a change and instead driver implementing thermal
> sensor would be the proper reason.

Hmm, you are right, it is not reproducible from the main tree, I was confused
with my ongoing developments: no in-tree DTS uses a tmp401-family
chip as a thermal sensor, so dtbs_check has nothing to complain about.

The warning came from a DTS that does, which is exactly the usage the
driver now supports and you are right that the driver, not the
warning, is the proper reason.

Since commit
  a3b61ba2558e ("hwmon: (tmp401) register with thermal subsystem"),
in v7.3-rc1, tmp401 sets HWMON_C_REGISTER_TZ

-> the hwmon core calls devm_thermal_of_zone_register() for every
temperature channel.

My goal is to unify/follow the other ones such as national,lm90.yaml,
ti,tmp102.yaml or adi,adt7470.yaml already pair "const: 1" with drivers
that set HWMON_C_REGISTER_TZ.

v3 justifies the change from the driver and drops the dtbs_check excerpt.
The diff is unchanged.

Thanks for catching it and sorry for the confusions,
  Vincent
