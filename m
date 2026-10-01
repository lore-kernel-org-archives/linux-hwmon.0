Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA7240927A;
	Thu,  1 Oct 2026 21:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790891029; cv=none; b=u6j/me17til5CtPCt+aT3Uy6BW4S5KHqgDcIcKloVHU0qxAylIhY332fQ3n9mzG9oBc/NzH8Exnw+lDFY2RQglxYL6MB8RkUKqGD9CUswwDDTK5U8nqfoirg7e4w29aDh6o5g0Oefic/oWIvtdnhekOtx3xAUaLjC2M11ej1e6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790891029; c=relaxed/simple;
	bh=Zy5DgYfKJ2Jvbz3nfTQhgnKyY+5AE4qgyM0EigO3rm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKarec3DvXBnoJHpwZyQCnU9Fte/bdBPI3MzjcWhScFPr5u0m3+80d+7jAVBTOwOz3d9YanlwWcXMewem8pRB1ew7wrPZQY8uDN25qdRzknMzNKRdV7g/JaMgXQPmBs0+0/t5CmO4eZCP0mpR4g/1M8skTp6YnRf+Aeofv+l/dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=VRzvYwnB; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="VRzvYwnB"
Received: from L30177.local (unknown [IPv6:2a01:e0a:ac2:22b0:4527:74e2:2212:f171])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 95136780331;
	Thu,  1 Oct 2026 23:43:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1790891017;
	bh=Zy5DgYfKJ2Jvbz3nfTQhgnKyY+5AE4qgyM0EigO3rm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VRzvYwnBWyOC8npDt2yJ6xqN3dLliujSUshcwjEhONV5GUb24lV2jZHSXh8RkhIMH
	 rNDAfwXL620ADzTmEwlEAQJRuU5EvScSxBm46VxfoN40cicS3+ivpP1S+5/c3KpGAk
	 KH2pSG8wWopMiDI/9fqwXwMHYC+mntd4NIUxtGeXRj6IaYSuJjbb/jkLfAaG4TP6Dh
	 l4FKqxCp41CLJUfvgZNTJ5KMgyM7YwgftbRIwTrOwq/HXgsDQPbSFT8AMLXUFv6/Zg
	 WrJhLbQ5aCRR2g4LVe/1dUgga5+AlwKyPAtKBplMSCvgth5NZPkFLaAdESE8sFEBhJ
	 SKtIr2RpJKHvw==
Date: Thu, 1 Oct 2026 23:43:26 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Conor Dooley <conor@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	Eduardo Valentin <eduval@amazon.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: hwmon: pmbus: mps,mpq8785: add
 #thermal-sensor-cells
Message-ID: <ar7T_u5RPVLc_MVh@L30177.local>
References: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v2-0-07d368dcc662@free.fr>
 <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v2-2-07d368dcc662@free.fr>
 <20261001-hash-husband-663954aed7b0@spud>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-hash-husband-663954aed7b0@spud>

Hi Conor,

> I don't understand this, if it has multiple sensors, each could be
> referenced by something and it would need cells. It only has single
> input, then that's the justification that needs to be provided here.
> What software does, especially in generic code, should not be used to
> justify a binding change.
> 
> I checked the devices supported by the mpq8785 driver and none of them
> actually appear to have temperature inputs at all?

Right, none of them has a temperature input pin: the sensor is
internal, not an input. Each device measures the temperature of its
own die.

I hope it avoids the confusion, I'll update the commit log,
  Vincent
