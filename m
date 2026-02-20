Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2A41DF742
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Feb 2026 18:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771610443; cv=none; b=jiBrYmHxjvx5LyNByLeTVwMGe5a3cKUPI0nmhjM5dizH4AEjZlFpzzbGI16bBKdE2U0xDsPX32yM8LzS6yZ2dU4ywDBglTTU42z5bBUzG6ZAVIuPl9UxEMY8DDFxKbtOiyGuGUjwHXgt0JST1vVw3uN/pJKYQXGrcc/JkY6P6ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771610443; c=relaxed/simple;
	bh=4RjALTch57rM6i6HYGOZ6B3ZuhRcn7x0yklH0OBcniQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fsoi7shqS+XyaalTJLluibl1EBrHcQDbckAlfhTBbGLJllVEx3mXpPmsQLsDuRs4CH+ti2w0KByZKtg7UaeKepkJVamUAieRfdyKWehte6pIHjLhYXrAWSF0Hl5cHcjiUd+27eMaXEkI87PKpT2mPmSv7Xdl98zd4C+LDExp+DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=noxkKKvI; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noxkKKvI"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-127423bea4bso48301c88.0
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Feb 2026 10:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771610441; x=1772215241; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDviFNaQlXl4RDWxBL/FyAxNNazEkOwOqLYJW2oU+Qo=;
        b=noxkKKvIMvG0/A24FWzq2vOa+oNr4XrYmjjV2/ZUKXHo2FaNibcbwZ62wEM/c5DTTM
         61MQ5n30BFBdpVNyaAPWHEuSbZL+vl8wBEta5fSnFRcqSX0n4T1Gdu3lfO9+Dx1MyAry
         nwTKcoJ89Zqom0Mh7z4JNCe1RBmucAucfseN29NUqwkBqrlcTIPncEUOr7muGGA/lLZu
         Jkoz4/y6aHdymK1vj5SCg+3vpluvCAMGaW4H3W2+SaQxFbrBlGgsXXeqyMiV8MpkgbzR
         fppyRqR3PrR54G/YgpClb16oF/KwLbjNuhQv6TXRt4u5UmYBl4EUpAc+InOvKIVVOBVi
         oSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771610442; x=1772215242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mDviFNaQlXl4RDWxBL/FyAxNNazEkOwOqLYJW2oU+Qo=;
        b=Jy/TuQZHX+6N2qAg36jdgCQFFbJfS6tFHL8NxjKw0Zn3msEeh/fJ8GhxJez2/IfsT6
         Omsmnq3UA1AqfC+IIG0jl3XyFVLaDSFZUU4oWmGneDnUnA6vinXsq3Ad6e/y3klurU8K
         59mnKmG2TzNqft7q64I9CpSbIY/hS6tYEiuXIDmNTBUEIBatODxdreX7J9q/iu+P2yT7
         xj+fGUeBsOR4HYkmMUeuBJU02J3Ns5xhJ60+Y4j/9X/uHoyHSQ4yWb3COwYuhEmt9qRJ
         +Ov5Dc4YKzSAfqgM8or+Fjfr7bcpf+fqdVF6NzTgsiqNJcb73x9SffDXkUv+CNqN7vx6
         jQpA==
X-Forwarded-Encrypted: i=1; AJvYcCUTtzEdNcYkac4an00ROYqxYjJmE6B+6LhnHz9YSxe1RwiijeKH8lJuebfPkJCx6RMah0hX4DMksqKV/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOAit1OqiYv5nbxWBtHtP02RPFfvtrUX8IwIYmEhuDE/Xwp7K9
	pFPv4JNx60zzBJEwMn4BRHFkEM/iNZ/7K2eVKnXLOk5Apg9KB/WId8Mu
