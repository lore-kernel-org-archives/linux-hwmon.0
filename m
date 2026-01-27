Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032631A9F93
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 00:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769473577; cv=none; b=tlzbP6YDf8Z5YQXFlrUfnJcZJI1HlDUZkzrrUO8mkM0pEB8+s6L/EjkbUChgq+NghEMCILdn95SU5KdPsuAY0FFrs+hYa6QOicFbSncroMqgU4gIJerAm8MfoFcSrGouHSqvVwOCubliq4ASvEeTaiq27Ws4+X+PDZrEQuxnSv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769473577; c=relaxed/simple;
	bh=fdMi7TfKrS7Cmghmf01IPyUxkj4PPBLbj9OGu4MkLsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=covMs+rUYXfMBBiON0lAf9LOArFPfjIDXdfInxUkxf1gSAtaY5wE2VxPWTplCeoPkVg90Bsp+4+GiIEQaA8Q7C8FD6KJHVhZEoB5j+NQ+IDuSLKhSjZI0+G7oj/scPXpmbWjhLDV/vv9PzWjy7weLLjD1pEWw3gyHctmqoq9i7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIqHhdig; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIqHhdig"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a2ea96930cso31403785ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jan 2026 16:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769473575; x=1770078375; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nIkKftRmvZrX00LdvEp/NTz/bb5lQOW0F+qle7ug6ME=;
        b=YIqHhdigWE8cWe6sSX80RmaGFN1rQtmj42JJcKxPkwXhPnCekI+ar6uxMkJrv9nrAc
         jN+4ydxalKY8WzGouVl3dZicEQRqBgwFdutGPfi8mqxpHFaYndKSreA4lBO9+0si02ig
         mILkf5GFjHUIWsVXFar/H/cawPry0gQUot1thh0qb7ddBVxNYDcTAwg77cfv/DE4ja6H
         NnGmZ98m/rKRnmSI2aX5aP3Goq3m/wDj7SsvElB5u21dge/T1EiFU+95NTkVYFlEd2uh
         +cQ5z+YXSiFHxpViztrYuxyLxITkpYsIXP8xui+RhMI4uB7vQDY8M3w93ghRuSPRuQgV
         B7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769473575; x=1770078375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIkKftRmvZrX00LdvEp/NTz/bb5lQOW0F+qle7ug6ME=;
        b=DzEeTrbOdpfEJvrb2NloKydra3kYVEPTrPX6DjTtu1uXff3SkcrQVw/Dtm6n9HIPgV
         R/AlYasljKrQpwCvUnVnvyaCRFnHg5f/5g1UfyI3wo1mRydbBGW5IsQGl5nTX1qAYCA9
         shs/m+0KenOQL+VOwwEG1Jd+8G0dPuago1gjbWCnZllPtBVHMlsB/1YabijbEa65ExST
         8UC0PDOKCKgbPYoCMsxP1GS+wA8DVLL132Z5URmpfRyk0/J/6YeSk089h6hIopFNTFii
         uXt+10AOR/X1QAfVGZwQiK4ALKJ+RSM7hf3MInkmXouiUODPleq66gJxrvNjqWJhIOAW
         nBzg==
X-Forwarded-Encrypted: i=1; AJvYcCWuQ2mMajj144GMfnODWSE1MarbiXUWUipRbWvAFb1DfOv3j1+scd73d0L92jBi0w2ACmWzu/ZcPTvphg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN7hwNU2RLsHIlhwgJiTy6xix098rXiy5sNnd2aA+BhqowW3fZ
	Atnw8YeaNeSSoXBFsC/5dx+vzSNtc7F3c9or/kGM5luyg2KhQ3tA55LQ
X-Gm-Gg: AZuq6aLOLPxpTxexP9MFNoHCc6XQh3FimJ+5bX4yojvTDqK3YZMzr5tSL0/9IKmsHG8
	htXspwUKdUp4NpbnjrnG0BWEj9//0Q7SuXLuMNyZrWXA+jrEV9nnfewUpZSP2hoaqs6VU7LrX50
	jg72mTRkeuIZSj/SRs8ZejcBzluLiuOqpJo/dELGRe+EKgqj1dao+WglOF3khybXJP8d/ddzEsa
	1H3vNqWvb3ryKzjpLGS6WbIsaRYb0r27VLKlFlyt0MERTEP2NB0u9/3aHG5hfqqRYdwY7nJSPNw
	jL20MS1b1P9sPictkw1/IddbG+9Sjj8u1kFIdI9EOePAMEI62HMouhsYOFkwrXubxon2q5AUrOE
	qRMjFty91crz/Z3RAOB/D0t4J0YU36kqQETB5MqtuGCXFcFcWyTeSuXQGV+pO5ulLzZXD+/dOKj
	rNg0NlRGWhd7dnZdy+1/9u3FA6
X-Received: by 2002:a17:903:178b:b0:2a0:d629:903c with SMTP id d9443c01a7336-2a8452f0c02mr62071425ad.30.1769473575154;
        Mon, 26 Jan 2026 16:26:15 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f98583sm99346985ad.54.2026.01.26.16.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 16:26:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Jan 2026 16:26:12 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Stephen Horvath <s.horvath@outlook.com.au>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 4/4] hwmon: (cros_ec) Add support for temperature
 thresholds
Message-ID: <0eae08ff-22ba-4c85-a2da-4cde7b50e156@roeck-us.net>
References: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
 <20260118-cros_ec-hwmon-pwm-v2-4-77eb1709b031@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260118-cros_ec-hwmon-pwm-v2-4-77eb1709b031@weissschuh.net>

On Sun, Jan 18, 2026 at 10:45:58AM +0100, Thomas Weiﬂschuh wrote:
> Implement reading temperature thresholds through
> EC_CMD_THERMAL_GET_THRESHOLD/EC_CMD_THERMAL_SET_THRESHOLD.
> 
> Thresholds are mapped as follows between the EC and hwmon:
> 
> hwmon_temp_max       - EC_TEMP_THRESH_WARN
> hwmon_temp_crit      - EC_TEMP_THRESH_HIGH
> hwmon_temp_emergency - EC_TEMP_THRESH_HALT
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied.

Thanks,
Guenter
