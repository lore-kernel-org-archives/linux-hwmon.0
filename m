Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0759156C6A
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Feb 2026 20:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770151526; cv=none; b=erDxFZg51tFnS3ljLVY51Mc9VDV24+1ScNgV4b9Tj9PwLdY0FFbYB63SMu38hhUeLFy+36zUX6fTCCDR2IU7GCIq0rgtUKkGFmXQXTlpUu42ixMH7pIesowpVOUtaqNjk/erA2Phu++GoLSK3g7xZYjU7sDkvc7BTaGU4zidGyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770151526; c=relaxed/simple;
	bh=JRBnZ+8tjOilMeZJMOzCmDnmZL1fwuQqpAz7EJltbms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V65rhc0gUTIsBpYCBWm2VKIcXQuu9cZMF27UWoDcB0Q88ID0S+nJAyNNvJUrb6fspGni9BpFuCAGsvW7rCHo4tOyI2osRAz5+NNBf3MLz9VHCYVM69o+OC4/GWD7WA2y/qmynwB55WPiE7HsvAt70qh0Kk1V7x7chovG9oXFDeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMO8mzeq; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMO8mzeq"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8230c839409so4832922b3a.3
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Feb 2026 12:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770151524; x=1770756324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SY6DYLnqRnlkJ6nNpwpLKHnvyItg1y7t+nOJ7MRScBQ=;
        b=OMO8mzeqrPH2Iho15bxaFba0CIj/FzxXX9jhgdFpPX30XknXQVNnN+qBoKiSXcuQNW
         0JTQIgujgXWjoCm7PupI7ag6OsUWVj2O/6yiH4VBZv6AYKGMRM2wtxOmW66nkqTgRfI3
         zVGlqknXFjFnOM0JBNDLGVOvRxdfvyqCm5L0/1O/DGg78N5oxuRrYAkgek4Tm13BtiHO
         5TFXMv5kiw6Ufqk/AcTvMR7a9jPfROw5dfVvxSMAjDF8KJASvfNrt0iGHks/lBFDfvbX
         EGk0yfH7xwQY3NbmlgHqn58IB5kQtl0rFOKIz1YetLamT719nDZYjnK68K1bJv/4Ao2e
         LosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770151524; x=1770756324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SY6DYLnqRnlkJ6nNpwpLKHnvyItg1y7t+nOJ7MRScBQ=;
        b=NdMC9tx7n6IC4waSqeGiYxx5P+fED85kUHUzJ193CR2RUik7gRZPZWjNIsv9ursGp7
         8wTlSIuZI9+2COp3+LX2Ib1/CbB7cIj+tEcBXfRa4ZYXYdDfTmReiakPjlwHZnrq7ltK
         H1UY3OVKNLKTOOV4VhLX+vF1LVxSFgI+3NMo/4x8xDFlA12m7TV8T+d11LTutHrXOlTU
         nQKIluFQLoPXbw0gA8wAnshXh5fXW/8QEhRMxJ2/JhMzxdL6q8AWke/dJxKWBmQxD/Ef
         B13R2hxSH0cwt8VKcwXt+tfXf0YjRE6pbPhICX3qIi7U4IfDI77tbVZNIrw9ljZqq11y
         dKdA==
X-Forwarded-Encrypted: i=1; AJvYcCUsfZoC1FNFvYnS1ti+uWmx98gTo3H2peuRjU040CGMVmWsDGw0UXo1UXKRnahBsw7rkm45GQ2AX07HkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5ms0HLXCHmPyvyIwB80wtrpwl8QkLnpiwdj/RaTYVHVX9xtIB
	q9EmaGvk89sp49VNM/9A+mEVL31QqiF2Z5dNxDVIzJ7qhHOwXhfoUul7
X-Gm-Gg: AZuq6aL2TeAz8R86T2H9LpFWqDQ3G0APkxek+aX7Om3DIKg9ifApxH5S1x9S25PrD/D
	snkjvpfZkD+a/THJnt1nCIWiAMRekoxrJFi5iCU/tzbrIGy+xC51/0m7h8euFJfi8/7SjU0z7Bo
	Dw/f9s6OQbSHYS0K1qDaZK/j2AcBLYDpPAWFkqs73Q8FW6tSWeZODIFv8VTvgiN4eroeTRL56JS
	abQAnT+4Iq0XOZbGrEntj2DVcwgucQXcd5ZDyK9AQT0aPpw4WEXkOs53oQmEqB+7VDVHf4V0Mos
	qrtXw07/WdYBT5oyc6T9pSeb/mlFPdJcm9Vji4OW5PPlfwDCG2otymvw66usjZ/ns+ltlorD7/Z
	9JSyTZWRZVxDSLqk1QOllb0JY8ruwD3d5ylCsWEKl+gimZE2QaSuI57qbwckJtDSsqCrj3aNu3h
	A23HjzlpG3QZRxbS3GheZ56DSjU+u6tNDDae0=
X-Received: by 2002:a05:6a21:718b:b0:393:7575:a8c7 with SMTP id adf61e73a8af0-3937575c9b3mr85990637.19.1770151524247;
        Tue, 03 Feb 2026 12:45:24 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c8515f36esm175662a12.29.2026.02.03.12.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 12:45:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 3 Feb 2026 12:45:22 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: victor.duicu@microchip.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, marius.cristea@microchip.com,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: add support for MCP998X
Message-ID: <99479712-9847-4113-8092-b87f1298a6da@roeck-us.net>
References: <20260127151823.9728-1-victor.duicu@microchip.com>
 <20260127151823.9728-3-victor.duicu@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127151823.9728-3-victor.duicu@microchip.com>

On Tue, Jan 27, 2026 at 05:18:22PM +0200, victor.duicu@microchip.com wrote:
> From: Victor Duicu <victor.duicu@microchip.com>
> 
> This is the driver for Microchip MCP998X/33 and MCP998XD/33D
> Multichannel Automotive Temperature Monitor Family.
> 
> Signed-off-by: Victor Duicu <victor.duicu@microchip.com>

Gemini is having fun. Another good point.

> +#define MCP9982_HIGH_LIMIT_DEFAULT		21000

AI:
The default high limit of 21 degrees C is extremely low and likely to cause
immediate alarms on many systems (e.g., room temperature is often > 21C,
and inside a case it is almost certainly higher). Standard practice is to
leave limits as configured by BIOS/firmware, or set them to the chip's
maximum rating if unconfigured. Overwriting them unconditionally to 21C
is a regression in expected behavior and usability.

Me: I would not call this a regression, but Gemini does have a point.
Why such a low high limit ? At the very least that warrants an
explanation/comment.

Thanks,
Guenter
