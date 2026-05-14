Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157673D902C
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 08:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778746209; cv=none; b=fvOA+M7m2egVt7oh339e+gDqdPH3BPYJgJtGwBRE0pPeslBtSl4MeIYfQVXzmVAiKoGDbE10WdDKF6ZZjh1hyx/RbbiMoWZgWBoO2KvKrx7FE74/x4vkwGH8TxtHIbwMUNoWCcTAf567anKT8qTbJoh3DPdQGkg32zFsthcvfIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778746209; c=relaxed/simple;
	bh=mIWoBWRQddNRY02ZWhQE9UbiTS+DRB/Kmr3febKKanA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=If3qhvOz++mHJlM9NBskI+ZFKoBVoVAxae8erUjTgxXnL/rs7yuv8MdvfkoAdL8fwhUcIROEQP5ZNvZpotlTvNEDpr2pzo58+WBw3baQj1XIe7PZLVV9tT5eApPGlLPwURvs8/pGOCZ3jo84hQUI1vl2g+0S2QpdlDh4//miIYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JkqjJzoJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JkqjJzoJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6ADC2BCB7;
	Thu, 14 May 2026 08:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778746208;
	bh=mIWoBWRQddNRY02ZWhQE9UbiTS+DRB/Kmr3febKKanA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=JkqjJzoJuPQLAoOYZRdUtNvy9fZd2Rj2vMdMPdzHrua/jw7DGXUGja4HqnUXIaLi8
	 M/yibc7HuvDqgO/lfeC+5nVJENcOr6EPgM5SHeExg0xCj8jFZ/p8cG4g6Be3FqfZPB
	 OPG8Om6QgSNXtCGp8p2ebMGNZqy9Nm70ipVQ+cxcs01p7cboj2eltiV/ons5WfaUvZ
	 DGhPpJMysttxzXUhSeipw75FBhHKguWOOMaq6pg55SS5fuavxosWDwXC/jSTr0DTyS
	 TTJFpAI0FZumqXUdHiXRhIO7UtgWc83Z8z856MzDzxgOs3J/kikeyKo8ZSFo1K9XD7
	 mggTO8plf6s2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] hwmon: scmi-hwmon: Log number of sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Tran" <alex.tran@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260513-scmi-client-probe-log-v1-3-00b47b1be009@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v1-3-00b47b1be009@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 08:10:08 +0000
Message-Id: <20260514081008.8E6ADC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The log message incorrectly reports the number of initialized senso=
rs instead of discovered sensors.
- [Low] The format specifier `%d` is used to log an unsigned 16-bit integer.
--

commit 7a34e84c653506754b307b335485bcabd49e81df
Author: Alex Tran <alex.tran@oss.qualcomm.com>

hwmon: scmi-hwmon: Log number of sensors

This commit adds a log message to report the number of sensors during probe,
making it easier to confirm the firmware exposed the expected resources.

> diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
> index eec223d174c07..6f1b0559d5c28 100644
> --- a/drivers/hwmon/scmi-hwmon.c
> +++ b/drivers/hwmon/scmi-hwmon.c
> @@ -362,6 +362,7 @@ static int scmi_hwmon_probe(struct scmi_device *sdev)
>  		}
>  	}
> =20
> +	dev_info(dev, "Initialized %d sensors\n", nr_sensors);

The nr_sensors variable holds the total number of sensors discovered from
the firmware, but the driver filters these and only initializes specific
supported hwmon types like TEMPERATURE_C and VOLTAGE. Should this message
say "Discovered" instead, or perhaps use the count of actually initialized
sensors?

This isn't a bug, but since nr_sensors is a u16, should it use the %u
format specifier instead of %d?

>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-scmi-clien=
t-probe-log-v1-0-00b47b1be009@oss.qualcomm.com?part=3D3
