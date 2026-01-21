Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6E8421890;
	Wed, 21 Jan 2026 20:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769028950; cv=none; b=mqO/T8CrJRsoRC/ITTUreud5T0ldLq5e3Hg1VXzlije1mlliVKiUDj6x45Po39XwY3WRguSKFeSeirFrfNh0zID03dETikjwVZNYzPCeE1lOEshFcE6bMbeg5OTXL1RLkTgNhb+Nv2P5uQlS3t4treOpCCtecxkznANe9tp5jwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769028950; c=relaxed/simple;
	bh=d8BsLSDA6CuAyXn1sXoLwvHsdq+IESstr2ZsAFsd/+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIMXzhFJxjjjvXnIaujWcdj3dStKyw83fv2xMEAyrNtqjdg8mQx1MykNi9c99R2IMY/qVpo3I8EapYXQmW9z5PcesesMUUB9zRiUDAzodj6OBqdbGImogVR4RB4w+Yph8ZaUoQHXZ85OS3/NcXJyj4fCqzn/v4QUxEWrSje8T+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=OSLe+Fzm; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="OSLe+Fzm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1769028939;
	bh=d8BsLSDA6CuAyXn1sXoLwvHsdq+IESstr2ZsAFsd/+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OSLe+Fzmoq+tRxogOZYIcU1k9RYXSmBF7Y0+mOfCPkzi5KBi5TLNCYMKyHav3VhXp
	 20yY8wYzrE8aAzNVAGMiY+iA+HbXiQX83JKVihIqoT3EQ+9xj3l7LNtSUSV0Ksoh7j
	 vP+iwPmn9p8PXZgwNEugwoJhCEKQi9H/fdJ2ctEI=
Date: Wed, 21 Jan 2026 21:55:38 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Dustin Howett <dustin@howett.net>, Mario Limonciello <mario.limonciello@amd.com>, 
	Stephen Horvath <s.horvath@outlook.com.au>, chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] hwmon: (cros_ec) Add support for fan target speed
Message-ID: <04a8e024-0502-4033-8fb6-c3c8a84088fb@t-8ch.de>
References: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
 <20260118-cros_ec-hwmon-pwm-v2-2-77eb1709b031@weissschuh.net>
 <aXCXipHCdryd64Le@google.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXCXipHCdryd64Le@google.com>

On 2026-01-21 09:08:26+0000, Tzung-Bi Shih wrote:
> On Sun, Jan 18, 2026 at 10:45:56AM +0100, Thomas Weißschuh wrote:
> > @@ -259,8 +278,13 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
> >  					u32 attr, int channel)
> >  {
> >  	const struct cros_ec_hwmon_priv *priv = data;
> > +	u16 speed;
> >  
> >  	if (type == hwmon_fan) {
> > +		if (attr == hwmon_fan_target &&
> > +		    cros_ec_hwmon_read_fan_target(priv->cros_ec, &speed) == -EOPNOTSUPP)
> 
> [v2 4/4] patch uses is_cros_ec_cmd_available() for the purpose.  Can't it
> also use here?

That is somewhat intentional. The code in patch 4 is executed many
times, so caching the result is faster. The code here is only executed
once. Calling the accessor instead of using  is_cros_ec_cmd_available()
makes sure that we test for the correct command and version, without
needing another, long CROS_EC_HWMON_*_VERSION define.


Thomas
