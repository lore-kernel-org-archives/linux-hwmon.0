Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B36D4A33EC
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 16:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772554242; cv=none; b=qY0yjsW79/EPti8XaIpgERzcXKbzAkw5ylIseh8zJlyeXYIxQ4uPorpwSwLBC2WBmIPbAuKi743+0gv2+Dzlail8EBPdDvYtw0n7djBccXqfZRe8OEc2rqHIvia6fWrX3BfdNqlppkbjdsl5cpYWh32oFxmlhnxlHpeKoj2/QiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772554242; c=relaxed/simple;
	bh=3Bq5QIwIvHJGRt95CVL/++zlq/FaP6pRDBmGmePMbqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PnL9RU1URZxfaAFB+yutP2SnTHUcWMEHgecpcv89rdqNthBH0TOu3HyQBTOGJt0kymYvdsinZAMSelxYWLKaJLHIGAkJI2MG2aZWKKTMZAvN/DjCouuTtQTyiO/TChpgEzQAowoEvRE3XhluTc4BL2PmHjAmvEA1K8b2Z2s4KlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vxSKD-0008QC-Jo; Tue, 03 Mar 2026 17:10:21 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vxSKB-003Zjk-12;
	Tue, 03 Mar 2026 17:10:20 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vxSKC-0000000G7OJ-2Kx7;
	Tue, 03 Mar 2026 17:10:20 +0100
Date: Tue, 3 Mar 2026 17:10:20 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>,
	Lee Jones <lee@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linusw@kernel.org>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: mfd: add NXP MC33978/MC34978 MSDI
Message-ID: <aacH7NmkOzZued0Y@pengutronix.de>
References: <20260303133947.1123575-1-o.rempel@pengutronix.de>
 <20260303133947.1123575-2-o.rempel@pengutronix.de>
 <177254885509.3251575.14819823286886805862.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177254885509.3251575.14819823286886805862.robh@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

Hi Krzysztof and Rob,

On Tue, Mar 03, 2026 at 08:40:55AM -0600, Rob Herring (Arm) wrote:
> >  .../devicetree/bindings/mfd/nxp,mc33978.yaml  | 114 ++++++++++++++++++
> >  .../bindings/pinctrl/nxp,mc33978-pinctrl.yaml |  82 +++++++++++++
> >  2 files changed, 196 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/nxp,mc33978.example.dtb: gpio@0 (nxp,mc33978): $nodename:0: 'gpio@0' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
> 	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
> 

Folding the mux node into the parent as suggested [1] causes this error.
Because the parent now has #mux-control-cells, the generic
mux-controller.yaml forces the node name to be mux-controller. Since
this chip is primarily a switch/GPIO controller, naming the parent SPI
node mux-controller@0 is misleading.

What is the preferred way to go here?

[1] https://lore.kernel.org/all/20260226-clever-rustling-dolphin-871aff@quoll/

Best Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
