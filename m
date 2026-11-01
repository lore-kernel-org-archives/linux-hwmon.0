Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571392;
	b=FoRkPkJYlcGSYi+VZFPuzekRlaLwWLvKLYgnMMVnA6x3TjTfplkPT2j4CzV7eITjxnyV
	 ciZ6krGCKjD/kiB18N8gek9jC3B5hN0fKtxPvf8YletKFmB4ZWKYZuiw1NZGanAdYJYLu
	 OSGqP8SEb65xEQJQif98ob5wiUGqJdk5S0aKWf4gNYbGuw/q23RTs11e0VuyinfsdNVOJ
	 cCVWNWavsNLs2QVJ9IDd7eKkB2cvVRLKW41PTilfJjYTRUM3DObmFVADzG6YlVYR6YZLN
	 xVe33ht82Xqja7mxA2A6KS39fN2JJo1C97ElzbCZ95Op7Zehii/T+xReLP2Z+hk8Plg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571392;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=LKx3D3L8i20KkgdM053WRZoZcyEWptAt+bunmlcQ35w=;
	b=ZaBQqFtxZKRj26k/OjRc/lbbRYQ1oncndx038JsNK0VswzznGvEwfbe/irQ/RAGK+4UZ
	 1AZBcZ6CrNRWNRCwkdXdcmuDc8aU82n64fgSYL0rQTiESn1Fa+bF6OzM1SXA3k4rh5z7z
	 1ue0Ex8HXcIBRhewRQzsRcYeiSYqAVFezf2+NKA3xLZlKXtNZ+N/df5ge1Nr/PTA8UBKp
	 tkJRNdd/yd90WU7LbJyJiRwvUVv0BwBGhg5nFkIuKohO4eGZW52cb/F3g1EYyVJBXImbu
	 y2gXW0ChmoZH1cWejcAR6VafurTgLVZcUAikWeCmIHGM6fVu0WfPfr48jPpXVJ7iYWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=waKZaezF;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD73606DB64;
	Sun,  1 Nov 2026 22:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AD73606DB64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=waKZaezF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=LKx3D3L8i20KkgdM053WRZoZcyEWptAt+bunmlcQ35w=; b=waKZaezFft+W4+DVAkBekptegW
	UnVtPxS4CWRmPMUfT3usNMXRPi8pgRhKiYrCC2qldwTF6kvbPud9Rv7dp711s66/Cn4JMTgHi4jE/
	Dan6sZi23Dgp9BRiTCR7QsGIrt1bO0O/kbzrt5213L9azRmU/aVc4z29eJoGXc9mYP/AOEd2P5Hti
	8HVpHlQ8NcnOSef9F2acRL0TLvgmxMqtbSeCZ2Nw5bKT7LAO1hk036BgG7raWsIcnEKJJVWnIefEE
	cagbA2Zxzi5h0KO962bVDJQPnzq6Vpv5qsRfmX0xor0slj/x1u/uwVDKKkJaw262eKa9Xvs0FTML2
	lMCkZ8Yw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] Label the fans on Kobol Helios64
Date: Sun,  1 Nov 2026 23:16:05 +0100
Message-ID: <179357136496.4108155.6955639670454082907.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261018-helios64-fan-label-v1-0-69a3f96d4efa@iav.lv>
References: <20261018-helios64-fan-label-v1-0-69a3f96d4efa@iav.lv>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 18 Oct 2026 07:54:58 +0300, Igor Velkov wrote:
> Helios64 has two identical PWM fans, and userspace can tell them apart
> only by their platform device names. Patch 1 makes pwm-fan.yaml
> reference fan-common.yaml, as Rob suggested, which also allows label;
> the hwmon core already exposes it as the label attribute. Patch 2 names
> the fans after their headers, P6 and P7.
> 
> To: Guenter Roeck <linux@roeck-us.net>
> To: Jean Delvare <jdelvare@suse.com>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Heiko Stuebner <heiko@sntech.de>
> Cc: linux-hwmon@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: rockchip: Label the fans on Kobol Helios64
      commit: f80a26e10a39dd51061513db96fb525244e5e890

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
