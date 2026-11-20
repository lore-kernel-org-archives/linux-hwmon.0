Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795142858;
	b=ZLI3v76eGwCNFS2BNEsGCehP4kIUBp9CzfSJiWL7YM39OjnkeXUdZIb8riQx2Hqawg25
	 aS2bMzq0ZJpjMrvYJDXMe+t74u2YVtzYXe5MBx0oMwXl9jab62rq2HWDojMrL+Cgk5DI1
	 ZhQO9xSkkJkn9nd1y8lvZDk7pqWh6ferHjsin0mTonXAzbvLRF6/ggNc3ULRRipVShkJz
	 QQL5LogC3aRyaqWTL8gouNZ8wQgbz7dipRa3+AKBXrg4bl+6FpVT8Ms+mhSHsofkaKJyV
	 gLb68QLwFpwaWvUzegyks6bkJ+TnT0L8kCYms+u4npsipWKffwrdhA+92kMpW2ryanQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795142858;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Dx2RTlrKqPke7Igm7x00qfeiJG+JApvKBA2WprMnOLw=;
	b=ITqL3SbtT49DAucnE5FzQT4s7MJ2pUuGV7nzw74eXfiyXH/Nz8/G8I45G2NP1957cifC
	 i+XvdaMBgNO3WiIoVJ6Kz3jpWaEthcZGn9Yz4QWH0P6bvyagl77EWhd4+Sn4xPcohHd51
	 vBQuo04pIIpJkvHEwRx7WCYLhUNf3hLx+xrSOu4XqUD2Mx6P12RWc535QH2vlF+O5jOxR
	 dXxjVUxUWZzz4UuqxHhWLQDNgaYDPhCvbtkQ6GYoLc1pH4nK275XtHKGJ4br3AQ3Lz1X9
	 7g+fEuGzOqlAbPfWRtTQJp9TSU5Rl5jDofwwYZ9JZgH8QzrQiahOhHYJlNIg4DMwBlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EK0NTXR9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A15960A2605
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Nov 2026 02:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EK0NTXR9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 811EF1F000E0;
	Fri, 20 Nov 2026 02:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795142857;
	bh=Dx2RTlrKqPke7Igm7x00qfeiJG+JApvKBA2WprMnOLw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EK0NTXR9tL0ijE8KBud33w2rX5mT22vf7G4D3kDfiJ1UrLuSGcZZ4B8Kc1iQDPt5n
	 0D4zjUxsWPN5Uut2H+H1o39VRxo8rJocMWJtbPuhySBn6QoV+JddUkXt6HO0kuIG92
	 wIhTg0KHUAbyGa2pxkqJOJ6p6CYRAdihONx5ToApWCZoGGdaleKGtrlud+Phil0E68
	 lB/pjP42y7xtIkJtxBjhlKs2fL66eTZETcn/IqfWL3grIzJkdFO8ziIAX2fkCqB6SR
	 XBAzDddYFb0IGvrcAL5PurYEP4Y8ISU6BT1MTZxCXCaRrUsakts9wLEiTFREqGA/iw
	 vTqpKBICNllMg==
Message-ID: <sashiko-outbox-224381@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: (pmbus/max16601) Support byte data writes
 on VSA rail
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arthur Korn" <akorn@google.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261120024416.338876-1-akorn@google.com>
References: <20261120024416.338876-1-akorn@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 02:47:37 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> MAX16601 exposes the secondary VSA rail on virtual PMBus page 2 backed
> by a separate I2C client (data->vsa), while page 1 is a read-only
> virtual page for VCORE input current and power telemetry. Although the
> driver routes byte reads on page 2 to data->vsa via max16601_read_byte()
> and PMBUS_CLEAR_FAULTS byte writes via max16601_write_byte(), it does
> not implement write_byte_data(), and max16601_write_byte() falls through
> to -ENODATA on virtual page 1.
>=20
> As a result, PMBus 1.2+ byte-data status writes from pmbus_core (such as
> clearing individual status bits in pmbus_get_boolean() or clearing
> STATUS_CML faults during probe) on page 2 are sent to the primary VCORE
> client instead of data->vsa, and byte writes on virtual page 1 fall
> through to page 0.
>=20
> Implement max16601_write_byte_data() mirroring max16601_read_byte() to
> forward page 2 byte-data writes to data->vsa and reject virtual page 1
> with -EOPNOTSUPP, and reject virtual page 1 in max16601_write_byte() as
> well.
>=20
> Fixes: 2138f8853a00 ("hwmon: (pmbus) Driver for Maxim MAX16601")
> Signed-off-by: Arthur Korn <akorn@google.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120024416.3388=
76-1-akorn@google.com?part=3D1

