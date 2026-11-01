Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530309;
	b=QxL8FCY1epzUm2WHkzg6pN3wfD2wNsOLubq7tcs70GmfeWgQSU86lmUvkPC3G3y9YPsS
	 /Y+X3v+SB9sA9I+gcbj4RImeDFe9OoiPNJHKdiABQLfPME1sgUmsQfBetZcwbABgaVeAl
	 asAvcvF+9+pQM5Jz0F1WR3lsCss7f+jlDiqXhSG/bOyX3TcbBcPc3uN5CeM/vEvfVBcu4
	 KeUovJnxU4wjsKEknZA1vMIAouzcQbJFVDgnmGjxpKtVKb4Qy16S4Cmey1me4h2ek30bY
	 gy0KJ0dTSHP/fV2T++T3P3eGrrCort0A7w5lQZmfCmGyVZ4zd7b8VF/LaXtqIGsA9kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530309;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zaI9dL/svwr/OGUng7i9Is/AoWIBlrw0c8VaX1TRt/g=;
	b=LMPkIiOtlqTEoCL2EIn8kkKrGiAjd21P7pvPc1qKcAIgfdDOfoR7OwgkWJebscZTybCy
	 Wkh3EpM9MzwP6kl9g1VLC5Ig/tJQoKbsVPfiLpR4MQLownsDxeq6g7vxDB0/oizoUyeIp
	 9xGsptwdJxq6CqtFowDuJtQ11lKN4WLW2nOIA6rTfViD6roP8LH4lb+OWITRHyJY7RT4p
	 fK2s8E8sHlryWL8n6tkrjpXJXrmq0u8NJHjZQMm9No6iOgNIv9XtWVZVi0ZK9w1iWEn+H
	 8Zwe2lF0j189t0B5GVyZkRvn0VAs04JYUdj9q0CGZcywe6RX24totqqPuf3yx/bEdoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sn8b3L5c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3584F606A324
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 10:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sn8b3L5c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B51881F000C1;
	Sun,  1 Nov 2026 10:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793530308;
	bh=zaI9dL/svwr/OGUng7i9Is/AoWIBlrw0c8VaX1TRt/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sn8b3L5cSmu265UmuDgdDyPkZADsBe5JMlSjNW/vWp+qjOo5mm17i/XCzgxBX24Wh
	 zPteXWbURVYaTuDn/XR3YLhqebt6AGa1VEXJeBOcXsvApx5Ss3V4SjI79Aj3iDwYBl
	 FrDe+yab1qRzffp4PLRdGBYysC7NfBjADCxJmMiWXsMtsx89vBD1iZhax4cntnc74G
	 6f9tDKh6/lXaKGjd83v/sEZtdvkmB6xZRuXwpRGTysHvuojjd0LcNG/WLxy2472tf+
	 tzD3rVkpomBL4mjn4EoJYecXQ1GsDfJcmgixh+oJ+XTr5hJCipBIi7DcgFoLRwq1rB
	 jtAp5tyH7plbQ==
Message-ID: <sashiko-outbox-192368@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] platform/x86: asus-wmi: dump buffer replies in the
 debugfs dsts file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartu Alev" <bartualev@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261101-asus-fan-floors-v4-v1-1-b8d1c31a99a9@gmail.com>
References: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
 <20261101-asus-fan-floors-v4-v1-1-b8d1c31a99a9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 10:51:48 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Reading dsts calls asus_wmi_get_devstate(), which uses
> asus_wmi_evaluate_method().  Because that helper handles only
> ACPI_TYPE_INTEGER and leaves other return types zeroed, methods
> returning an ACPI buffer read as 0x0.  This affects fan floor tables
> (0x00110026, 0x00110027, 0x00110033), fan curve getters (0x00110024,
> 0x00110025), and TUF RGB readback (0x0010005B).
>=20
> Evaluate the method through asus_wmi_evaluate_method_locked() directly,
> matching the call node, which keeps execution serialized against other
> WMI operations.  Format integer replies as before, dump buffer
> contents with their byte length, and print any other type as t:<type>:
>=20
>   DSTS(0x110026) =3D 16 bytes:
>     00000000: 00 00 00 00 19 30 3a 4a 00 00 00 00 00 00 00 00
>=20
> The sentinels 0xfffffffe and 0xffffffff continue to return -ENODEV.
>=20
> Signed-off-by: Bartu Alev <bartualev@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-asus-fan-f=
loors-v4-v1-0-b8d1c31a99a9@gmail.com?part=3D1

