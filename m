Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2874DD3CE
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 16:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353717; cv=none; b=Tscz19QrAn1CELraknpJoaxfw1fHDdTbSdKGr1y45wQsTwCuazHyrE4YzZ4u+ZAyTOVfgoknk1P42TBbe9V5DrelxGatjKrYapoo3Sc896rRmqLOkLjuq79J8Sh2q1c83y1ya/zv9AFy4o/wzmK/aqvLXvL1po90phNlYEbuzNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353717; c=relaxed/simple;
	bh=l+2wzoIOJ5TacTdwjQJG0rDHJINOx2GRB1xkArKzQmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCbyr8e8szUG6UFS4TGvvuskl3pwBOOBS3b07K6d0QYYfRY2bcSECkxz9y+zcu9GRmA2hnYxRd+q6zZSOlPkRvbOiGC/L8SaG+NtMGqmrTWlHsz2Qih5FJfRwDpNGcJWoAJln6pYQLRy82g5aa5jLWywDgjbVrRKHuXHU5WarBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmglRRCt; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmglRRCt"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso705663a91.0
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 09:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790353713; x=1790958513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GwpFfXPotsrRNWGW8QfW7lFLTfBJDFVvrgvILRfxIY0=;
        b=NmglRRCtysELuQ+WhQ0EK8Zcvj6wIkxsZ7XLPhTxeY/C5+gnw9eds089MTLvdhZSFu
         iS1VSS37awT5pOsLretvGGyqAkcol8c1hsA3HufkGDLF3MXl+9PjXbNfl9t8859LOEgB
         sh5SEZ2a6gn5YQewnKhx86J8PsIywk5Je6do4HVJ+XLdEE7JASGdq6uW7L4CxikW5mWZ
         ufE40xJKc7ybYh7ka5gGXuo2WCqXkbxkEvjQ9NYLDkrYfAo/xOjRfKkzu23rPt+VgyR9
         ixnuy0iQsZ8xwQi5KJUROV+hK32yg891V8swgVFkUPUb+TCng9a6feaMsJ2qAObtNHRn
         JEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353713; x=1790958513;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GwpFfXPotsrRNWGW8QfW7lFLTfBJDFVvrgvILRfxIY0=;
        b=c9xVhYxE4nKJmVtVje4z4Gney6Upk884eKnFFZc9fzRKpigrFVOLo2dh8cT2CHHhi5
         CK7m/Nx+LSggkjaAZpsd3ACPlOWp51xltGxf2TV+5DFR+B3Gs3JIKEuc9wGFMISK9iyE
         MxJfqBEwK5VZxemyGMSCIXRKiKS+E1YORpiXt0y17SFU5S4EFLGwGIOR43mTAsCuEQY0
         wBLcfStwoZuVNQvLMK5MvfZWGuH6YiKEi3QSIlGyn29LM/2Uy+ON+JrGHTD/xlk3ERi0
         w4k0PGvcaC4KTMmXSPfuETAd6cHL2HyGzhM0NyHUNkH1NkuMyAAvhzfEDS55cUmU7n65
         v7VQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAJUwuUFHYTd9jcCZw0lrhlc93H7Rvx0cd88yzIDVwHntvckXKjJQsgVo4GQEVl7NfN530zpnAXAzQiA==@vger.kernel.org
X-Gm-Message-State: AFuF++kEq7bvia8oc8b7hl046bsa+e3xW97VpwzbzKN2/HwRbPoUpVMn
	BJdA23GPjo4b6/PM6t9I4RMTv9skZT8W0OOU/y/C5SCwO7HLaiR62dZT
X-Gm-Gg: AYBFou2xRcyhLssipTRC6tqWXluDOjI9MJIK+B3SO7ONebZvThHcURQJ3Pkz9nLpdaG
	hbwv/l5RU32M74mgoCapmwRyTjXSB1i/hVTrvqVWdwfyxkQJOgbKZiEn6yxP0tb6VnQDzObbk2S
	vUCBnIi+qntP0ecQw7uaeLzj056jAcbTVaLNbKpV8x03H/K5sVT+f/wP8el/2JRHL4wSgxACjRv
	3v0P1zhTYC7pTfPkyMRqrWPVTOG8c2iX8k8TwizSyrE2Jf6M9h1ELqQj0QuctJfrj27eXURoetW
	1HX2m7FrfoGGVERq9TxCRbDEayUl9vNn95aogcPc0DfeSFQE+Whb7eTqxudXXdN3RPyZZC5g5FU
	iKsIeGpoqMOXI/hTkLXJuCswW7oK9TTB/O7AB0eV+1TgGLEf7E3eMLWQxo4xTO7NEHWgucXLp89
	c/fW0uPgtXq/vamQ6QrVvJdaEvIDAIstej9hT4vAeFNZfU+wQsyD7bCgxI+z0YUNSAXvcex5H5X
	iKcRrey+LBNeA==
X-Received: by 2002:a17:90b:1350:b0:39e:6c6a:656d with SMTP id 98e67ed59e1d1-3a0bb630128mr2176047a91.48.1790353713455;
        Fri, 25 Sep 2026 09:28:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c7435sm12169939a91.11.2026.09.25.09.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:28:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 09:28:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grant.peltier.jg@renesas.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	colin.huang2@amd.com
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/isl68137): Add Renesas RAA229639
 and RAA229640
Message-ID: <2301d0ca-9cfa-40e9-8250-4438d30a0059@roeck-us.net>
References: <20260921-add-raa229639-and-raa229640-v3-0-b104ee8a70b2@gmail.com>
 <20260921-add-raa229639-and-raa229640-v3-2-b104ee8a70b2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-add-raa229639-and-raa229640-v3-2-b104ee8a70b2@gmail.com>

On Mon, Sep 21, 2026 at 03:16:36PM +0800, Colin Huang wrote:
> Add support for the Renesas RAA229639 and RAA229640 PMBus
> voltage regulator devices.
> 
> Both devices are supported by the existing raa_dmpvr2_2rail_nontc
> driver variant, so no functional changes are required beyond
> adding the corresponding device IDs and OF match entries.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>

Applied.

Thanks,
Guenter
