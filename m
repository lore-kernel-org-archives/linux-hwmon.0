Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDDF17B505
	for <linux-hwmon@vger.kernel.org>; Fri,  2 May 2025 05:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746163922; cv=none; b=GR4FFs5BOGYEeNFAfybH8qQm5zqIMQW0LcGbo8wCAn2TDsvYXEKmsWQzcGZM7QIxujvRKsmWUpGIzXA4oR8WaZjAJ6PLS0BlNmdxVVCu3UBhrahHsDbpOFCu74lQyOr8iX1nmaLx/pBnNiEkv9DjbQ+p6YgHd98UY2Az5Fmnxa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746163922; c=relaxed/simple;
	bh=usJVdZHK/QHhzFDHOhC3JAVS9UlWcT9i2Wt2pFBV7Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6yDVPZXElfR1eANA2DQ+N8kedKaaKOnnFGN7/fyjDTlY2rR/ZMnaLIxJ3N5NmW+NJYy7JSEk5ZqExggLgknkl7aqGK7huZr8QO50YrIe9Xxa9xx3cASZqdv9okCy5ZEYre2vnSFItyH5wIYT8F4BDWd4UZc+l6t3m/6IAAGS1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FhT5NlW4; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FhT5NlW4"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223fd89d036so19841145ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 01 May 2025 22:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746163919; x=1746768719; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EuQJSqMieCdA49kvmDy4IyuB0LzUEBY1NlpAym9Qp94=;
        b=FhT5NlW4VuHR3zxx+3fZQWJsaEamQW5M9NJSZ1h4eBt3NKK8ttIuNwL2Feiwt8WwhG
         z+8MspMFKdsD/sZrxscqRMfk4qgXgpx8DRVToU8uuiUxuZrRMil6s4G8fsdUbxTCLlME
         xtcuVmSjC0zKIbz6h0m+seVgW7gYccWQslDck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746163919; x=1746768719;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EuQJSqMieCdA49kvmDy4IyuB0LzUEBY1NlpAym9Qp94=;
        b=F++Cdw5Ef23Sec6oqdtl58HO2p+PiMskz3K6yO2lj6mnIj/jkr3YWKJ78Avs/BUMC6
         3rX45T6HzK3grq826aYQtrMdIF5M/gV7ICgVnFJgGC3F7njKYrzE4gHE/aRP4DR+DeEE
         EtmE136ARH3xqXXHODACNOEsgtvHKqqO6ruvkfYtyk0oNDe2i5qy9T+ebLzHiUe+ZqK5
         l1TNteCzJiItA4L9WOyF5SeudMj7J8va/NF4EDdRTLL8hmzY1bYy2UmKnslV9JLcLgmQ
         I10C7SbRHBd5qKdrxOc02yjSoI9Mjh5rCgIuitIPw40os7WZYFyZecePSPyW7lKm36D4
         pOng==
X-Forwarded-Encrypted: i=1; AJvYcCVstedp4loa3e0SPPXuGmyNuKIT6GC68w6NKuW+nTpy/uB98awRUAINF1IS73jm8hDS8FzlDIn9UG3Q2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTgncoC2KvCLZAvsCfbFAPUnUFt+r1TxzZHGaKjlhuo5feoGUC
	DlItGCf9nYMiFcW5NyqMoW2nREbnBQe+z8NHmSLWKKzr9zZp7smWYPvHsQLlk2QTN81x6tPpsAY
	=
X-Gm-Gg: ASbGncuXGwLhcSynLO2ja1NzqI9SOKbPpcblSYkwo8jV7MkFehuNMMxuTEKI4obEPBA
	LGVWU6AexA/qPrc6RFxCm+ORgUYnZzX3hau9LPbVhiCsyhTlcZh+PlbPAS9+Sr2jb0WHi4QUDJ6
	5EvJhrr0CGdG8Jj0IhOO2b9Qu/tRHrDvIPykyhtDuimwF0BWR3iG1Hk2Cn7dW+nc7ylsAeHGx5g
	YoTMowbHe0WRl9a52PaJnpH2XjkC6rSi/GEMQUNmxHYUTsDsdC96JonFP2ihgATxz/77xYOEsqi
	f0jfP3YO5eiW3FG9xmbZwHjZLY4mevq/Xw==
