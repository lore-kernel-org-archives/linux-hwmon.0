Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4F8175A62;
	Mon, 21 Sep 2026 07:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974098; cv=none; b=fiJZNaOTjBRU6n1EIYOzZvLFnZIgXVGC77GuEdhXwn0f5/Mz8UogzaNhM2FszTmbf+An037XcGAmRu7J++j7g3Fl0rX3lIy5ZIrM5VZjWN+zhYRBYg1RX0N88KHKJ7M/yDXuvWWntahJbV3J5rUirjtVwor1waIV+M2Tgn+9ZPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974098; c=relaxed/simple;
	bh=rTWPAtkRsxVBgj+BCia0c+kuPWjDOUxiAog1iSM/cbA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JsjQ95jk5JeYyepx56UUQzg5ZBEj2fhKHMF1Ev9tX5HXL8YiD1cthlLdRpFQ3U1RPmIMgGW9bvnX6MZ0GDtWHoRwVcvASq7/0meAqWxPyEFnT48j2GvvEMkzKhGQUCwXZNSTLCwEZAB5sxozdfZmlGyt7so0u2AU0BBs/eRNaDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oBmy/thb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBmy/thb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743931F000FF;
	Mon, 21 Sep 2026 07:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789974097;
	bh=rTWPAtkRsxVBgj+BCia0c+kuPWjDOUxiAog1iSM/cbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oBmy/thbeBQUTaDkuJleku7IdzSElWwW0Mt89spabjvMrr2Kbw64MhJbJbh6LmJtD
	 5HRCbZNGRmLG1H6c4UEMcTpOUqiqT2+Nn1fepcIknZfJFg19xUGsyAT4a5kAtR+38L
	 GIESwuOCM0yHC8aHwNvU4DcT268cx9dFsibkeLH5rRimjryvNqBMRGam6HVFq+f+77
	 I/Y6gsQ7Y1BKCeVPeYLQUYirJwYcRpxkkTzN8BKnNZNan1oG7LcLCn9nVYVofXnF11
	 rQeWlf2EGoycQOW89MiKTT6PgqqOc+uc7/TKoZ+U1MQi597NmIH5FQBT95AWyyPnNM
	 vJda7yON/ECcQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: Add support for
 XDPE1A2G7C
Reply-To: sashiko-reviews@lists.linux.dev
To: "ASHISH YADAV" <ashishyadav78@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260921065702.93196-2-Ashish.Yadav@infineon.com>
References: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
 <20260921065702.93196-2-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 07:01:37 +0000
Message-Id: <20260921070137.743931F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Ashish Yadav <ashish.yadav@infineon.com>
>=20
> Add Infineon Digital Multi-phase XDPE1A2G7C Controller to trivial devices.
>=20
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921065702.9319=
6-1-Ashish.Yadav@infineon.com?part=3D1

