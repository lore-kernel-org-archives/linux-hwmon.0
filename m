Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1238D43634A;
	Tue, 16 Jun 2026 10:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604575; cv=none; b=MOQP6lB0+4mBaCsgLdGb9OV7Aux5UXACSAneTX28kOrYqhUKEHgAHzV7VaSZOILJr16oVgrENtSvNh3b1ZZqU3zw1c7IYVS15IiWLZ+TqkODU8iRq2ucgya8xyHAILV7a7j76mIOsNw/hzYAbM/3LxVlilyWZqQ+L/gnn7F1uUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604575; c=relaxed/simple;
	bh=uV6sAE5MuQDix+EpLcN3XDCl4e4foIl7MdMMFw97FlI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sI7wdruUhf6YnrJJwwCRb7+sTmHk0i89nPDhPfuFOmJMglVbHFBYnFofA+j05ypZMawbOyJHXfXj3H79AfV8nMiBlGVrPVb1NrO2A3MDl1tI0MS2He5qlvyxALAXop3xwuhvJDQTX/kVYEGv3ziCszwGIJk9pDpaIvxoUbbhnLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fIs+qIkc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fIs+qIkc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F2A1F00AC4;
	Tue, 16 Jun 2026 10:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781604573;
	bh=uV6sAE5MuQDix+EpLcN3XDCl4e4foIl7MdMMFw97FlI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fIs+qIkcMXW73ccx0PiF4y356tMm+2Jtqg5b0CnhgmEaWzDn/sxJX8HutnflWBofx
	 Glu93jzgB0tlJz6CBWG+04o9BIh9uIm8DDI0P/BJpdJe6KsUTdBBRPW32J0KXg9ZIv
	 1kPU6xxt6UqqnLESZ278r1O5BP/IWpUk5h2vFTuFeaO7HlMKxLIJLstnYhM4Y+ulgo
	 tqep6Tiw+4eGo4RY8DQ6NqRPqv//JWQTVUS9Qg/PGT76FWaAeTUBBcAEIrl35LaLJ5
	 VY9OiK7Z/b9lXCkfgLKGH+3lsjz+i9gNju1lZTnIALNQGB24zhWB5k/H4lRyNXYKOS
	 U4I3BMZ1iRf7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/12] hwmon: spd5118: Remove 16-bit addressing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260616095429.3947205-11-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-11-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 10:09:32 +0000
Message-Id: <20260616100933.65F2A1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The intent of introducing 16-bit addressing was to support I3C, but it
> turns out that I3C does not require reading the Legacy Mode register,
> nor any specific encoding for page translation. The testing of 16-bit
> code was limited and there are no known users for this feature. Remove
> the sections that support 16-bit addressing and prepare the driver to
> support I3C appropriately.
>=20
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616095429.3947=
205-1-akhilrajeev@nvidia.com?part=3D10

