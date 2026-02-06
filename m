Received: from carl-amd.amd.com (unknown [218.32.81.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165F41D6AA;
	Fri,  6 Feb 2026 06:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.32.81.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770360141; cv=none; b=WXAu3taog7jh48nGgUyKVUPKTJWqnuAi924HKqqijeqAO8PHqAFqZotcuT60mHWbYXVkJl3HAg2cDx/AFI+lTpFMyrXsCoGNBctgtB6sHS9NrZLPzlrUcHGm1KEZO0SePlT5BkYgxpTaXNc93piwfY6XzqehP5SE1d1qQDzxw6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770360141; c=relaxed/simple;
	bh=WxU43T15Ay7FVgSmMVyl4sbcVpIPJA6jURP2oOfkTXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssEOwjbtcbg9MRsxWURKEVnY08TYp4hEdV6S0eXDZ2YwwSOk+EngpqldChRlzhLmVULwrH4/g7FYv4gh7eAqBo6Ax0rjpSOPSCrgK1apAbWxhEu+IHiwqLN/XgL0xJAcs/j1y24mMstZKT9+9I8JZquAOrqH0hlNFZvDwEWRrS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; arc=none smtp.client-ip=218.32.81.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Received: from carl-amd.amd.com (localhost [127.0.0.1])
	by carl-amd.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id 6166fs1e1008273;
	Fri, 6 Feb 2026 14:41:54 +0800
Received: (from carl@localhost)
	by carl-amd.amd.com (8.15.2/8.15.2/Submit) id 6166fsxI1008272;
	Fri, 6 Feb 2026 14:41:54 +0800
X-Authentication-Warning: carl-amd.amd.com: carl set sender to carl.lee@amd.com using -f
Date: Fri, 6 Feb 2026 14:41:53 +0800
From: Carl Lee <carl.lee@amd.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Charles Hsu <ythsu0511@gmail.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, peter.shen@amd.com, colin.huang2@amd.com
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: pmbus: mpq8785: add MPQ8786
 support
Message-ID: <aYWNMdfFpW2A0SGy@carl-amd>
References: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-0-3744cd9b2850@amd.com>
 <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-1-3744cd9b2850@amd.com>
 <20260205-cordial-warping-pronghorn-aeebe7@quoll>
 <79a6a2bc-4894-4ff9-8a11-5ed71195cf09@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79a6a2bc-4894-4ff9-8a11-5ed71195cf09@roeck-us.net>

On Thu, Feb 05, 2026 at 08:17:07AM -0800, Guenter Roeck wrote:
> On Thu, Feb 05, 2026 at 02:46:29PM +0100, Krzysztof Kozlowski wrote:
> > On Thu, Feb 05, 2026 at 06:01:37PM +0800, Carl Lee wrote:
> > > Add device type support for MPQ8786
> > > 
> > > Signed-off-by: Carl Lee <carl.lee@amd.com>
> > > ---
> > >  Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> > > index 90970a0433e9..aec7397a29f9 100644
> > > --- a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> > > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> > > @@ -19,6 +19,7 @@ properties:
> > >        - mps,mpm3695-25
> > >        - mps,mpm82504
> > >        - mps,mpq8785
> > > +      - mps,mpq8786
> > 
> > Your driver code says they are the same, so compatible. Express it with
> > fallback or provide real rationale in commit msg.
> > 
> 
> Agreed. The mpq8785 datasheet is public, but the mpq8786 datasheet isn't.
> That makes it all but impossible to determine if there are indeed no
> notable differences between the chips.
> 
> Guenter

Agreed. There is no chip-specific difference in the driver code to justify
separate MPQ8786 support. 
Therefore, Therefore, I will use MPQ8785 for support.
