Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDB01C6B4
	for <linux-hwmon@vger.kernel.org>; Fri,  2 Aug 2024 05:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722575526; cv=none; b=ccn239yORug2Bn3hCHrodfgF7ozF0A8LIC2WQg3It7B5yYDtIE9kKmcAHgcpw5ID/7pfGyVvnXNPrg59pH3pnnIfewtgGJAYuNFJVeUj/6TFYh7J5g5m+X9VaYH0vcbAQ2tzwUPj8TcOyVAC3TygARjANCATVMEDLYD3d+7OhGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722575526; c=relaxed/simple;
	bh=GANHcVs/u+gYa9PU6hqOrjgbQbwikQm4kygySYJSr4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyhYlXwe/S48JCmZk0Ccne3nP2Ooa4jgp4D5pZRxNd9ARewL8te3KAuOGZ5yCenLecZQo1XNZbAtYyWJZzubIcajVzLEzSdC60HhNczswf1lgoPHRI2o/4VS6mm8deE8Ltfq22kB+LbaXdVdNRcbyVx0kOlrn3nURWCX2szNsN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPxeE3ls; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPxeE3ls"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38BC2C4AF0A;
	Fri,  2 Aug 2024 05:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722575525;
	bh=GANHcVs/u+gYa9PU6hqOrjgbQbwikQm4kygySYJSr4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPxeE3lsY0zUfuJ72ZuT8l/LV6csDN6uISVJRHwIppK2pz2Zir+tGpklzS0KGVYU/
	 edvRlmgCnejZymh7sSVPVChUVYOEKbY+K9wmpR9Gs6bAth6huYmUlZPuXH1jjezpaC
	 nLfwGABrOgUokZPgDHw9NbEBGLYiXLUg5w/uTzTYHZORJZnQ57OS1Ecfrd8rAa+m/z
	 pCmGlRlPYuB4n37NqgpZaeVatxMjdstS+vU1v8X84yNjDSKlpzvXSouwDDyK0vaaTd
	 YAAMY1kkm2SNeIZLjEFaRk9cPeyOHPHX0yDxZTpU6EFa1CVAIqjP/5Aefh7A2uByuk
	 DJ7ZZMDZMdCZA==
Date: Fri, 2 Aug 2024 05:12:03 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 2/6] hwmon: (lm92) Reorder include files to alphabetic
 order
Message-ID: <Zqxqoz4um8RphB81@google.com>
References: <20240801144918.6156-1-linux@roeck-us.net>
 <20240801144918.6156-3-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801144918.6156-3-linux@roeck-us.net>

On Thu, Aug 01, 2024 at 07:49:14AM -0700, Guenter Roeck wrote:
> Simplify driver maintenance by reordering files to alphabetic order.
> 
> No functional change.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
