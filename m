Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FE83F86F7;
	Fri, 10 Jul 2026 10:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678394; cv=none; b=cV/Rs42swISrzNzfOZqMXKgj8zmtyzz5lAfxEBbhqy0uSSFF/oI6gLf3zUGBAAGWgwMrRnKhexFSZ23w7OlXVL9UC5BTNWNGYhrLIQv2jf4UQpEOyLKbyxBvloQsHvWEhfGQ6RhfUTSFeCFM2ubi6yH6ry/+swpv18waNrmSmRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678394; c=relaxed/simple;
	bh=jF0FLl6ymivZ3T56dpr84k71wyBaBxJUTLlkktAxFGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a18vheETI1/lOXpH+lSCVyqRCavuX/KSXPRoXs4cuj/xYmEOymLe5VyDYCYCjI+Nfk+abIQnLJutAwCJzSaQSTTzoXvCp3fsnb6aZFlWVinn+g+QN9otcz3y9sLJcgIZfHPekqLxwSbHCgw/mgW0hXLSOtpM6F4xaacu4COMKpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMjwgew4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UMjwgew4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9A61F00A3A;
	Fri, 10 Jul 2026 10:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783678392;
	bh=8hbfKRDuVLHGMoceKywKuoqDqNYu8CtOmnUy8e3NQuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UMjwgew4UIdPCkArdOvI4C4B0xibaemx4mdrCZW/wzcxrR7lEYm9BNEMnBhzMFMVL
	 q8sKV4m90DH/mLxh7wVsygmAJ2+haumF32jCdVD2mWjxVdnxJigrJpTJ5TKRCJnSD1
	 c4qGyqXHDrlsnoO3Ly2jVyikKiPlJ7f29tV2b/IZypIngdI9cnonpREabW7KMalRCc
	 RBHo4ijJTQkgml/4vGmbVXL3Wxx7n+lEv/Zh8cXnu+gcMLZ62i1CE3NTFiyewE33A3
	 1HqjEYgjYwasy4rNAt/1cQJtVi464Axya9O4HeTQphWKrPxe55vMPggW7owDzQ1hHG
	 BjBl1+LqTsyoQ==
Date: Fri, 10 Jul 2026 12:13:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: hwmon: (pmbus/max20830): add
 enable-gpios property and complete examples
Message-ID: <20260710-acrid-enchanted-prawn-5de949@quoll>
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
 <20260706-dev-max20830c-v2-1-37761e89bb5f@analog.com>
 <20260706-neat-perky-malamute-7518b7@quoll>
 <PH0PR03MB6351C4B212D2CCBA3F1BF113F1F12@PH0PR03MB6351.namprd03.prod.outlook.com>
 <65ebf21f-5a23-43b5-b10c-684fe421b0dc@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <65ebf21f-5a23-43b5-b10c-684fe421b0dc@roeck-us.net>

On Mon, Jul 06, 2026 at 09:33:32AM -0700, Guenter Roeck wrote:
> On 7/6/26 00:13, Torreno, Alexis Czezar wrote:
> > 
> > > On Mon, Jul 06, 2026 at 10:08:41AM +0800, Alexis Czezar Torreno wrote:
> > > > Adding an entry for the MAX20830 EN (enable) pin. This pin exist but
> > > > was not included before. Also edited examples entry to be more complete.
> > > > 
> > > > Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> > > > ---
> > > >   .../devicetree/bindings/hwmon/pmbus/adi,max20830.yaml         | 11
> > > +++++++++++
> > > >   1 file changed, 11 insertions(+)
> > > > 
> > > 
> > > How did you address previous feedback?
> > > 
> > 
> > Regarding the enable pin, I added this since I know bindings like being complete
> > and saw that I didn't add it the first time I submitted max20830.
> > I added driver code for the gpio but learned that it wasn't really a use case so
> > I simply dropped the patch for it.
> > 
> 
> I guess I am completely missing the point here. I can not imagine a situation
> where one would want to connect the enable pin to a driver-controlled GPIO pin,
> or why would one connect the chip's PGOOD output pin to a GPIO input pin
> and connect that back to the driver.
> 
> I think we will need guidance from devicetree maintainers explaining what
> "complete" means in such a context to avoid having to repeat this discussion
> for every driver going forward.

I think complete means all reasonable hardware resources/properties,
regardless whether current OS implementation uses them or not. That's
why if there is enable-gpios which is not used by Linux but could be in
the future, then it should be documented.

However if you claim that enable-gpios will absolutely NEVER be used by
Linux or bootloader or any other DT bindings user (*BSD, Barebox, U-boot
etc), then I would skip it, just like we do not describe many other
parts which simply have no use for the software.

IOW, DTS is description of non-discoverable hardware for the software.
We do not describe hardware for the sake of description, to mirror
schematics. That's not the goal. The goal is to make some software
happy, even if this is a future software implementation.

What is the case here - I rely on your guidance whether enable-gpios can
EVER be used by software. If there is a chance, then IMO property could
stay.

Also, no harm will be done if we skip this property and we add it later
in the future when actual use appears. Maybe no need to spend time on
discussing such triviality and instead just skip it.

Best regards,
Krzysztof

