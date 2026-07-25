Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDEA23AE62;
	Sat, 25 Jul 2026 21:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785014796; cv=none; b=r3HqqyGcVGtWfgPkyVEwzfFnyzsbLLM1zMT3wRRCcrABm1Oo/TGbcd9xhZ+XbkOWfSS15RewYcNhqy08FbuEcSDWOnFCaJg8e1KXcE56+efsdN+6G7iAgLUt+ngWTiUpo8koJqRrnJQkOJzBm7LnwEnwAD/CC23rukxKh0YUTXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785014796; c=relaxed/simple;
	bh=MpVxxpl5WZDMxYK2gqklDUY1XwZDcPXQrYVZiNs1zFY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MITYaaqXv/T1iXbjyN2HXK4BGSQbWCb2A7TluFFMFlwGbxfLsmvMLVml47737VYZACwCUx1hm1CbIscVb1IIUWMk/AFaN+lsv9LEi9vYmQeBqbQGKX8ZhX4CdmGPt47/4cbjcGLHkY4saLhRelWFAqg+zK/ydzaC989bwq/NJck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XcJDxVbf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XcJDxVbf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 299E81F000E9;
	Sat, 25 Jul 2026 21:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785014795;
	bh=MpVxxpl5WZDMxYK2gqklDUY1XwZDcPXQrYVZiNs1zFY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XcJDxVbfL++xyYAtGXubw3+iQftrbGHOfguq4jkvKuIQwUG96xbiaU5rCeFZwpC0O
	 iq54zedtU69qT53ylKqJ5eCsxiP7+ek5iQTHWbAwsNI/rRfJgw1M5Rr63wFbR+WGuO
	 GKLkS1Kw/cwBYvGmVmKiY+A0narPreabrS5kJxRgkz/dVrz+XEFOqi/NBKSQ4McPXX
	 IsUD6z+c5hu4cEtMqcwon65E/6jJfAvspryZJyn5P4kP0ef5YypealcKdBB7bh+BQH
	 LEUzF5OKEbiY6EiJn8PEIiDFSLWLnvODHAmnHP9VLYr1WRh8GE4xRcwvm/+oUNFgDB
	 uvtZQG47EwhnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX16545/MAX16550 and Volterra VT7505
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UHJhZGhhbiwgU2FubWFu?= <sanman.pradhan@hpe.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260725211945.288415-2-sanman.pradhan@hpe.com>
References: <20260725211945.288415-1-sanman.pradhan@hpe.com>
 <20260725211945.288415-2-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 21:26:34 +0000
Message-Id: <20260725212635.299E81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Sanman Pradhan <psanman@juniper.net>
>=20
> Add device tree binding documentation for the Analog Devices MAX16545 and
> MAX16550, and the Volterra VT7505 PMBus controllers.
>=20
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725211945.2884=
15-1-sanman.pradhan@hpe.com?part=3D1

