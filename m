Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0712D94AB;
	Thu, 28 May 2026 17:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779990527; cv=none; b=b63fMoBMSuLAXCWiqQcL5SkCtVzSQAQggl/l/j00ss2BYLByP4BrGVUXVX4S+PM8rpstpkANUo5r8JX+jj67IzZxRAXgW7HmLnzab3FdI43mmJZserPVb2IOTHx6RX8yjeanZ4BO0EZuJud1ccpuERKf1Oey39llsQKBLxP8lIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779990527; c=relaxed/simple;
	bh=FOi6BvqNBpelg7dc8/Q0YNAXScZDElcRGdGHUdPAcIw=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P1CaUV2zVJKWuxXN3sOfONTjdzbNFdySoZK5LeNLBqWjDYPk1aEvsi/eI+CVBjBN7bVjQHTp9LEh2ycObSOvtdto+TJWtoNckS99iIlLjQS54g3u7IGh3UStlMXzOA/kfaWhZZW+bTcu5gsZLoxxRE+J86mn0rY3z0js0Trn9MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OybtAhcE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OybtAhcE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 591811F000E9;
	Thu, 28 May 2026 17:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779990526;
	bh=FOi6BvqNBpelg7dc8/Q0YNAXScZDElcRGdGHUdPAcIw=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=OybtAhcEbS8DH3lVXhcb3Kmo9SyMxhkNQZZSAAS+htmW150YAxNvCvNIWokuvzsdM
	 kUmd4YvE49soXoi0aoEfogEYFQuVmLQlFbLUEfuV/AnQFcZrDNbSjrV6eoraMJuXA2
	 GgGzE4uqPbS5WEFdfYcEa1nSK26+LKP7LFNAGAi9Ia/cszeBHIFvueozh0g7vZ7we+
	 9/2JxWc4VoAvvYzyXhvpTx5fmAHsiTDTzVjk5WiVOupzsqi+v+UwaAIgqXUOsIGySR
	 DFA/KJihEvw+wVZ+rGtY6nMtjXk2ggPeBJKnyldxRa8SU6iSzjqzhnXd6ik9ppBjqW
	 5SfPAIsfF43bw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Reply-To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260528173424.87503-2-sanman.pradhan@hpe.com>
References: <20260528173424.87503-2-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 17:48:45 +0000
Message-Id: <20260528174846.591811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Sanman Pradhan <psanman@juniper.net>
>=20
> Add devicetree binding documentation for the Analog Devices MAX20860A
> step-down DC-DC switching regulator with PMBus interface.
>=20
> Both "adi,max20860a" and "maxim,max20860a" compatible strings are
> supported. The MAX20860A was originally manufactured by Maxim Integrated,
> now part of Analog Devices.
>=20
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528173424.8750=
3-1-sanman.pradhan@hpe.com?part=3D1

