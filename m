Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211F21519B4
	for <linux-hwmon@vger.kernel.org>; Tue, 18 Mar 2025 01:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742263058; cv=none; b=PI9ZQsABmOgmldUPX8quLR68I5U+Oz6GMlUKX0HQPQwSNyNywbW0ziOWCTR95Rof0VqDQQS6R356kKsgIsrWBiLhiZDHOw0TRnvDT+JzGdj5uew5gHImp3BLEtQz7xoSQ2uP6Z6tIr2OZOE0dZK6FPbaQEYXpVjVIqWsbemLMvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742263058; c=relaxed/simple;
	bh=f180VaDMqMO3zpMoFdqmiE01b5APf8IIlFR0sQ4TcdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6ZvTvIvZNldHH8BDhPXOEuhCU+pQXAJNXpqwnhzy+gebMn+/dhuuI1qqep93I1+eIHlPThqUYaNmhFU8RFjya5qinVd5cE5bXe2ElHsP0CNtbgif+YriToFMLQ+g1uUHCEahhGqeAfHZ0jbQSjVdrgwjIyZcdrLJpj5QJgzQ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BSLtD7wZ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BSLtD7wZ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223fd89d036so100625655ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Mar 2025 18:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742263056; x=1742867856; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KKTdJ2tedOISnUnkmTfkXG5Rfy1WMUmTRh6HNM9C/u4=;
        b=BSLtD7wZu37SzZzJCdQK5COvpYVPGPCrhtBWYv911ENkI4ZHYKsnDgYCeAyyWd1Inb
         n2KCOESona2CcRshZzd3RP/mU7M5PGbLLbkUWam19QYFIaW7/7AxuIZyremsYkHRfAtn
         g6/ES/CKRxhohDesPy2ri4HnTSsgJATjuPOAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742263056; x=1742867856;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KKTdJ2tedOISnUnkmTfkXG5Rfy1WMUmTRh6HNM9C/u4=;
        b=lBa2wLVvlcGb8wj1BW5xXoI3l/G8gVHcRaj6oVTCuAnLS20Sb4JuidazfpRhbSnMOF
         FafHVMVPYw42Vjzui/XHpe7irWYjVZ1IJnEJoj4bH6w/EU6MdFNJehOjGd3pQB1nYR1T
         0fFDQm8/ze1rpaF8zdw91JPMotBD193oHqvK49jS46PL3qcrsL6Y2SJYpxutIcvPFooP
         5b3uwxynJckNCqlV80uZPpKIP9AWdocZAsrkqvK9DycZQ2X5Zd0vO3yhK5prU5D9pL5Q
         nZpgLKnbzO8Xu+ix3vBUSQY2/d1LAqSpz9udEK3Nrt/CJsNshXTi4S2TdudoogbCisvY
         WiBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAY4RxzrukaEs26AmUM+PcxmLQgcTKtwYkGU8VONcD+muQ3zVJeOUxjATTsuJDjQ2w/AWPAMGqQZlBKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOpxz/bVGaB1R2QXqcfs2gYp3a7iK3R157VZ9eH4BV+uB/J/yv
	XZf2B083cONxAw4kA+iuZxjsfSo5ZbW25LKrZoLWQT6maUi0KXiuk7y0RE5fW4HGgJtbPmXFX/4
	=
X-Gm-Gg: ASbGncvCP3nvbtwgmNC2EXJ8gniKcmA5pMLIzT2YmyeZKn9x84i9YAEEygtf7KdQi+/
	HrGtE+vlzgLFQaok6MILg6zKQ4J9pybjEE7b0sSB7/B4MxSZRqDgfG1vqFFia2uiSI/N/gQQvtv
	fRyE66lprI8x0cW1Dzvy3Q6mZNjiAMDDQmLjKJdEbipzw+NkNtPyJ81/yIgZYsh0gUM1Cg0fk/H
	gDDnIP4liVcy41eoJuIo+b3DAE81R0Zb9rpfhL+EnsWREPHcE3MEV7cbV+P3p5X28qtRbMQIUH3
	S5ESsL5CHyuSpmGZNylBODHz2unojUk8vd/f1P8=
X-Google-Smtp-Source: AGHT+IHLwqi/TKiBnTx0e1Puwtwkw/FCI8pLX198arJf1RLieF9XKPcbc87eh31+IZqNU2Bg2JW/DQ==
X-Received: by 2002:a17:902:e843:b0:21f:2a2:3c8b with SMTP id d9443c01a7336-225e0a28851mr202763175ad.11.1742263056269;
        Mon, 17 Mar 2025 18:57:36 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:e601:f6c4:2d67:29ef])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6888683sm82611465ad.36.2025.03.17.18.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 18:57:35 -0700 (PDT)
Date: Tue, 18 Mar 2025 09:57:32 +0800
From: "Sung-Chi, Li" <lschyi@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (cros_ec) Add set and get target fan RPM
 function
Message-ID: <Z9jTDJqkaID75OU-@google.com>
References: <20250317-extend_ec_hwmon_fan-v2-1-13670557afe5@chromium.org>
 <aaa1fe3e-9813-4701-9c55-405925d8d1f7@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaa1fe3e-9813-4701-9c55-405925d8d1f7@t-8ch.de>

