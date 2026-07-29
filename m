Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7D33254A0;
	Wed, 29 Jul 2026 05:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785301209; cv=none; b=AtAbvqA0HzznA3uHxI05gLzec5dsUcriq9WnZVwa0EGjT+/ymvqxCAud+NnZLr6W4P8R+TdQJe5fmndc3ihUbvuwDOnVYjg5yD/JahDLSeOYunr46wVEjZBDJ/njvJrV8UDsudnG6cXQAw1KIgDbvKu+Nx5U90ASAJv+9SdBpZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785301209; c=relaxed/simple;
	bh=FCczHLW51QDQqEDKRgzQXoBMlUiaJ3CP4iB8P2iot7w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PyDIt4abqI9BL5AKt1yEwNpJTULKD3I4oJ89ygOGcJaF8nhxf1+yza8FQmftVgnLu+XRQl8N8+5U7bFviLt7MuxgTWd8P86dIdQ2YP3AhsCI/X/3zJEoMbzSW3515sWsw3xF025S8f2V+/wyrGDfX/oWD/f66o7u7f0kIZ8PJ28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gaX+p/Wu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gaX+p/Wu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090791F000E9;
	Wed, 29 Jul 2026 05:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785301208;
	bh=ZBgUJuQnaUyhDmd1vbcQk5y+VRwfjLBrycMUEJVY5oQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gaX+p/WuvhxD8xuWgg7TOMdz07TOHckWFEal2CFZjxAKvK4NUJbv5mpJaSwPP7DBl
	 ehD5vfIU5P0f5WIxbJIm7yB/C8Vj2StQDZokBQFQrFc1XoplAAhocY18OERjZmoW7i
	 N3hPLEk6l9oiny3rl8v1hLResV1+HJXbCwS0Fc+ejjJCH3at2DWmg2sV8nfAYSok9m
	 REF68ssWLpw9q+C9d3+wlNS0xDbsDIdYUYSWhKhJJVSMLNY7O6CKPDsH+VgYN9Iydf
	 eDN69OauRMWFVVsQsWn07vIGtuuLCTFQIAyn/2mCUf4DMXBZtaNwn0u1joCa2VAiYI
	 8uOPdVRZsAu4A==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon-next PATCH v4 3/4] hwmon: (adt7470) Expose fan control
 via PWM framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260729-adt7470_thermalzone-v4-3-c14039dfa0e6@gmail.com>
References: <20260729-adt7470_thermalzone-v4-0-c14039dfa0e6@gmail.com>
 <20260729-adt7470_thermalzone-v4-3-c14039dfa0e6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 05:00:07 +0000
Message-Id: <20260729050008.090791F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The ADT7470 features four PWM outputs designed to control fans.
> Previously, these were only accessible through the legacy hwmon
> sysfs interface.
>=20
> Expose the ADT7470 fan control lines through the generic PWM framework.
> This allows generic PWM consumers described in Device Tree, such as
> "pwm-fan", to use the device through the "#pwm-cells" property.  This is
> particularly necessary for boards where the ADT7470 external temperature
> sensors are not populated and the chip is used strictly as a fan
> controller (e.g., Edgecore ECS-2100-52T switches). In such setups,
> delegating control to the generic PWM subsystem allows the kernel's
> thermal framework to manage the fans based on unrelated temperature
> zones, such as internal SoC sensors.
>=20
> When a PWM consumer applies a new PWM state, the driver automatically
> switches the corresponding PWM channel to manual mode so that the
> requested duty cycle takes effect. The duty cycle specified by the PWM
> framework is internally converted to the 0-255 scale expected by the
> hardware registers.
>=20
> The legacy sysfs interface remains unaffected and operates in parallel.
>=20
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-adt7470_th=
ermalzone-v4-0-c14039dfa0e6@gmail.com?part=3D3

