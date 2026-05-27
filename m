Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761F0150997;
	Wed, 27 May 2026 05:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779858353; cv=none; b=pQDyvDaEgdYQT9EkfWz8lzYC/HoPh6yqvKevRAwVymb6O9OkJpgkMeKeQ0HIbxzJiEtSgT+WN9Se/QaPu2qmfpM+kpri0zIvageIdSQxDk88Uy8cnQQlps8Hb2vF+hku32tBK0ZHEQbLecr3r6IcL1f13OAqXAZXr+EpLam66w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779858353; c=relaxed/simple;
	bh=AXvi9dREvHTpdrUagI10QnWO8XSOl+cZPL4niVvS53w=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MIennjwXHAyBpDNoxwZkRx5qqYbVozzoTfFmIBGyXCDX1OJ9+LtDCOn4v8PbiNXIK4rjWxhEKud788ViiGfjroFI8QPg+1YwRAyqCxN1I4UQUfNUF2cvs2+rlt4f5A1JaSdksi5xUUNg/hWZhVXLKzt9qY4686umjssmRQlTWB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UyffM7NF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UyffM7NF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C4361F000E9;
	Wed, 27 May 2026 05:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779858352;
	bh=AXvi9dREvHTpdrUagI10QnWO8XSOl+cZPL4niVvS53w=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=UyffM7NFrnoHusjMnw2tktOLUd3BhNr3yPchonO/gdkvHVb7SQtz20ijqdOvvGngh
	 n8NMCnJTx9Kgggn5JiO98Ihs30rIiv1V7ANJHd+4tybRGEPZoXAY4UuvxD88496jDh
	 ABTH28ib7Vd/e4zJf2LkUCI4BAvzZts2aodhblLmL8+SwWPWegjOn6dYw9XfYtQQLz
	 /uOPzb4fhBdquhsPkUVCfv343chMfOi7vKe/1llxGXKrCLIDMbDs/ST2q/dsldwO9u
	 Shi8qmqEiwVxhP37A2eRpeiLe0RsYcq8Wdxeohzsmeb8mWofRrKOqALvf0UClcOPSZ
	 EB0rUqa71Fzzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Reply-To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260527045409.9092-2-sanman.pradhan@hpe.com>
References: <20260527045409.9092-2-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 05:05:51 +0000
Message-Id: <20260527050552.1C4361F000E9@smtp.kernel.org>
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
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527045409.9092=
-1-sanman.pradhan@hpe.com?part=3D1

