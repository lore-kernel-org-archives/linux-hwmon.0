Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC3218D65E;
	Tue,  7 Jan 2025 17:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736271817; cv=none; b=FEhxhqn5mf61XaRmBJpn1H94rAz+7maLov+OubZ0Ogzgbbzdk8FjOZzHKyqM3O2zG3+HZ8KTAV9psx7A6/+wNnB+DFHkp8JuSRmms2prCMhZ40j3xCZk1CZXu1Shy8z+r5qoiL3y+TSJasWzev2+uj94CPcX1qp4nRvxiYwA+9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736271817; c=relaxed/simple;
	bh=kTmufHi+lxcm8JRQSROmsUSiDj4VOEY8N+bi9/WnAjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDU93fByFwxDJ2ejs0kLpCDllE5Q4awFe+ULmnLrBKz/VY/JEWm7ptJ8MJZ6UcjoSsRtSM46cS8gfEoxENSMLfHMPEib5JG0kdoQVzdKVo5+H3rnUkM47RlDWG3N3BOZ/60sNlPnuDpT0g+8TkZPMVF9iuZV2P77l2REUXLiHAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJC4+mPK; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJC4+mPK"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2163bd70069so41779925ad.0;
        Tue, 07 Jan 2025 09:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736271813; x=1736876613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NR0LGZuLA+b3m7gMwiwKTS64duGaoEeZrwVNsZV8Z/M=;
        b=RJC4+mPKFWgktpnVL40UymwjjdPc//CFMzkS4ZXwmMAuwyN3zTfMlD/Pu74lHiE5A9
         OFXTcUSEcaQ0v2M4XoXd2FDCT/IpHX0+/fyl7LtheS67JfmgqP1izyNZ9itikGu1Xkfd
         NQwG7W2pBG2unqyRE0HN3ymz1qrZNEEgpY9r5ziTi2daToOvWpd8cxAtv0Ez87Nr8IVW
         tt/oORthWBfVkSrmSZrajHqhWEYGnKjiwSMXTk043wkwf83iuPoDiC+6Yex7jS2papGr
         ewC0RoxnmS4H/MFfkCtpTZuAol49XWP2g5oBwQ2Bie5947irk7vBWVDJVKLKAwejUUGo
         iCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736271813; x=1736876613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NR0LGZuLA+b3m7gMwiwKTS64duGaoEeZrwVNsZV8Z/M=;
        b=rxif4FleFYPVsOtvV2VgUPqf+vFriu8O9dkFHYq/Nlx43K9dXrzeYGfKLaQqMaxp58
         pVZ9w51nhKQVgkG+Rpywlark71s33Hrgpz6M39kbaFIqNGJ4SnC56HcGxETRduTzJ9T0
         NhfXNz+s0G+50C7Vc1c7kK65wozr6UFmjMufdrS6CW7E/fatJEtvryfCA4NZvxpFYFvo
         rUDSaXHjKqRkhNkhg0bDocksRujYRxQHxGso8t4BsNuCagOPNLSXWbIBNbp3bh2bH2Ou
         2JLzuvHT4ui3NxQajDpI+AJmx3iQxpFIg/TSMWxajVbxuuI5QX4KfCYzz+XZH1Rou9QS
         HWyA==
X-Forwarded-Encrypted: i=1; AJvYcCU/NNcVa7qvTomRX5LRKqtbxlo0qIjF4hEDWN3m4+8qAyZBIc4ukQu9DGS1LJsJEskWpStmAc3UKAlJHubJ@vger.kernel.org, AJvYcCWI8XU6CO8vTeoAL1/iI9LovTxMQFA8C+g0WeurpA/EoOGocqDst4++U/aVbfo3DyoyXlJREpTKPB0/dQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzY/Esav5/7i+Bxnm/l5GSbVzZV+z+CN20g/+VC2hAbhNKtopda
	WReKuWd35gPZ74VmEPpUrPQsO02L8nkK1ai+QFGK7jkt+OHEWQyn
X-Gm-Gg: ASbGncvURuhrdsQVHvXGqZJhVYMLP66LSv6ijRoCkV9sRJcbN/FXDMJuAT5AHnNk6CD
	z9Jjn+bcuvddEsu9FmO03/6kwH/qcre+ynEs3IB2hUY3uUDFjplE6rJQDGRphSVZv+nJGkF5eTR
	MaeFoMjR8BAMoKlBjeL/5sAV9Cvc4kbaJDxSovQ0Fh/RnPtksbkxT6tgTggR8AciL0WTlkutb9a
	Ue2VmHTIOuXLbq2PaqJl2TNq3peoMBdE7dAgidXp7bLy8mfDY8I6WBGPMyv8Ovg1dpldQ==
X-Google-Smtp-Source: AGHT+IFZPj2SiTXGe6Id1Y0Q98iEc6lH/23Tt9wPrSROl8DcCGFox4UyrlFtvNynMVw5s64TuGqL2w==
X-Received: by 2002:a05:6a00:428e:b0:725:cfd0:dffa with SMTP id d2e1a72fcca58-72abdd4f49emr96731113b3a.5.1736271813189;
        Tue, 07 Jan 2025 09:43:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90b32dsm33594285b3a.173.2025.01.07.09.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 09:43:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 7 Jan 2025 09:43:31 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Derek John Clark <derekjohn.clark@gmail.com>,
	=?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] hwmon: (oxp-sensors) Cache state of PWM enable mode
Message-ID: <5eef3ba8-3e6b-4672-94fd-a98920f79e4e@roeck-us.net>
References: <cover.1735232354.git.tjakobi@math.uni-bielefeld.de>
 <80c85a5d219eba0c10d6927c3f90bbc3ad6043a1.1735232354.git.tjakobi@math.uni-bielefeld.de>
 <94e512e0-8105-4123-b9be-8a9805f7cfca@roeck-us.net>
 <28b7a9b2-a2ea-473e-8a17-2b987169b669@math.uni-bielefeld.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28b7a9b2-a2ea-473e-8a17-2b987169b669@math.uni-bielefeld.de>

On Fri, Dec 27, 2024 at 12:13:40AM +0100, Tobias Jakobi wrote:
> On 12/26/24 22:05, Guenter Roeck wrote:
> > On Thu, Dec 26, 2024 at 06:00:19PM +0100, tjakobi@math.uni-bielefeld.de wrote:
> > > From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> > > 
> > > The driver is in full control of the enable mode, so we
> > > don't need to read it from HW every single time.
> > > 
> > 
> > That is not a reason for adding that much additional code.
> > What is the problem that is being solved, and why is it worth that much
> > additional code ?
> I don't think it's that much additional code, but anyway: Reading from EC is
> not exactly fast, and I want this value cached for another reason. It turns
> out that some devices use a different scaling for the PWM value depending on
> whether the PWM is controlled automatically by the EC, or manually through
> the driver. And I don't want to do an additional EC read to figure this out,
> if I can avoid it.

Maybe it isn't that much code after the runtime feature checks are removed.
Either case, since there are now two operations (reading/writing from/to
the EC and caching the result), all associated operations will need to be
mutex protected.

Guenter
