Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426487;
	b=GPVBBj/33pZMLNKwKioEVqDyAIuJ6ohI6cs2AAEfnP0lmw8h8F1ftfIRsAfOdAZQQ8kE
	 mjHMXfvQSbfDV4QgLXLRTWdkIUHKKHkHwnC3KlEWGmuIFZnd3Kw7+nk8JdfYz8QsBuBjK
	 wX9ShBhGfE5dhSI0sqLtYVu4J7ME5moVou7T5M+gmE2Tvog5Pc98CQqEjEoMfn1wOjrSB
	 At79HqRNT8BbSUMLHZEYg3YqtyLzOxUTq6bMb3TgXt8t0PVdVL534lkrdBqtStg55f1Dr
	 K3fPPLjOHSgifeuajQAT2lh0Egj/YcgHnTkWdp7hjLPC8hCxANdiPzFzUHLNSgPH7ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426487;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VbTjWsWCAhPHdsr+fOAnTbmENy1jTt7HkluSNhFKAyk=;
	b=QC7omck73hTaRoe+IPDnffcdqVOxz+WwuxefTs0jFxxw0DWkvYMy5cE2+rFbOqPMCbR8
	 fyuOPCxyFKBJdQiYvZLlWllqApvak5JSn1nj5b3Np7eCmgF5ZgtXxjJwGHBIu/cZKANhe
	 hZW4wGKyDoFdQQAsMKNqioRz0PcxmxDjknGont1+NaqlJOOMQ/aadiugWsYbJlHKp7JLC
	 eDmLy39uFSlIIqPJfpd6vNghDw2UGfZb2z2+WZGomBoFCZeBD1cQwn1Y0ige8po2PKXL8
	 HmLbMDiHVuXGcDaDgo6bPn1DO4UrGq3LFKfaBRI4AN3/3VyhSyVH7qWdV1QRLBGsQdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eZVNJWuR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C031E606A325
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 16:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eZVNJWuR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3D71F000C8;
	Mon, 19 Oct 2026 16:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792426486;
	bh=VbTjWsWCAhPHdsr+fOAnTbmENy1jTt7HkluSNhFKAyk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eZVNJWuRhgXcEVSRGuixePSm2L/JKXNmqqivimt1qt8u4x3Xc+xgGA/6sztCZLa/F
	 lcnLcS5z7OayS+dlIdJHh7hQtRcudYV0oAmmZ/Jhf/VQ/vQoybjHpJTi+8RT+IFwpx
	 PayApSuFN9Gyyr07+k6gq5ZPlKBqygighOjz3Ic23k5TxnQ1j+gqPbNZC2SCGjPKUB
	 lk+e231oYI3Nl64rtPQArk6u2FIaZWPoebpNqpQl4yWVP51J9/XrCNqBnvTKw6WcFx
	 O+5UmbQ5qGXs31g8Le3vDxnB3RRQILIK0dqbDkL1E5JEJQXiDSslbA2L+asZQy8UM5
	 +TB4574AFjxwQ==
Message-ID: <sashiko-outbox-177848@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (sht3x) Return the consumed count for heater
 writes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmFlayBLeXUsIEtpbQ==?= <pocj8ur4in@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261019154718.2328055-1-pocj8ur4in@gmail.com>
References: <20261019154718.2328055-1-pocj8ur4in@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 16:14:46 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> heater_enable_store() returns the result of i2c_master_send(), which is
> the two-byte command length on success rather than the sysfs input
> count. This can report more bytes than were supplied, or a partial write
> for a fully processed input. For example, writing "on\n" returns two
> instead of three, so a caller retrying the remaining newline gets
> -EINVAL even though the heater command succeeded. Retrying the remainder
> of "off\n" can also send the heater-off command twice.
>=20
> Return count after a complete command transfer. Preserve negative I2C
> errors and return -EIO for nonnegative incomplete transfers, so a
> zero-message transfer is not reported as a successful zero-byte write.
> Keep the existing boolean parsing, command selection and locking.
>=20
> Fixes: 50c22cd154e5 ("hwmon: (sht3x) add humidity heater element control")
> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019154718.2328=
055-1-pocj8ur4in@gmail.com?part=3D1