X-Google-Smtp-Source: AGHT+IEg5hGIJsupBIjuos3OKynkR03wDTIHxLSn0l4PtdYPmXd+1wOHbVQYP7FSLZwrEVutzqN7vw==
X-Received: by 2002:a17:903:11ce:b0:224:f12:3746 with SMTP id d9443c01a7336-22e10340bf2mr22776705ad.30.1746163919276;
        Thu, 01 May 2025 22:31:59 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:e66e:6e73:436b:6b0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e10848fe9sm5845215ad.16.2025.05.01.22.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 22:31:58 -0700 (PDT)
Date: Fri, 2 May 2025 13:31:55 +0800
From: Sung-Chi Li <lschyi@chromium.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: (cros_ec) add PWM control over fans
Message-ID: <f63hek7p5d74xrkcbm7wk5s3fc6mlgyjkiovpyprlro4blyckf@in5an2tk6twb>
References: <20250429-cros_ec_fan-v1-0-a8d9e3efbb1a@chromium.org>
 <20250429-cros_ec_fan-v1-2-a8d9e3efbb1a@chromium.org>
 <0933ec48-9a4b-49d0-8670-50b6ff6433f5@t-8ch.de>
 <aBHKepQx_drHfnp8@google.com>
 <0483bdf2-c1a2-4a8e-b0ee-b00cafdda557@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0483bdf2-c1a2-4a8e-b0ee-b00cafdda557@t-8ch.de>