X-Gm-Gg: AZuq6aJLxBa9LM/R1rVex56/FFz/6ooLPPiiGM/ICboVxWaC+2OgGSKsayFkzunSaAO
	QJS4tJLZCuYqOaEj7zbArZvoKuzYTATTCAcsw4+ACzRZSx2fQwdihAs1i+SAyB29Xq/kQD6mjnn
	SnLqCWt2/arscfndajPMZUtC1+lyrg77xyNxOvdsBCSCc48DlOl/aAy4b6cuXO5CJ/N3QtUhlNm
	16E0eHQIv4VdBIfC937tkV839jzy3+E1cclGWUsBKO34+HWvzChb9cxZySpok/S6zRwiF4fUNcN
	Hrx0PK/dec/lZP2VmH+OG28tidtfdnSZc0nFYAN1l8i7Vpw78d9fjD9H58NojxCYA8lZhDbu6lZ
	6SMYIOXrP4KAwBtyz64hOJirttAiK+sOho6hvAZajKY+tjDwtz7vIX47deobH1gFir+8SKdP14y
	ocLruXgn6kuXBeiIaVgRSUXgYfsImf2rjA7nRY
X-Received: by 2002:a05:7022:128f:b0:11d:fb4c:db13 with SMTP id a92af1059eb24-1276acb98f5mr251538c88.14.1771610441292;
        Fri, 20 Feb 2026 10:00:41 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af20fc8sm203892c88.6.2026.02.20.10.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 10:00:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 20 Feb 2026 10:00:38 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, sohil.mehta@intel.com,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
	Thomas Gleixner <tglx@kernel.org>, Tony Luck <tony.luck@intel.com>,
	x86@kernel.org
Subject: Re: [PATCH] [v2] peci: Remove dependency on x86 CPU variables
Message-ID: <6ad986a0-b99a-4b12-a590-85e9b2da496b@roeck-us.net>
References: <20260220175121.C16ADAAA@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220175121.C16ADAAA@davehans-spike.ostc.intel.com>

On Fri, Feb 20, 2026 at 09:51:21AM -0800, Dave Hansen wrote:
> 
> From: Dave Hansen <dave.hansen@linux.intel.com>
> 
> tl;dr: The non-x86 PECI driver #includes an arch/x86 header.  This is
> ostensibly to avoid duplicating CPU model number constants, but the
> result is complexity and duplicated *code* which is a far worse fate
> than duplicated constants.
> 
> Remove the PECI dependency on arch/x86 by adding a list of supported
> "target" CPU models in the driver.
> 
> This is only compile tested.
> 
> Long version:
> 
> == Background ==
> 
> The "PECI" driver runs on non-x86 hardware inside an x86 system.  It
> talks to the x86 CPU. The PECI hardware has different features based on
> platform generations and uses the CPU model to control feature
> detections.
> 
> Basically, instead of a PCI or USB device ID that a USB or PCI driver
> would use, the PECI driver uses the CPU model (and family).
> 
> The arch/x86 code unsurprisingly has a list of CPU model numbers and the
> PECI code currently reuses that list. But the arch/x86 list is
> maintained in the "Display" format which is different than the binary
> format that CPUID (and PECI hardware) uses.
> 
> == Problem ==
> 
> The end result is that the PECI code #includes the arch/x86 constants
> header and then duplicates some code that transforms the CPUID to the
> "Display" format. This is fragile because it's easy for us x86 folks to
> break the PECI driver when assuming that arch/x86 is x86-only.
> 
> == Solution ==
> 
> Remove the arch/x86 dependency. Instead of duplicating the
> CPUID=>Display functionality, just duplicate the constants.
> 
> Also rename the formerly "x86_vfm" variables. They are not in the VFM
> format any longer. They are purely device IDs.  Name them appropriately.
> 
> The result is a net code removal. The only downside is that the PECI
> folks need to add a #define whenever there is a new CPU model. But, they
> need to go add new CPU model to the driver explicitly *anyway*.
> 
> == Notes ==
> 
> One little wrinkle in this is that the CPU identifier that comes back
> from the PECI hardware contains the CPU stepping just like
> CPUID.01H:EAX. But the stepping is ignored by the PECI driver.
> 
> So, the PECI_INTEL_* identifiers are just defined with the stepping
> shifted off the beginning. They could have been defined with a 0 there
> and then have the stepping masked somewhere.
> 
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>
> Cc: Iwona Winiarska <iwona.winiarska@intel.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> Cc: openbmc@lists.ozlabs.org
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: x86@kernel.org
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> 
> --
> 
> Changes from v1:
>  * Fix wrong Haswell model/family
>  * Fix peci_device kernel doc
> ---
> 
>  b/drivers/hwmon/peci/cputemp.c |   10 ++++-----

For hwmon:

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter
