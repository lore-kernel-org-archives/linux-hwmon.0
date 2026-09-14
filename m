Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E16E3F1066;
	Mon, 14 Sep 2026 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374203; cv=none; b=pbRoXgzItKnlFCU2LA3Z5P6ecBj+WsLMzSDAm0oTN3m6DZakUONLwgXhPjJDyGV/kXC8QYbhDzvDLmy+chHgqYASyH9Nu+c1OSyiBDbozG95VvsRnUe7YGUEoYrInzNqLgZjTf7YDw3HQ0mZeeLaOQq/MIuH3gd/1NBmUSoTLMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374203; c=relaxed/simple;
	bh=S0xTvowG8F38Ha9rLkoPR6zpq3B+50tSFSHrVcQbmUc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JI5BiijiEZSHDkQKosz4fF1a7tFX6f9D2LS76SGG0yqtg7tqrfbreuNw2oySuCJxnlopouXAMyMo6KuU/I+6ybYVDvxxTIGhlVtV91j1odOOtqeYUS/cdvj8IZV9vHyqvnHRFRaQIUOSSWgvZuzZe3R/uSq/u+MkrfrlBPzgb+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmsMYuwt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmsMYuwt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1751F000FF;
	Mon, 14 Sep 2026 08:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374201;
	bh=S0xTvowG8F38Ha9rLkoPR6zpq3B+50tSFSHrVcQbmUc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EmsMYuwtkLAjpdH59Qi3zqE/+2Tvy/rNweVNKHwRAepMFqNDU4Z8p58H0/Ybz/pYm
	 nhDJLcv83IusEfkg3QVdjiTgBBOA5MYnx+bFTTRs424FMWUBO45DkiSRmBq0o3GHSp
	 vECFwqgMGSnUKKnBPQe4mSkJ6PPlOEzZIMBfRSpnkk0SVrVHgYZDly9F4c7j5RxaXk
	 jWJzXME9B7YJG9YG9ko/qUiXc1isypIuRFxMwrXZX3bClXDkm3mq7ScuZWFWl/hIVc
	 jw7t//sW1jTgn8BvED8h9d2N9lAkyPLH7nh0K2k6CI6RbqSINKdFRLvBvcTsRyTeAB
	 xw85ZYjtRAlbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/6] riscv: dts: spacemit: Add K3 I2C6 pinctrl state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260914-ctl2301-v5-5-522def70acb4@linux.dev>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-5-522def70acb4@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 08:23:20 +0000
Message-Id: <20260914082321.5E1751F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add the K3 I2C6 pinctrl state used by boards that route I2C6 to pads 7
> and 8. Use a 25 mA drive strength, which is supported for both K3 IO
> voltage domains, and leave board-specific IO voltage selection to board
> files.
>=20
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-ctl2301-v5=
-0-b44b81cd2c3c@linux.dev?part=3D5

