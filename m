Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794110608;
	b=bkJj/i3xBSipJn4whILj/KFiseW/3NSv4xQJkTKtVB4dax3t+tqG5sFIFDz06Y9w9Mnf
	 vceInmZbKhq08pB/qTNVH4qVkwBxIM/VWvjfzz2HCuiQsQxMukfCqGCQDr/ImT4fy3jBr
	 O+K84kqjvzUuuosCe7+OP1AdXYdi7gKonFTp/1B628WdXK/X+Y+kxNFSAHQNChFLk5L4i
	 PtNpWPYKKnl/Io+eMzfsLlJWkGcn2wySoyu+D0pbUPci7/ofFWpeT1ysJVuE71/pJhaMI
	 f3Ec8hRo4SGqjSnDcLRnmgQzQgdvP9GUR04u3Sb+409MNvUIERCzPQbha35OnHHlmIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794110608;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sdDTIXRhcAd53lBZhzYQZzg7JzCtI/uwN/j4Fc0QV7o=;
	b=gWnsutWdZziPNAC3YqAwpd7CCY8ZY7xtryIUcxvOij6D/Va2jHcAG+xCQdVkMt6SioNL
	 kbnZcRqcR8KAuutLQcwjT7ogJoSjv9boqxYVaZ+xtRUe9gKPdNiesdWAHdNRD+/BfhbV2
	 4b58NYglA3IViiH2TWp+LHRjsewT45tzYfP/7RK2NX3QwXlikfzWazb8Em/lKVmDr5RS2
	 cIDkhDgx4ZKzmpp8dzhrwWolTy8+pMIZugN5n4Dvh2vMwTiuE75qtKqz+vxgxE0swSTnv
	 mAEdwcMQ2cAecJuMs4vorVC/5BxAVjnIFVFE3bvgsXnELv3pFUh2sNVLEe5g+8Arumg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eLdDiMhC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68576606A31A
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 04:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eLdDiMhC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237C21F0089F;
	Sun,  8 Nov 2026 04:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794110608;
	bh=sdDTIXRhcAd53lBZhzYQZzg7JzCtI/uwN/j4Fc0QV7o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eLdDiMhC39aznurhfF7iqf0+/ziX0Sq4UsAEubvT3jSD73ydIjbE8SHPzdMRI8nw6
	 uheiC1fsP17XcLB0QIt1vdzhbF8fpfk61X89LFC1274jc5UvZD7fSXA7brZ+pgy/09
	 aNyl2jQSgnKDOziLIUssf5adurtSVktIvH0RlyraFIERkaaM2rW6WVLNHnbb6r6xKs
	 TeQEkNB/jMj6fqHrfbxdeBwY6Ydcky6IY7Ppkmt5JPdk+Ohm7K6dgG9S8BMiY4HxBf
	 U9wfVu0GHS97KQqvDl7vEqAGH/ZfQutCf2mSfOapYs3rzwnjU9B3usOFqQ9x8OSijE
	 o05PHry7cO06Q==
Message-ID: <sashiko-outbox-203553@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: (max31760) Leave standby mode at probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261108-max31760-fixes-v1-2-a61450463059@gmail.com>
References: <20261108-max31760-fixes-v1-0-a61450463059@gmail.com>
 <20261108-max31760-fixes-v1-2-a61450463059@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 04:03:27 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The driver never clears the standby bit (CR2_STBY) during probe.
> While max31760_resume() clears this bit on resume, probe only
> configured CR2_ALERTS.
>=20
> If the chip was left in standby (for example, by boot firmware or a
> previously running OS before a warm reboot), it remains in standby:
> temperature sensing, fan speed counting, and PWM output are halted.
> This occurs on the Samsung Galaxy XR, where the bootloader places the
> chip in standby during boot.
>=20
> Clear CR2_STBY alongside setting CR2_ALERTS in probe.
>=20
> Fixes: 38b04ad02d0d ("drivers: hwmon: Add max31760 fan speed controller d=
river")
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-max31760-f=
ixes-v1-0-a61450463059@gmail.com?part=3D2

