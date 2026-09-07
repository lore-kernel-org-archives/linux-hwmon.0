Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF36409624;
	Mon,  7 Sep 2026 07:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764760; cv=none; b=Hzszpmd1XEksfx5Gx2IXFZBfxAvBBjg6cQe0XCMjwbIm727fCesEIP9uIYonY8quMKuY0KPOGIrdRsE1kwVVh0lZWIv0quoLkAkMZC8bpzbk2Pess7zrzybLNkYanFVKfxeRIHEteshtppytGQ7eSvO3WnA9RuOs/5f4ExMLzYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764760; c=relaxed/simple;
	bh=7W3x3yRXiSBCXfTPBdHRL/jkquGY2G7mWJ1VWMsxixY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u1/ltkAc5OatVLkUoxN1Nn6sfgF+O3EreDwfWt15GO0xU/qAiCxRjjpvMPzRnr58gutp6VBuoQxlyiVAZl79f7IaZ7BDZv6V6JNR3jBSNkFvYmPeNta1WS4ZpLvFT0YSDJTCr8m4+nrnBRcZeCnALEnBCb/yshAp8yk9luR5kt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AY1/+od1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AY1/+od1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7ED11F00A3A;
	Mon,  7 Sep 2026 07:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788764759;
	bh=7W3x3yRXiSBCXfTPBdHRL/jkquGY2G7mWJ1VWMsxixY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AY1/+od1CabkJ/6Iy60PUahVi26HVK1XIEAffP4CtkjzWpJf3wSQGMBN4DMxUjrXZ
	 2T3qYMH1Q2WUXU8G3UswYrlxS59LsYIX96OFhd+7SWn6SB+9Xr96MadgLXELXAXXqc
	 Qjyq6Vpvb+lIZrJvMi/hvLbD2W76Ncm1U1Yan8PFUq55elSdo+LtMqXpy4jLsIDDja
	 x0KVb2/EYmXl+z+rIR7w3b+QuZkIdfi1kUf+GQ9TGs8p2XHD5R7H/aZxXEKCkEYPDf
	 Pz3GJg5aiLQAPfnQKRWY5JK/jFCK39kgDTefKPhq42TkWGcGorxq6FxZPDKMW+W4nH
	 dEg6EARzyllBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: isl68137: Add Renesas
 RAA229639 and RAA229640
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <colin.huang2@amd.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907-add-raa229639-and-raa229640-v1-1-8f7218cba85d@gmail.com>
References: <20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com>
 <20260907-add-raa229639-and-raa229640-v1-1-8f7218cba85d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 07:05:58 +0000
Message-Id: <20260907070558.D7ED11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Colin Huang <u8813345@gmail.com>
>=20
> Add Device Tree compatible strings for Renesas RAA229639 and
> RAA229640 PMBus devices.
>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-add-raa229=
639-and-raa229640-v1-0-8f7218cba85d@gmail.com?part=3D1

