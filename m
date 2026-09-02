Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E1347D935
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Sep 2026 12:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353972; cv=none; b=o1kOIHjZeLAgFgqKMyZxG3cIoIMvV/r9Q2pqrpDtzPoKUr25j3c8gm+xYgtpL1+qMnUve3ivnbfFfxyQVnJ10apDpOSKaixafxIlE3erh5lAMutJ8Z+bJA0eWdwm8XFJqR2RCZSg2Zv+4RDoyneTFV477k+7Ea31nndBzLtT4NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353972; c=relaxed/simple;
	bh=dmJe+J/F+vYCqGcuQ3jcywh4Jc/H3IZgC2ypGBQHfp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ry8jGsJ6CtrgPTeP8+Hqr0OggfBqIth+03WWaSi3XPVUBWEaLbT+c6iut6xCw2pijRkiBiOQ+pA1/kIH01yadgEBNnAo9qyn0UyG0Fo/200/mVHutDS2TSWLxysIw6sbrhM1vtVPyTyz56V27F5RRybCb89w7QnVtU1cRtUc/BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pPkUxD/T; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pPkUxD/T"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d032846c95so12365345ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Sep 2026 05:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788353970; x=1788958770; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqORnjd6nGMwkHINTVnkwjIgRmlTLFd4wtw4MP5cLxE=;
        b=pPkUxD/Twrwtl8FSBb3jjo50HqDKJ5Gemks/7vWj7UFSxp15IkP+79KXBQa+Rf/0ff
         K71gAHKDZiYsH1qwaLX8f2Sxmov+dieOamzQcATPeEyA93+m+CAOSgp49F+c1BmTLQxC
         4w4UC6HQA8e7NBjdvKcRWNowO/PIazlUvQy+W5TlaPkLeBO+4uf6L62gX+UsMkE5x17v
         zdCSvV/YvowcVkbMamIPnNYs1zqlsIAm0YSzFh9yN0OJhUyd59LA+VW8I9pOMakRsdmt
         +MEVrpIRHQ/TJR7mbMILaRjeKdmRVTuppNyo1qd1iDx8vW1uBwRmnh6WcFmQ0gW/KLN8
         jOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353970; x=1788958770;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqORnjd6nGMwkHINTVnkwjIgRmlTLFd4wtw4MP5cLxE=;
        b=KZch0rM1Y5KGu/VLmaTqcTh2h4NH/PHheEBngJmFSh0tqZ85vu0fg0XCnppiyEshQJ
         SK4yNGr0WgZibgqvfrLTejkD75eaKbOuFtKM311FiMjn/Nss48jEhz99OU6/yhshA4Ai
         I0Xu9CaWc+4oeUw3iPeaxenF5JRxcd6feZd6P7+QGMG8IxG2+Q2b4mPftHrCz8hHjURI
         ifpVcB58Ye/Tz+LbeH37fDU2AAnaCHZYxc2NIlgCHERIPNQOSGXo1MZmTi00dX1tQ/3D
         TxAvKAh+LFWnRbqIlP4lDGOPhwhRoE8y6WMGITmvzgPRbhL5jt1U4jmxmSQG0/FaQ8Fb
         neMA==
X-Gm-Message-State: AFuF++nFhcSZxK4xSAxkPQseZaVcZR5PwFRZ9PqHy6wvk1Yll8Gmacmb
	NhIJCo8x36M1G36Cf4x/cXzTAt2Mc6G7mQcbHaIFw5UqV9WQqDPzoAER
X-Gm-Gg: AYBFou2TUod2SOPLXr62JJdlSogpRmeSG/rzLdCuoJs9hdCMPYab4tC9lNknu8N2hkN
	4nYcnWR/KQY4eXlKQM7U2LoSJXP/qHnPYUBxGVDT72ewh5pDgs4neLowjplLePLORltdZrNUrm9
	wHL+p7Iq1OwVR5pvjAeZ3EyBZDe+FNmrdzDXIETZRBI/khmO4IfJdEtfJXyGyODPy5GhmIv8FZG
	0AEzkQswMnoDCNcvAbXPO3vaQjgB1yWklhJGDbfTK7cSUjMHIN3hCNhxf4X9cOgymxc0KiU0E6l
	kAgRbMU5niiW6laxEMiNhoKr/PzVlwb+iDgTzZ8y2YWGm4+XQNkmHTHsDL1XcuXPXcCdK54GijT
	ytkupGSPIgykLXDHzvBb2mNOM69CvEZiYX0bQnyxtrkh1lKO/fA25ql3A+9Na91z0Nc3L+YfILf
	ipwpN1dWpoF3FNBtsM1CrAhwDAHwXUbGXKy5NEcZlzLcaiKqD90OQnO88g/cOALWmAQqr1e512W
	Q==
X-Received: by 2002:a17:903:22ca:b0:2d6:3c2f:6a5 with SMTP id d9443c01a7336-2daec71f2f5mr60870245ad.14.1788353970437;
        Wed, 02 Sep 2026 05:59:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd4a688dsm12228205ad.58.2026.09.02.05.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:59:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 2 Sep 2026 05:59:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?Sebasti=E1n?= Peyrott <speyrott@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] hwmon: Add Minisforum UM780 XTX EC monitoring and fan
 control
Message-ID: <7709521d-745d-4d1c-b68f-95337918fa43@roeck-us.net>
References: <20260902000509.191115-1-speyrott@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902000509.191115-1-speyrott@gmail.com>

On Tue, Sep 01, 2026 at 09:05:09PM -0300, Sebastián Peyrott wrote:
> Add a DMI-gated hwmon driver for the embedded controller used by the
> Minisforum UM780 XTX with board revision 1.1 and BIOS 1.06.
> 
> Expose the CPU and system fan control temperatures and tachometers. The
> tachometer protocol returns one byte per OEM command, so serialize
> transactions and use high-low-high sampling to reject torn values.
> 
> Allow selecting either complete OEM CPU fan profile through pwm1_enable and
> changing the two validated system fan transition temperatures through
> standard automatic-curve attributes. Cache coherent settings and restore
> them after the firmware reloads defaults following resume.
> 
> Signed-off-by: Sebastián Peyrott <speyrott@gmail.com>

Applied.

Thanks,
Guenter
