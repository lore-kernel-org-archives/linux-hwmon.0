Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004EF35295C
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Apr 2026 20:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776024999; cv=none; b=IJtmv5z+ZL2FJCQOI65HQv7XW7Lv6xQ38vvTQKVndEjIcNvS0i+qIfuspBu6mXel3JYffyqmF5V+UiUxgzZsPOfys0nKFxqbzvFkvirC6mxueY+tkzAjsBLHtizds+S1hVbNQJ1KtYMYVDsUW/t2J9TrprB0IBPg9rcrEjlxW2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776024999; c=relaxed/simple;
	bh=wkIoDGw2inFVbsC8y6rpJ+eOOZE8VMAt9CK5OTCHrG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnG5RkIQr7OvrfkZLX08WfF0IJer4UUFHrNwpClhWp6Jtk2euzDKF4u5i+E6j8W0mY1XzeF5R44rELtPhi+ALHyQWwjdbS4VYcL1FMNhdozmFRuAQlmQ9pmLs+mGZWZyeRNX0pzwOcT12B1R6UaxpWlItss7NrDettwXqfsW3sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=E+5vuCcY; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="E+5vuCcY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5DB1E4E429E2;
	Sun, 12 Apr 2026 20:16:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1330D5FFB9;
	Sun, 12 Apr 2026 20:16:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B536E104500EE;
	Sun, 12 Apr 2026 22:16:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776024994; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=YYgaBasPu/jNs2Sww7H5ka9hu3+0rgpJ63cKOKJsiiQ=;
	b=E+5vuCcY8XufyKdg61LHjIa8ao0Lemtd3QpFm2aXGsodRtAQVLh/XF7q7xxUBrEngeCfrQ
	Sws4n02B2Pb37njbWb9Hi/lA2d44xLw2l5hD18qw/pvl5O4zztiflEmnsgEVP62PljsCky
	NdHxfO6U4tj5z28ord/9O4rZgp7Dqr+6dxqkWWq9XPCCJZ/bT8Vc7dFRLNN1NVXJk/zm6k
	AmMlusSIfG2UAafaWjIdu2afO551qSMTj8uowrxDxpQFW9QeYYgdQtVVK6V8L2sdPq7EWD
	qEiHAI/RtBjapUEaJq5RODY2ryG4oAyKZQpBiaJMt4+9PKnXJxe7bzjXr0AfVA==
Date: Sun, 12 Apr 2026 22:16:29 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Akhil R <akhilrajeev@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 12/13] hwmon: spd5118: Add I3C support
Message-ID: <20260412201629345ffec6@mail.local>
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
 <20260409105747.48158-13-akhilrajeev@nvidia.com>
 <19218853-499c-46a2-8843-0bafa17c81d5@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19218853-499c-46a2-8843-0bafa17c81d5@roeck-us.net>
X-Last-TLS-Session-Version: TLSv1.3

On 09/04/2026 07:19:25-0700, Guenter Roeck wrote:
> On 4/9/26 03:57, Akhil R wrote:
> > Add a regmap config and a probe function to support for I3C based
> > communication to SPD5118 devices.
> > 
> > On an I3C bus, SPD5118 are enumerated via SETAASA and always require an
> > ACPI or device tree entry. The device matching is hence through the OF
> > match tables only and do not need an I3C class match table. The device
> > identity is verified in the type registers before proceeding to the
> > common probe function.
> > 
> > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> 

Guenter, I guess you can actually take 11/13 and 12/13 for 7.1 if you
prefer as they don't seem to actually have any dependency on the
previous patches. The worst that can happen is that the driver won't be
probed because the I3C subsystem will not enumerate the device.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
