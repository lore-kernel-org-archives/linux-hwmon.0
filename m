Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC1D3B27CE;
	Fri, 24 Jul 2026 10:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887491; cv=none; b=ZmtvQsos9A3fORA5ra0gGzo6MEUeO9QzfkiS/YtR8DhYdv7fSUMX4GIspVBbuLhrvkSW8hzsMWCaTQ1WcIM8f8VHusDn3ob0Ow+LICSLv0mAy5/DiBibUHaPXF27/QwncmYCVbQ1Wx2gn2xLCPHC/dQaVG7dtMrYfnBGm7ljdeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887491; c=relaxed/simple;
	bh=JJ0DB5ADDU1KUnxlOxjvnRIQ4UglrCjzOqILuT4OS2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bGY/pVROXJYyqkE6NA6EiwoRH6XKe6wlQRfOd+SgEyqwMbcca2w+rbp9yaXDZw1RJCUsSeXGJ7p2GZxJrL8IINQ+yf505iPDwjNHDdUgbrP/nTDrBTNy2jBmvTL5Iv2adZyI3Ev4dlGqqBt8Hzw8UQJ3m/e4+ZHfvvenp/zFOug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=VmSndFJL; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="VmSndFJL"
Received: from L30177.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 79198780371;
	Fri, 24 Jul 2026 12:04:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1784887486;
	bh=JJ0DB5ADDU1KUnxlOxjvnRIQ4UglrCjzOqILuT4OS2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VmSndFJLteXqyksIsin8yuLS+uuzo9aI8UHwHeygOs8mReJGs6e21CwKO5BlVs2A/
	 KD5c+xsMHKuwgW3TYf+xsOGEAKZiTPLaWh9opIMTyu42DMGT47Snn6CAKSgmAzTqMb
	 c7h3tU1qEIg51djMSrBRD4Qgp0nmBw2Cu6NIuj0RzKrAe3fiRFYpYlHuGA/d8YDqo/
	 vU7IjB+2Q9/KNbC0WS9Nqc7/rmeofOPMBwf6EXD5ajejUXF0jqYkA3LhFAgJ/OFGfD
	 FixhiNL2atCaFJAYoM/+HjTQ2Q658/NLLO08bJeOtrRjA90duT9cDbED9buucN+siU
	 XABM1XhDbE3JQ==
Date: Fri, 24 Jul 2026 12:04:39 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org,
	conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/3] hwmon: pmbus: add MPQ8646 driver
Message-ID: <amM4t3Mr-TcEiQgB@L30177.local>
References: <20260724-mpq8646_v0-v5-0-5915b5ae9aa2@free.fr>
 <20260724-mpq8646_v0-v5-3-5915b5ae9aa2@free.fr>
 <20260724000643.E60C81F000E9@smtp.kernel.org>
 <b5c0741a-b9da-4a3a-81ae-33368e6dd756@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5c0741a-b9da-4a3a-81ae-33368e6dd756@roeck-us.net>

Hi,

> > Although this is triggered via debugfs, executing it on a DMA-capable I2C bus
> > could reliably crash or corrupt the system. Should these buffers be dynamically
> > allocated instead?
> > 
> 
> Do not address. This is a false positive. Sashiko's I2C subsystem prompts
> need to be updated.

thanks Guenter for this guideline.

Very appreciated,
  Vincent
