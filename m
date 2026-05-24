Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1549923507C
	for <linux-hwmon@vger.kernel.org>; Sun, 24 May 2026 15:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779636365; cv=none; b=U3E5PO4tKLypE4PSiR6KS7juK6wlqnT1y6+/wpacxie19/6AvuiSX2Wi6uZ0eXPyrdry7KKA6CfzxhCOB8+u1H5hen3/eiusbCkJR4L/ouDFzUKtvexy78Sctj94UCeJ2sVLe70/1NbF+6kuJfHHmKFLNwKZfujaUnvREJiu/BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779636365; c=relaxed/simple;
	bh=endhtLMwREnMrpsK9d6pveIWZYHLz6j+UumURqVqXgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIpGhlWfMYD9nV6S0Wz4rPPItQihZyTUKK38WjDSVNJYaDykg1N1zcVTXU60tEUeFvKmzq1Q5WusS5J3Ifg4lueANicY4pvITSfJCAj/JGBYsMJgLrWHDpKwap5IXZ9XkEaWZlDYVcEdKx0H6m6jZLisqFO2QkEt0jIURPUIWbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=skxpwxj2; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skxpwxj2"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso9127188eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 24 May 2026 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779636363; x=1780241163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vd80g3kYCb3Gm0irbMYMwyAFrBdTjDNomWG6QQeh9hU=;
        b=skxpwxj2BUJE88xnpYuchmA85eOx1bDR2E2HSLtN/H8JvXxISxiJaSzmzTzuh7uv9N
         4iwwpr2j7RuTRHmuXVU7DKroPtTrKiWWvlF0FWC6FgNY2TeXhOcGgn5zyA5uY2hdaYGu
         ojlCL0E7rwhk9JfElcinR41KYYg9RV4kiGF4We2ABe2TJm/hxu9Sh5JPEUPtudUHg6Mw
         epUgiATJkH3oh/WKXBVzfq1My9uUHkOhddjSLWTwebR1zDfCiubz6bZwz+MBBfN+O49N
         iSGkAtvEzn2oOvyebbqoXeTOgxu/F2np9w7iXw7QJvElyoi/JJpji0amx9dK/UgfDS0v
         fCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779636363; x=1780241163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vd80g3kYCb3Gm0irbMYMwyAFrBdTjDNomWG6QQeh9hU=;
        b=lwmDrsoFRmCwJemE2PVmt2cXohJXVOwpncbuNHbDaURd2xyGfOMGreu1/XO4FAAaJO
         PqUqqdfxD1z3URfCjHjbBUEUEPaL9mZGTOhPXk0x9dYg9hCkZo1dsVBgZGRcnastp+Cm
         MtXp3b68kun3yteIi1rbQFjJ+83EX0oc+ornWsOBFtaaSydCin2dTMdFw1T/rl4OvRBo
         3pSlQ+aEqn2xz2iU3mY63dSCT8ODSAV0qHQHFTznQBndn+MF7fNXACg2u9R/aOtTsb5K
         Xe4vBmRu31U5WZ9cChm4U3lOnWRojjJU50mn4cOOgtf/xCoI1dkP+Xtnboi3Gog43rRf
         WqNA==
X-Forwarded-Encrypted: i=1; AFNElJ8cqNL5i7wLUpaD4rhR0JEpnO3t2Y8gYjfNoi3GDVd94a/P0BQ0juwgXcBoj2sjGyIBfw6VaHzHSBoWRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzM4+8wRHZ8yGu14FmCyeXV2I4pZuPqizYqRHXq5K8gzUJ4T27+
	XMRfL0tP0E6BkbXVgUJC/pPquxyxGlzOswBHZtAzvZfjLUnt0aTyFsyS
X-Gm-Gg: Acq92OEmmh1KrVIN5kVT+x1tJcHtf3E5dS+EV7E2uUp/MjxJMY0c0n0AFTgcXXh/tOC
	hRnALYASYP66kNaN3aH2VPLXQM5v6JhZ95oXKEJDiKfxmBk6sCt9MRof8rZ3SNVxibefB1eTydb
	sVqi55WEG6QpsNe6dNTbaVH97+P3MdcDY22Wq5/jVBSuvabzwHl6i0Biy1h0u9ZufaP3xIi5eg2
	ZVomxJUL9k3ruyNsHGUMMiRWqdhhNz23RacdaKKb9byJNxyL4atz19j3LpijrcISEHFrL22Dajo
	yt2mvnIm+MqveSHN2v1EZkx57u2Aj7Kh1qsg8JrSZTMwJrhJuSea52io6IEYDBARBG24mSf/3zp
	J/yfnQEvVAjUU6DPK4/F60iAwwwzrynftiLSsEVDyKfuxqFxQ4D0tumF/EyJWTmg1db8wdDNzdK
	9/TSFiEMgMfsEiLfEq7cbijyKGc/MIoUGPbVfwKaHHj+D7M3I=
X-Received: by 2002:a05:7300:ad30:b0:304:70d0:4f07 with SMTP id 5a478bee46e88-30470d05c96mr1710201eec.17.1779636362636;
        Sun, 24 May 2026 08:26:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045225b7b6sm7935559eec.25.2026.05.24.08.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 08:26:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 24 May 2026 08:26:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jan-Henrik Bruhn <kernel@jhbruhn.de>
Cc: sashiko-bot@kernel.org, linux-hwmon@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v4] hwmon: (lm63) expose PWM frequency and LUT hysteresis
 as writable
Message-ID: <d0694fe0-16b0-45f9-b6e9-12733d489f67@roeck-us.net>
References: <20260523105837.67B9C1F000E9@smtp.kernel.org>
 <20260523133617.3439102-1-kernel@jhbruhn.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523133617.3439102-1-kernel@jhbruhn.de>

On Sat, May 23, 2026 at 03:36:17PM +0200, Jan-Henrik Bruhn wrote:
> The driver caches the PWM frequency register and the CONFIG_FAN slow-clock
> select bit, but never lets userspace pick a different output frequency.
> Add a pwm1_freq sysfs attribute that selects the closest SCS + PFR
> combination for the requested value in Hz, gated by manual mode like
> set_pwm1(). PFR is clamped to 31 so that 2*PFR fits in the chip's 6-bit
> PWM register (matching the existing scaling assumption in show_pwm1).
> 
> The hardware LUT hysteresis register is shared by all LUT entries, so
> the per-point pwm1_auto_pointN_temp_hyst attributes can't be made RW
> without N-to-1 cross-attribute side effects. Following the max31760
> precedent, expose a single chip-wide pwm1_auto_point_temp_hyst attribute
> holding the hysteresis amount in millidegrees; the per-point attributes
> stay RO and continue to show the resulting absolute trip-down
> temperature for each entry.
> 
> This was tested on a Linksys LGS328MPC switch hardware where the fan
> would not spin with the default PWM Frequency, which is why this change
> is required.
> 
> Signed-off-by: Jan-Henrik Bruhn <kernel@jhbruhn.de>

Applied.

Thanks,
Guenter
