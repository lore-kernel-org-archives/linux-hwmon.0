Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23AB3C3C08;
	Mon,  9 Mar 2026 17:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773076994; cv=none; b=HLd3EWSQm/n5FtwtbTBTH/8M/w9q1A4HvYtThMqXfhA6ukmVX4gfsEYYORLX21jd3RYDnHNV4AxNUR8uWVp65nlp3lp7C3uXOF8V14Clj8k1YVtyyV0tpf862tPoxNmlZEU65+eeYSb6Pj0IZ8iybWgO3orO1GqQaqzSebmiUNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773076994; c=relaxed/simple;
	bh=4rOz6vSUmerTq0k7LmyDdZAnzbukgGgjBdJyWrBQ8cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2aNnUzGiZfgEff3LdR89YPuwYewG7AvuhkVKjJpe0UEg2xbdswy5RBIpWYcKTcK4jiqFEefWhHtixgOsaOKIf8R6VJ5F3Mck7odoyM7YGekH26IPaf6+M3CRSuByRpQIq1uYiZEEVu8mmIH+MA5z750WidVe1l0GfgCLPhLEpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=knBcEnJ6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="knBcEnJ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A60C4CEF7;
	Mon,  9 Mar 2026 17:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773076993;
	bh=4rOz6vSUmerTq0k7LmyDdZAnzbukgGgjBdJyWrBQ8cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=knBcEnJ64zpX8G5B754WiqB/pbP7C9GQk8sQoyMx2Ddz+cjqGr5S8DABc3Wyop6IJ
	 c1OHAQ28Nr7qt49XFZErpRYjpStNz3O2LW1XSxSKzGkL3AHgYESqRC088jRlBwOpgK
	 2dsi0Bhc3vUVDRkl8tfnAAQw9k4HANKMmJiRtbhvOhwnOkYUovZKPn5dCXvetQ4LV2
	 kf8dnXIATK7lEP115VkdO327fUxmiAxnAhTQ0PB8+2tLTh6ZBLLgiawkdbfkRhR5/Z
	 IV1EjkmGxAOcZzIkaJ3+HL/FEIxmvUb9mRSDeBcFow9bfP5l7hhb50uNHh/eJSbkwD
	 PtVhPoCGMkIEg==
Received: by pali.im (Postfix)
	id C795B687; Mon,  9 Mar 2026 18:23:09 +0100 (CET)
Date: Mon, 9 Mar 2026 18:23:09 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Dell.Client.Kernel@dell.com,
	mjg59@srcf.ucam.org, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/9] platform/x86: dell-descriptor: Use new buffer-based
 WMI API
Message-ID: <20260309172309.a3ukif3bejbicywl@pali>
References: <20260308002522.4185-1-W_Armin@gmx.de>
 <20260308002522.4185-2-W_Armin@gmx.de>
 <39bdcdf7-a771-4f1b-a3a0-0ecde272d914@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39bdcdf7-a771-4f1b-a3a0-0ecde272d914@amd.com>
User-Agent: NeoMutt/20180716

On Monday 09 March 2026 10:41:20 Mario Limonciello wrote:
> On 3/7/2026 6:25 PM, Armin Wolf wrote:
> > +	/* "DELL" */
> > +	if (le32_to_cpu(desc->vendor_signature) != 0x4C4C4544) {
> 
> Do you think you could come up with a helper for matching an expected
> "string" like this?  I /suspect/ it's going to be a common pattern that
> vendors use and it will increase code readability going forward if a helper
> is possible.  I see it at least twice in this patch alone.
> 
> Something like this prototype:
> 
> bool wmi_valid_signature(u32 field, const char* expected_str);

When I read your comment, I come to another idea. What about introducing
a macro which will convert 4-byte string to u32 number? For example:

  #define str_to_u32(str) ({ _Static_assert(__builtin_types_compatible_p(__typeof__(str), char[5]), "wrong type"); (u32)(u8)(str)[0] | ((u32)((u8)(str)[1]) << 8) | ((u32)((u8)(str)[2]) << 16) | ((u32)((u8)(str)[3]) << 24); })

The whole conversion would be done in compile time (with -O2) so should
not cause any possible performance issues.

With it, the condition could be written as:

  if (le32_to_cpu(desc->vendor_signature) != str_to_u32("DELL")) {

and no need to use magic number 0x4C4C4544 and write comment that this
number in ASCII is the "DELL" string.

> 
> > +		dev_err(&wdev->dev, "Dell descriptor buffer has invalid vendor signature (%u)\n",
> > +			le32_to_cpu(desc->vendor_signature));
> > +		ret = -ENOMSG;
> >   		descriptor_valid = ret;
> >   		goto out;
> >   	}
> > -	buffer = (u32 *)obj->buffer.pointer;
> > -
> > -	if (strncmp(obj->string.pointer, "DELL WMI", 8) != 0) {
> > -		dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature (%8ph)\n",
> > -			buffer);
> > -		ret = -EINVAL;
> > +	/* " WMI" */
> > +	if (le32_to_cpu(desc->object_signature) != 0x494D5720) {
> > +		dev_err(&wdev->dev, "Dell descriptor buffer has invalid object signature (%u)\n",
> > +			le32_to_cpu(desc->object_signature));
> > +		ret = -ENOMSG;
> >   		descriptor_valid = ret;
> >   		goto out;
> >   	}
