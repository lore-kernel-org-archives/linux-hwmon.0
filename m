Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DC0344D8E
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Apr 2026 15:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775057571; cv=none; b=AAxY0V3SJy7fkzS9l3/y5YGOU5cYGHr+XpMqBYN1UR45847T8XF1zJDTvRmb4vSpl4RiNOxAm8UbQxWw+nRXeJfI4vpkCq6mM8p2ekym+Morny+eMfyQvyE3zuzUC4rghBseeV+dPzm2pS0A6ht+CP/ghgE21+hYCpnpsTWyHwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775057571; c=relaxed/simple;
	bh=Ai2/x1kqo80rkpEaKRRyykEK4jbPrETJQvivg8Hd8Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8gklb9l4le+hcegIHNtSdCFh7kFKu/5JiUQhC7xeLF9pSqZSuNCDu7lW+4Mhdy3xE/Pr9P0A5HSm3uKOaIzrTEvyrx9LnU25nLMcwYyeZJRXLoDuewCUsEzTey6/HDFGeEe4St7QWM+A2wUSeRAb3LVIjCiF3eF6m9Qk+7sqek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtXA1g8P; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtXA1g8P"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12732165d1eso9786445c88.1
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Apr 2026 08:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775057570; x=1775662370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21I3m8LqYZE/Hogk17E7dwBI5zTNe6gNNbn7uLVQjko=;
        b=jtXA1g8PoZrrOpDYaeJfsEf5yaA4/fX5+gX9LMPMddB8xYiVKy/T4gkrMrSwSTL1A0
         8M/08Vcjj/8P0TES6zm/rvrngzfmH5XBA2eOUvWSihKryOXnBmhmiIsgO+ycUkiMtkhi
         4UbWtCJg/Jw71DcY5lyZqXrfa68ARG0T5fU0kEg8x4SmUrlFIJJWZ8k3vAJdkfiXaUOO
         NQfyA/n5nCO7PwOGMIpy7X0FgcGWFO2nQwRA/xlMR3fXgNknyDLFp9PRSd4ojrrm7IcC
         0aDJlJ6KOqke3nsre35iMeqZQnExGw3yf69wsGdgdX4oyFa8AgMSQpIgqlMRumvdapzW
         eehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775057570; x=1775662370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=21I3m8LqYZE/Hogk17E7dwBI5zTNe6gNNbn7uLVQjko=;
        b=sXBaGPGdSV0KDzoajA1queBDMl+4B97kqDpgCr8FcDG+dO7DnBEFc3R5gYsNS/JESC
         lBY62eqdH2o8d43TwL21mQJlylfkF1OrEaFGPrCEJI3GtT8u8fi+raq5Skv5BKOJXKlR
         ooIEuJmo28LudlfowHkHXEdAox3BiMJZnS/6y8vqKALvZsqX4pyyMsJk2oRefzXooDY0
         BKiXv7kGPMFvd/YAqbA/9TPx844cD3DnTyYl66DRYBoRCU2Kgly3yN0kx5a0x9/Vt5Es
         cNAgC5fZpiWUgpekHWE8GYpxwETHGoIhUwfNiuPAGkhg4inoTCHfXyLmlytFG/DoGjki
         NLRQ==
X-Gm-Message-State: AOJu0YyndSoSYE5HBiZNMmA7wXWuu0O/gROumRUgq8IQnjH2WKrTTKDs
	cOHxyvVXzm7q0F8F2fASU/AZJAaVcWRjcqh0u3B9bj1r5tbjEFNEqR17
X-Gm-Gg: ATEYQzz1Y5kozxvCdR+zWx3nT6unHJkOzG0ckN4sQnCKVqIeiIpiPc/Pe1RFhhri/6D
	VOc3Vv1Mbu74fin+cuXZP67Tu+QoE8nPXrjgsxNPC0JoUTahqdPDJpOl0VOXtnK0b0AMY6cNQMF
	OnU66RxE67rPgMKeImJ7XgM+cpLHwHhkVpxLz9S/Ao1yJxYcE7TqRyi0wUgNn4QqDN3ALv3DtEL
	ECMaghmzRF8T1abNYQMkclLQQoTCly5wY/enp0gE8cMTH/F+7OCmSLlERalH/RA5RrTOYA0kfTn
	3KWEzqmIy/VsLn5IEANFX8G2CbD7+r1Qo6gs3Ont8OmQFBz8yGx1ypa7R7dTh8D2+aBx5jDUvQC
	LE+DsNvdI7wIPjQIxfcMjDC/BX2cW3RDp+ThvkTq1uHLk4OJJpnTVLqvQLAgZQuoS/QK/nyQmTE
	ELhAMuXVhIESOOBVSBS0UENtw0kD4CDMWYDqIk
X-Received: by 2002:a05:7022:6288:b0:127:15cd:9f52 with SMTP id a92af1059eb24-12be6457e26mr2297000c88.5.1775057569588;
        Wed, 01 Apr 2026 08:32:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bedd4e4e3sm131752c88.1.2026.04.01.08.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 08:32:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 1 Apr 2026 08:32:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aureo Serrano de Souza <aureo.serrano@arctic.de>
Cc: linux-hwmon@vger.kernel.org, linux@weissschuh.net, corbet@lwn.net,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] hwmon: add driver for ARCTIC Fan Controller
Message-ID: <aae8af5f-a61c-44da-976b-55fd684cbaec@roeck-us.net>
References: <20260401112654.60560-1-aureo.serrano@arctic.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401112654.60560-1-aureo.serrano@arctic.de>

Hi,

On Wed, Apr 01, 2026 at 07:25:54PM +0800, Aureo Serrano de Souza wrote:
> Add hwmon driver for the ARCTIC Fan Controller, a USB HID device
> (VID 0x3904, PID 0xF001) with 10 fan channels. Exposes fan speed in
> RPM (read-only) and PWM duty cycle (0-255, read/write) via sysfs.
> 
> The device pushes IN reports at ~1 Hz containing RPM readings. PWM is
> set via OUT reports; the device applies the new duty cycle and sends
> back a 2-byte ACK (Report ID 0x02). The driver waits up to 1 s for
> the ACK using a completion. Measured device latency: max ~563 ms over
> 500 iterations. PWM control is manual-only: the device never changes
> duty cycle autonomously.
> 
> raw_event() may run in hardirq context, so fan_rpm[] is protected by
> a spinlock with irq-save. pwm_duty[] is also protected by this spinlock
> because reset_resume() clears it outside the hwmon core lock. The OUT
> report buffer is built and write_pending is armed under the same lock so
> that no reset_resume() can race with the pwm_duty[] snapshot. priv->buf
> is exclusively accessed by write(), which the hwmon core serializes.
> 
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>
> ---

Looks like the patch is corrupted.

Applying: hwmon: add driver for ARCTIC Fan Controller
error: corrupt patch at line 587
error: could not build fake ancestor
Patch failed at 0001 hwmon: add driver for ARCTIC Fan Controller

I can not figure out what is wrong, but both git and patch report that it is
corrupted. Please fix and resend.

Thanks,
Guenter
