Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1B92DF126;
	Mon, 17 Aug 2026 10:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961966; cv=none; b=a/d+3Ew//M2SKFrV7rBEyvzgJtiO7qOfz2rHZ7d6duaMg5qY5DbGuwuPBStuJhiYT8yaZM6bYo00ccG1zQ421y0r3SjyhCZ/mK67QkkMDRvmChn6Gy2iwSrgLW5vFpiRs3wag6Km3kf3Q91biwSsZLNkNjyP0ZPhbXMLw9Z1uQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961966; c=relaxed/simple;
	bh=WVvo0PMPxnkupeQI70BKz80oLrVlO6VID9NP/OZK1WM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NmqgCBR/jAqoo8DjNDddbeQET9doj/3p4AVgQMkY/dWLxRAxBx4/i90uqInIksQJp4fBtbn1maIQOvQGTDAEvGFfP+GZynlSIj8Wy0Ev7hu0Rg1Y1vGum4n9n9R/+dg/zUX/OIMzr9SK+41EDXJVufVxOWRbKebi1kqKEkvPZhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzl4eL/F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzl4eL/F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10851F000E9;
	Mon, 17 Aug 2026 10:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786961965;
	bh=WVvo0PMPxnkupeQI70BKz80oLrVlO6VID9NP/OZK1WM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hzl4eL/FZ9VqIFnM59m4np8dEg+gJSwVDLOim43M6+tMq3HcsDcTkwu6DZkQF/Izv
	 i+iqkSd0Sly8Yok8TZXFqfr2CyPwhK/aWYJLx+1ub1qJ5OfL2vaDuDdebSNE0bwJrh
	 +ce3e2tk38fL/qhHQtcRcdPDtVX2gec/BUztD7vNYztQp8b5ErQOlz3CrEF4IxtJsH
	 KSRhlKvFVP2uwFBPU9+cG2IrEmstsYT/7CQ4T67iMIFdThPKiq22BAOPlEkOBZdgZx
	 aQjwdX/gj3NiftL/Jnsx845ecrEffB8QSsEE2KPKPJIIShwf8v4RcO9tDt55s16y9o
	 6BSyYkUKG3vuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stoyan Bogdanov" <sbogdanov@baylibre.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817101455.3526260-3-sbogdanov@baylibre.com>
References: <20260817101455.3526260-1-sbogdanov@baylibre.com>
 <20260817101455.3526260-3-sbogdanov@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 10:19:24 +0000
Message-Id: <20260817101924.D10851F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add device compatible support for TPS1689
>=20
> Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817101455.3526=
260-1-sbogdanov@baylibre.com?part=3D2

