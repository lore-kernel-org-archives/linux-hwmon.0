Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C78D356759
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 14:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570527; cv=none; b=SuXvVjMboaEqkgzmBnoGsm65TELysGQ1QjvTI++syv5wQj8dCltUfo71r/LVe4sHjzOmjYmOMkR1u/PElVsLsvrnDTjdP4nN+JqEXM2h5nQqBBK4f7Qus4wO9Gm4iuYkGi0wwkZ7CWknUUVtxuPC4UvboPDRkRBYPxTGhXrfYU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570527; c=relaxed/simple;
	bh=JpTFGpyHF/Ma4ZnJDkbrqA5WxX1p6md71/a7atwIJaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxQblcgHleSfezDCzuu0AQ/PO+J4tO6A/SePS87Y9Psue5lyhe1o4tiQ3YuvYNaR+aFCY1PEorZoPmFd1rTmWe+eg7LCm7UFESq9ai0nC+vVIG84SKA5zvIkgO8XPsWLNq+onWcHS3PM8y1JWe3xIFhi0nQwWkA9Qwd363+JmVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGph7ymm; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGph7ymm"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91a931f66so6619115ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 07:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789570524; x=1790175324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I052qaxrSO7MreL+XHe4B4oMuzy+yJxrtuNLZAmykZ0=;
        b=VGph7ymm+M4GpBldEmDKNqg7UiXASUxST6iv/RK3uW5Iml1I3DZODHyFZheEm80QEZ
         DAkSBjmlflA1xqH3SsbG8W4X6hJNB4H7d6yWwhFa+QWQNR+Ppd9/5Z9pNqrglKQq7EQp
         IiLhm/MyGoidToNDjK+qwb132FfKdIKa2s3rmfMxcHnolbTd9tjuceVx0GddFFGWPEgD
         sPtWAdXtepby1vCSrowIY0SKKUr/Hgze9NrehIrqDhcvWed9/M9dVZCGQRgJSQbxQmbw
         jqsH3JXtmBLsj/riPM2cXnb1NEVsRmzRpPUic0YhmMnWq9CV/uXKJ+73V79evzEfv48i
         R7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570524; x=1790175324;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I052qaxrSO7MreL+XHe4B4oMuzy+yJxrtuNLZAmykZ0=;
        b=XNSdgng4rvXz0WYw5yHNVftliQS8deF8LxgLwhDE2tqXCAQG/TBdwnqX8Y+5kPACEJ
         7Fdzc9oeFA3O+ntL4BLhyMVggfSL02LCsv6K/eVdaMslrjYriLa2ktkR8wY76BG2coS3
         hGymIbD5sVnCGdxCYmSpA+AQk9xEATIuouNQWiod99q0WVCBUIc6As6j1UWTzCLW9U9T
         HuLAoUMCwnoIg2CSmjmFocHiwy6KEjKcsbuTyryEmWDxxrJt65Gim7XmxNvEmkTKVic1
         Unr90klBwmYcHog538QTCF1ZvLeMBIDdRw+W59qk+vKeRWoW2Mxa1zCvqJ9uz3QbOglo
         JChA==
X-Forwarded-Encrypted: i=1; AKwUvBzooxXc1qi32yDNHJ1ykejtDoilQNeSzS+G/XYInfsH8LLIcDzEuJ652C0Kts9LyS6dH1xtk0wZFsMCaQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mqFtWOsmZ8Hz9Z+m0g8l7UplYx7sz8kHbe4ssKI+se/TJLXZUb
	H4pvfonZ0L3aPiRBjCiIpXAKtq0Bzwp7m6SIBOCo7iMKqWsh2kD22rBq
X-Gm-Gg: AYBFou26SIU5npGiJUC9fjnn5ML+f2aeNQEZAb+j36/BJi28I31j39IPSn+So4nMDIT
	f/qj31popR91jez3wa7t1KgxxhkDdrOfunVjIVoc6eEUXdeCzhr/7T0usKKMXU78PBrkA0tPTqP
	GwyTRd4UpwkD8WeLjqsx8B6fNcXIVYagD8pIfz6UfyyHwuaHOfC7+dswWNRUdKVTWfL/hTw5QyI
	Sxw6qaZpS5akrLE4JadpWi2Oz8eXNkMLRMe693C4OAvvXtIp90EUdU0qcVClFkuX/4ppxJyJZiO
	Dgc76maTrEYEtxNSCslAL6OQ0IHmlra4BTMO5072WHV3H5DpmcQWlpyVOavDT/bHqnv0CbrnILN
	jzwfECxEY8TlEeXnMQxpFvgpYSIHg3CYZxF4rXY33RiT3f+mTrz/HQUgkyZg1HL4z98DWJBYwVx
	AtiBefIYtety8mTVkGxNTtdb9SuiL2p+b4HE0STYoZFizg0h5PBie3jdRGHlQ9WR9921Vy85QKK
	2YBPU/edYMnmjO2epS8oTM=
X-Received: by 2002:a17:903:950:b0:2d9:438e:b70d with SMTP id d9443c01a7336-2dd8dc039edmr63405905ad.1.1789570524293;
        Wed, 16 Sep 2026 07:55:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f06a30sm12944355ad.65.2026.09.16.07.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:55:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 07:55:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Muhammad Bilal <meatuni001@gmail.com>
Cc: James Seo <james@equiv.tech>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (hp-wmi-sensors) Fix use-after-free in
 fungible_show()
Message-ID: <d63a4830-c627-49b8-81c7-f28ca4a41306@roeck-us.net>
References: <20260916002926.161595-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916002926.161595-1-meatuni001@gmail.com>

On Wed, Sep 16, 2026 at 05:29:26AM +0500, Muhammad Bilal wrote:
> nsensor->current_state is dynamically replaced as the sensor's state
> changes. update_numeric_sensor_from_wobj() does this by freeing the
> old string and installing a new one:
> 
> 	if (strcmp(trimmed, nsensor->current_state)) {
> 		new_string = hp_wmi_strdup(dev, trimmed);
> 		if (new_string) {
> 			devm_kfree(dev, nsensor->current_state);
> 			nsensor->current_state = new_string;
> 		}
> 	}
> 
> This function is only ever called from hp_wmi_update_info() while
> state->lock is held, so the free-and-replace itself is properly
> serialized against concurrent updates.
> 
> fungible_show(), however, reads the same pointer after the lock has
> already been dropped:
> 
> 	err = hp_wmi_update_info(state, info);
> 	if (err)
> 		return err;
> 
> 	switch (prop) {
> 	...
> 	case HP_WMI_PROPERTY_CURRENT_STATE:
> 		seq_printf(seqf, "%s\n", nsensor->current_state);
> 		break;
> 
> hp_wmi_update_info() takes state->lock internally and releases it
> before returning, so by the time fungible_show() dereferences
> nsensor->current_state in seq_printf(), no lock is held. Two
> processes reading a sensor's current_state debugfs entry at
> overlapping times (or one reading it while another read of the same
> sensor triggers a refresh) can race: one thread's seq_printf() can
> be part-way through printing the string at the moment another
> thread's call into update_numeric_sensor_from_wobj() frees it with
> devm_kfree() and installs a new pointer, causing a use-after-free
> read.
> 
> Take state->lock around the read in fungible_show() as well, so it
> can never run concurrently with the free-and-replace in
> update_numeric_sensor_from_wobj().
> 
> Fixes: 23902f98f8d4 ("hwmon: add HP WMI Sensors driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> Acked-by: James Seo <james@equiv.tech>

Applied.

Thanks,
Guenter
