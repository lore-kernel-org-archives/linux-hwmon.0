Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428887;
	b=Lynx58SzDKpLLaeET/vFcExu8YTRtwtlivGi3W+R731WyQSBsleYWNHyjY9D6dejlQug
	 zKLbiXjmhlck3PgobEyMDMHNwHJ0QzjlxBTyVmJSyp0WE15Kl/SfEBcisls3nRt6EMynr
	 3WJxjb73fihJa/XLDmCoMi+r4SUffEiKymey2WPhvubznl4QUMB05yHejpWBTwsK7CR5W
	 XtImny0cB8l2yAm+8vPfRQ35ABkIQaC07C93wz3FgDiQ1KDrGH/wk2KwsnmPhS7+F1igB
	 1oyuF1pi5kRH7VTezOoUp24BLfZL4FLhV8u2/9N2sQAGlW0UnrBkETILQyuaK5ZSW8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428887;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=F8z8y09+jVKBbKZimDHdTs8APxEMDZ3eZWZtEqP2bQg=;
	b=bvumkwgReM0aBb8oGEXF6H2JSEShcJOGAZREjXf2Je744WVuxGAf+IjlShAHdS+DnSg/
	 ZIacTsQIfi2QqK+7bPizz8e8xbSXZMyt8ijcZuzLQ2IrSAX5tGcaHgVI89DGg2Q1n+Uuj
	 9HQ+13MYB5T0yZypJFScAp3MRXb2KDgi4WTF76nrgAfR5EHxNuq2MCXZcWzagFfY9VDUV
	 r6eEOJplxVsVromxTH1EsMF+3dI8vy4ozxTnwEPMjDxPGELvl+ftus2vtMFFQ470bG4nR
	 xsTs2hNCAAtANz04eK3qVkhGHiOVRDanpudwNCo+NKsxYfTr2M067YvDaUSCOCcHdaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iNfrCfF2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC5A606A324;
	Mon, 19 Oct 2026 16:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iNfrCfF2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC121F000C8;
	Mon, 19 Oct 2026 16:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792428886;
	bh=F8z8y09+jVKBbKZimDHdTs8APxEMDZ3eZWZtEqP2bQg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=iNfrCfF22qt69ASu4DIy5bvfZGH2R+H/cN1fb+j0aBwNaUWdKBqb4S82vM8qqwVhq
	 fJJi85A6fAd2Wxrqj/PTAGLl8eSGPWVqXc118mzfdJZFS1JiTFvRxk8GT1a0yuST/t
	 Uw5OhjxPpMrp2rncy9sM9SBMQrJKZq5lHwhQR+pTJCeXzmDDWPE5KLUh5FD5ezSAkO
	 BFX2Uxr9XzpDjn1cP/pJe6S50qpYIaj9KqZgT9Z2z8oLJCOD+g9G/IjuB6+8kEjBmi
	 KFZ5w042d4cImFxL3KZWxYisdEY6cTQUZN/GFvIOgldipVsL7pTIy6lnLGO7Yd4Bzz
	 UuWVHYto7Ku6g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 42293CE09FC; Mon, 19 Oct 2026 09:54:46 -0700 (PDT)
Date: Mon, 19 Oct 2026 09:54:46 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?iso-8859-1?Q?Sebasti=E1n?= Peyrott <speyrott@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (minisforum-um780xtx) Fix clamp() build failure
 with GCC 11
Message-ID: <04a379a5-f2ab-48b4-96dd-9c6d611224b5@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fda0e59f-20e1-4a94-a714-288940dcdd37@paulmck-laptop>
 <20261014214522.243253-1-speyrott@gmail.com>
 <2bffbd3b-391d-492f-959c-fb9128bce49b@roeck-us.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2bffbd3b-391d-492f-959c-fb9128bce49b@roeck-us.net>

On Sun, Oct 18, 2026 at 09:16:44AM -0700, Guenter Roeck wrote:
> On Wed, Oct 14, 2026 at 06:45:22PM -0300, Sebastián Peyrott wrote:
> > GCC 11 fails to build the driver:
> > 
> >   error: call to '__compiletime_assert_727' declared with attribute error:
> >   clamp() low limit 0 greater than high limit points[1] - 1
> > 
> > The store function returns -EIO unless points[0] < points[1], so
> > points[1] - 1 cannot be negative when the clamp is reached. GCC 11 jump
> > threading, however, duplicates the clamp() limit check and does not prune
> > the copy in which points[1] is zero, so the compile-time check in clamp()
> > fires on an unreachable path. GCC 8 to 10 and 12 to 16 accept the code.
> > 
> > Select both limits first and use a single clamp_val(). This does not
> > change behavior.
> > 
> > Fixes: 9d980da93bbc ("hwmon: Add Minisforum UM780 XTX EC monitoring and fan control")
> > Reported-by: Paul E. McKenney <paulmck@kernel.org>
> > Closes: https://lore.kernel.org/r/fda0e59f-20e1-4a94-a714-288940dcdd37@paulmck-laptop
> > Assisted-by: LLM
> > Signed-off-by: Sebastián Peyrott <speyrott@gmail.com>
> > Tested-by: Paul E. McKenney <paulmck@kernel.org>
> 
> Folded into original patch, as suggested.

Thank you both!

							Thanx, Paul
