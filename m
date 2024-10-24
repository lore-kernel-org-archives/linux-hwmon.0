Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15C81FF02C;
	Thu, 24 Oct 2024 19:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729799017; cv=none; b=R3tzyUxFszYBwWBL7AA5b4gxqc9rIT6dmgXUq2oY//bnQ8dEQlLU8XNqI/Adrxu/xnBl31VsqMU8Lv1jZdPX/dCLHVSWeOJlBMpm/1W2k9J/nv9s0cpUggxqQzG/0z4xOBR9K3kzlDCniyTspk0FNHvNk5WvIJm0fxfsT5b+qY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729799017; c=relaxed/simple;
	bh=yZ/K6dqDsGzjb6K/FzxlpFPTOwMfQtT9lhO1k2nevX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oStj7IUKDc2rv5rkjN6bYdRwd92Ih1a7g8Mhw+04+liVrQO8Rrb+KeKYvq1ZwnribdFqmWUDcuYW6fO2v4NsVKaVu6cuGDUGTmeXCIwmc32NvVwAxRcVLVARXWCOYm+l73y3OFeumwty1ErMbcTs6zqpVT+Bm1880Ua5+Rq2pYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xy75vLzG; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xy75vLzG"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7181eb9ad46so841627a34.1;
        Thu, 24 Oct 2024 12:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729799014; x=1730403814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fzk7F6oUmjqDhYJuo0PpkPkgeOk+vBWt9cR54GKynl0=;
        b=Xy75vLzGNL4NN8FtwoNmSeZ/RbxySibZpOty8cF62YUAzENTR93v/tXehZZQ2csGnw
         YmWuuU+XFcNehSUVCSloychBdfshutWteKxF4aI6B6njL+gwCVDi0vYuovbc69VWGQOR
         7XAeRtc6cO/zzsXl8NEG1KpBUCOMMReELJXoosQXe7i3WZI1jlliu3rjctFPlEmtcvQT
         lXXp778JGeFSZBCd3tbDgeZbUbqEtmkFA7t2J2qE6pS4lUYF/0rAJAF+ke9TNob1X+qw
         nnw5orV9v712s5xKKGdIhBZnJK8m8dsDjIkc7Rm1n28jsY6NOok94gyMCDKHFbFA2Mzq
         BYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729799014; x=1730403814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fzk7F6oUmjqDhYJuo0PpkPkgeOk+vBWt9cR54GKynl0=;
        b=uyLyA5xjIBoIMQp3RtDICM1ZVVm4gJ9fUlKsybSQHVxpgm2kgVVMmZ8zoep151W9Py
         fCxG1VpYdLf0BFndffCf0xvP4XWmURs8IrZGLVsUsngxDzswBOfTppE4BtcZYL12iGdn
         2j4qVJqytlb0K/fhF13cXdrU+yPE2262hYN8AEjH06g9ZcQmaMZBN8RbNZYHB4fdkKRM
         RbqQTXnwOYbuWMsOMVQ8Y0EimzrS9clBKO70kWBMVNbE7N0ElVQTK082R+KNkbbls4Uo
         NWxg4KM2Hq/05xpCXvLRZ8yy8ti59X0n89d1qeVroFb+RM2agc7OXzb7zudfDUpJXm6D
         pCEg==
X-Forwarded-Encrypted: i=1; AJvYcCVvhP8Fq0I2ALMxk7n8PLiDFbYntXRQUskyG+Oi/Qr/PRaP+mX7uve5OeHFBruUnK2bhm+x1Gs2ld0njSA=@vger.kernel.org, AJvYcCWDYuK4HAza4DIC19bEUDOuVuKAwdlDkfKgUUsqNacS97QlsIniqkIY/pZG9Dm3AzBvIT9XKYMB0l+1@vger.kernel.org, AJvYcCXOsxnC9bqCdMH1JYhjsIPvMMh0iNn7pOMcAQQdHyRgN/lLZ/MlK8IBI6n/N1X4qbA3kteCejp0pUeo@vger.kernel.org
X-Gm-Message-State: AOJu0YzXary5WPjjob6myG448lofSm0Qev8d0LsVurFFbSJqT95qiq6b
	TTXT5xZCb5LOR+dN4YupLuw7SuW6wGTajKqbj/WXswgZUnDVGuid
X-Google-Smtp-Source: AGHT+IGAmjBs9KPnqhzVymUJWLtawEh8mKaCboI+u4oJBXp9Mw9fgh2Y7T2TbFiEefA8jFOtXibqSw==
X-Received: by 2002:a05:6830:719d:b0:709:42dc:a024 with SMTP id 46e09a7af769-7185971d8efmr2990920a34.15.1729799014444;
        Thu, 24 Oct 2024 12:43:34 -0700 (PDT)
Received: from raspberrypi ([2600:1700:90:4c80::f])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7182ebd47acsm2236909a34.58.2024.10.24.12.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 12:43:33 -0700 (PDT)
Date: Thu, 24 Oct 2024 14:43:31 -0500
From: Grant Peltier <grantpeltier93@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: robh@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (pmbus/isl68137) add support for voltage
 divider on Vout
