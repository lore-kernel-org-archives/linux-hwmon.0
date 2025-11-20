Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA339221271;
	Thu, 20 Nov 2025 08:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763625728; cv=none; b=f6Hmntb/Uq2j5SF/C2r9mfm7N50BdMZzi8wN6u1fbhG8rEFemBwp5zgHK/jJU95XUnzBdfoQHJvXvFUIR0nyGYHCPqQOnLEx231mJ6rzlMy0dL4+jX7KK9PqgnzsZXdOj9PSThlsCTJGsj9uKz/pg3DhLZDRsvteediDUnhqym0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763625728; c=relaxed/simple;
	bh=mmzn6UC+XT6yk7vSSz8rO7MiIRbmBMxComsmjWtmqgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5vdcoKH1kZNPMK7MOjJXQ3jjdg3xU6ET7ZuC7rlsKzXi6WZOZLUsUmOkdG8Kb5wfEQ/uokcIFcaDKU/vtdNa+DwEk2tTuq3UiqAsMZBjZjUgtnyYY6d7r3u3+VfLHSlJ2YkLt8BaQ7bSA8WCzbE7g2Sq3F20BifCkpU2WL1Hmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s9tcBmKw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s9tcBmKw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13C5C4CEF1;
	Thu, 20 Nov 2025 08:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763625724;
	bh=mmzn6UC+XT6yk7vSSz8rO7MiIRbmBMxComsmjWtmqgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s9tcBmKw0xtxde1vbfu3KXoQuJJ3WllVlxNvksp/DTOano8dJrxkPVs6Kh2TnOwy9
	 qBPFGbKin+c4hnQBC8+z7gQ2nD57Rp0ze9ZRiHiGYc4I1qSFG4PDYEJ8xjiEMpMq1b
	 pes05/5SRpfgJ0VXRNxc01vkxR8ohZ9ITvOrbnm08nEPHYofAM7ebTXecT0c3nf5T5
	 SEVKYOAL61kEi/t/x/1aoNhUVKTHh76wsBwRAKj5GxDYMeYJRDmJRHPpoZz/MHzEKB
	 6TDS9wKD3hT/yaACF8w5zUdK3TEzwNGyIWjlv98htce4cZKT3XQ2RGGJ+F1X06H5zH
	 aFEbcKYk9AmAQ==
Date: Thu, 20 Nov 2025 09:02:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thomas Marangoni <Thomas.Marangoni@becom-group.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux@roeck-us.net, corbet@lwn.net, Jonathan.Cameron@huawei.com, 
	michal.simek@amd.com, nuno.sa@analog.com, Frank.Li@nxp.com, wenswang@yeah.net, 
	apokusinski01@gmail.com, dixitparmar19@gmail.com, vassilisamir@gmail.com, 
	paweldembicki@gmail.com, heiko@sntech.de, neil.armstrong@linaro.org, 
	kever.yang@rock-chips.com, prabhakar.mahadev-lad.rj@bp.renesas.com, mani@kernel.org, 
	dev@kael-k.io, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: Add trivial-devices for WSEN-tids
 temperature sensor and wsen as vendor-prefix
Message-ID: <20251120-towering-clam-of-memory-d96a6e@kuoka>
References: <20251119125145.2402620-1-Thomas.Marangoni@becom-group.com>
 <20251119125145.2402620-2-Thomas.Marangoni@becom-group.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251119125145.2402620-2-Thomas.Marangoni@becom-group.com>

On Wed, Nov 19, 2025 at 01:51:38PM +0100, Thomas Marangoni wrote:
> WSEN-tids only has an i2c interface and an optional interrupt. This
> should qualify the sensor as trivial device.
>=20
> WSEN is a subcompany of W=C3=BCrth Electronics specialized on IC sensors.
>=20
> Signed-off-by: Thomas Marangoni <Thomas.Marangoni@becom-group.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  2 files changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitt=
ing-patches.rst#L591
</form letter>

Best regards,
Krzysztof

