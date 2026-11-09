Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232111;
	b=TvdfNWQ75mhaS5ZLieJQak9krYRS7uJGbHXIoGveWHKY2UZug6lwDusb8YwNaDRv/Ih9
	 A9nONz6RA0Q8rz16K9zjV1szzPnwiLpCZzJs2tC45hngnXAZ0S8H76sfV4BkY9+WBp8EW
	 nUXhl36dZzafhSl/PW7JbI3RjDmUNO2AgOFB1G1NaMZB8hU7kau9SnLLNzcW8GXXdq2sq
	 ufkUBcRlq0ekvM3bTDd//qFZNFDYCkDyeiC0IK1bJ4gcP+BMK3l5A2jKXqOi4Nm1f1Z7M
	 hF2tYzxtG2JHobEXzIAr58vaaTEM96zlulGx+SBftEcaep9PrekAjdH5Pjhxp3PVUwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232111;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BkxSpfdGJpvMZKg6GzZ4Bpnqgh5nJJYxQO4s+vDmU7Q=;
	b=u8GGwQFFoSZdNjwxUIDmsgw7Qpqk3seavXXTAnLaTNHeAin2dV0f357jTGWhhf0X9qac
	 eM/LP9duoFvthU/8QKixPhXWSruO/7CqLzj4PquOhOOp41v7wTkpB6Q+EOi1ZczbNds6D
	 9RxcdXINPHZKIy+zG6Tq9J7Sbj29odQ4rpMoxe7ms5DQspOk0akIsNxXiR/oq8a9on3My
	 zIilLeVZn5o84CyxMgxlyx6LWqEzSo7lUpIisqhSvkie8KEfTG9MrVgF0SAi5XOWrLhOR
	 FFZhK6gqCXeVmCkljr495Npd2ABSedxM/h6unLpjFmKzNrFDmji6/dG7NmiaND42i8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HVo7uOPy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C448C606D834
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 13:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HVo7uOPy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ABDB1F008A1;
	Mon,  9 Nov 2026 13:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794232110;
	bh=BkxSpfdGJpvMZKg6GzZ4Bpnqgh5nJJYxQO4s+vDmU7Q=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=HVo7uOPy9vyDsohysh2CKKjwU/bkmU7R1+Yrc2CV/oja1rnQ/k9X1RWq4YrvfNXw7
	 qVciQBB1uoKJFQVHrqmgQRqORf1pec29JMU7Zf5ZfbrziRJjyqEgLhla2WsifGwawS
	 rVpO3Ti7RNN2wSa1JLbgLYC7+JX/+9FQwAjbP5F9ky6aPBjvxqfqRHcuHl8A4ke/RP
	 DlynbIWy3MKu23LrrJlwck3eJAQjyaxy+wFLSSHJdhrRx7CN/D6jKEdPLnKMED/l2N
	 Zoz58+nmZqbgjQE4CxXxe/ISrAShVclRRl0m3ZKqrijAg6f80UJYjBBQTxpWRPbgNB
	 qO9Sj9ga8ZNiw==
Message-ID: <sashiko-outbox-205030@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/6] hwmon: sparx5: add LAN969x fan monitoring
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261109133609.810876-3-robert.marko@sartura.hr>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
 <20261109133609.810876-3-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 13:48:30 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> LAN969x has a fan controller with a tachometer in a register block
> separate from its Sparx5-compatible temperature sensor. Match the fan
> node independently and expose fan1_input on its own hwmon device.
>=20
> Read the optional pulses-per-revolution property from the fan child.
> Preserve the temperature-only behavior of existing device trees.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109133609.8108=
76-1-robert.marko@sartura.hr?part=3D3

