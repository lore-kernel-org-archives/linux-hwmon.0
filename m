Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852928;
	b=FvuEA/GJcdc0uafdrLM7G42Ks9DIec7sGQDjqQMLcjgFLvdhPjpucztLsJlKSaqnRhIl
	 aGvoe7HoqdqAG+HtzURSzZMk0cNPv4X2GPZpkjfEJVWrvIDD93fe+9kqa7sqggbSMxcSG
	 4g9SFDNzBDq0Hroq7c72UyMlPPI9bViQhs4t39uLZhYEAI2OIxZ7PO2gOo+DlJYrbZA72
	 pO1kUQ843b9Y/kBQ6cFIjbN/PhCWqcSd2VQ4iv5A9h/7S6V1Ucht4Cm86EIV6hqEZFrMf
	 LD/7T/rhL3cecD/fyPNLyw+k8kv83pTp42f2EaF9DevPyyOMvx2mLJJ92tOiDQ/VLnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852928;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IiLwzD50d12j9Jd7sM2dH7bfTT0+thDr9XIJoRP2/SM=;
	b=5P/0YWmcbWNhlOiUSCSsQq7tROD7e7SW4ssIR0aHEhvQNMlhkuebNXmX+W03oi9IKjgS
	 O94LeLSHZJ22QTtrHcKJmtTIc0V19JDWOPmKnAUlZCmsfbD1poG9ik8LaG0e+Y71/QVI6
	 4v81Uk6Hz8mDqvloXFkNk54k9QDydBgM2rgPuymyKrTkYjlCqfTGXA1RpwQmb/eaCLTnn
	 LH5RE24lgjzBBVF/tvxEyfC/7ASDich6+tgN9YQT6chPV1fa8m4kIvKlDh1grXoHN3vkX
	 kVw7jJPKrnxuTs8ch88kDSlYjfz3ranSGxb3DtUwYteRLmDVc65NDenEs9+2vANRwrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TwV9wnR6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8704606A31C
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 18:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TwV9wnR6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53FE51F000C9;
	Mon, 16 Nov 2026 18:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794852927;
	bh=IiLwzD50d12j9Jd7sM2dH7bfTT0+thDr9XIJoRP2/SM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TwV9wnR6n7lQrzIWhYjLC0anoDPHeizRyJN3ODaqNQnO8Kfuq/aqdClUIndYujuXF
	 DJQ52TkcJtF9FJIGzAhObHUnPXrO1aLWtplkFTDfjxXgZpf/hWaKskwOYs+l1YGfno
	 bLnNTiNBtvkhOcOLEEk3FDlegBo3MtXQPHZV3doEwuEYeLt9OBrNq/oiwxTy7QfSs2
	 ku856qRxOuvqaVVuw77GnmeuI1igPEoVdU7PhNxVuXZrCGn2w++M6027nL1INespPE
	 QttBKUPt1axcNvqXAmdJQU8G4Lu7LAOnF29EbSj5Bh45d3d9Sn2jTnV8MuqwmasY0E
	 6LCR6esSifPUw==
Message-ID: <sashiko-outbox-217493@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (ltc2947) Make ltc2947.h self-contained
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@baylibre.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261116180950.3894659-2-u.kleine-koenig@baylibre.com>
References: <20261116180950.3894659-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 18:15:26 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> When ltc2947.h is included without a previous definition of
> of_device_id, the compiler wails:
>=20
> 	drivers/hwmon/ltc2947.h:11:34: error: array type has incomplete element =
type =E2=80=98struct of_device_id=E2=80=99
> 	   11 | extern const struct of_device_id ltc2947_of_match[];
> 	      |                                  ^~~~~~~~~~~~~~~~
>=20
> A forward declaration is not enough to fix that, so include the header
> providing `struct of_device_id`.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116180950.3894=
659-2-u.kleine-koenig@baylibre.com?part=3D1

