Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6354E33B6C4
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 20:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781038260; cv=none; b=L+lOYdVo9nR5xD5uNvIPX/BMwECIkNi7DZN1YJkpo/E8ItFyZwYegYEwz64/4WwO+TN171dkKun8LFdbnUqqXMLZTXE3sJqYrVs8r93W8a/ezcDxPsjVudo6b/I2LaVH93B+wygWXn4rpsFRE/rHWhq/9B6OPeIgov3DatFb8E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781038260; c=relaxed/simple;
	bh=ytyM0ohCPscKcRAsiqq6VTb2bKPUXGBz7fqKl3AsXAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjziCX/SG4TPBeVPVKNVNDzS9JPALjmKTMIFufkYrxa+uExlaIrqkhi9kzRtJexgfAsO6RQLeGAwFJ6vYUDJrXNiUxbUZzKzZtmw/kPdIEGeubdMNd0/ZR1U8AT2uwxFaxRhmRYW69vwAujlYgnh3Q0FJ+PMyI3H8fb4y6XFaZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NM6PXYyP; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NM6PXYyP"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36da151a152so4204691a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 13:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781038259; x=1781643059; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9wsVO7WJMT3aLMJb2s6cZ2xInbAc2bWqJEVVcktReD4=;
        b=NM6PXYyPExUHHqAHgSz/qbbywtfniPDAYhrHg0jGuwlO+KTiWil6GyQsFLUWdIgdfo
         WLuKAy4Nz9OZC5KRWS5BsuUdJmqflrFSeqhRDQ8/jH+65wT53taN5tvf+CPT3RwdvEzc
         IIGLhvlLIBOCxdA1UFreUSllstBTPRcrkfElpcGkcoW/vPSA24wICjsZfZvAhw4IpGRp
         gEGg4RueGA4wj+gC8LBTYsTE4SSBdgp07+7l0QKdAhcw6KaCGuY8kdYts/wIWajXBuT3
         ccLh95OR2Pgk8w8IYJbhZG8re3y1rLrjh0TLlkzCMjONq6xz61TcqR0wJh2Rn5GMbfn7
         q5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781038259; x=1781643059;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wsVO7WJMT3aLMJb2s6cZ2xInbAc2bWqJEVVcktReD4=;
        b=nx4sl9icccMhSdYjcEoAVAuD4Fnel34Vnbe0cqiZLei4bncjtTEDnxIrUpIZMuzMk3
         2CVYqVAnkKdvI+So2MmgotMxB+s9hqkmhuGtbf1DGgRETW0sjHFi9sRx5KmVCoHujgf/
         N/CVxDtvGSgoWuf8eDdrw5Rf91cBpjz8Tn230teFFst9bDdp8xEZgS/AdhRIhsUZJOW+
         R78P06UAwHLxm+2fv6ljmUvmFYDWOz3d17rVPXPaMCgszr1YybBbr/Hj8eImGlc/Fv0z
         5jlLH3EV8FuSVaGtOZ9fpc0LnTuKJRQX65FMZdBHdr2TaTuOYpg4ti/bill9kb9aQno4
         Frew==
X-Forwarded-Encrypted: i=1; AFNElJ8WPpJAaUeBacyNj/bJrffeOtcgu99c2YbpZkgzf4w8QKhXPmk0opz60EIF2Knk2y+d2W35FY3szSqtJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn3kVu7GSkn3fRB867MOa+GoU4gk3uh9kC4e2oH8ia2KlRUGD1
	+zIShRWlbo0lFd/QVkleiey74564uHwwfKoBdSVFrDPTRE0f81cAb3fWp7sw48WX
X-Gm-Gg: Acq92OESDz9NrOsrz4FPRgGoQ0vZK6O2yXfIbhzB/y2sErErm/YQ0bRlc1MoSUsTXgs
	2fOfYm2Cv5htykG0xkZmkX4kNNB3eVAI77wYm0ix2yUkTwmFwh7rHAmDZ6O9z/aSimtmD6pUw6J
	2OSucQyatmAwWsYz5FVJINgLRsPh7rDGzsJAMkQDraT94QsWcvNOeoMXwnbo28U3acaRPqcXcu3
	yv+XcMS6SfNjGg/ZKrErky56cvAil36NbrAXfmmpryjS0s9OzFE5NTpzOl1REeHOzvg/QQ+OuET
	vaP1S9xA3ZThL0zwQVCW3wyezvVgKDQgWq8cL+4QKdr4kDeXoe8HeWMZGuk4vznrzHb1l7wGN+V
	vBHDWIvB/8MZw40Ep5AyNMtiVEHPPs3CN+1GH06J5SfWK1iglmjEYmdJjin3X8Fj8hABg/6pUva
	7u/0OuiifC7l7yu4cghgDQlygFODWBz+y0ffJ0Gs5C7zuqeEg=
X-Received: by 2002:a17:90b:580e:b0:36c:e254:4db with SMTP id 98e67ed59e1d1-370ee544633mr22312274a91.6.1781038258678;
        Tue, 09 Jun 2026 13:50:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37625ecfe47sm194958a91.0.2026.06.09.13.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 13:50:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 13:50:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] hwmon: (cros_ec) Implement custom kelvin to celsius
 conversions
Message-ID: <6b3d438e-ba7b-40c0-8fd7-7e6eb1708a90@roeck-us.net>
References: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
 <20260529-cros_ec-hwmon-fan-curve-v1-1-da6792b3830f@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529-cros_ec-hwmon-fan-curve-v1-1-da6792b3830f@weissschuh.net>

On Fri, May 29, 2026 at 10:31:52PM +0200, Thomas Weiﬂschuh wrote:
> The ChromeOS EC APIs use integers representing degrees kelvin for
> temperatures. The default conversions from linux/units.h will then
> always convert these integer degrees celsius with a 150 millidegree
> offset. This is a bit confusing, as it also differs from other CrOS EC
> tooling. Internally the EC uses a kelvin to celsius offset of a round
> 273, so the current conversion is also not entirely accurate.
> 
> Implement a custom conversion which preserves round values.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter
