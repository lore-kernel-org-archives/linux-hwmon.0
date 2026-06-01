Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6A739061C;
	Mon,  1 Jun 2026 09:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780305469; cv=none; b=X85pgJ68zAKvG1cN67GuD3DG1e3AnLwY7IpVMT/DRJspngo/1ftUcws/quJZrW/knn/6+lLKYIqRHbQ9O/JCdEOvpPvMiexqSmP5uePMmPszJSrin7cgW4o8QrGBey4zkcefoNpFJyQl2HFYiD/LPVizz67oDVrf6w0JEfai15s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780305469; c=relaxed/simple;
	bh=5dyK72MMPz2wRuY0iUZQ/EQf6NMnrASwHShpqTcVxpI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yl92CsN9VWS335iunsRgrg4wxWD1ZodtKrSUhA8EWkfk9gEjD++mZ984ivsby2K2YjCghTZujNgaqu/43g/cGpBQ8QNd3aQb7IJ0WDk4+Ts5Mx1I9YNftR4e26jD0IRZN3pDOZCs5JkZ5c3ndU4E0EfVjSeeOc+hi+Nidxf6WTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJ6yPrQF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJ6yPrQF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870AB1F00893;
	Mon,  1 Jun 2026 09:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780305466;
	bh=5dyK72MMPz2wRuY0iUZQ/EQf6NMnrASwHShpqTcVxpI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IJ6yPrQFplMdNTTBQcwK8b2B0SzZyhCLTVA46nrTyN1/8YN3MLzB/0OrKlbBZjga5
	 z0IFQuZogwy+vRz2bnhBp4jiZ+RbluY0S5tua4z5iikF07Ok0TQkEDyegWMQLAlPbG
	 sp89qcH5IEBBAjUds6Q5OY0wj6wCSwW/Z21EwcVZ7WEKyX/IbStQ0blQMHFaxy7Z68
	 DeDRl/zc++XXyHMcaYKACv3hXqJO9GdurmFEiM2fQzjHfvwKHGnVCjEZis5HavVvKZ
	 m/Gs96+pUU/LswLLCn7Y5tpYKt3Q59xludI3Un2DYmtqO6v2T2ts4RwQXpaBIM6knL
	 94V2yBXbhWrpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] hwmon:(pmbus/xdp720) Add support for efuse
 xdp730
Reply-To: sashiko-reviews@lists.linux.dev
To: "ASHISH YADAV" <ashishyadav78@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260601090925.3781-3-Ashish.Yadav@infineon.com>
References: <20260601090925.3781-3-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 09:17:46 +0000
Message-Id: <20260601091746.870AB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Ashish Yadav <ashish.yadav@infineon.com>
>=20
> Adds support for the Infineon XDP730 Digital eFuse Controller by
> updating the existing XDP720 driver.
>=20
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601090925.3781=
-1-Ashish.Yadav@infineon.com?part=3D2