On Wed, Apr 30, 2025 at 04:48:15PM +0200, Thomas Weißschuh wrote:
> On 2025-04-30 15:00:10+0800, Sung-Chi Li wrote:
> > On Tue, Apr 29, 2025 at 11:20:09PM +0200, Thomas Weißschuh wrote:
> > > On 2025-04-29 16:14:22+0800, Sung-Chi Li via B4 Relay wrote:
> > > > From: Sung-Chi Li <lschyi@chromium.org>
> > > > 
> > > > Newer EC firmware supports controlling fans through host commands, so
> > > > adding corresponding implementations for controlling these fans in the
> > > > driver for other kernel services and userspace to control them.
> > > > 
> > > > The driver will first probe the supported host command versions (get and
> > > > set of fan PWM values, get and set of fan control mode) to see if the
> > > > connected EC fulfills the requirements of controlling the fan, then
> > > > exposes corresponding sysfs nodes for userspace to control the fan with
> > > > corresponding read and write implementations.
> > > > As EC will automatically change the fan mode to auto when the device is
> > > > suspended, the power management hooks are added as well to keep the fan
> > > > control mode and fan PWM value consistent during suspend and resume. As
> > > > we need to access the hwmon device in the power management hook, update
> > > > the driver by storing the hwmon device in the driver data as well.
> > > > 
> > > > Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> > > > ---
> > > >  Documentation/hwmon/cros_ec_hwmon.rst |   5 +-
> > > >  drivers/hwmon/cros_ec_hwmon.c         | 237 +++++++++++++++++++++++++++++++++-
> > > >  2 files changed, 237 insertions(+), 5 deletions(-)
> 
> <snip>
> 
> > > > +static int cros_ec_hwmon_read_pwm_value(struct cros_ec_device *cros_ec,
> > > > +					u8 index, u8 *pwm_value)
> > > > +{
> > > > +	int ret = cros_ec_hwmon_read_pwm_raw_value(cros_ec, index, pwm_value);
> > > 
> > > The _raw_ function is unnecessary.
> > > 
> > 
> > This is to share with the `cros_ec_hwmon_cooling_get_cur_state`, and there is a
> > unit conversion needed, so extract the same process into a _raw_ function.
> 
> What's the advantage of scaling the value for the cooling device?
> The hwmon core thermal zone implementation also uses the hwmon values
> directly.
> 

After rethinking about this, I think using the same unit between hwmon and
thermal cooling devices is easier. As a result, will remove the _raw_ functions,
and update logics in the cooling device commit.

> > > > +
> > > > +	if (ret == 0)
> > > > +		*pwm_value = *pwm_value * 255 / 100;
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static int cros_ec_hwmon_read_pwm_enable(struct cros_ec_device *cros_ec,
> > > > +					 u8 index, u8 *control_method)
> > > > +{
> > > > +	struct ec_params_auto_fan_ctrl_v2 req = {
> > > > +		.fan_idx = index,
> > > > +		.cmd = EC_AUTO_FAN_CONTROL_CMD_GET,
> > > > +	};
> > > > +	struct ec_response_auto_fan_control resp;
> > > > +	int ret = cros_ec_cmd(cros_ec, 2, EC_CMD_THERMAL_AUTO_FAN_CTRL, &req,
> > > > +			      sizeof(req), &resp, sizeof(resp));
> > > 
> > > Keep &foo and sizeof(foo) together on the same line please.
> > > 
> > 
> > This is automatically formatted by clang-format. I will keep it like this in the
> > v2 patch. If it is important for readablity, please share with me, and I will
> > update that in the v2 patch.
> 
> It's not that important. But unfortunate that clang-format will make the
> formatting worse.
> 

Ok, I will keep them in the same row.

<snip>

> > > > +	};
> > > > +	int ret;
> > > > +
> > > > +	/* No CROS EC supports no fan speed control */
> > > > +	if (val == 0)
> > > > +		return -EOPNOTSUPP;
> > > > +
> > > > +	req.set_auto = (val != 1) ? true : false;
> > > > +	ret = cros_ec_cmd(cros_ec, 2, EC_CMD_THERMAL_AUTO_FAN_CTRL, &req,
> > > > +			  sizeof(req), NULL, 0);
> > > 
> > > Use a full 100 columns.
> > > 
> > 
> > Hmm, I found the style guide actually strongly prefer 80:
> > https://www.kernel.org/doc/html/v6.14/process/coding-style.html#breaking-long-lines-and-strings
> 
> I don't think it is a strong recommendation anymore.
> The hwmon core also doesn't seem to be religious about it.
> 

Ok, I will update the series with 100 columns.

<snip>

> > > > +static int cros_ec_hwmon_resume(struct platform_device *pdev)
> > > > +{
> > > > +	const struct cros_ec_hwmon_platform_priv *platform_priv =
> > > > +		dev_get_drvdata(&pdev->dev);
> > > > +	const struct cros_ec_hwmon_priv *priv =
> > > > +		dev_get_drvdata(platform_priv->hwmon_dev);
> > > > +	size_t i;
> > > > +	int ret;
> > > > +
> > > > +	if (!priv->fan_control_supported)
> > > > +		return 0;
> > > > +
> > > > +	/*
> > > > +	 * EC sets fan control to auto after suspended, restore settings to
> > > > +	 * before suspended.
> > > > +	 */
> > > > +	for (i = 0; i < EC_FAN_SPEED_ENTRIES; i++) {
> > > > +		if (!(priv->manual_fans & BIT(i)))
> > > > +			continue;
> > > 
> > > Given that we can read the actual state from the EC I'd prefer to read
> > > it back and store it during suspend() instead of storing it during write().
> > > 
> > 
> > Do you mean reading fan mode and fan PWM value during suspend, or we will keep
> > updating `manual_fans` while write(), and do not cache the PWM value while
> > write()? That involves whether we need to send a get fan mode for every write
> > PWM value.
> 
> This one:
> "reading fan mode and fan PWM value during suspend"
> 

Sounds good, update the logic to only caching values when suspending, and remove
the behavior of caching values when writing. The write of PWM values is then
changed to fetch the fan control method first.
