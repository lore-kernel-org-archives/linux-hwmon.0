Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C496381EBB
	for <linux-hwmon@vger.kernel.org>; Tue,  6 Oct 2026 13:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291674; cv=none; b=ZimUoyUoua3vlJN5M66c+Q7pFOg/yeHr9HJpmNP43GWis8AM6L6IwgY3Vuk5y/bEmUa8I6nSpJy8kiilFb63wUW4kUJJdP2+AtkjdrdXjF+cBQY6wgxEQdIweQA8HUMSxZOK+zUN3oBSfUYEEa5HSor8hogEzyO3wdtd34jAaxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291674; c=relaxed/simple;
	bh=BnpHY8vuZhOUtha0soz/kXVWjEL22TFUYx+RnZ0Z4cE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K4ioERQrYvOBDNBtMkUIz+fR54o2JecQ73N4FPt3cjEpEirYfyVrDZZYUlYgoKINIX9T447/9qKvVL6uT/G7DHL9c+5E10evW0LMKaYpuAApw1GgkYHhV9ocKbczsIfSCVzDuNohOa0NPCT6XDEpJvQYlW8rAFErlp4xmLGQAAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CBGN1fC8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CBGN1fC8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D691A1F000FF;
	Tue,  6 Oct 2026 13:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791291673;
	bh=BnpHY8vuZhOUtha0soz/kXVWjEL22TFUYx+RnZ0Z4cE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CBGN1fC8wnusWNecrsJyow2o/aQDdsI6TyUHepIFs5Nvc84oPU3lT+dp1HoIWNJkT
	 yihIBdhg7zaKJ9hKGJOjFhlb+2u2qos1avaBNnDGnG8T2jlMhFZZAwRYKywj2WRUDd
	 lXW67agfcQ4dHpNuTOxXY779pVWxguTh1JCI+e2wPGQnNd589OXk0LSbaLivRLFAgW
	 nTqXwjcIIMAR5RaYCV6JLlzvOJBX4eWwvLpLC5v0/3zcIROsMWP+jqrDkwFjzU/vpp
	 AzheD+pjd/gvq8WFNhpqPj+Wdqaf/zFpsdKYW49GzK96iQbJlO8fMcLpx5BcILrPW4
	 M1renLYcXUnag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (coretemp) Return -ENODATA for invalid
 temperature readings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ricardo Neri" <ricardo.neri-calderon@linux.intel.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261006-coretemp-enodata-v2-1-64e788acc7dc@linux.intel.com>
References: <20261006-coretemp-enodata-v2-1-64e788acc7dc@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 13:01:12 +0000
Message-Id: <20261006130112.D691A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> IA32_THERM_STATUS and IA32_PACKAGE_THERM_STATUS have a valid bit, bit 31.
> The Intel SDM documents it only for the former, but the package register
> implements it too: x86_pkg_temp_thermal has required it since commit
> f1a18a105660 ("Thermal: CPU Package temperature thermal").
>=20
> This driver checked the bit for both registers as well, until
> commit bf6ea084ebb5 ("hwmon: (coretemp) Do not return -EAGAIN for low
> temperatures") made it ignore the bit because some CPUs clear it while
> the temperature is too low to be measured. Since then, temp%d_input
> reports such a reading as a real temperature. Userspace cannot tell it
> apart from a genuinely low one.
>=20
> Fail the read with -ENODATA while the CPU reports the reading as invalid.
> On a CPU that clears the bit, reading temp%d_input now fails where it
> used to return a low value. sensors(1) shows N/A in its place.
>=20
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Link: https://lore.kernel.org/all/46f9f319-de71-412f-a424-6cb801478456@ro=
eck-us.net/
> Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-coretemp-e=
nodata-v2-1-64e788acc7dc@linux.intel.com?part=3D1