Message-ID: <ZxqjY-5MvsZfzf3U@raspberrypi>
References: <cover.1729646466.git.grantpeltier93@gmail.com>
 <422a40e992e047e250a3b1295503e3b81b5515ae.1729646466.git.grantpeltier93@gmail.com>
 <7d705ac9-a109-4b49-9ac6-78bd2e9ca091@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d705ac9-a109-4b49-9ac6-78bd2e9ca091@roeck-us.net>

Hi Guenter,

Thank you for the review!

On Thu, Oct 24, 2024 at 10:48:16AM -0700, Guenter Roeck wrote:
> On 10/22/24 18:58, Grant Peltier wrote:
> > + [...]
> > +	switch (reg) {
> > +	case PMBUS_VOUT_MAX:
> > +		/*
> > +		 * In cases where a voltage divider is attached to the target
> > +		 * rail between Vout and the Vsense pin, Vout related PMBus
> > +		 * commands should be scaled based on the expected voltage
> > +		 * at the Vsense pin.
> > +		 * I.e. Vsense = Vout * R2 / (R1 + R2)
> > +		 */
> > +		fallthrough;
> > +	case PMBUS_VOUT_MARGIN_HIGH:
> > +		fallthrough;
> > +	case PMBUS_VOUT_MARGIN_LOW:
> > +		fallthrough;
> > +	case PMBUS_VOUT_OV_FAULT_LIMIT:
> > +		fallthrough;
> > +	case PMBUS_VOUT_UV_FAULT_LIMIT:
> > +		fallthrough;
> 
> Just add the comment after the last case and drop all the fallthrough;
> Same above.
>

Will fix in v4

> > +	case PMBUS_VOUT_COMMAND:
> > +		if (data->channel[page].vout_voltage_divider[0]
> > +			&& data->channel[page].vout_voltage_divider[1]) {
> 
> It would be better to set defaults instead of having to check this
> for every executed command (for example by setting R1:=0 and R2:=1).
>

Sounds reasonable. I will adjust the channel initialization process to
set defaults instead and will remove the checks in v4.

> > [...]
> > +static int isl68137_probe_child_from_dt(struct device *dev,
> > +					struct device_node *child,
> > +					struct isl68137_data *data)
> > +{
> > +	u32 channel;
> > +	int err;
> > +
> > +	err = of_property_read_u32(child, "reg", &channel);
> > +	if (err) {
> > +		dev_err(dev, "missing reg property of %pOFn\n", child);
> > +		return err;
> > +	}
> > +	if (channel >= MAX_CHANNELS) {
> 
> The actual number of channels (pages) supported by the chip is known here
> and should be checked, either by passing the number of channels or a pointer
> to the entire info structure to this function.
> 

Will fix in v4.

> > +		dev_err(dev, "invalid reg %d of %pOFn\n", channel, child);
> > +		return -EINVAL;
> > +	}
> > +
> > +	of_property_read_u32_array(child, "renesas,vout-voltage-divider",
> 
> Ultimately this potentially applies to _all_ hardware monitoring chips,
> so I would very much prefer a generic voltage divider property definition.
>

There is a parallel conversation on PATCH v3 2/2 about this. Would you
prefer that I match the implementation for maxim20730?

> > +				data->channel[channel].vout_voltage_divider,
> > +				ARRAY_SIZE(data->channel[channel].vout_voltage_divider));
> 
> The returned data should be be validated here.
> 

Fixed in v3.

> > +
> > +	return 0;
> > +}
> > +
> > +static int isl68137_probe_from_dt(struct device *dev,
> > +				  struct isl68137_data *data)
> > +{
> > +	const struct device_node *np = dev->of_node;
> > +	struct device_node *child;
> > +	int err;
> > +
> > +	for_each_child_of_node(np, child) {
> > +		if (strcmp(child->name, "channel"))
> > +			continue;
> > +
> > +		err = isl68137_probe_child_from_dt(dev, child, data);
> > +		if (err)
> > +			return err;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >   static int isl68137_probe(struct i2c_client *client)
> >   {
> > +	struct device *dev = &client->dev;
> >   	struct pmbus_driver_info *info;
> > +	struct isl68137_data *data;
> > +	int i, err;
> > -	info = devm_kzalloc(&client->dev, sizeof(*info), GFP_KERNEL);
> > -	if (!info)
> > +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> >   		return -ENOMEM;
> > -	memcpy(info, &raa_dmpvr_info, sizeof(*info));
> > +
> > +	for (i = 0; i < MAX_CHANNELS; i++)
> > +		memset(data->channel[i].vout_voltage_divider,
> > +			0,
> > +			sizeof(data->channel[i].vout_voltage_divider));
> 
> Under what circumstance would this not already be 0 after devm_kzalloc() ?
>

Mental lapse on my end. Will change to set harmless defaults discussed
above.

> > + [...]
> > +	if (dev->of_node) { 
> This conditional should not be necessary because for_each_child_of_node()
> ultimately calls __of_get_next_child() which checks if the node pointer
> is NULL.
> 

Will remove in v4.

> > +		err = isl68137_probe_from_dt(dev, data);
> > +		if (err)
> > +			return err;
> > + [...]

Thanks again,
Grant 
