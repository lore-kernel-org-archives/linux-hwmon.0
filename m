Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F96312821;
	Mon, 16 Feb 2026 16:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771258934; cv=none; b=HweE77RCptiVVbGd3d495L9NC9+5OzQdHupQg/IhNelETh6F71ououVIBKNdzTK5wvSPWyTePGi4ZBZOC84FfEyctLw3jcjAVFCnojPOaHBdGZvqsg2rFpqb1QpV04b2gIIltfgRgcnGcOLfz4m2VPhk/aJ5OXoNa16wJu5O8e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771258934; c=relaxed/simple;
	bh=wvqDLZFvY1On6e8TFnSfctct62+0IJvImXxLPolTnCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsyODaKAgIumvzaCLaolArFKlqEY89gwWDTVrgDpQl/KzN5Z2E+P9Jk4mK9EBvLXPAmes5zNq7l45oE9NlFjhRJ5KUt66XieSKH0xOqcWOuZwFWl6tcP0vFXcDkCPPLBVEq05jXt55g/HGhudpKWOzf9zt+S05YU30AMu9yqsBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1vs1ML-000000001G9-12jr;
	Mon, 16 Feb 2026 16:22:05 +0000
Date: Mon, 16 Feb 2026 16:22:01 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] net: dsa: MxL862xx: don't force-enable MAXLINEAR_GPHY
Message-ID: <aZNEKS-fefEgqhTs@makrotopia.org>
References: <20260216105522.2382373-1-arnd@kernel.org>
 <aZMKXavVQPelSXcG@makrotopia.org>
 <306e79fb-f3ee-434e-a90e-547e97d2a5aa@roeck-us.net>
 <c881a13a-0687-4e4d-b70b-900f91acd212@app.fastmail.com>
 <70a195ab-3b61-47fb-a361-17b53cf7bdda@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70a195ab-3b61-47fb-a361-17b53cf7bdda@roeck-us.net>

On Mon, Feb 16, 2026 at 08:20:41AM -0800, Guenter Roeck wrote:
> On 2/16/26 07:34, Arnd Bergmann wrote:
> > On Mon, Feb 16, 2026, at 16:17, Guenter Roeck wrote:
> > > On 2/16/26 04:15, Daniel Golle wrote:
> > > 
> > > Technically, with "select MAXLINEAR_GPHY", NET_DSA_MXL862 should depend
> > > on "depends on HWMON || HWMON=n". That would prevent NET_DSA_MXL862=y
> > > and with it MAXLINEAR_GPHY=y.
> > > 
> > > Maybe it is time to implement dummy functions for hwmon API calls
> > > to avoid all this.
> > 
> > I had considered this when I found the build failure, but
> > I think removing the 'select' here is much better: this
> > simplifies the dependencies, and allows a valid configuration
> > with hwmon and gphy support in a loadable module that would
> > otherwise be impossible.
> > 
> 
> Makes sense. I think I'll move forward with the dummy functions anyway
> because with that the #ifdefs in drivers are no longer necessary
> and the "depends on HWMON || HWMON=n" becomes optional.

Yes, that would be great and eliminate that whole class of obstacles
with some inline no-op stubs in the header.
