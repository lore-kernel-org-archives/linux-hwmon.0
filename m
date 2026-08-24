Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521C9331EBB;
	Mon, 24 Aug 2026 22:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787610065; cv=none; b=G7GX4rQ2dYbE+XrtoVy79XVmmHEn2lwxRyNxUQjVUpjqnq2+nhyB7exxwCelXTwnQwIpCrtQ3PdzjW9exAPI9n4aiEtUISjBOmQOcp9MLHRD9HId6iRkiD7IFCyassn9+HtNIcA3LhsAP7FtnZCeIwkkKAIzyKUoosaQuo9+WcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787610065; c=relaxed/simple;
	bh=yxpOEALfDO9cCoKEQ8mgUJakHall18SqIf2Cegc537k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kep0HFtwf93wAfx0k8zqHSWlA4BGvtv3nCtPIJnm9Kp5xKEoqL9wF4YHaQ9vSpiyHLp3+YV6GUHGqdYF+mnLZt7FKg8wlXUqKTXBL/Y7V1yG3L9yTpNfN1b0eDxz2Te2jESsBLLTz8KzGcHJZ7kjDSfLPdvTvZQm0zDQNhQcKlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=h+grUwjP; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="h+grUwjP"
Received: from L30177.local (unknown [IPv6:2a01:e0a:ac2:22b0:9a6:acd5:d8dc:dcdb])
	(Authenticated sender: vjardin@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 3AE9F2003B4;
	Tue, 25 Aug 2026 00:20:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1787610062;
	bh=yxpOEALfDO9cCoKEQ8mgUJakHall18SqIf2Cegc537k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h+grUwjPHXCbDauZpcTc1ZUo+pqAbQzGLb/R7tEKj7qflQ8H4kXk49TOz6O/IDHSr
	 CGfxj6qwN5SQC7/ylmxh8b5fyOAOYUpZbLsgrMnEOf0ASGvVA61WFCdsSgNA/eoMXM
	 9EDecCyF4zAPCS7u4cytfF9rsiYacbZJwAbvMW4XL+xCeJviWYTKAKwR3f1vTz+L6X
	 awQ24YwJMu8TvZasbL84rRjPM25LUneHrvBzV1KBUZgOKipGVt4qxyGQLVQSg2qOJm
	 l7yC6Zrou9AEAecVic+TxgUrGjOk9H9IJjvFYO7AmNpyFw4Mt19VCHo8TXHL3JkleK
	 n6gzr81A4D2PQ==
Date: Tue, 25 Aug 2026 00:20:52 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: microchip,emc2305: add vcc-supply
 and #cooling-cells
Message-ID: <aozDxJNY8GspEvsZ@L30177.local>
References: <20260824-for-upstream-dt-emc2305-vcc-cooling-v1-1-cd3b53dfb5d4@free.fr>
 <20260824-flashcard-renewably-badc0e011949@spud>
 <1685dcc8-848a-42f7-902d-b20c7c3914b4@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1685dcc8-848a-42f7-902d-b20c7c3914b4@roeck-us.net>

Hi Guenter,

> I am a bit (or, rather, more than a bit) concerned about Sashiko's feedback:
> 
> New issues:
> - [Medium] The commit message makes materially false claims about the driver's
>   device tree parsing logic to justify leaving the binding examples unchanged.

Sashiko is right on it ! I did miss read the code.

Best regards,
  Vincent
