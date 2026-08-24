Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9B8350A05;
	Mon, 24 Aug 2026 22:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787609961; cv=none; b=WK9ZgU6/ZgiOqa0sz4C/Xw3DL/2PEi1NEGgP3vdo4EtrAazNJPadvVdk/k9cBUq3oz2viAtAMhc23iDG/z9fyVciGfePlvyzSjqgwOjUstOxO8jfKBDRMg8e0B1oRaqpNa5iNekNowmq9b3yE9GHlYKxA3DZfW7K8M4BdFx7CLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787609961; c=relaxed/simple;
	bh=TOJB9LaRF3sGVMeoZ49vUrIJyKXA/bFQzH0vrUrRKQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owPjAB6eLjksqHTbLWNZe0DSbpZxwzXr6BmIyPWuILzjrXZAIBZEC2l6Ljwic6OSNhg08zQK90uC/6d5OpSqBLGtIicOxQYH0fRGMGIdZBjDKiN1NdQ3ca8h4+S2VPdGk1DUspVguHb07u9utpzn8qVMCwMjn2D1x8ejaTHeRuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=IKT/0I6S; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="IKT/0I6S"
Received: from L30177.local (unknown [IPv6:2a01:e0a:ac2:22b0:9a6:acd5:d8dc:dcdb])
	(Authenticated sender: vjardin@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id E9D412003A4;
	Tue, 25 Aug 2026 00:19:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1787609958;
	bh=TOJB9LaRF3sGVMeoZ49vUrIJyKXA/bFQzH0vrUrRKQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IKT/0I6SKBCNMYN/KZqYZfqhcP8gRklr7ujjVeO4vevqGBqvqRvtg/RWjc7ZFtwRH
	 g1xN1pe8V0li1OhIeVVWVcLalB1thlc8uz3IvqRHTSHvYFqS5wr+CHLEBqjtvqshbs
	 4FZ1rby4dwyoDklzL8IDigy/v2xBudeftVOSvo1IKEkP0WLm40/Khfc7HqKcBFVNPk
	 0rGo+0QnMVbSIor8gEmlato/Q9Elv7THnBciUvxU5StSOvWNveucsmFzqNKaEhOJ2P
	 HfJTT4Ef/g4EYU6p8vMUeCpGFsmNnk6X2yzrz0+v9wGIkTDY75dDfk3Uj4ctgF87TR
	 bCiXn9Ywgassg==
Date: Tue, 25 Aug 2026 00:19:08 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Conor Dooley <conor@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: microchip,emc2305: add vcc-supply
 and #cooling-cells
Message-ID: <aozDXIdUKwr4Tt29@L30177.local>
References: <20260824-for-upstream-dt-emc2305-vcc-cooling-v1-1-cd3b53dfb5d4@free.fr>
 <20260824-flashcard-renewably-badc0e011949@spud>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-flashcard-renewably-badc0e011949@spud>

Hi Conor,

> That seems correct though and putting it in the device node when there's 4
> fans that could interact with different zones seems wrong. Shouldn't the
> driver be fixed instead?

Hmm, I did re-read again the code and I am wrong.

I withdraw the patch instead of sending a v2.

Sorry for the noise,
  Vincent
