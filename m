Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC86C330D35
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 03:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780888161; cv=none; b=O8JiuQQHB7ga8kRjzsP9UhdKTDp+cQ7vbQgcSs82piD7sNG0m9KGREbLG3bIR3Ybp2jvObn/R4/gykBsKPAEfE2lz6ktEP/7aAccwmI7xvf+1cVKSIUZR0B1Pi705uhu1T26Vy142n0XbZRip5aB4I7g7vLSFBWyjlTJX4244WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780888161; c=relaxed/simple;
	bh=kGkWt6C5ycyjEXTsn2oV6cHKOg6pKviV0NC46vzMPWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPwH72dvbSR7+anpZ4Yf7s/eQICucsaoK9h/HjqMXMcn28Hc+DvWFNuecFKhVqkCkleMsAmabzOUqHgv6gjwtnk1DSCzXPy9T/gNagKsLLYir5DSRpFQpEc9vDnyY0mJdiWvwe7/t0P/IZo8OARvNXT64U4gEQzecpl/oPgFkQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=er46dHqc; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="er46dHqc"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36bcbd7821fso1458080a91.2
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 20:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780888160; x=1781492960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bnSxX6NnlVP9TffY8s3zLGx9ESRaKOyzgVhLAZp1f+8=;
        b=er46dHqcA0duUz4iMNw27XOsxjmWyA1B5pSMoaAIzmvFtDmVBXF9QpdoPvpeSCHAcB
         7/9oj/EC6m0KKL6e0DULafXDERbrsxenFnBb7dApXgG/R11ceeVEZKzh54brJXicCFSC
         5YWQEUKIWIBwq8Hn+lgcFx67Aac5Lzsqpn2kTpyDTafzl02OusDIQFr9A6slLFjba1u5
         Akq6E1H0DliXhpU+GgrTKSOaIl3mx4YBti7DQatVYRh7DMeInjj31TAE8gqlOIj1v3b9
         YmjlijND3HKw1ysYGvAaNFIkc4vgdV64X50RJRegdg7Z6Km/LKa8ZN9Tm736lreA+ugC
         BjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780888160; x=1781492960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bnSxX6NnlVP9TffY8s3zLGx9ESRaKOyzgVhLAZp1f+8=;
        b=MwXmeTW+k7abe5l6SkUK7zplGjTjD4YZ0yd6jip2YL/9+pyWdqbrJDhCvhOGpmiv/R
         AWv9qzOqYnAN7AsUX69Zvg3ucJ77SZQ8jcWQ3zY2RSS7BRTUE7i8yauux/tdfAgaojdN
         LsNQjhOHjHo4XUpgO29/C40mVLqf9Dl0PJlpv2pGR70kypwJfQ4pQ4RZNPcX1wMDtbfO
         eBSTMgLX1B2lQqmZSpVc773tTK1ORPMdgw2Aq7hQt31QRyzEUEzPcxDzHuD+0QnB+EBp
         pTgNhGpf9QDUFGnHlwSkq+9JtKL+Qv/yEAI5NP1pkccVZAt6802Yx4hubPj6ne6MKbv3
         7E2A==
X-Gm-Message-State: AOJu0YwO4V9t2EJhjSTE2SRZtt5sVtnkbr0e2p9/3p/bjUkzAw2roz+9
	+lj7wSXIqT/d4ancVs7v21iI8Mv+dKHzsSRkffMag74bgj0Py5EikCaO
X-Gm-Gg: Acq92OGCX8G3jlZvLMGhu4AemrLNR/2puLvPeExxCcqf52SmTjQfOSvI5+1qp1x614Q
	oSF8PCMtf4JKpifHMYGQlZgvdZXUG6/7KfnAOQUant51YcNO3KmbvdAYC1I7rKPol72z4zXb4y3
	yjNO+tkWQXOVKLTy16MCwj+QUfVY4k/xAcaJzsJoZX2YSCYBvgzo+cSXSNlFuskHu5d5pykUJ6+
	g+qZCIkjFs9NDmxyaWbMy7zOnOQ2AErtmK52zvnA3KhGXHqj1dgVKvAJl7zTfVJDPGT56uS1Va1
	NwYiRiZBQkr/1as0xxoDkxPyrR/K00LzxJcF1MV0UmHM13tcCe+/xrbEZibvwTuCgg/ZGpka0Kv
	h4mnJukcrX0Ru3QxKvnYdCmjG/voRmt9blbm6o4VFnrw3Akwtn8Ms3Wz0eE32DNekjJpFeeIy89
	S4rcJFfjHtbsNX2IiHmaoCIHMZfAeNT8mzPQme3Diby4q68Ek=
X-Received: by 2002:a17:90b:57c4:b0:35f:b647:d98a with SMTP id 98e67ed59e1d1-370ee64373dmr14132310a91.5.1780888159963;
        Sun, 07 Jun 2026 20:09:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a29cd6sm13867998a91.11.2026.06.07.20.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:09:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 7 Jun 2026 20:09:17 -0700
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
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v4 2/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Message-ID: <8559cc71-ad0d-4b76-b562-67dd3d7a4ca8@roeck-us.net>
References: <20260601184516.919488-1-sanman.pradhan@hpe.com>
 <20260601184516.919488-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601184516.919488-3-sanman.pradhan@hpe.com>

On Mon, Jun 01, 2026 at 06:45:36PM +0000, Pradhan, Sanman wrote:
> From: Syed Arif <arif.syed@hpe.com>
> 
> Add a PMBus driver for the Analog Devices MAX20860A step-down DC-DC
> switching regulator. The MAX20860A provides monitoring of input/output
> voltage, output current, and temperature via the PMBus interface using
> linear data format. Optional regulator support is available via
> CONFIG_SENSORS_MAX20860A_REGULATOR.
> 
> Signed-off-by: Syed Arif <arif.syed@hpe.com>
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