On Mon, Mar 17, 2025 at 06:46:32PM +0100, Thomas Weißschuh wrote:
> On 2025-03-17 14:40:26+0800, Sung-Chi Li wrote:
> > The ChromeOS embedded controller (EC) supports closed loop fan speed
> > control, so add the fan target attribute under hwmon framework, such
> > that kernel can expose reading and specifying the desired fan RPM for
> > fans connected to the EC.
> > 
> > When probing the cros_ec hwmon module, we also check the supported
> > command version of setting target fan RPM. This commit implements the
> > version 0 of getting the target fan RPM, which can only read the target
> > RPM of the first fan. This commit also implements the version 0 and 1 of
> > setting the target fan RPM, where the version 0 only supports setting
> > all fan to the same RPM, while version 1 supports setting different RPM
> > to each fan respectively.
> 
> Can you explain why this set of command compatibility was chosen?
> I would have expected to fully support the v1 commands and completely
> skip v0.
> 
I thought it would be better to support all current existing functionality.
Currently, there are v0 and v1 for setting, and only v0 for getting. However, I
think we will only care about v1 for setting (there is only v0 for getting), so
combine with another comment for the importance of v0, I think I'll only support
setting for v1.

> > Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> > ---
> > ChromeOS embedded controller (EC) supports closed-loop fan control. We
> > anticipate to have the fan related control from the kernel side, so this
> > series register the HWMON_F_TARGET attribute, and implement the read and
> > write function for setting/reading the target fan RPM from the EC side.
> > ---
> > Changes in v2:
> > 
> > - Squash the read, write, and register of fan target attribute to 1
> >   commit, as they are the same topic.
> > - Probe the supported command version from EC for setting the target fan
> >   RPM, and perform the set fan target RPM based on the supported
> >   version.
> > - Update the used variable type to kernel types (i.e., u32).
> > - Link to v1: https://lore.kernel.org/r/20250313-extend_ec_hwmon_fan-v1-0-5c566776f2c4@chromium.org
> > ---
> >  drivers/hwmon/cros_ec_hwmon.c | 130 ++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 125 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> > index 9991c3fa020ac859cbbff29dfb669e53248df885..b118a355f67d7238a6f596cf01a49d5b621b31d6 100644
> > --- a/drivers/hwmon/cros_ec_hwmon.c
> > +++ b/drivers/hwmon/cros_ec_hwmon.c
> > @@ -21,6 +21,12 @@ struct cros_ec_hwmon_priv {
> >  	struct cros_ec_device *cros_ec;
> >  	const char *temp_sensor_names[EC_TEMP_SENSOR_ENTRIES + EC_TEMP_SENSOR_B_ENTRIES];
> >  	u8 usable_fans;
> > +	int set_fan_target_rpm_version;
> > +};
> > +
> > +union ec_params_pwm_set_fan_target_rpm {
> > +	struct ec_params_pwm_set_fan_target_rpm_v0 v0;
> > +	struct ec_params_pwm_set_fan_target_rpm_v1 v1;
> >  };
> 
> No need to give this union a name. It is only used once.
> It doesn't even have to be a union but can be two dedicated on-stack
> variables.
> 
Only v1 is supported, so I'll remove this union, and there will only be 1
variable on-stack variable.

> >  
> >  static int cros_ec_hwmon_read_fan_speed(struct cros_ec_device *cros_ec, u8 index, u16 *speed)
> > @@ -36,6 +42,25 @@ static int cros_ec_hwmon_read_fan_speed(struct cros_ec_device *cros_ec, u8 index
> >  	return 0;
> >  }
> >  
> > +static int cros_ec_hwmon_read_fan_target(struct cros_ec_device *cros_ec,
> > +					 u8 index, u32 *speed)
> > +{
> > +	struct ec_response_pwm_get_fan_rpm r;
> > +	int ret;
> > +
> > +	// Currently only supports reading the first fan.
> > +	if (index > 0)
> > +		return -EOPNOTSUPP;
> 
> This needs to be checked in is_visible(), not here.
> (Or only support v1 and not have the restriction)
> 
Thank you, I was not sure about whether to do it in `is_visible` or the read
function. Please note that there is no v1 for getting the specific fan target
RPM value.

> > +	return 0;
> > +}
> > +
> >  static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8 *temp)
> >  {
> >  	unsigned int offset;
> > @@ -52,6 +77,49 @@ static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8
> >  	return 0;
> >  }
> >  
> > +static int cros_ec_hwmon_set_fan_rpm(struct cros_ec_device *cros_ec,
> > +				     int version, u8 index, u16 val)
> > +{
> > +	union ec_params_pwm_set_fan_target_rpm req;
> > +	int req_size;
> > +	int ret;
> > +
> > +	if (version == 0) {
> > +		if (index != 0)
> > +			dev_warn(
> > +				cros_ec->dev,
> > +				"v0 only supports setting all fan to same RPM (cannot just set idx %d), set all to %d\n",
> > +				index, val);
> 
> How important is v0 in general?
> 
I think v1 covers all functionality for v0, and the intention for having this
functionality is to have more control on each fan, so v0 is not that importatn.
Along with the comments above, I can drop the support for v0.

> > +	if (ret < 0) {
> > +		dev_err(priv->cros_ec->dev,
> > +			"error getting target fan RPM set command version: %d\n", ret);
> > +		return ret;
> > +	}
> 
> If neither v0 nor v1 are supported, this will completely prevent the
> driver from being probed. Is this intentional?
> 
Supposedly one of the version should be supported. However, with your reminder,
I think missing this functionality should not block this module. As such, I will
only log an warning here.
