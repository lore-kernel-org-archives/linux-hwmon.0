Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0910F2C026E;
	Thu, 22 Jan 2026 03:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769052253; cv=none; b=UUxKXMyBV+ZMrbAt/oX1/zJx5/MeysVtNBBGlegHWjLhcy9LMa6EHBRXG04WOgL3eGJPOFoEwtUM183HuXs97fLKOHmn/U2qffchoC6WGasqYfYRi5bbrsV9IZxFGFcI0Qd+sQ+2aJh8Tq8coY8+ZT3fqVVjlACKXfW8w29EGME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769052253; c=relaxed/simple;
	bh=YeNy/fSNfoJeqTGvnCndeeZNov8D3p7cw007DSUK2XU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVm5YsuLV3nQYTZcaPdcgd6SqYEP1Xly5QiB7qkvsbnmTkf0lYswSWQNANTtBUURWT6KDN4eCx8R7H7eLOMqkiiN4LupmwrNlYFB5lZeo94fSxxA+i/Uln86HCd7YsQMn19QUZqKRXzJYq3dfMP7UoNBdiylmN6NI7RvSlBtCoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ry7ubtsH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ry7ubtsH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D3DC116D0;
	Thu, 22 Jan 2026 03:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769052251;
	bh=YeNy/fSNfoJeqTGvnCndeeZNov8D3p7cw007DSUK2XU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ry7ubtsHCdW4j9mcERB5RK4vNGvrl0T62CuB17DJABIa51Y4fs7di5y1As8XSlb9D
	 GrfMsvliE4M7i9lWFrhOM68vlV3XYX4PzdOotwU6c5BtQvv2eu6+0ufRIP8ODLd1T3
	 msl7B+S26kgq6evWpLxkssYp7z784u/+ABeUhqxJpDcEcZbCvuu6/KMpxA8ArLZmy4
	 mhIkze2fBZv9EsX12kx7arRDpZ5OVxPce7nUyKqO4MrcYkLX6r5o/+vqgQxEG38UXX
	 FZScJuA8iVVaZOjvADhUZNg/YCcyG1x6Cb73pk3x6NqRIabgr+oZeA11459LdixNEV
	 28FaiZjP2tPBw==
Date: Thu, 22 Jan 2026 03:24:07 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Stephen Horvath <s.horvath@outlook.com.au>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] hwmon: (cros_ec) Add support for fan target speed
Message-ID: <aXGYV5VdeI-CRIWk@google.com>
References: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
 <20260118-cros_ec-hwmon-pwm-v2-2-77eb1709b031@weissschuh.net>
 <aXCXipHCdryd64Le@google.com>
 <04a8e024-0502-4033-8fb6-c3c8a84088fb@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04a8e024-0502-4033-8fb6-c3c8a84088fb@t-8ch.de>

On Wed, Jan 21, 2026 at 09:55:38PM +0100, Thomas Weißschuh wrote:
> On 2026-01-21 09:08:26+0000, Tzung-Bi Shih wrote:
> > On Sun, Jan 18, 2026 at 10:45:56AM +0100, Thomas Weißschuh wrote:
> > > @@ -259,8 +278,13 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
> > >  					u32 attr, int channel)
> > >  {
> > >  	const struct cros_ec_hwmon_priv *priv = data;
> > > +	u16 speed;
> > >  
> > >  	if (type == hwmon_fan) {
> > > +		if (attr == hwmon_fan_target &&
> > > +		    cros_ec_hwmon_read_fan_target(priv->cros_ec, &speed) == -EOPNOTSUPP)
> > 
> > [v2 4/4] patch uses is_cros_ec_cmd_available() for the purpose.  Can't it
> > also use here?
> 
> That is somewhat intentional. The code in patch 4 is executed many
> times, so caching the result is faster. The code here is only executed
> once. Calling the accessor instead of using  is_cros_ec_cmd_available()
> makes sure that we test for the correct command and version, without
> needing another, long CROS_EC_HWMON_*_VERSION define.

I have no strong preference.  For the patch,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
