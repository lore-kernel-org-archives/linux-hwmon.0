Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231537;
	b=BhgAqT8qSh5Bw/A3ZurhhaUcneMS2WYhiKMfE6ImjoRXLEai6tqjoXKX1B3/KFKcK3XW
	 EyOXu9ZqdF51hVQNlo1aTD2yBRNqLhpR0t9llMU2uAsEJ1mpZYWICqohf9JKO0gpccg/b
	 2gzAmhGShIfbO6wBFo+5pjD/8esQAF1YRLjrE0VKT6F4Y70Fhus5PBJxT90JnX+LyXu9j
	 AdxEoNC1jUI4++oRmZRMzFgPBcpLiFQ3eLCckQURRduaa6jsj046UjmGLXO1j0TRePsdu
	 MYDinoIF7Q8yh7Hpb1entZ52yoUybU3Zy7GErTGcZe/0RDZV0QWWHzHJRMigdiJo2EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231537;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=T4AeIeBcsYTICkV5N1JJbnaH/wrXvLSoN2TpczQCmHU=;
	b=j2enZuLNGOm80spJ4BFH/pb7EH9FULC8fnMIIYksqA/WojUlY+swke5BSjUqZlXwtpiy
	 dmERFgih/gNw+2Kv+oKkW3f1bbPiuuvdAJAyCOMv98uDJr9+xFDKReO3OGcelS17HauYD
	 aR21CxBDsUc4mYD9JnReF42eibqtPc4YjA9AOBt9Yhe7hQj6mUwOWxDPraQGP6HYZJU+z
	 wS3Q6STlps+7ZiQVgUkirlul0ceAUwHZD5j/lm/2kVPcTCggjp4T/TvOjoFNLj705GecA
	 8PU5hPlQ3GVVfrZZGgL/zFgo65FnoV/I/CPjMyRayVnm8v1+lIN2tqcP87ykN32Umbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dMAWp9hb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA36D606A31C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 13:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dMAWp9hb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D72F1F0089F;
	Mon,  9 Nov 2026 13:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794231536;
	bh=T4AeIeBcsYTICkV5N1JJbnaH/wrXvLSoN2TpczQCmHU=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=dMAWp9hbPncD66G+C4eBjTOccp9cRJWkRcQwA5FMRhW+HG8Vg1iULQIezi0CgZ0C4
	 B7HzU8mSyuUOsk6AHAefbd+iDIEoA7TIDujarQ0aJ4qroJvNmd55WsO1wWmHVyIL7Y
	 35Fakw0wIgVVHdlUkjdHSwvqyh6HQ5/AyNOiCFAkvjKLJzKpqtqmglt5sHyHLf/lSh
	 wjZUb+flHjY8xcYodiHnycr03raycQ+Y3viRBqHWB0NCLvX5wUTF3BQ/vTu57L4JrL
	 SVtJt6rLy+WRrRdeRKA7r0QENu/WdOtSHPPtlfYhEzkUglY6Flnb2N9bOwv87Z4HAs
	 WTS9a/9HJl2lg==
Message-ID: <sashiko-outbox-205016@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/6] hwmon: sparx5: separate temperature reading from
 sensor dispatch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261109133609.810876-2-robert.marko@sartura.hr>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
 <20261109133609.810876-2-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 13:38:55 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Move temperature conversion into a helper and dispatch reads by sensor
> type. Preserve the existing temperature calculation and error handling
> in preparation for adding fan monitoring.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109133609.8108=
76-1-robert.marko@sartura.hr?part=3D2

