Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA1957C9F;
	Thu,  5 Mar 2026 02:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772678311; cv=none; b=kPsIRqCReJKsLUDXd+nXrSindHlSfMyKYAuwElSOD/Q59K2CDtHz4oPRKjjGD1cJIERQIdVq75AWCcP4fQLY+dWnJ9oZNMVu8zpVO7WArANtC9hi7+bsmigBMQCdzZKGHZvplyEEqiAJF8h6KQfGIyXPw8JiMlfh1Zo6Ho3c/yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772678311; c=relaxed/simple;
	bh=506uDU247HDePGang6seeRFn49SvlHkZJdjIiHrnIIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4amTnbuEp7gxDpOLYfOF60skZ9Ylsk6DnXrs5HcWZewSgr62AVLpFTOqUQlpkFfio20HsiJRwhk9Ps6rU/XVnxQL1mclNm513HObnhXVOVgkgjFVuUURKOLmAy5sbLsT82tx0h2/YhcyNYHj+vRRcpf+Fz7Wb8Z4agUCEqHFb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqK66pFk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqK66pFk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0FDC4CEF7;
	Thu,  5 Mar 2026 02:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772678310;
	bh=506uDU247HDePGang6seeRFn49SvlHkZJdjIiHrnIIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JqK66pFkJv3DsxZtTjLCQTS5nU5r/UkcspNfG1yr0Wp8HYy1av1eFpgN08faC+bas
	 wb/a4TGMvAAFd/cDtfzUsR5Wv75LUdswOgNKG8u0Wzu9vJWEC22OkOIqONRs6naE9F
	 wnUzpwkdCKc60naF4k/CAjcsC4PvNc5OrMdSvFlcaCc+CKN0WvVEQbxJqn/Ab6Sn2F
	 QiR16M12tA+1b+jSnDRaVZUgVkPjXP9DMNi/m95pSIWZ++dFg8mR/4UXS+oe1BLWUZ
	 cdCB2E49+fIf3xquWRxCPNRHVkWpiWzjnYPxvu1zMCFNToq203GCzR2HzLWji7C5rx
	 LZ5UuYRHmaU7Q==
Date: Wed, 4 Mar 2026 20:38:29 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>,
	Lee Jones <lee@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linusw@kernel.org>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: mfd: add NXP MC33978/MC34978 MSDI
Message-ID: <20260305023829.GA3128030-robh@kernel.org>
References: <20260303133947.1123575-1-o.rempel@pengutronix.de>
 <20260303133947.1123575-2-o.rempel@pengutronix.de>
 <177254885509.3251575.14819823286886805862.robh@kernel.org>
 <aacH7NmkOzZued0Y@pengutronix.de>
 <CAL_JsqJztUNizCcn=VCoGfmaMy3r6wDTLwZH5r6vj7kh6q9qAA@mail.gmail.com>
 <20260304-arose-pampers-fe07c893d079@spud>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304-arose-pampers-fe07c893d079@spud>

On Wed, Mar 04, 2026 at 06:33:34PM +0000, Conor Dooley wrote:
> On Wed, Mar 04, 2026 at 12:26:17PM -0600, Rob Herring wrote:
> > On Tue, Mar 3, 2026 at 10:10 AM Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> > >
> > > Hi Krzysztof and Rob,
> > >
> > > On Tue, Mar 03, 2026 at 08:40:55AM -0600, Rob Herring (Arm) wrote:
> > > > >  .../devicetree/bindings/mfd/nxp,mc33978.yaml  | 114 ++++++++++++++++++
> > > > >  .../bindings/pinctrl/nxp,mc33978-pinctrl.yaml |  82 +++++++++++++
> > > > >  2 files changed, 196 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
> > > > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml
> > > > >
> > > >
> > > > My bot found errors running 'make dt_binding_check' on your patch:
> > > >
> > > > yamllint warnings/errors:
> > > >
> > > > dtschema/dtc warnings/errors:
> > > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/nxp,mc33978.example.dtb: gpio@0 (nxp,mc33978): $nodename:0: 'gpio@0' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
> > > >       from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
> > > >
> > >
> > > Folding the mux node into the parent as suggested [1] causes this error.
> > > Because the parent now has #mux-control-cells, the generic
> > > mux-controller.yaml forces the node name to be mux-controller. Since
> > > this chip is primarily a switch/GPIO controller, naming the parent SPI
> > > node mux-controller@0 is misleading.
> > >
> > > What is the preferred way to go here?
> > 
> > I think there was another series dropping the mux-controller node
> > name. Not sure what happened to it, but that's what we need to do
> > here.
> 
> It's here:
> https://lore.kernel.org/all/cover.1769703480.git.tommaso.merciai.xr@bp.renesas.com/
> 
> Tommaso pinged me about it wondering what to do. Mux maintainer has been
> unresponsive. Maybe you should grab the binding portion since it is
> blocking other work?
> https://lore.kernel.org/all/cover.1769703480.git.tommaso.merciai.xr@bp.renesas.com/

It is now applied.

Rob

