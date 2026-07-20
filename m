Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41C030F819;
	Mon, 20 Jul 2026 16:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784563629; cv=none; b=rjDTUnZA8LCkjAabaHjp9fPXgAZiNwA32lGnRx1Gno1ZoBkZUgBi8JhTgBW+hycMZnzB/d62JnktCReZXtWywLvXfabohm7ytvp+GvVEVQvxaY6oesLJ19CMg9MMMxIDtgozsCQtFSYG4+nihLiSLKuaM4a4huQvlCWi03A8IWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784563629; c=relaxed/simple;
	bh=cDnkQdPIuOoFtVNYtxgiA3XD7U8fp+F1Z8/GP4AscrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1HF3tbQWw/kc2sqVcK7tiBLr0Kk5WjNM1LMulPZLfr4DknNwWxAIny8l1l5BLwU3EAD3NC4KkvFUgAdbBwqkrL1DnqPsLshWRC54Qdp+uNeeTPgvaCf2nY8kZ45sklzVF+T0B9owTOhqUmBecxOeT7/5Qg2+47hr2dXFVLuWno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SfEVFH66; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SfEVFH66"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 483571A10C3;
	Mon, 20 Jul 2026 16:07:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18F8360360;
	Mon, 20 Jul 2026 16:07:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6EC211BD3CC1;
	Mon, 20 Jul 2026 18:07:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784563624; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=utWdvu19UNZoxJGvC9DGJv7trvlZp6J4sIOyLrpLToc=;
	b=SfEVFH66oqT+dpdZlYmxW8cXj8hCgnZvQ97i28dcV+BpRyTibFoFlF/Oc1X5s32eT+PHe7
	kWk35LUlaNlwXb+BsJPoSV2izZ1wPTJ6HUES4TVmdVnreurls+o6M6gwdyLnwWVNP1Uh6s
	wlFjUNlZTqmESIhVINyYXkDn/+v7sVGy8sjtpvEaC9mKh6jxQAfDIZTshLJO6HURGVZdCC
	uMY+fUKdbDbU4BUFDGRhmEAClWdR+bQqydFPF32+osTDh3fls/Jpd5fl3bhNF/e5kYCZbL
	okwjeC9X6VESZV5XsND/gpGsei34x1TKpx7vXoV/I7KUh461x/+MHObPyANCtA==
Date: Mon, 20 Jul 2026 18:07:01 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: frank.li@oss.nxp.com, Frank.Li@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org, robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v5 04/12] i3c: master: Add support for devices using
 SETAASA
Message-ID: <202607201607012c70129a@mail.local>
References: <aj0iG5xplWPWc6m_@SMW015318>
 <20260703090855.1519255-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703090855.1519255-1-akhilrajeev@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3

On 03/07/2026 09:08:55+0000, Akhil R wrote:
> On Thu, 25 Jun 2026 07:42:03 -0500 Frank Li wrote:
> > On Thu, Jun 25, 2026 at 09:38:15AM +0000, Akhil R wrote:
> >> On Wed, 24 Jun 2026 13:57:46 -0400, Frank Li wrote:
> >> ...
> >> ...
> >> >> [Severity: High]
> >> >> Is it possible that sending the SETAASA broadcast before direct SETDASA
> >> >> assignments breaks initialization for devices that natively support SETAASA
> >> >> but are configured for SETDASA?
> >> >>
> >> >> According to the I3C specification, any device on the bus natively supporting
> >> >> SETAASA will respond to this broadcast by adopting its static address as its
> >> >> dynamic address.
> >> >>
> >> >> After this broadcast, the driver iterates through devices and attempts to
> >> >> assign custom dynamic addresses via direct SETDASA commands:
> >> >>
> >> >> drivers/i3c/master.c:i3c_master_early_i3c_dev_add() {
> >> >>     ...
> >> >> 	ret = i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
> >> >> 					i3cdev->boardinfo->init_dyn_addr);
> >> >>     ...
> >> >> }
> >> >>
> >> >> Since the target device already adopted its dynamic address during the
> >> >> SETAASA broadcast, it is no longer in the unassigned state and will NACK
> >> >> the subsequent SETDASA command.
> >> >
> >> > Look like correct, but I am not sure if target will NACK SETDASA. Or should
> >> > use SETNEWDA for SETAASA method.
> >>
> >> Yes, this looks valid for mixed device buses. I can move
> >> i3c_master_setaasa_locked() after the SETDASA handling and before
> >> i3c_master_do_daa() in the same function, so SETDASA-assigned devices will
> >> ignore the later SETAASA broadcast. Does that sound good to you?
> > 
> > yes, try it to follow spec.
> 
> I just noticed that the specification says: if both bits 0 and 1 are set,
> meaning both SETDASA and SETAASA are supported, the I3C Bus Controller should
> use SETDASA first.
> 
> So moving i3c_master_setaasa_locked() after SETDASA handling follows the spec.
> 
> I will wait a few more days before sending v6, to see if there are any other
> concerns.

No other concerns on my side.

> 
> Best Regards,
> Akhil
> 
> -- 
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
