Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD5F32E141;
	Mon,  8 Jun 2026 06:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899783; cv=none; b=BJAjYg4pkLq04RkCjiE3dsGKfkg4WWLTHslYbvqe525ndm7MWREu79U5WhqmEaIjiUunNx4sLaVhrk1f6x2NjB0FmXhoVmeFA8XqaOF5y2/f/W2d5EXFpW2OmFQCGvVedSLD4XWWzy00TPpgimGBtv6bSR7ey+KwKGQ5XOBbcus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899783; c=relaxed/simple;
	bh=IjYttGUnRHIWgVX5GaN3pEnNpzLhOXR7VBRVgq1uHCQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dqV13fuOOQh8nRsbowrxSQNzCi+QmogMTnxZv5Uomw9MrFTmkTgzE2R0VsT/zdst48PEk/eyGaVrcP9HNV4WxY8Ee4jj/p7GRvoZOR6mEbtAWV0ocSaQH8XLwiuA8f/MqYnYqVs5vTh2Xc2qdby0i3H9hbkFNdtaquRP7zOPQ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=meF9q+GC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="meF9q+GC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A791F00893;
	Mon,  8 Jun 2026 06:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780899782;
	bh=IjYttGUnRHIWgVX5GaN3pEnNpzLhOXR7VBRVgq1uHCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=meF9q+GCX6w9n/EfJ+wuVpljmQTRTxMPR7OYmeynu0q+hP7Y/E0H3+TIcq0EaVoIO
	 YA6TPKWQq/jCAkPvI25KlPx4RPtAGaLe01aDUWu7xPGk4SSBf3+QKZI8/7A+fjAXlM
	 JLy9nZiGTDJbmW4BC/L57XBPaQpUXTQ2NXjHSZ6rO8EJQuH540f/b4jR72IpI9EaHL
	 OOiYzT6ymEqHsf9IjRka708RzLXHv0Ynyt7syPK0UUQeej8RpGnGsBr5Kr1ae1NH2n
	 ZfngnOcmg/bQ2VYlikPIQa7o/9J0kqPXGADw4oN1sjrVzyIpLsoOT+wcvdIpv7TU0t
	 xUc4iRj6AqBLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] hwmon:(pmbus/xdp720) Add support for efuse
 xdp730
Reply-To: sashiko-reviews@lists.linux.dev
To: "ASHISH YADAV" <ashishyadav78@gmail.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260608061544.5613-3-Ashish.Yadav@infineon.com>
References: <20260608061544.5613-3-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 06:23:01 +0000
Message-Id: <20260608062301.B9A791F00893@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608061544.5613=
-1-Ashish.Yadav@infineon.com?part=3D2

