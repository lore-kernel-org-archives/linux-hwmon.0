Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB9C50AC19
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 13:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897142; cv=none; b=hERi9Z1s//qSWafaPWSZkNi+S3GqCPDO2jNrp7KmLANxZxofBGteP9OrgCUyfCRLgSg8cgfw/fYXMcEnf77ESR2M85Q+0brKdYzL8ywU4vc4ECOirwdgdci/HZbdTfE83osuObGupw4QZ102+dEqWQ65FjruDTndUvOrCNDRffs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897142; c=relaxed/simple;
	bh=p2iE2gI8+Ynsu3GNbYcIJnwDGdY0aMhToMP2qipExis=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=SZerYt2HtwuFb9bZ3SCp2YOPIjPq4o0279W1nXHP96qL2c23T/DGLZ/vDfNLTwK5HtKZt7dSQEQ0P5SfdBdwbAXdxUukszxxmyEOr88+HQ/b94PikF9oLaZBNpYeDOqqb9gx/lE9Yvld/vkg9k7gGmiK3pO4HaSvm2gfXIr1vzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdJzDXux; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdJzDXux"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4551F000FF;
	Tue, 13 Oct 2026 13:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897140;
	bh=p2iE2gI8+Ynsu3GNbYcIJnwDGdY0aMhToMP2qipExis=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=mdJzDXuxG4wDFtuj65+/5qGhhNOSzRDosZjv9nSe7T4D7tRHgwAygteEH6pNFINZi
	 gClSGO8Lqz2w4sq5mH/ItkDnUxrRZmum5g7WVP3rbTtRft/O+ir9fzqSVuHtC7i6a8
	 NOKJMHUKYg4quv//sGLbzDSTGPVPd1//66+PhIY8b6FZrR3tTwmQ9GQmd8gVx0Rtrq
	 GwEVgGevpBMlsrAH5cmcgFjITza2LlmtoCKYZICgCVQHsyGqZCedasfwRBLyoUdPMB
	 pdnxWQ862ZvKJgbhkbTy+U7YRcCMrcfAF+P+1dk2JYlctSXb+ow7YGuOXBmcV/fP/A
	 Vl9SYOvP2877Q==
Message-ID: <sashiko-outbox-169783@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] hwmon: sparx5: register LAN969x fan as a cooling
 device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261013125735.1542349-5-robert.marko@sartura.hr>
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
 <20261013125735.1542349-5-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 13:12:20 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Allow the LAN969x hardware fan controller to be used by thermal-zone
> cooling maps when cooling-levels are provided on the fan child node.
>=20
> Translate cooling states to PWM duty-cycle values and keep the cooling
> state synchronized with direct pwm1 writes. Register the cooling device
> against the fan child so thermal references resolve to the correct node.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013125735.1542=
349-1-robert.marko@sartura.hr?part=3D5

