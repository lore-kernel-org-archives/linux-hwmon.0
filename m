Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60121F5846
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 19:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758742268; cv=none; b=rBELVB+i6X71jvb8vNYyA/peFEbZt3uHcODUrt/dLo80v7qIlS/zL3Apr4/Qiz5Mcg18tDODXNv3clLEX+VhIYpeOmT6U8kkH+4P+icdMQqXGHO5+RY/h3IgumoJXCxGqFPjVOkFihkYxTstHEb2eXSlqQuV9BvhP7GjxylaN3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758742268; c=relaxed/simple;
	bh=GI9Xl+MPFOHHEWNS6m62yjXMQrhju00mYgKx0uA5d/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OK+YVxrhYP+8GhdQXMQZA5Orq9tip1Few4DQLuO/1nHerF6hXVP6+PJZQ6ubflgmyb7+34uxEdXzh8qo3wkiuEiPO/7DDrKXSFT6ckCmr9f/hpecVLtXtc4qaAQXpLHU8nI9Itul8VLxGNVA4t7wkHEe1IUSgaiQaNsQ+JFcuwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2IxPYm/; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2IxPYm/"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-77f343231fcso128740b3a.3
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 12:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758742266; x=1759347066; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PmXYYWuE84Zx3GWpt8FZ0tAm371gI0YIhPYxwUcYz5Y=;
        b=L2IxPYm/E765vjxiyaHWxQo8kqevxsH82AZYoCi87u2cIJNGKhacdjSx1isE/nJEJB
         FjXYrxWXVFbVmVKsdRqIAQ6s/v4UNli3/n24/ZFoV9g7A/NHcMInPjpk83nrSBdSl9AH
         z7gQ7+y2EVyER1VljOxeaKSTyJu6SazCy8pOkCfbDYMuTj/3o9KyXXpA4Rc5Eo7GXW20
         d0EsbuQGm2HBLXVCVNz54il4NBxzj3P8l8i6IqMN7pv1nguoCEmN4ZCb0atxsWvRhxWZ
         hCcHpl3d6HK95Bw3TllB0qCrN2z6iXofBPnUfTi+nOdfABMH0qskgO+3HulB6C22YZeq
         GkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758742266; x=1759347066;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PmXYYWuE84Zx3GWpt8FZ0tAm371gI0YIhPYxwUcYz5Y=;
        b=ULNo6uEk8usA59VlgzfzTTfs/YSPiPSEJZdOhqiwE7gLfDbq6FUTAiMj/LsgeP5NW6
         rDEae5wrnXfDQP+PsNK8KimziRRaat7h4UXd/j+6oQD6THK2B9oYaBuWXIe/mNl4R93k
         gBtFsJ2ujzwOwnUaE0NHfaVtdrXRZHVVrsLAPcSN0R5/Q861jVS4S85AFUl0q5DJGCWm
         +eaWCtgPhDHN9JG41sG0/nHxPDBWTyJDme7WDdmokji3ApcXpcUtwmvyh2FP3bAeTb+J
         nwdyELYeQ7WIdqrwKtl0mkR31F1XXPiXV5LL+6JA3kWndzPsIbE2MynUiekyMs1vIFwr
         ILeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA7wKttL7xPH18t7opiNI53MF+ne/gm+kKai9wOAas5oU4hB/UsS8Pd6HyS8Ax1nIT+5MnxNXjiFZj+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7/cWac7SVlzeMLBpSYsGy56URI95EaPqMa8nVYS4djm+FqNnh
	kLw6KwIFPukG2jK+kjHVNXjWfDbhgx09zz2DwA+KtnKohPli3JMTWhZL
X-Gm-Gg: ASbGncszjsg/wLro3L0aAEaBaPlN4kIgGBTn7LOu/4wUytGx4RcIq3gM4lzc4PLINAD
	qioq2o6cE0UZRWiVZ3dF40P7SCp6qP2m1kCZk3xbxqhMrR9uIvBjm62bG9ZR38spxP/6prtA8YP
	ajxtAEXwQ3gQ0+he9nsArc1J6enVsEl9nMHGP1BdYSe9re120Wc2lpzYYbfTwGHOvYCax+WgKwM
	oA6Py3inHrjL+/0mjr/W7KqkifIjeV/vZGboDVLbu5wn8LpGx0yWR1V9cD+/ZDzGxIS0OvJTUO7
	RkGf5vScfA7G3nf8DcFHGb+znD68RUClW3jSi5lQpZy22X8T4HwWCw3mnRWE07KSn0VdOfreCLp
	qqXFj6/0uE/rZ1CSgw90u1gpj3XuSCr5b548=
X-Google-Smtp-Source: AGHT+IF5CXklsVDvXe6vgWeVR2NFBBfKBUg2RT7kvwKZ6Qe4Syfm8nnQYr4AnphsGc3zSzkp7zeq+w==
X-Received: by 2002:a05:6a00:1382:b0:77f:383f:61f4 with SMTP id d2e1a72fcca58-780fce1fa18mr1117807b3a.12.1758742266232;
        Wed, 24 Sep 2025 12:31:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2f02c15bsm10810811b3a.95.2025.09.24.12.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 12:31:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 12:31:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sung-Chi Li <lschyi@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jonathan Corbet <corbet@lwn.net>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>
Subject: Re: [PATCH v6 2/3] hwmon: (cros_ec) add PWM control over fans
Message-ID: <41c71099-d9ad-4beb-bdc5-c8d15293d41c@roeck-us.net>
References: <20250911-cros_ec_fan-v6-0-a1446cc098af@google.com>
 <20250911-cros_ec_fan-v6-2-a1446cc098af@google.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250911-cros_ec_fan-v6-2-a1446cc098af@google.com>

On Thu, Sep 11, 2025 at 06:56:35AM +0000, Sung-Chi Li wrote:
> From: Sung-Chi Li <lschyi@chromium.org>
> 
> Newer EC firmware supports controlling fans through host commands, so
> adding corresponding implementations for controlling these fans in the
> driver for other kernel services and userspace to control them.
> 
> The driver will first probe the supported host command versions (get and
> set of fan PWM values, get and set of fan control mode) to see if the
> connected EC fulfills the requirements of controlling the fan, then
> exposes corresponding sysfs nodes for userspace to control the fan with
> corresponding read and write implementations.
> As EC will automatically change the fan mode to auto when the device is
> suspended, the power management hooks are added as well to keep the fan
> control mode and fan PWM value consistent during suspend and resume. As
> we need to access the hwmon device in the power management hook, update
> the driver by storing the hwmon device in the driver data as well.
> 
> Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> Acked-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Guenter
