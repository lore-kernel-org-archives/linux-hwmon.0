Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4000341DEE7
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 14:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163545; cv=none; b=bp9xoHckBvRsSLs28DQWfQgoEHr/y3IKaCJbZAxzYyQk675B8Jf5OCDkQB+w958FhPu/faPkXnJozKObLzdoUHq1wPr9lHCBB94KhHdFfqL0c+uEPemapVd1gUMs/j3Yb0iCZjwjYpOs/k12o4M2bZeHjeGCNAEVP5qLi0f3vw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163545; c=relaxed/simple;
	bh=TRQNemJU0zS79g/J4enfOrZKplEZddMF1OAmtUzc9ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=juTs9uPxV325xKqG5gRGV+lJyNu4+hLmOJK3+e3Yw5UkZsBfHs+L+VoexFnRTC4XM9n01V7iT91Bl5gQ6UaOi1pwBXHitrtoK56UXHmCCHDHPNLNo/++GryhXCgqVG6qRAcEpZG4rtYPszbBjscUPfg8UPdE1W8z7pkJOu3gqN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byWA0BWv; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byWA0BWv"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso1403540a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 07:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785163543; x=1785768343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KAGgkFqzP96xx/+bNop2DzU5y4t0TVlGWAhIbONjPIo=;
        b=byWA0BWvGW8fGgI091FdsEcrFvt4I25/Tpv9v6UrJNzLSxcVEnBJ8XSpHwdt+rZj3t
         75EweMkNDF1Jr1+sdGRahEmpveHG485EGMs7VoK1Kh5byEhwH8RkLpBQWdOXhsgc2oCe
         1ee4e0ou8x7gVRwluWW2I4RAxKCgKOqv7qVkW+S1f+5bLldeUqZEHUZ7P/lmq5B3Pk0a
         AuyQgevhQucNkqeXjaK7j/m1ZbfSu8zUpBgT1zOvFjRz0VVnmj6cFuXGXqhAHVoxO0BN
         K/1U53PK7xeN5m5y5jCudZ0jITVpvO7gjWJ76iSNAlemYGEkYWce0whtWLyfFS9cXut5
         Bj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163543; x=1785768343;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KAGgkFqzP96xx/+bNop2DzU5y4t0TVlGWAhIbONjPIo=;
        b=MmKxLOc9hefFhoB85ft1P9rnxFXf1H98jhg6X+9XxvWkFYmwReausNsxG2m31VvuVF
         z/xX50YRRNuatXRwT/0T7mbqfXyz+vxVOj9ONsykzsM6UUNbzJwgwyc9/QJ7sTTjZM8l
         TtQ2XcLvZEiaBKfJ8S0YwB0pnKSxuT/xGbGTkoerD+NuALtkaUgevdBaG2jpRpyIloOv
         Vxm6G3ntrZqutJu2NHYo/FPUt9SrsiruEsDFSh/ALVwaXsCHRFDyVc7XB8tGeNoSobKi
         ptT+ZA2+ZBJcHWDcZIZCc6qJRuEZeloQW6sWnIAxIS5U1vKW8+DOL1VoLF0Kp+fCZ0qe
         lZqw==
X-Gm-Message-State: AOJu0YxzDLHbAis5/zFUDhqRXvXkgr0Ir5z/yuUEX21cNqm+bbp0x709
	XFd2BiFvqo1/g3b0BBh/JonFfeN8JCJ2PC2YgRzGTu3xJOwFUFw8AJ+B
X-Gm-Gg: AR+sD10PXFgnxvNE2f45Y7nJmcnOMiPFlqmqJSTL1m5SMpwaDrP0RObH0OzaMsVeiiU
	wWCPJw6hyCyXl86h3PXF/Fj9hwBKKC6/mGZxmM4pBEL9+tqV9B2+4k2LdLeUPKTDXOdjgaPdfQW
	tac43GB34/CGxToXgm/ONwAkfY5aeTPWXl2K8zD8+hYC2aDNHCKJCS3+DLugQ7dI3NI4ZZNpSIP
	w/U9t3p6TM8u/cv1yIW60A71yvZAOGyKzC2U3GnF2mUaSD27DVSTFIa/qKLvjkgcIEd6BLQaPw8
	y7i3tcaUdZsMbnmM+gUGRRdip6NpPQ+4cnHXJ78CxIidGvTHf1pgPTEh0YHUVG8Kb6hf47JJdvy
	2wG2lGIdpACctY1Yq6sgbvECkB7c9ExyEwTgau7cVgZA2FpXo1o6rbUoSYU1iuk6WR4DAFEID3P
	9W6uk7OzNnqoSyyUj/n5yEtZkmlA==
X-Received: by 2002:a05:6a20:94ce:b0:3c0:9c19:659e with SMTP id adf61e73a8af0-3c67e00cac0mr8474498637.70.1785163543389;
        Mon, 27 Jul 2026 07:45:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc288a79sm32967946eec.0.2026.07.27.07.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:45:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 07:45:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	Debjit Ghosh <dghosh@juniper.net>,
	Jawahar Balaji Thirumalaisamy <jawaharb@juniper.net>,
	Santhanakrishnan Balraj <sbalraj@juniper.net>,
	Brian Mak <makb@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>,
	Dhruva Devineni <ddevineni@juniper.net>,
	Avadhut Naik <avadhutn@juniper.net>
Subject: Re: [PATCH v4 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
Message-ID: <eb7f53ad-f996-4e13-aa67-0b70b6e399bd@roeck-us.net>
References: <20260725211945.288415-1-sanman.pradhan@hpe.com>
 <20260725211945.288415-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725211945.288415-3-sanman.pradhan@hpe.com>

On Sat, Jul 25, 2026 at 09:20:14PM +0000, Pradhan, Sanman wrote:
> From: Georgi Vlaev <gvlaev@juniper.net>
> 
> Add a PMBus driver for the Analog Devices MAX16545 and MAX16550, and the
> Volterra VT7505 controllers. The driver reports input/output voltage,
> input/output current, input power and temperature over PMBus. All values
> use the direct data format. Peak input voltage, output voltage, output
> current, input power and temperature readings are exposed and can be
> reset.
> 
> The reported current and power depend on the external current-report
> resistor connected to the ILOAD pin, which can be provided through the
> "adi,rload-ohms" device tree property.
> 
> On the MAX16550 and VT7505, the severe-OCP deglitch time can optionally
> be configured with the "adi,ocp-severe-filter-us" device tree property.
> When omitted, the existing hardware setting is left unchanged.
> 
> Co-developed-by: Dhruva Devineni <ddevineni@juniper.net>
> Co-developed-by: Debjit Ghosh <dghosh@juniper.net>
> Co-developed-by: JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>
> Co-developed-by: Avadhut Naik <avadhutn@juniper.net>
> Co-developed-by: Santhanakrishnan Balraj <sbalraj@juniper.net>
> Co-developed-by: Brian Mak <makb@juniper.net>
> Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
