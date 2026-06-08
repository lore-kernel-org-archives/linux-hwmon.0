Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9DD282F09
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 03:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780888124; cv=none; b=k4lft52kttXGkMxa1Ob0vQZzhviGj5b6BIoaLHa4SDu25tZtxfIZ9sFWCzjX8zwQX6378PGCLJlGS0JH8GYr+usE5Lh4Nj/aSBeU2WCItwUyBKzRP63WPd+Q4seGUf4YE725bhhCIm7tnyDC5e8aON9LEdAclk7bKTggrJ/iWxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780888124; c=relaxed/simple;
	bh=eO7yVSb+ongNWkKbPuJJgDwNs5WTX9mm5C62KLUvoRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1RvOOFhLaGwg3qA1sWVsKnVOX9Cy1/pVWbdLiiZU74VlxnUcvfiqh53VXbKV9/te70RHBIHKrQgpbSQqBL+f2uPghrc3LGewuHFd967MQOH0GnCF2+cfwogjwXwC1NxBttlMvAPTz0AbZ0Bf70IJixrBJiXcJrZ/s61FizhtE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n74Cnow2; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n74Cnow2"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36b9b15af73so3344311a91.0
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 20:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780888122; x=1781492922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZmjdnA6Z/FpveiHy+bpkM+wI1acYPmFvyA9Nr3I4wg=;
        b=n74Cnow2jipnsiaIWCh4pBIYOzgyXgaymlAUYlsV27kmSMo3v53jIgxgmIScVQGLux
         MlVn2NxVrCtGjziqIIEr8DMuZYbigavfi2D1ewnZLbmzXZVPNe9M/G+70G9b7v/4xAZX
         IgjN3zipjZuudD1YPvcowIru3TzgzBOHqJBpbketCB2lYNtkaKpDIIDJYRSH0gDmJWcC
         0gWCFHyZUspVPmUKV4QwzuDvreFUTfUqHM1OwWGjXirAOJFCi4qr5IslAG6X/e5V/20T
         mhwAQwUxoBDKShHweTygYYxutfh0krmI1MHKDQlF3FfNIRnauevZ+RmQLwuKbPTeqwwi
         R/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780888122; x=1781492922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jZmjdnA6Z/FpveiHy+bpkM+wI1acYPmFvyA9Nr3I4wg=;
        b=Vrb8xK3b0LJt3YZlwtbVdqHrY9rz49J/zZIOJ4/irkPFma6wYULUP2HjEfr/Jirbnf
         Y41b61e8byRARChEJbIp8Igsmi5ANB0wHFsHztAFIinnPe9yQ86JkHhCsoc817SxuFgd
         IU2wlRSrxySBITT2tanz+KosArjwsG7Rlvba6K7s6xCcNM5pjQMJZyNYu2XREbHfqfIK
         ug3SCIl/qE1yUZNt1VogiO0kbTHKe5ZtoEZ4bEhZ4SnsoB0ljhQWKuYFXnLDE98PF27F
         SMBY3eluFDMqo0IliXdNO1mu8U0RKr9Ouua/64hK1CvdEUucmAgXxsA4wfmu6CwzwXwK
         WFkg==
X-Gm-Message-State: AOJu0Yx8E4Lbv9FJZ8Og0Gs9iEDCsoEi5ZeWK9AnfzK48KjVeDUItRCt
	mPZlYudTQ4gScKEV/9IBUAa0xr5jqH8p9zB56cFa9gjaZ54EU5sRx8wG
X-Gm-Gg: Acq92OGJMTyRoz7tHGiyYFdmtIf28Mn7/RS2wU6C+p9aeOXm5co8hKhtZ8d0PLZGeWw
	pNlEHdVF1eI1Y2TA1gvDSxU3OozJeO25zhEZHm02DfNWjRsm2FGgpW1BcXLTmvJ6rVu5u2F6DUq
	dhms7DCK33IngxNCC/5973tVPVSMze/tzJdIrycpVcTSZCmovE3BXAMU7lBzeT7rSWQ0oCQRl0o
	SU5DHbdV92DewHgqYDPU79WqJ5GMeu9GKOMbqDFk2bB6eB83yyls+34BjNT6E0nwEN4jplRhdKc
	RO1qKLpgT9fwWsuxDtGb1gtT515+p1kSXojyQ1/WALtsktxE5OiEW+eE6DGlysE0nNo9MAU5+vm
	qGWhvw35URufoy6PO0+ysokiqQxwzsMl9pmymKuG1ouN13W8dTZSUXky3mO7ClXlcB0VzT6ttyD
	mIrLn+Cknh5ZvmmJmIj363KyEcLfRte3Q5uU6uQIianUw2rb9xEziMCvYHCg==
X-Received: by 2002:a17:90b:4a0a:b0:36a:fcf5:64bd with SMTP id 98e67ed59e1d1-370eec10e38mr15237248a91.2.1780888122204;
        Sun, 07 Jun 2026 20:08:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f710ee4f3sm14702020a91.13.2026.06.07.20.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:08:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 7 Jun 2026 20:08:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"noname.nuno@gmail.com" <noname.nuno@gmail.com>,
	"Syed, Arif" <arif.syed@hpe.com>,
	Sanman Pradhan <psanman@juniper.net>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Message-ID: <6cbc0058-5471-4199-902f-5dbd574df886@roeck-us.net>
References: <20260601184516.919488-1-sanman.pradhan@hpe.com>
 <20260601184516.919488-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601184516.919488-2-sanman.pradhan@hpe.com>

On Mon, Jun 01, 2026 at 06:45:30PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> Add devicetree binding documentation for the Analog Devices MAX20860A
> step-down DC-DC switching regulator with PMBus interface.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
