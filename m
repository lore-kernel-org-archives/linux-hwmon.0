Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6263806A9;
	Wed, 21 Jan 2026 09:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768986511; cv=none; b=L8/97fyd2dLttbBGajFevdw0BTN/88wy22JIjXsA+WFSJIZ6yT1/fETJU5efk0gNb/3Gj8Ya5TeTZeEPlgJ26njZyeN9P6PZp6Fv9DUdrcGd88rbE/U8MfmAp7cxjiOC/gcj7ZSkAMVHS0Uad1b1ju5eOwkwT7z4aOgHd4b3sUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768986511; c=relaxed/simple;
	bh=yyb/4j3/U6xaiC07XuWygjCqCwh2HhRPPJIlayUkfNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GdTw5RBKDY8Y/U6u+PEFDEOnSuy5NEp5PATWTud9EnAJZPnK7GhliuLAbuq/4O+nGQu/OJMGvJPFxD3klgebxzONDPw6OIxTpdqjOpUvKxbjL4OjYPKyF/dxtdq8IVwtNuMcZEHoNnWJTuw3PZAkPJ4dzHewt0oCTYMjFi3B7JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fzkX3lC/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fzkX3lC/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB1FC116D0;
	Wed, 21 Jan 2026 09:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768986510;
	bh=yyb/4j3/U6xaiC07XuWygjCqCwh2HhRPPJIlayUkfNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fzkX3lC/NgITfl6bgmkSNB1erlpiHcx/GfQcshAvL4iGnA8tzB0FKU1vhz4hNlr6F
	 2nKi1bA2+AtFB2bN081JOYodCecS5M3rnmboYacKPPEc4VvIB9S4H65PvdhZr/aS+4
	 TPbOeoyCzUgU3HBHwAWrbpk3vdqnBNbSG7ARjM9r19/2S+X3v9zEip46KGcAJIRekJ
	 fHuONXmfQwYye2NKvemLeqmqJELbNwcJiUsM+P71bahyeqwhlPK8XYsQsa6RSPKS9R
	 O5dKYWQ9jC5PYbXA6em/SXYhBXxRJPoOjIyAD6SQEFkVhfVyF4K2PVPaQK0oJ7yMm0
	 tvKsFiVpjrsNQ==
Date: Wed, 21 Jan 2026 09:08:26 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Stephen Horvath <s.horvath@outlook.com.au>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] hwmon: (cros_ec) Add support for fan target speed
Message-ID: <aXCXipHCdryd64Le@google.com>
References: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
 <20260118-cros_ec-hwmon-pwm-v2-2-77eb1709b031@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260118-cros_ec-hwmon-pwm-v2-2-77eb1709b031@weissschuh.net>

On Sun, Jan 18, 2026 at 10:45:56AM +0100, Thomas Weißschuh wrote:
> @@ -259,8 +278,13 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
>  					u32 attr, int channel)
>  {
>  	const struct cros_ec_hwmon_priv *priv = data;
> +	u16 speed;
>  
>  	if (type == hwmon_fan) {
> +		if (attr == hwmon_fan_target &&
> +		    cros_ec_hwmon_read_fan_target(priv->cros_ec, &speed) == -EOPNOTSUPP)

[v2 4/4] patch uses is_cros_ec_cmd_available() for the purpose.  Can't it
also use here?
