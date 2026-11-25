Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592081;
	b=YDVGZVYzDMCb7umTShy1YSSW4TUJiVJMDOvTye1aEOiZJvtU+ZEExhYxKbyi6B5y3vJs
	 zWIJ472dhmP980VuTvDq3QMI8D9cSfuzss9JQZ/VlmRx0c1AbURimboUCNv+flEGgZFNy
	 Um3335RCq8OZCJF8bkPraUqbj/Wpx3QNlRopluXXUcoWASf7w7boBMDgTurHmSBjfz5hx
	 SE6BOX8QVxAw1hwDCHHRriiE28WgCFWV9uwwDRIrqnGs6jR6UPrIzoYWB4SSPCCTR4nrk
	 ffJTcwPaUKUMMR1QsB8U6YSxPesOf5VJoWSLzNVhsnLp7qx+Vg+XySyfA2FUmdmJKog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592081;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vhEYBievY3WZF+qTGHl81/DD1yHEF4RZuE/uuoSiWVw=;
	b=HileFkeK7t3esQ5HMXsFABVjjUoYTc1zYzS50aCmes/BLtj0vLW9IDVmZGpDYyRbcyOg
	 16QECCsZypbL+BJNdVnajwq4S4r1bd+LEb0eGA5q3i5JmXNrSmjnDSR1gedQbx/sJV6HR
	 H/z+gkfnbQPzmb8tNbr4F5YEA0/0kYaTtXXJEyo0Tr8bHDoRbcIXn/a+DESlqXSJx4xBu
	 Fm/v05rCDe60H/qpzM8Qn1pNDAnXn66x2a8gkrNQPufr+jVWCGKVITPRq3ynd/lDxeSIm
	 vLKJJP5pPXmi0r/yUdMCoMZWNdLVUJY9Kkbyj+PKPDnXMD4cCyq6EvEingiccs6rVqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jaF2rD8F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08B2606A31E
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2026 07:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jaF2rD8F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2811F000CA;
	Wed, 25 Nov 2026 07:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795592080;
	bh=vhEYBievY3WZF+qTGHl81/DD1yHEF4RZuE/uuoSiWVw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jaF2rD8FI9/CNR8TVkNH0xhpw7nIdvjhi+c6xRUqhsSCXqkKyTWFVkhMk3ToQm28O
	 hd6oafxuKFdAWlX+vzG5I2Biyhhu+dTz0l2FvEF3q2BdLn7bhk3M47e529krRwJPqo
	 /Ccvn3V3ja9efhy0PwB+tOQLptUfnE+jDVjPRzTAkqUQGq8Cz5BLuOIMaDvy7PY6tH
	 2Inq1Mtp5Fs3c72sHNcCd5BvHL7+zD1GCdMlhJCu8Lu3roFS7iqBvJhucg/4K7q6nj
	 MVyKnPAcwIVNZnB/hiIJAquZu2KFnC9UWzwFDEKhNIbKLONAnpL0t7QqYYcvpMtCYT
	 +iLfLRwmfZEaA==
Message-ID: <sashiko-outbox-232816@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 0/9] HID: Make driver_data in hid_device_id a union
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@baylibre.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <cover.1795589119.git.u.kleine-koenig@baylibre.com>
References: <cover.1795589119.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 07:34:40 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 9-patch series:

- Patches 1-7 and 9: no issues found.
- Patch 8 ("HID: wacom: Benefit from pointer typed driver_data i..."): 1
  potential issue (1 Low) and 1 related pre-existing bug

A detailed review has been sent as a separate reply to patch 8.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795589119.gi=
t.u.kleine-koenig@baylibre.com
